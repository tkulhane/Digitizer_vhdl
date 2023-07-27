// ********************************************************************
// Microsemi Corporation Proprietary and Confidential 
//  Copyright 2018 Microsemi Corporation.  All rights reserved.
//
// ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN 
// ACCORDANCE WITH THE MICROSEMI LICENSE AGREEMENT AND MUST BE APPROVED 
// IN ADVANCE IN WRITING.  
//  
// Description:  Lane Master mode1 (CORELANEMSTRmode1.sv)
//    This lane master intiates RQ transactions for the following
//    reasons:
//    a) requesting CDR lock-to-data
//    b) requesting CDR lock-to-reference
//    c) asserting soft PCS Rx Reset
//    d) deasserting soft PCS Rx Reset
//    e) toggling DFE_CAL_RST (->1->0)
//    d) toggling DFE_RUN_FULL_CAL (->0->1->0)
//    e) reading DONE_FULL_CAL
// This is an enhanced variant for use with CoreRFD. This variant 
// requires the PF_XCVR be configured to not support the HW
// auto-kickoff calibration. The auto-kickoff calibration is implemented
// by this module the first time the RX_READY input (CoreRFD's RX_FINE_LOCK)
// rises. Only use this variant when calibration of the CDR or DFE is
// desired.
//      
// Revision Information:
// Date     Description
// 14Sep18 Initial Release 
//
// SVN Revision Information:
// SVN $Revision: 8764 $
// SVN $Date: 2018-10-11 11:21:08 -0700 (Thu, 11 Oct 2018) $
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
// 101579   8Oct18   Brian Added AUTO parameter. AUTO=0 disables automatic
//                         receiver calibration.
// 102006   8Oct18   Brian Port naming changes.
// 101850   8Oct18   Brian Added CALIB_SYNC_HOLD output port.
// 101425   9Oct18   Brian Moved sqfsm to CoreLnkMstr. Reduced RQI, RQR
//                         bus sizes.
// 101848   9Oct18   Brian Changed reset value of the CALIB_REQ synchronizer
//                         such that an initial 1 on CALIB_REQ will not
//                         be treated as a rising edge.
// 102160  11Oct18   Brian Unusually large synthesis difference AUTO={0,1}
//         25Aug20  Preethi Added support for Data clk Eye centering and
//                          Incremental DFE 
//                          Changed the RQI Bus Size
//                          Changed system verilog -> verilog                         
// Notes: 
//        
// *********************************************************************/ 

module CORELANEMSTRmode1
#(
parameter integer       AUTO=0
                        // AUTO=1 means automatic calibration occurs upon
                        // first bit-lock event.
                        // AUTO=0 means no automatic calibration occurs
)
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
input		        USR_DATACLK_RECAL,
input		        USR_DFE_RECAL,
// Common interface signals
input                  CTRL_CLK,
input                  CTRL_SRST_N,
// Fabric IP interface
input                  CALIB_REQ,
                        // asynchronous wrt CTRL_CLK
                        // Previously external synchronization and
                        // rising edge detection logic is now moved
                        // inside this module.
output                 CALIBRATING,
                        // High during DFE calibration.
output                 RX_OK,
                        // Delayed rising RX_READY. RX_OK is low
                        // during DFE calibration.
output                 CALIB_SYNC_HOLD,
                        // Rises prior to any calibration-induced loss of
                        // RX_READY, falls post-calibration.
                        // CALIB_SYNC_HOLD=1 does not necessarily
                        // imply a calibration is running. Use
                        // CALIBRATING output for that purpose.
output                  USR_DATACLK_RECAL_DONE,
output                  USR_DFE_RECAL_DONE);

//timeunit 1ns;
//timeprecision 1ps;

`timescale 1 ns / 1 ps

wire tppoll = LTPULSE[0];

/*// Begin parameter checking
if (!(AUTO inside {0,1})) begin :g_a0
    $fatal(0,"AUTO=%0d must be one of (0 1)",AUTO);
end :g_a0
// End parameter checking*/

`include "request_code.v"

