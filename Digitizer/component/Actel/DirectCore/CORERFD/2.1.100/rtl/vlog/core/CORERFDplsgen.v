//**********************************************************************
// Copyright 2016-2017 by Silicon Creations Inc.  All rights reserved. *
// No portion of this material may be reproduced in any form           *
// without the written permission from Silicon Creations.              *
// All information contained is Silicon Creations company private,     *
// proprietary, and trade secret.                                      *
//**********************************************************************
// Context:     		Silicon Creations RTL
// Filename:    		pulse_gen.v
// Author:      		B. Tutro
// Version              1.0: 	Wed Aug 15 16:17:10 EDT 2018
// support@siliconcr.com
//**********************************************************************
//
// Pulse generator
//

`timescale 1ps / 1ps

`ifdef SYNTHESIS
    `define REG_DELAY
`else
    `define REG_DELAY #1
`endif

module CORERFDplsgen(
    clk,
    rstn,
    pulse
    );

//////////////////////////////////////////////////////////////////////
// Parameters
parameter NBITS = 4;   // Size of the counter in bits.

//////////////////////////////////////////////////////////////////////
// Input signals
input clk;      // Clock signal
input rstn;     // Reset signal

//////////////////////////////////////////////////////////////////////
// Output signals
output wire pulse;   // Pulse signal

//////////////////////////////////////////////////////////////////////
// Variables
reg [NBITS-1:0] count;

//////////////////////////////////////////////////////////////////////
// Sequential logic
always @(posedge clk, negedge rstn) begin
    if(!rstn) begin
        count <= `REG_DELAY {NBITS{1'b0}};
    end
    else begin
        count <= `REG_DELAY count + {{(NBITS-1){1'b0}},1'b1};
    end
end

//////////////////////////////////////////////////////////////////////
// Assigns
assign `REG_DELAY pulse = &count;

endmodule
