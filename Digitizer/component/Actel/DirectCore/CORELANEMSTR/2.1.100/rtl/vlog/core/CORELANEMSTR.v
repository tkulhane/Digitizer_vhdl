// ********************************************************************
// Microsemi Corporation Proprietary and Confidential 
//  Copyright 2018 Microsemi Corporation.  All rights reserved.
//
// ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN 
// ACCORDANCE WITH THE MICROSEMI LICENSE AGREEMENT AND MUST BE APPROVED 
// IN ADVANCE IN WRITING.  
//  
// Description:  Lane Master Shell (CORELANEMSTR.sv)
//      This lane master shell handles the choice between several variants
//      of the functionality of Lane Master. The choice is implemented
//      with the MODE parameter which can be set as follows.
//      MODE    MEANING
//      0       Legacy functionality. This variant requires
//              the PF_XCVR configured for HW auto-kickoff calibration.
//              This functionality is not compatible with use of CoreRFD.
//              This implementation supports calibration plus on-demand
//              calibration.
//      1       Enhanced functionality with support for CoreRFD. This
//              variant supports soft auto-kickoff calibration upon first
//              lock and on-demand calibration. This variant requires
//              the PF_XCVR configured for no HW auto-kickoff
//              calibration.
//      2       Much simplified variant for use with CoreRFD where no
//              calibration is required of CDR and/or DFE. This variant
//              does not respond in any way to ON_DEMAND. Outputs
//              CALIBRATING and ACK_ON_DEMAND are constant 0.
//      3       A modified variant of MODE=1 where the CoreLaneMstr
//              does not automatically initiate calibration on first
//              bit-lock.
//      
// Revision Information:
// Date     Description
// 19Sep18 Initial Release 
//
// SVN Revision Information:
// SVN $Revision: 8752 $
// SVN $Date: 2018-10-09 08:13:47 -0700 (Tue, 09 Oct 2018) $
//
// Resolved SARs
// SAR      Date     Who   Description
// 102006   8Oct18   Brian Changed port names: LNK_CLK to CTRL_CLK;
//                         LNK_SRST_N to CTRL_SRST_N;
//                         ON_DEMAND to CALIB_REQ.
//                         Removed port ACK_ON_DEMAND;
// 101850   8Oct18   Brian Added CALIB_SYNC_HOLD output port. This new
//                         signal goes to CoreLckMgt preventing
//                         a transition to lock-to-reference during
//                         receiver calibration.
// 101579   8Oct18   Brian Added MODE=3 parameter value support.
// 101425   9Oct18   Brian Moved sqfsm to CoreLnkMstr. Reduced RQI bus.
// Notes:   2sep20   preethi Added Ports for Incremental DFE and
//                           DataClock Eye Centering
//                           Incremental DFE and Data Clock Eye Centering
//                           added for Mode 1 and 3.
//                           For Mode 2 and Mode0 this outputs are tied
//                           to logic 0
//                           Converted the System verilog -> verilog 
//        
// *********************************************************************/ 
`timescale 1 ns / 1 ps
module CORELANEMSTR
#(
parameter integer       MODE=1,
                        // See header for description of variants.
parameter               SIMULATION_MODE=0
                        // 0 = Full simulation
                        // 1 = Pass-through, all Calib signals tied-off			
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
                        // asynchronous flag wrt LNK_CLK
                        // Previously external synchronization logic
                        // is now pulled into this module.
input                   USR_DATACLK_RECAL,
input                   USR_DFE_RECAL,
// Common interface signals
input              CTRL_CLK,
input              CTRL_SRST_N,
// Fabric IP interface
input              CALIB_REQ,
                        // asynchronous wrt LNK_CLK
                        // Previously external synchronization and
                        // rising edge detection logic is now moved
                        // inside this module.
output             CALIBRATING,
                        // High during DFE calibration.
output             CALIB_SYNC_HOLD,
                        // Rises prior to any calibration-induced loss of
                        // RX_READY, falls post-calibration.
                        // CALIB_SYNC_HOLD=1 does not necessarily
                        // imply a calibration is running. Use
                        // CALIBRATING output for that purpose
output             RX_OK,
                        // Delayed rising RX_READY. RX_OK is low
                        // during DFE calibration.
output             USR_DATACLK_RECAL_DONE,
output             USR_DFE_RECAL_DONE);

//timeunit 1ns;
//timeprecision 1ps;
//Commented as parameter checking is not supported in system verilog
// Begin parameter checking
/*if (!(MODE inside {0,1,2,3})) begin :g_a0
    $fatal(0,"MODE=%0d; must be one of (0 1 2 3)",MODE);
end :g_a0*/
// End parameter checking

// synthesis translate_off
if (SIMULATION_MODE==0) begin : rtl_sim
// synthesis translate_on
  if (MODE==0) begin :g_mode0
    CORELANEMSTRmode0 u_mstr ( 
      .LTPULSE(LTPULSE),
      .I_LCKFRC(I_LCKFRC),
      .O_LCKFRC(O_LCKFRC),
      .M_GRANT(M_GRANT),
      .M_REQUEST(M_REQUEST),
      .RQI(RQI),
      .RQR(RQR),
      .RX_READY(RX_READY),
      .CTRL_CLK(CTRL_CLK),
      .CTRL_SRST_N(CTRL_SRST_N),
      .CALIB_REQ(CALIB_REQ),
      .CALIBRATING(CALIBRATING),
      .RX_OK(RX_OK),
      .CALIB_SYNC_HOLD(CALIB_SYNC_HOLD));
    assign USR_DATACLK_RECAL_DONE = 1'b0;
    assign USR_DFE_RECAL_DONE = 1'b0; 
  end :g_mode0

  if (MODE==1) begin :g_mode1
  //CORELANEMSTRmode1 #(.AUTO(1)) u_mstr (.*);
    CORELANEMSTRmode1 #(.AUTO(1)) u_mstr (
      .LTPULSE(LTPULSE),
      .I_LCKFRC(I_LCKFRC),
      .O_LCKFRC(O_LCKFRC),
      .M_GRANT(M_GRANT),
      .M_REQUEST(M_REQUEST),
      .RQI(RQI),
      .RQR(RQR),
      .RX_READY(RX_READY),
      .USR_DATACLK_RECAL(USR_DATACLK_RECAL),
      .USR_DFE_RECAL(USR_DFE_RECAL),
      .CTRL_CLK(CTRL_CLK),
      .CTRL_SRST_N(CTRL_SRST_N),
      .CALIB_REQ(CALIB_REQ),
      .CALIBRATING(CALIBRATING),
      .RX_OK(RX_OK),
      .CALIB_SYNC_HOLD(CALIB_SYNC_HOLD),
      .USR_DATACLK_RECAL_DONE(USR_DATACLK_RECAL_DONE),
      .USR_DFE_RECAL_DONE(USR_DFE_RECAL_DONE));
  end :g_mode1

  if (MODE==2) begin :g_mode2
    //CORELANEMSTRmode2 u_mstr (.*);
    CORELANEMSTRmode2 u_mstr ( 
      .LTPULSE(LTPULSE),
      .I_LCKFRC(I_LCKFRC),
      .O_LCKFRC(O_LCKFRC),
      .M_GRANT(M_GRANT),
      .M_REQUEST(M_REQUEST),
      .RQI(RQI),
      .RQR(RQR),
      .RX_READY(RX_READY),
      .CTRL_CLK(CTRL_CLK),
      .CTRL_SRST_N(CTRL_SRST_N),
      .CALIB_REQ(CALIB_REQ),
      .CALIBRATING(CALIBRATING),
      .RX_OK(RX_OK),
      .CALIB_SYNC_HOLD(CALIB_SYNC_HOLD));
    assign USR_DATACLK_RECAL_DONE = 1'b0;
    assign USR_DFE_RECAL_DONE = 1'b0; 
  end :g_mode2

  if (MODE==3) begin :g_mode3
    //CORELANEMSTRmode1 #(.AUTO(0)) u_mstr (.*);
    CORELANEMSTRmode1 #(.AUTO(0)) u_mstr (
      .LTPULSE(LTPULSE),
      .I_LCKFRC(I_LCKFRC),
      .O_LCKFRC(O_LCKFRC),
      .M_GRANT(M_GRANT),
      .M_REQUEST(M_REQUEST),
      .RQI(RQI),
      .RQR(RQR),
      .RX_READY(RX_READY),
      .USR_DATACLK_RECAL(USR_DATACLK_RECAL),
      .USR_DFE_RECAL(USR_DFE_RECAL),
      .CTRL_CLK(CTRL_CLK),
      .CTRL_SRST_N(CTRL_SRST_N),
      .CALIB_REQ(CALIB_REQ),
      .CALIBRATING(CALIBRATING),
      .RX_OK(RX_OK),
      .CALIB_SYNC_HOLD(CALIB_SYNC_HOLD),
      .USR_DATACLK_RECAL_DONE(USR_DATACLK_RECAL_DONE),
      .USR_DFE_RECAL_DONE(USR_DFE_RECAL_DONE));
  end :g_mode3
  // synthesis translate_off
end 
else begin: pass_through_sim //rtl_sim
  assign M_REQUEST = 1'b0;
  assign RQI = 6'd0;
  assign O_LCKFRC = 1'b0;
  assign CALIBRATING = 1'b0;
  assign CALIB_SYNC_HOLD= 1'b0;
  assign RX_OK = RX_READY;
  assign USR_DATACLK_RECAL_DONE = 1'b0;
  assign USR_DFE_RECAL_DONE = 1'b0;
end	
// synthesis translate_on
endmodule  //:CORELANEMSTR