//Replacing enum with Localparam
// Registers and their next-state variables
// Request Master State
/*enum logic [4:0] {
    MIDLE,              // idling
    MSLO,               // request change to CDR locking
    MALF,               // acknowledging lock management change
    MWRDY,              // wait for RX_READY
    MPPOL,              // pre-polling
    MSTMR,              // polling timer
    MRDFC,              // requesting read of DONE_FULL_CAL
    MCHKDONE,           // branching on value of DONE_FULL_CAL
    MRXOK,              // requesting deassertion of PCS Rx Reset
    MPRECAL,            // pre-calibration state
    MCAL1,              // requesting calibration, step 1
    MCAL2,              // requesting calibration, step 2
    MCAL3,              // requesting calibration, step 3
    MEYEIDLE,           //Dataclk centering and Incr DFE Idle state
    MRDC,               // Read & Load DC Offset value 
    MSH0DFE,            // Set SEL_H0DFE = '1'
    MRSH0DFE,           // Reset SEL_H0DFE  '0'
    MSDFECAL,	        // set DFE_CAL_EM_ONLY = '1'
    MTACOMP,            // Toggle RUN_AREA_COMPUTE_USER bit
    MRACOMP,            // Read Read DONE_AREA_COMPUTE bit
    MRSDFECAL,          // Reset DFE_CAL_EM_ONLY = '0'
    MDECHKDONE,         // branching on value of DONE_AREA_COMPUTE
    MRMAXDFE,          // Read MAX_DFE_CYCLES 
    MWMAXDFE,          // Write MAX_DFE_CYCLES 
    MRHMON,            // Read & write DFE Calibration code 
    MSCOEFF,           // Set SET_DFE_COEFFS_USER bit 
    MRFORCEH,          // Read DFE_CAL_FORCEH bit
    MWFORCEH,          // Write back DFE_CAL_FORCEH bit
    MDFECALUSR,        // Toggle RUN_DFECAL_USER bit
    MRDONEDFECAL,      // Read DONE_DFECAL bit
    MINCDFECHKDONE     // branching on DONE_DFECAL bit
  
} */

localparam [4:0]    MIDLE          =5'd0; // idling
localparam [4:0]    MSLO           =5'd1; // request change to CDR locking
localparam [4:0]    MALF           =5'd2; // acknowledging lock management change
localparam [4:0]    MWRDY          =5'd3; // wait for RX_READY
localparam [4:0]    MPPOL          =5'd4; // pre-polling
localparam [4:0]    MSTMR          =5'd5; // polling timer
localparam [4:0]    MRDFC          =5'd6; // requesting read of DONE_FULL_CAL
localparam [4:0]    MCHKDONE       =5'd7; // branching on value of DONE_FULL_CAL
localparam [4:0]    MRXOK          =5'd8; // requesting deassertion of PCS Rx Reset
localparam [4:0]    MPRECAL        =5'd9; // pre-calibration state
localparam [4:0]    MCAL1          =5'd10; // requesting calibration, step 1
localparam [4:0]    MCAL2          =5'd11;// requesting calibration, step 2
localparam [4:0]    MCAL3          =5'd12;// requesting calibration, step 3
localparam [4:0]    MEYEIDLE       =5'd13;//Dataclk centering and Incr DFE Idle state
localparam [4:0]    MRDC           =5'd14;// Read & Load DC Offset value 
localparam [4:0]    MSH0DFE        =5'd15;// Set SEL_H0DFE = '1'
localparam [4:0]    MRSH0DFE       =5'd16;// Reset SEL_H0DFE  '0'
localparam [4:0]    MSDFECAL       =5'd17;// set DFE_CAL_EM_ONLY = '1'
localparam [4:0]    MTACOMP        =5'd18;// Toggle RUN_AREA_COMPUTE_USER bit
localparam [4:0]    MRACOMP        =5'd19;// Read Read DONE_AREA_COMPUTE bit
localparam [4:0]    MRSDFECAL      =5'd20;// Reset DFE_CAL_EM_ONLY = '0'
localparam [4:0]    MDECHKDONE     =5'd21;// branching on value of DONE_AREA_COMPUTE
localparam [4:0]    MRMAXDFE       =5'd22;// Read MAX_DFE_CYCLES 
localparam [4:0]    MWMAXDFE       =5'd23;// Write MAX_DFE_CYCLES 
localparam [4:0]    MRHMON         =5'd24;// Read & write DFE Calibration code 
localparam [4:0]    MSCOEFF        =5'd25;// Set SET_DFE_COEFFS_USER bit 
localparam [4:0]    MRFORCEH       =5'd26;// Read DFE_CAL_FORCEH bit
localparam [4:0]    MWFORCEH       =5'd27;// Write back DFE_CAL_FORCEH bit
localparam [4:0]    MDFECALUSR     =5'd28;// Toggle RUN_DFECAL_USER bit
localparam [4:0]    MRDONEDFECAL   =5'd29;// Read DONE_DFECAL bit
localparam [4:0]    MINCDFECHKDONE =5'd30;// branching on DONE_DFECAL bit
  
