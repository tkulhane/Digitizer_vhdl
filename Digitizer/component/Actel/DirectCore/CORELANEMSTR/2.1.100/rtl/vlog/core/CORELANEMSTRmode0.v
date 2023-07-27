// ********************************************************************
// Microsemi Corporation Proprietary and Confidential 
//  Copyright 2018 Microsemi Corporation.  All rights reserved.
//
// ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN 
// ACCORDANCE WITH THE MICROSEMI LICENSE AGREEMENT AND MUST BE APPROVED 
// IN ADVANCE IN WRITING.  
//  
// Description:  Lane Master Mode 0 (CORELANEMSTRmode0.sv)
//    This lane master intiates RQ transactions for the following
//    reasons:
//    a) requesting CDR lock-to-data
//    b) requesting CDR lock-to-reference
//    c) asserting soft PCS Rx Reset
//    d) deasserting soft PCS Rx Reset
//    e) toggling DFE_CAL_RST (->1->0)
//    d) toggling DFE_RUN_FULL_CAL (->0->1->0)
//    e) reading DONE_FULL_CAL
// This is a capture of Revision 8701 (14Sep18). It is being preserved
// as legacy mode of CORELANEMSTR operation. This particular
// revision requires the PF_XCVR be configured to support the HW
// auto-kickoff variant of calibration.
//      
// Revision Information:
// Date     Description
// 14Sep18 Initial Release 
//
// SVN Revision Information:
// SVN $Revision: 8756 $
// SVN $Date: 2018-10-09 10:59:24 -0700 (Tue, 09 Oct 2018) $
//
// Resolved SARs
// SAR      Date     Who   Description
// 101451   20Sep18  Brian Dissallow on-demand calibration
//                         request while forcing lock2ref
// 101454   20Sep18  Brian SAR cited that an ongoing calibration
//                         would be disturbed by an on-demand request.
//                         This was the original intention. When this
//                         feature was discussed among the whole team
//                         we learned that a device stuck in calibration
//                         will remain stuck even if we request a restart
//                         via on-demand. Since the feature is ineffective
//                         we decided this SAR can be fixed by removing
//                         the ability to respond to ON_DEMAND from the
//                         middle of an ongoing calibration.
// 102006   8Oct18   Brian Port naming changes.
// 101850   8Oct18   Brian Added CALIB_SYNC_HOLD output port.
// 101425   9Oct18   Brian Moved sqfsm to CoreLnkMstr. Reduced RQI, RQR
//                         bus sizes.
// 101848   9Oct18   Brian Changed reset value of the CALIB_REQ synchronizer
//                         such that an initial 1 on CALIB_REQ will not
//                         be treated as a rising edge.
//
// Notes: 7sep20    preethi Increased the RQI width
//                           Converted the Systemverilog to verilog 
//        
// *********************************************************************/ 

module CORELANEMSTRmode0
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
`timescale 1 ns / 1 ps
//timeunit 1ns;
//timeprecision 1ps;

wire tppoll = LTPULSE[0];

`include "request_code.v"

//Converting enum logic to Localparam
//and Logic variables to reg
// Registers and their next-state variables
// Request Master State
/*enum logic [3:0] {
    MIDLE,              // idling
    MSLO,               // request change to CDR locking
    MALF,               // acknowledging lock management change
    MWRDY,              // wait for RX_READY
    MPPOL,              // pre-polling
    MSTMR,              // polling timer
    MRDFC,              // requesting read of DONE_FULL_CAL
    MCHKDONE,           // branching on value of DONE_FULL_CAL
    MRXOK,              // requesting deassertion of PCS Rx Reset
    MCAL1,              // requesting calibration, step 1
    MCAL2,              // requesting calibration, step 2
    MCAL3               // requesting calibration, step 3
}  */

localparam [3:0]    MIDLE    = 4'd0;              // idling
localparam [3:0]    MSLO     = 4'd1;              // request change to CDR locking
localparam [3:0]    MALF     = 4'd2;               // acknowledging lock management change
localparam [3:0]    MWRDY    = 4'd3;              // wait for RX_READY
localparam [3:0]    MPPOL    = 4'd4;              // pre-polling
localparam [3:0]    MSTMR    = 4'd5;              // polling timer
localparam [3:0]    MRDFC    = 4'd6;              // requesting read of DONE_FULL_CAL
localparam [3:0]    MCHKDONE = 4'd7;           // branching on value of DONE_FULL_CAL
localparam [3:0]    MRXOK    = 4'd8;              // requesting deassertion of PCS Rx Reset
localparam [3:0]    MCAL1    = 4'd9;              // requesting calibration, step 1
localparam [3:0]    MCAL2    = 4'd10;              // requesting calibration, step 2
localparam [3:0]    MCAL3    = 4'd11;               // requesting calibration, step 3
reg [3:0]             rmfsm, rmfsm_nx;
reg                   o_lckfrc_st, o_lckfrc_nx;
reg                   calib_st, calib_nx;
reg [SZ_RQCODE-1:0]   rqCode, rqCode_nx;
reg                   rqEn, rqEn_nx;
reg                   rx_ok_st, rx_ok_nx;
reg [2:0]             calib_req_sync;
reg                   CalibReqRise, CalibReqRise_nx;
reg                   sync_hold_st, sync_hold_nx;
reg [1:0]             rx_ready_sync;

assign O_LCKFRC = o_lckfrc_st;
assign RQI = {rqCode, rqEn};
assign M_REQUEST = rqEn;
assign CALIBRATING = calib_st;
assign RX_OK = rx_ok_st;
assign CALIB_SYNC_HOLD = sync_hold_st;
wire rqDone = (RQR[0] & M_GRANT);
wire ReqExit = ~rqEn;

