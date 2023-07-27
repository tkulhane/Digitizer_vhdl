//**********************************************************************
// Copyright 2016-2017 by Silicon Creations Inc.  All rights reserved. *
// No portion of this material may be reproduced in any form           *
// without the written permission from Silicon Creations.              *
// All information contained is Silicon Creations company private,     *
// proprietary, and trade secret.                                      *
//**********************************************************************
// Context:     		Silicon Creations RTL
// Filename:    		sample_counter.v
// Author:      		B. Tutro
// Version              1.0: 	Tue Aug 14 15:48:45 EDT 2018
// support@siliconcr.com
//**********************************************************************
//
//  
//

`timescale 1ps / 1ps

`ifdef SYNTHESIS
    `define REG_DELAY
`else
    `define REG_DELAY #1
`endif

module CORERFDsmplcnt(
    clk,
    rstn,
    en,
    sample_max,
    timeout,
    last_sample_cnt
    );

//////////////////////////////////////////////////////////////////////
// Parameters
parameter CTR_SIZE = 10;            // Size of counter in bits.

//////////////////////////////////////////////////////////////////////
// Input signals
input clk;                          // Clock signal
input rstn;                          // Reset signal
input en;                           // Enable signal
input [CTR_SIZE-1:0] sample_max;    // Maximum sample value.

//////////////////////////////////////////////////////////////////////
// Output signals
output timeout;                     // sample_max has elapsed.

output last_sample_cnt;
//////////////////////////////////////////////////////////////////////
// Modules instances
CORERFDbincnt #(.NBITS(CTR_SIZE)) Xbin_counter(
    .clk(clk),
    .rstn(rstn),
    .en(en),
    .max_count(sample_max),
    .rst_out(timeout),
    .last_sample_cnt(last_sample_cnt)
);

endmodule
