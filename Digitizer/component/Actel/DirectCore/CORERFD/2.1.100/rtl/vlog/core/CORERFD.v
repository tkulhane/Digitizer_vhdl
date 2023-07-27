// ********************************************************************
// Microsemi Corporation Proprietary and Confidential 
//  Copyright 2018 Microsemi Corporation.  All rights reserved.
//
// ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN 
// ACCORDANCE WITH THE MICROSEMI LICENSE AGREEMENT AND MUST BE APPROVED 
// IN ADVANCE IN WRITING.  
//  
// Description:  Rotational Frequency Detector (CORERFD.sv)
//
// Revision Information:
// Date     Description
// 17Sep18 Initial Release 
//
// SVN Revision Information:
// SVN $Revision: 8741 $
// SVN $Date: 2018-10-08 17:19:41 -0700 (Mon, 08 Oct 2018) $
//
// Resolved SARs
// SAR      Date     Who   Description
// 102039   8Oct18   Brian Renamed parameter from MODE to PPM.
//                         PPM has allowed values 500 and 4000.
// 102879   5Nov18   Alex  Replaced all SystemVerilog code with Verilog code
//
// Notes: 
//        
// *********************************************************************/ 
`timescale 1 ns / 1 ps

module CORERFD
#(parameter integer     PPM=4000)
  // The PPM parameter setting impacts the allowed frequency difference,
  // the lock time and the FPGA resources required.
  // PPM  Max Diff    Lock Delay    FPGA
  //      (ppm)       Cycles TYP    (Cost)
  // 500  500         16,378        77
  // 4000 4000         4,090        58
(
// common interface
input                   ARST_N,
                        // Low-active asynchronous reset
                        // Tied to initialization wire
// Clocks being compared. Nominally the same frequency.
input                   CLK_IN,
                        // Derived from recovered receiver clock.
                        // Sometimes this is directly from PF_XCVR
                        // RX_CLK_R, but not always!
input                   CLK_REF,
                        // Derived frequency reference. Sometimes
                        // this can be directly from PF_XCVR
                        // TX_CLK_R, but not always!
// PF_XCVR interface
input                   XCVR_RX_READY,
                        // Present coarse CDR frequency lock flag
// IP interface
output                  RX_FINE_LOCK
                        // The fine CDR frequency lock flag
);
// Alex: replaced timeunit and timeprecision with timescale for SV->Verilog
// timeunit 1ns;
// timeprecision 1ps;


wire                    rstn = (XCVR_RX_READY & ARST_N);

// Alex: removed parameter checking, not supported by Verilog
// Begin Parameter handling
// if (!(PPM inside {500,4000})) begin :g_a0
//     $fatal(0,"PPM=%0d; must be one of (500 4000)",PPM);
// end :g_a0
localparam integer      SAMPLE_CTR_SIZE =
    (PPM==500) ? 12 : 10;
localparam integer      ROT_SH_CTR_SIZE =
    (PPM==500) ? 5 : 6;
localparam integer      SAMPLECNT =
    (PPM==500) ? 'd4095 : 'd1023;
localparam integer      ROTSH =
    (PPM==500) ? 'd11 : 'd18;
localparam integer      PPMHIGH = 1e6*(ROTSH)/(4*SAMPLECNT);
localparam integer      PPMLOW = 1e6*(ROTSH-1)/(4*SAMPLECNT);
localparam integer      HIST = 2;
localparam integer      UNLOCK_HIST = 2;
localparam integer      LOCK_HIST = 0;
// End Parameter handling

/*AUTOREGINPUT*/
/*AUTOWIRE*/
// Beginning of automatic wires (for undeclared instantiated-module outputs)
wire                    error;                  // From u_sicr of CORERFDsicr.v
wire                    sample;                 // From u_sicr of CORERFDsicr.v
// End of automatics

/* CORERFDsicr AUTO_TEMPLATE (
  .clk_in                               (CLK_IN),
  .clk_ref                              (CLK_REF),
  .max_sample_count                     (SAMPLECNT[0+:SAMPLE_CTR_SIZE]),
  .max_rotation_shift                   (ROTSH[0+:ROT_SH_CTR_SIZE-1]),
);*/
CORERFDsicr
#(
    .ROT_SH_CTR_SIZE(ROT_SH_CTR_SIZE),
    .SAMPLE_CTR_SIZE(SAMPLE_CTR_SIZE)
) u_sicr
(/*AUTOINST*/
 // Outputs
 .error                                 (error),
 .sample                                (sample),
 // Inputs
 .clk_in                                (CLK_IN),                // Templated
 .clk_ref                               (CLK_REF),               // Templated
 .max_sample_count                      (SAMPLECNT[0+:SAMPLE_CTR_SIZE]), // Templated
 .max_rotation_shift                    (ROTSH[0+:ROT_SH_CTR_SIZE-1]), // Templated
 .rstn                                  (rstn));

reg   [HIST-1:0]    history, history_nx;
reg                 fine_lock, fine_lock_nx;
reg                 unlock_event, lock_event;

// Alex: replaced always_ff with always @ for SV->Verilog
always @(posedge CLK_REF or negedge rstn) begin
    if (~rstn) begin
        history <= 0;
        fine_lock <= 1'b0;
    end else begin
        history <= history_nx;
        fine_lock <= fine_lock_nx;
    end
end

// Alex: replaced always comb with always @ (*) for SV->Verilog
always @ (*) begin :history_combo
    if (sample)
        history_nx = {history[HIST-2:0], ~error};
    else
        history_nx = history;
end //history_combo

if (LOCK_HIST==0) begin :g_lock_inertia_0
    // Alex: replaced always comb with always @ (*) for SV->Verilog
    always @ (*) begin
        if (sample && !fine_lock && ~error)
            lock_event = 1'b1;
        else
            lock_event = 1'b0;
    end
end //g_lock_inertia_0

if (LOCK_HIST>0) begin :g_lock_inertia_ge1
    // Alex: replaced always comb with always @ (*) for SV->Verilog
    always @ (*) begin
        if (sample && !fine_lock && ~error && &(~history[0 +: LOCK_HIST]))
            lock_event = 1'b1;
        else
            lock_event = 1'b0;
    end
end //g_lock_inertia_ge1

if (UNLOCK_HIST==0) begin :g_unlock_inertia_0
    // Alex: replaced always comb with always @ (*) for SV->Verilog
    always @ (*) begin
        if (sample && fine_lock && error)
            unlock_event = 1'b1;
        else
            unlock_event = 1'b0;
    end
end

if (UNLOCK_HIST>0) begin :g_unlock_inertia_ge1
    // Alex: replaced always comb with always @ (*) for SV->Verilog
    always @ (*) begin
        if (sample && fine_lock && error && &(history[0 +: UNLOCK_HIST]))
            unlock_event = 1'b1;
        else
            unlock_event = 1'b0;
    end
end //g_unlock_inertia_ge1


// Alex: replaced always comb with always @ (*) for SV->Verilog
always @ (*) begin :fine_lock_combo
    if (unlock_event)
        fine_lock_nx = 1'b0;
    else if (lock_event)
        fine_lock_nx = 1'b1; 
    else 
        fine_lock_nx = fine_lock;
end //fine_lock_combo

assign RX_FINE_LOCK = fine_lock;

endmodule //CORERFD