reg [4:0]             rmfsm, rmfsm_nx;
reg                   o_lckfrc_st, o_lckfrc_nx;
reg                   calib_st, calib_nx;
reg [SZ_RQCODE-1:0]   rqCode, rqCode_nx;
reg                   rqEn, rqEn_nx;
reg                   rx_ok_st, rx_ok_nx;
reg [2:0]             calib_req_sync;
reg                   CalibReqRise, CalibReqRise_nx;
reg                   sync_hold_st, sync_hold_nx;
reg                   firstcal, firstcal_nx;
reg [1:0]             rx_ready_sync;

//Signals added for Incremental DFE
reg [2:0]             usr_dataclk_recal_sync;
reg [2:0]             usr_dfe_recal_sync;
reg                   usr_dataclk_rise;
reg                   usr_dfe_recal_rise;
reg                   dataclk_nx, dataclk_st;
reg                   incr_dfe_fg, incr_dfe_fg_nx;
reg                   incrdfe_st,incrdfe_st_nx;

reg                   dataclk_ok_st,dataclk_ok_nx;
reg                   incrdfe_ok_st,incrdfe_ok_nx;

assign O_LCKFRC = o_lckfrc_st;
assign RQI = {rqCode, rqEn};
assign M_REQUEST = rqEn;
assign CALIBRATING = calib_st;
assign RX_OK = rx_ok_st;
assign CALIB_SYNC_HOLD = sync_hold_st;
wire rqDone = (RQR[0] & M_GRANT);
wire ReqExit = ~rqEn;
assign USR_DFE_RECAL_DONE = incrdfe_ok_st;
assign USR_DATACLK_RECAL_DONE = dataclk_ok_st;

// Begin: Register modeling section
//Replaced always_ff -> always sv-> verilog
always @(posedge CTRL_CLK or negedge CTRL_SRST_N) begin
    if (~CTRL_SRST_N) begin
        rmfsm <= MIDLE;
        o_lckfrc_st <= 1'b1;
        calib_req_sync <= '1;
        CalibReqRise <= 1'b0;
        rx_ready_sync <= '0;
        rx_ok_st <= 1'b0;
        sync_hold_st <= 1'b0;
        firstcal <= 1'b0;
        rqCode <= RQC_L2R;
        rqEn <= 1'b0;
        calib_st <= 1'b0;
        usr_dataclk_recal_sync <= '1;
        usr_dfe_recal_sync <= '1;
        dataclk_st <= '0;
        incr_dfe_fg <= '0;
        incrdfe_st <= '0;
        dataclk_ok_st <= '0;
        incrdfe_ok_st <= '0; 
    end else begin
        rmfsm <= rmfsm_nx;
        o_lckfrc_st <= o_lckfrc_nx;
        calib_req_sync <= {calib_req_sync[1:0], CALIB_REQ};
        CalibReqRise <= CalibReqRise_nx;
        rx_ready_sync <= {rx_ready_sync[0], RX_READY};
        rx_ok_st <= rx_ok_nx;
        sync_hold_st <= sync_hold_nx;
        firstcal <= firstcal_nx;
        rqCode <= rqCode_nx;
        rqEn <= rqEn_nx;
        calib_st <= calib_nx;
        usr_dataclk_recal_sync <= {usr_dataclk_recal_sync[1:0],USR_DATACLK_RECAL};
        usr_dfe_recal_sync <= {usr_dfe_recal_sync[1:0],USR_DFE_RECAL};
        dataclk_st <= dataclk_nx;
        incr_dfe_fg <= incr_dfe_fg_nx;
        incrdfe_st <= incrdfe_st_nx;
        dataclk_ok_st <= dataclk_ok_nx;
        incrdfe_ok_st <= incrdfe_ok_nx;         

    end