// Begin: Register modeling section
//Converting always_ff -> always
//always_ff @(posedge CTRL_CLK or negedge CTRL_SRST_N) begin
always @(posedge CTRL_CLK or negedge CTRL_SRST_N) begin
    if (~CTRL_SRST_N) begin
        rmfsm <= MIDLE;
        o_lckfrc_st <= 1'b1;
        calib_req_sync <= '1;
        CalibReqRise <= 1'b0;
        rx_ready_sync <= '0;
        rx_ok_st <= 1'b0;
        sync_hold_st <= 1'b0;
        rqCode <= RQC_L2R;
        rqEn <= 1'b0;
        calib_st <= 1'b0;
    end else begin
        rmfsm <= rmfsm_nx;
        o_lckfrc_st <= o_lckfrc_nx;
        calib_req_sync <= {calib_req_sync[1:0], CALIB_REQ};
        CalibReqRise <= CalibReqRise_nx;
        rx_ready_sync <= {rx_ready_sync[0], RX_READY};
        rx_ok_st <= rx_ok_nx;
        sync_hold_st <= sync_hold_nx;
        rqCode <= rqCode_nx;
        rqEn <= rqEn_nx;
        calib_st <= calib_nx;
    end
end
// End: Register modeling section


// Begin: Next-state variables determined by Request Management (rmfsm)
// replacing with always *
always @ (*) begin :rmfsm_combo
    rmfsm_nx = rmfsm;
    case (rmfsm)
        MIDLE: begin
            if (I_LCKFRC != o_lckfrc_st)
                rmfsm_nx = MSLO;
            else if (CalibReqRise && !o_lckfrc_st)
                rmfsm_nx = MCAL1;
        end
        MSLO: if (ReqExit) rmfsm_nx = MALF;
        MALF: begin
            if (o_lckfrc_st) rmfsm_nx = MIDLE;
            else             rmfsm_nx = MWRDY;
        end
        MWRDY: begin
            if (rx_ready_sync[1]) rmfsm_nx = MPPOL;
        end
        MPPOL: if (tppoll) rmfsm_nx = MSTMR;
        MSTMR: if (tppoll) rmfsm_nx = MRDFC;
        MRDFC: if (ReqExit) rmfsm_nx = MCHKDONE;
        MCHKDONE: begin
            if (!calib_st) rmfsm_nx = MRXOK;
            else rmfsm_nx = MSTMR;
        end
        MRXOK: if (ReqExit) rmfsm_nx = MIDLE;
        MCAL1: if (ReqExit) rmfsm_nx = MCAL2;
        MCAL2: if (ReqExit) rmfsm_nx = MCAL3;
        MCAL3: if (ReqExit) rmfsm_nx = MSTMR;
        default: rmfsm_nx = MIDLE;
    endcase
end //:rmfsm_combo

always @ (*) begin :rqCode_combo
    rqCode_nx = rqCode;
    case (rmfsm_nx)
        MSLO: rqCode_nx = I_LCKFRC ? RQC_L2R : RQC_L2D;
        MRDFC: rqCode_nx = RQC_READDFC;
        MRXOK: rqCode_nx = RQC_PCSRST0;
        MCAL1: rqCode_nx = RQC_PCSRST1;
        MCAL2: rqCode_nx = RQC_TGLCALRST;
        MCAL3: rqCode_nx = RQC_TGLRUNCAL;
    endcase
end //:rqCode_combo

always @ (*) begin :rqEn_combo
    rqEn_nx = rqEn;
    case (rmfsm_nx)
        MSLO, MRDFC, MRXOK,
        MCAL1, MCAL2, MCAL3: begin
            if (rmfsm_nx != rmfsm) rqEn_nx = 1'b1;
            else if (rqDone) rqEn_nx = 1'b0;
        end
        default: rqEn_nx = 1'b0;
    endcase
end //:rqEn_combo

always @ (*) begin :o_lckfrc_combo
    o_lckfrc_nx = o_lckfrc_st;
    if (rmfsm_nx == MALF) o_lckfrc_nx = ~o_lckfrc_st;
end //:o_lckfrc_combo

always @ (*) begin :rx_ok_combo
    rx_ok_nx = rx_ok_st;
    case (rmfsm_nx)
        MSLO: rx_ok_nx = 1'b0;
        MRXOK: rx_ok_nx = 1'b1;
        MCAL1: rx_ok_nx = 1'b0;
    endcase
end //:rx_ok_combo

always @ (*) begin :sync_hold_combo
    sync_hold_nx = sync_hold_st;
    case (rmfsm_nx)
        MIDLE: sync_hold_nx = 1'b0;
        MCAL1: sync_hold_nx = 1'b1;
    endcase
end :sync_hold_combo

always @ (*) begin :calib_combo
    calib_nx = calib_st;
    if (rmfsm_nx==MCHKDONE) calib_nx = ~RQR[1];
end //:calib_combo

// End: Next-state variables determined by Request Management (rmfsm)


// CALIB_REQ rising edge detection
always @ (*) begin :CalibReqRise_nx_combo
    if (!rx_ok_st) begin
        CalibReqRise_nx = 1'b0;
    end else if (calib_req_sync[2:1] == 2'b01) begin
        CalibReqRise_nx = 1'b1;
    end else begin
        CalibReqRise_nx = CalibReqRise;
    end
end //CalibReqRise_nx_combo

endmodule //CORELANEMSTRmode0
