// ********************************************************************
// Microsemi Corporation Proprietary and Confidential 
//  Copyright 2018 Microsemi Corporation.  All rights reserved.
//
// ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN 
// ACCORDANCE WITH THE MICROSEMI LICENSE AGREEMENT AND MUST BE APPROVED 
// IN ADVANCE IN WRITING.  
//  
// Description:  Lane Master mode2 (CORELANEMSTRmode2.sv)
//    This lane master intiates RQ transactions for the following
//    reasons:
//    a) requesting CDR lock-to-data
//    b) requesting CDR lock-to-reference
//    c) deasserting soft PCS Rx Reset
// This is a much simplified variation of mode1 which can be used
// when no calibration of CDR/DFE is required.
//      
// Revision Information:
// Date     Description
// 14Sep18 Initial Release 
//
// SVN Revision Information:
// SVN $Revision: 8749 $
// SVN $Date: 2018-10-09 07:20:44 -0700 (Tue, 09 Oct 2018) $
//
// Resolved SARs
// SAR      Date     Who   Description
// 102006   8Oct18   Brian Port naming changes.
// 101850   8Oct18   Brian Added CALIB_SYNC_HOLD output port.
// 101425   9Oct18   Brian Moved sqfsm to CoreLnkMstr. Reduced RQI, RQR
//                         bus sizes.
//          7sep20  preethi Increased RQI bus size
//                          changed the system verilog file to verilog                                 
// Notes: 
//        
// *********************************************************************/ 

module CORELANEMSTRmode2
( 
// CORELNKTMR interface
input  [20:0]      LTPULSE,
// COREULCKMGMT interface
input              I_LCKFRC,
output             O_LCKFRC,

// CORELNKARBMUX (for single lane application, CORELANEMSTR) interface
input              M_GRANT,
                        // For single lane application tie
                        // M_GRANT high
output             M_REQUEST,
                        // Asserted to request a grant
                        // M_REQUEST is a copy of RQ_EN
output  [5:0]      RQI,
                        // Request Initiate
// CORELANEMSTR interface (never from CORELNKARBMUX)
input  [1:0]       RQR,
                        // Request Response
// PF_XCVR interface
input                   RX_READY,
                        // asynchronous flag wrt CTRL_CLK
                        // Previously external synchronization logic
                        // is now pulled into this module.

// Common interface signals
input              CTRL_CLK,
input              CTRL_SRST_N,
// Fabric IP interface
input              CALIB_REQ,
                        // asynchronous wrt CTRL_CLK
                        // Previously external synchronization and
                        // rising edge detection logic is now moved
                        // inside this module.
output             CALIBRATING,
                        // High during DFE calibration.
output             RX_OK,
                        // Delayed rising RX_READY. RX_OK is low
                        // during DFE calibration.
output             CALIB_SYNC_HOLD
                        // Rises prior to any calibration-induced loss of
                        // RX_READY, falls post-calibration.
                        // CALIB_SYNC_HOLD=1 does not necessarily
                        // imply a calibration is running. Use
                        // CALIBRATING output for that purpose.
);

//replaced timeunit and timeprecision with timescale for SV->Verilog
`timescale 1 ns / 1 ps
//timeunit 1ns;
//timeprecision 1ps;

assign CALIBRATING = 1'b0;
assign CALIB_SYNC_HOLD = 1'b0;

wire tppoll = LTPULSE[0];

`include "request_code.v"

// Registers and their next-state variables
// Request Master State
// replaced enum logic with localparams for SV->Verilog
/*enum logic [2:0] {
    MIDLE,              // idling
    MSLO,               // request change to CDR locking
    MALF,               // acknowledging lock management change
    MWRDY,              // wait for RX_READY
    MRXOK
} */

localparam [2:0] MIDLE = 3'd0;              // idling
localparam [2:0] MSLO  = 3'd1;               // request change to CDR locking
localparam [2:0] MALF  = 3'd2;               // acknowledging lock management change
localparam [2:0] MWRDY = 3'd3;              // wait for RX_READY
localparam [2:0] MRXOK = 3'd4;