end
// End: Register modeling section
// Begin: Next-state variables determined by Request Management (rmfsm)
// //Replaced always_comb -> always @ (*) sv-> verilog
always @(*) begin :rmfsm_combo
    rmfsm_nx = rmfsm;
    incr_dfe_fg_nx =  incr_dfe_fg;
    case (rmfsm)
        MIDLE: begin
            incr_dfe_fg_nx = 1'b0;
            if (I_LCKFRC != o_lckfrc_st)
                rmfsm_nx = MSLO;
            else if (CalibReqRise && !o_lckfrc_st)
                rmfsm_nx = MPRECAL;
            else if(usr_dataclk_rise && rx_ok_st) //Calibration done once
              rmfsm_nx = MEYEIDLE;
            else if(usr_dfe_recal_rise && rx_ok_st)begin
              rmfsm_nx = MEYEIDLE;
              incr_dfe_fg_nx = 1'b1;
            end         
        end
        MSLO: if (ReqExit) rmfsm_nx = MALF;
        MALF: begin
            if (o_lckfrc_st) rmfsm_nx = MIDLE;
            else             rmfsm_nx = MWRDY;
        end
        MWRDY: begin
            if (rx_ready_sync[1] && (!firstcal && (AUTO==1))) rmfsm_nx = MPRECAL;
            else if (rx_ready_sync[1]) rmfsm_nx = MPPOL;
        end
        MPPOL: if (tppoll) rmfsm_nx = MSTMR;
        
	MSTMR: if (tppoll)begin
          if (rx_ok_st) begin  //If DFE is already done,chk fr Incr DFE
            if (!incr_dfe_fg) rmfsm_nx = MRACOMP; //Read Data Clk Eye cetering Done status
            else  rmfsm_nx = MRDONEDFECAL;
          end else rmfsm_nx = MRDFC; //DFE Not yet Done
        end	 
        MRDFC: if (ReqExit) rmfsm_nx = MCHKDONE;
          
        MCHKDONE: if (!calib_st) rmfsm_nx = MRXOK;
                  else rmfsm_nx = MSTMR;
     	MDECHKDONE:if(!dataclk_st) rmfsm_nx = MRSH0DFE;
                   else            rmfsm_nx = MSTMR;
        MINCDFECHKDONE: if(!incrdfe_st) rmfsm_nx = MRSH0DFE;
                        else rmfsm_nx = MSTMR;
        MRXOK: if (ReqExit) rmfsm_nx = MIDLE;
        MPRECAL: rmfsm_nx = MCAL1;
        MCAL1: if (ReqExit) rmfsm_nx = MCAL2;
        MCAL2: if (ReqExit) rmfsm_nx = MCAL3;
        MCAL3: if (ReqExit) rmfsm_nx = MSTMR;
        MEYEIDLE : if(rx_ready_sync[1]) rmfsm_nx = MRDC;

        MRDC:      if(ReqExit) rmfsm_nx =  MSH0DFE;
        MSH0DFE :  if(ReqExit) begin
                     if (!incr_dfe_fg) rmfsm_nx = MSDFECAL;
                     else rmfsm_nx = MRMAXDFE;
                   end 
        MSDFECAL:  if(ReqExit) rmfsm_nx = MTACOMP;
        MTACOMP :  if(ReqExit) rmfsm_nx = MSTMR; 
        MRSH0DFE : if(ReqExit) begin
                     if(!incr_dfe_fg) rmfsm_nx = MRSDFECAL;
                     else rmfsm_nx = MWFORCEH;
                   end
        MRACOMP :  if(ReqExit) rmfsm_nx = MDECHKDONE;
        MRSDFECAL: if(ReqExit) rmfsm_nx = MIDLE;
        MRMAXDFE : if(ReqExit) rmfsm_nx = MRHMON;
        MRHMON : if(ReqExit) rmfsm_nx = MSCOEFF; 
        MSCOEFF : if(ReqExit) rmfsm_nx = MRFORCEH; 
        MRFORCEH : if(ReqExit) rmfsm_nx = MDFECALUSR;
        MDFECALUSR:if(ReqExit) rmfsm_nx = MSTMR;
        MRDONEDFECAL: if(ReqExit) rmfsm_nx = MINCDFECHKDONE;
        MWFORCEH : if(ReqExit) rmfsm_nx = MWMAXDFE;
        MWMAXDFE: if(ReqExit) rmfsm_nx = MIDLE;
        default: rmfsm_nx = MIDLE;
    endcase
