//**********************************************************************
// Copyright 2016-2017 by Silicon Creations Inc.  All rights reserved. *
// No portion of this material may be reproduced in any form           *
// without the written permission from Silicon Creations.              *
// All information contained is Silicon Creations company private,     *
// proprietary, and trade secret.                                      *
//**********************************************************************
// Context:     		Silicon Creation RTL
// Filename:    		rot_freq_det.v
// Author:      		B. Tutro
// Version              1.0: 	Wed Aug 15 15:20:57 EDT 2018
// support@siliconcr.com
//**********************************************************************
//
// Rotational Frequency Detector
//

`timescale 1ns / 1ps

// Uncomment line below for synthesis to remove registers' delays.
// `define SYNTHESIS

module CORERFDsicr(
    clk_in,
    clk_ref,
    max_sample_count,
    max_rotation_shift,
    rstn,
    error,
    sample
);

//////////////////////////////////////////////////////////////////////
// Parameters
parameter ROT_SH_CTR_SIZE=5;        // Size of rotation shift counter in bits. Must be more than 2. This is SIGNED counter!
parameter SAMPLE_CTR_SIZE=14;       // Size of sample counter in bits. This is UNSIGNED counter.

//////////////////////////////////////////////////////////////////////
// Local parameters
localparam PH_ROT_SIZE=2;           // 2^PH_TOT_SIZE is a number of rotation steps for full rotation. This CAN'T be changed in this version!

//////////////////////////////////////////////////////////////////////
// Input signals
input                           clk_in;             // Input clock. This is "slave" clock that comes from DUT. 
input                           clk_ref;            // Reference clock. This is "master" clock that comes from system reference clock.
input [SAMPLE_CTR_SIZE-1:0]     max_sample_count;   // Number of samples after which rotation shift is reseted. Value is number of 4 times clk_ref periods. (More detailed: the value is number of 2^PH_ROT_SIZE times clk_ref periods).
input [ROT_SH_CTR_SIZE-2:0]     max_rotation_shift; // Maximum allowable rotation shift that NOT cause the error. Value is difference between clk_in and clk_ref cycles.
input                           rstn;               // Asynchronous reset signal. Active LOW.

//////////////////////////////////////////////////////////////////////
// Output signals
output                          error;              // Error signal. Indicates that frequency drifted more than max_rotation_shift during max_sample_count.
output                          sample;

//////////////////////////////////////////////////////////////////////
// Instantiations

// Reset signal (rstn) retiming to clk_ref
wire rstn_clk_ref;

CORERFDsync #(.SIGNAL_WIDTH(1), .INIT_VAL(1'b0)) Xrst_Sync_clk_ref(
    .outClk(clk_ref),
    .outRstn(rstn),
    .asyncInput(rstn),
    .syncOutput(rstn_clk_ref)
);

// Reset signal (rstn) retiming to clk_in
wire rstn_clk_in;

CORERFDsync #(.SIGNAL_WIDTH(1), .INIT_VAL(1'b0)) Xrst_Sync_clk_in(
    .outClk(clk_in),
    .outRstn(rstn),
    .asyncInput(rstn),
    .syncOutput(rstn_clk_in)
);

// Enable signal (en_clk_ref) generation
wire en_clk_ref;

CORERFDplsgen #(.NBITS(PH_ROT_SIZE)) Xclk_ref_div(
    .clk(clk_ref),
    .rstn(rstn_clk_ref),
    .pulse(en_clk_ref)
    );

// Input clock phase generator
wire [PH_ROT_SIZE-1:0] clk_in_rot;        // Input clock rotation

CORERFDgrycnt #(.NBITS(PH_ROT_SIZE)) Xclk_in_rotator(
    .clk(clk_in),
    .rstn(rstn_clk_in),
    .out(clk_in_rot)
    );

// Input clock phase (clk_in_phase) retiming from clk_in to clk_ref
wire [PH_ROT_SIZE-1:0] clk_ref_rot;     // Input clock rotation synchronized to clk_ref

CORERFDsyncen #(.SIGNAL_WIDTH(PH_ROT_SIZE), .INIT_VAL({PH_ROT_SIZE{1'b0}})) Xclk_in_rot_Sync(
    .outClk(clk_ref),
    .outRstn(rstn_clk_ref),
    .outEn(en_clk_ref),
    .asyncInput(clk_in_rot),
    .syncOutput(clk_ref_rot)
);

// Sample counter
wire timeout;                               // Flag for indicating when to measure input clock rotation shift
wire last_sample_cnt;

CORERFDsmplcnt #(.CTR_SIZE(SAMPLE_CTR_SIZE)) Xsample_counter(
    .clk(clk_ref),
    .rstn(rstn_clk_ref),
    .en(en_clk_ref),
    .sample_max(max_sample_count),
    .timeout(timeout),
    .last_sample_cnt(last_sample_cnt)
);

// Rotation shift counter
wire [ROT_SH_CTR_SIZE-1:0]  clk_in_rot_sh;      // Input clock rotation shift (SIGNED)
wire                        clk_in_rot_err;     // Input clock rotation error. Indicates that rotation shifts was more than one step.

CORERFDshcnt #(.CTR_SIZE(ROT_SH_CTR_SIZE)) Xrot_sh_ctr(
    .clk(clk_ref),
    .en(en_clk_ref),
    .rstn(rstn_clk_ref),
    .timeout(timeout),
    .rot(clk_ref_rot),
    .rot_sh(clk_in_rot_sh),
    .rot_err(clk_in_rot_err)
);

// Frequency error arbiter
    // Checks if input clock rotation shift is not bigger than max_rotation_shift
    // after max_sample_count.
CORERFDfrqerrarb #(.ROT_SH_CTR_SIZE(ROT_SH_CTR_SIZE)) Xfreq_err_arb(
    .clk(clk_ref),
    .rstn(rstn_clk_ref),
    .en(en_clk_ref),
    .timeout(timeout),
    .rot_sh(clk_in_rot_sh),
    .rot_max(max_rotation_shift),
    .rot_err(clk_in_rot_err),
    .error(error)
    );

// /////////////////////////////////////////////////////////////////
// Microchip Added
wire smplerr = (en_clk_ref & last_sample_cnt);
assign sample = smplerr;

endmodule