reg [2:0]               rmfsm, rmfsm_nx;
reg                   o_lckfrc_st, o_lckfrc_nx;
reg [SZ_RQCODE-1:0]   rqCode, rqCode_nx;
reg                   rqEn, rqEn_nx;
reg                   rx_ok_st, rx_ok_nx;
reg [1:0]             rx_ready_sync;

assign O_LCKFRC = o_lckfrc_st;
assign RQI = {rqCode, rqEn};
assign M_REQUEST = rqEn;
assign RX_OK = rx_ok_st;
wire rqDone = (RQR[0] & M_GRANT);
wire ReqExit = ~rqEn;

// Begin: Register modeling section
//changed always_ff to always @
//always_ff @(posedge CTRL_CLK or negedge CTRL_SRST_N) begin
always @(posedge CTRL_CLK or negedge CTRL_SRST_N) begin	
    if (~CTRL_SRST_N) begin
        rmfsm <= MIDLE;
        o_lckfrc_st <= 1'b1;
        rx_ready_sync <= '0;
        rx_ok_st <= 1'b0;
        rqCode <= RQC_L2R;
        rqEn <= 1'b0;
    end else begin
        rmfsm <= rmfsm_nx;
        o_lckfrc_st <= o_lckfrc_nx;
        rx_ready_sync <= {rx_ready_sync[0], RX_READY};
        rx_ok_st <= rx_ok_nx;
        rqCode <= rqCode_nx;
        rqEn <= rqEn_nx;
    end
end
// End: Register modeling section

// Begin: Next-state variables determined by Request Management (rmfsm)
// replaced always_comb to always @ (*)
//always_comb begin :rmfsm_combo
always @(*) begin :rmfsm_combo	
    rmfsm_nx = rmfsm;
    case (rmfsm)
        MIDLE: if (I_LCKFRC != o_lckfrc_st) rmfsm_nx = MSLO;
        MSLO: if (ReqExit) rmfsm_nx = MALF;
        MALF: begin
            if (o_lckfrc_st) rmfsm_nx = MIDLE;
            else             rmfsm_nx = MWRDY;
        end
        MWRDY: begin
            if (rx_ready_sync[1]) rmfsm_nx = MRXOK;
        end
        MRXOK: if (ReqExit) rmfsm_nx = MIDLE;
        default: rmfsm_nx = MIDLE;
    endcase
end //:rmfsm_combo

//always_comb begin :rqCode_combo
always @(*) begin :rqCode_combo	
    rqCode_nx = rqCode;
    case (rmfsm_nx)
        MSLO: rqCode_nx = I_LCKFRC ? RQC_L2R : RQC_L2D;
        MRXOK: rqCode_nx = RQC_PCSRST0;
    endcase
end //:rqCode_combo

//always_comb begin :rqEn_combo
always @(*) begin :rqEn_combo
    rqEn_nx = rqEn;
    case (rmfsm_nx)
        MSLO, MRXOK: begin
            if (rmfsm_nx != rmfsm) rqEn_nx = 1'b1;
            else if (rqDone) rqEn_nx = 1'b0;
        end
        default: rqEn_nx = 1'b0;
    endcase
end //:rqEn_combo

//always_comb begin :o_lckfrc_combo
always @(*) begin :o_lckfrc_combo
    o_lckfrc_nx = o_lckfrc_st;
    if (rmfsm_nx == MALF) o_lckfrc_nx = ~o_lckfrc_st;
end //:o_lckfrc_combo

//always_comb begin :rx_ok_combo
always @(*) begin :rx_ok_combo
    rx_ok_nx = rx_ok_st;
    case (rmfsm_nx)
        MSLO: rx_ok_nx = 1'b0;
        MRXOK: rx_ok_nx = 1'b1;
    endcase
end //rx_ok_combo

// End: Next-state variables determined by Request Management (rmfsm)

endmodule //:CORELANEMSTRmode2