end  //:rmfsm_combo

//Replaced always_comb -> always @ (*) sv-> verilog
always @(*) begin :rqCode_combo
    rqCode_nx = rqCode;
    case (rmfsm_nx)
        MSLO: rqCode_nx = I_LCKFRC ? RQC_L2R : RQC_L2D;
        MRDFC: rqCode_nx = RQC_READDFC;
        MRXOK: rqCode_nx = RQC_PCSRST0;
        MCAL1: rqCode_nx = RQC_PCSRST1;
        MCAL2: rqCode_nx = RQC_TGLCALRST;
        MCAL3: rqCode_nx = RQC_TGLRUNCAL;
        MRDC:  rqCode_nx = RQC_READ_DC;
        MSH0DFE : rqCode_nx = RQC_SET_H0DFE1;
        MSDFECAL : rqCode_nx = RQC_SET_DFE_CAL_EM1;
        MTACOMP : rqCode_nx = RQC_TGLRUN_AREA_COMP;
        MRSH0DFE: rqCode_nx = RQC_SET_H0DFE0;
        MRACOMP : rqCode_nx = RQC_READ_AREA_COMP;	
        MRSDFECAL : rqCode_nx = RQC_SET_DFE_CAL_EM0;
        MRMAXDFE : rqCode_nx = RQC_READ_MAX_DFE;
        MRHMON   : rqCode_nx = RQC_READ_CALIB_CODE;
        MSCOEFF  : rqCode_nx = RQC_SET_DFE_COEFFS_USER;
        MRFORCEH : rqCode_nx = RQC_READ_DFE_CAL_FORCEH;
        MDFECALUSR: rqCode_nx = RQC_TGL_RUN_DFECAL_USER;
        MRDONEDFECAL : rqCode_nx = RQC_DONE_DFECAL;  
        MWFORCEH : rqCode_nx = RQC_WRITE_DFE_CAL_FORCEH;
        MWMAXDFE : rqCode_nx = RQC_WRITE_MAX_DFE;
    endcase
end  //:rqCode_combo

//Replaced always_comb -> always @ (*) sv-> verilog
always @(*) begin :rqEn_combo
    rqEn_nx = rqEn;
    case (rmfsm_nx)
        MSLO, MRDFC, MRXOK,
        MCAL1, MCAL2, MCAL3,
        MRDC, MSH0DFE,MRMAXDFE,
        MSDFECAL,MTACOMP,MRSH0DFE,
        MRSDFECAL,MRACOMP,
        MRHMON, MSCOEFF, MRFORCEH,
        MDFECALUSR,MRDONEDFECAL,
        MWFORCEH,MWMAXDFE  : begin
          if (rmfsm_nx != rmfsm) rqEn_nx = 1'b1;
          else if (rqDone) rqEn_nx = 1'b0;
        end
        default: rqEn_nx = 1'b0;
    endcase
end //:rqEn_combo

//Replaced always_comb -> always @ (*) sv-> verilog
always @(*) begin :o_lckfrc_combo
    o_lckfrc_nx = o_lckfrc_st;
    if (rmfsm_nx == MALF) o_lckfrc_nx = ~o_lckfrc_st;
