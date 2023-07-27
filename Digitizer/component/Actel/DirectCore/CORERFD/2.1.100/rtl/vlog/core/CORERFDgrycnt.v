//**********************************************************************
// Copyright 2016-2017 by Silicon Creations Inc.  All rights reserved. *
// No portion of this material may be reproduced in any form           *
// without the written permission from Silicon Creations.              *
// All information contained is Silicon Creations company private,     *
// proprietary, and trade secret.                                      *
//**********************************************************************
// Context:     		Silicon Creations RTL
// Filename:    		gray_counter.v
// Author:      		B. Tutro
// Version              1.0: 	Tue Aug 14 15:48:45 EDT 2018
// support@siliconcr.com
//**********************************************************************
//
// 25May2021 - Updated by Microchip - SAR#119314
//
//**********************************************************************

`timescale 1ps / 1ps

`ifdef SYNTHESIS
    `define REG_DELAY
`else
    `define REG_DELAY #1
`endif

module CORERFDgrycnt(
    clk,    // Clock
    rstn,   // Reset signal
    out     // Counter output
    );

//////////////////////////////////////////////////////////////////////
// Parameters
parameter NBITS = 2; // implemented only for NBITS=2

//////////////////////////////////////////////////////////////////////
// Input signals
input clk;
input rstn;

//////////////////////////////////////////////////////////////////////
// Output signals
output wire [1:0] out;

//////////////////////////////////////////////////////////////////////
// Variables
reg [1:0]       count;
reg             parity;

//////////////////////////////////////////////////////////////////////
// Sequential logic
always @(posedge clk, negedge rstn) begin
    if(!rstn) begin
        count <= `REG_DELAY 2'b00;
    end
    else begin
        count <= `REG_DELAY count ^ {parity, ~parity};
    end
end

// Combinational logic
always @(*) begin
  parity = ^count;
end

//////////////////////////////////////////////////////////////////////
// Assigns for outputs
assign out = count;

endmodule