end //:o_lckfrc_combo

//Replaced always_comb -> always @ (*) sv-> verilog
always @(*) begin :rx_ok_combo
    rx_ok_nx = rx_ok_st;
    case (rmfsm_nx)
        MSLO: rx_ok_nx = 1'b0;
        MRXOK: rx_ok_nx = 1'b1;
        MCAL1: rx_ok_nx = 1'b0;
    endcase
end //:rx_ok_combo

//Replaced always_comb -> always @ (*) sv-> verilog
always @(*) begin :dataclk_ok_combo
    dataclk_ok_nx = dataclk_ok_st;
    case (rmfsm_nx)
        MSLO: dataclk_ok_nx = 1'b0;
        MRSDFECAL: dataclk_ok_nx = 1'b1;
        MEYEIDLE: if(usr_dataclk_rise & rx_ok_st) dataclk_ok_nx = 1'b0;
    endcase
end //:dataclk_ok_combo

//Replaced always_comb -> always @ (*) sv-> verilog
always @(*) begin :incrdfe_ok_combo
    incrdfe_ok_nx = incrdfe_ok_st;
    case (rmfsm_nx)
        MSLO: incrdfe_ok_nx = 1'b0;
        MWMAXDFE: incrdfe_ok_nx = 1'b1;
        MEYEIDLE: if(usr_dfe_recal_rise & rx_ok_st) incrdfe_ok_nx = 1'b0;
    endcase
end //:incrdfe_ok_combo

//Replaced always_comb -> always @ (*) sv-> verilog
always @(*) begin :sync_hold_combo
    sync_hold_nx = sync_hold_st;
    case (rmfsm_nx)
        MIDLE: sync_hold_nx = 1'b0;
        MCAL1: sync_hold_nx = 1'b1;
    endcase
end //:sync_hold_combo

//Replaced always_comb -> always @ (*) sv-> verilog
always @(*) begin :firstcal_combo
    firstcal_nx = firstcal;
    if (rmfsm_nx==MCHKDONE) firstcal_nx = 1'b1;
end //:firstcal_combo

//Replaced always_comb -> always @ (*) sv-> verilog
always @(*) begin :calib_combo
    calib_nx = calib_st;
    if (rmfsm_nx==MCHKDONE) calib_nx = ~RQR[1];
end //:calib_combo

//Replaced always_comb -> always @ (*) sv-> verilog
always @(*) begin :dataclk_combo
    dataclk_nx = dataclk_st;
    if(rmfsm_nx == MEYEIDLE)begin
      if(usr_dataclk_rise) dataclk_nx = '0;
    end else if (rmfsm_nx== MDECHKDONE) dataclk_nx = ~RQR[1];
end //:dataclk_combo

//Replaced always_comb -> always @ (*) sv-> verilog
always @(*) begin :incrdfe_combo
    incrdfe_st_nx = incrdfe_st;
    if(rmfsm_nx == MEYEIDLE)begin
     if(usr_dfe_recal_rise) incrdfe_st_nx = '0;
    end else if (rmfsm_nx == MINCDFECHKDONE) incrdfe_st_nx = ~RQR[1];
end //:incrdfe_combo


// End: Next-state variables determined by Request Management (rmfsm)
// CALIB_REQ rising edge detection
//Replaced always_comb -> always @ (*) sv-> verilog
always @(*) begin :CalibReqRise_nx_combo
    if (!rx_ok_st) begin
        CalibReqRise_nx = 1'b0;
    end else if (calib_req_sync[2:1] == 2'b01) begin
        CalibReqRise_nx = 1'b1;
    end else begin
        CalibReqRise_nx = CalibReqRise;
    end
end //:CalibReqRise_nx_combo

assign usr_dataclk_rise = (usr_dataclk_recal_sync[2:1] == 2'b01)? '1 : '0;
assign usr_dfe_recal_rise = (usr_dfe_recal_sync[2:1] == 2'b01)? '1: '0;

endmodule //:CORELANEMSTRmode1
