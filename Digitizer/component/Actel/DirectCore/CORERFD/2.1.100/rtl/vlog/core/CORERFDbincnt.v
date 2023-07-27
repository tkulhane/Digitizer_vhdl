//**********************************************************************
// Copyright 2016-2017 by Silicon Creations Inc.  All rights reserved. *
// No portion of this material may be reproduced in any form           *
// without the written permission from Silicon Creations.              *
// All information contained is Silicon Creations company private,     *
// proprietary, and trade secret.                                      *
//**********************************************************************
// Context:     		Silicon Creations RTL
// Filename:    		bin_counter.v
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

module CORERFDbincnt(
    clk,
    rstn,
    en,
    max_count,
    rst_out,
    last_sample_cnt
    );

//////////////////////////////////////////////////////////////////////
// Parameters
parameter NBITS     = 10;   // Size of the counter in bits.

//////////////////////////////////////////////////////////////////////
// Input signals
input clk;                      // Clock signal
input rstn;                     // Reset signal
input en;                       // Enable signal
input [NBITS-1:0] max_count;    // Maximum count value then reset then 

//////////////////////////////////////////////////////////////////////
// Output signals
output reg rst_out;             // Reset when count == max_count

output last_sample_cnt;
//////////////////////////////////////////////////////////////////////
// Variables
reg [NBITS-1:0] count;          // Variable for storing counter value.

assign last_sample_cnt = (count == max_count-1);
//////////////////////////////////////////////////////////////////////
// Sequential logic
always @(posedge clk, negedge rstn) begin
    if(!rstn) begin
        count <= `REG_DELAY {{(NBITS-1){1'b0}},1'b1};       // Initialize to 1
    end
    else if (en) begin
        if(rst_out) begin
            count <= `REG_DELAY {{(NBITS-1){1'b0}},1'b1};   // Initialize to 1
        end
        else begin
            count <= `REG_DELAY count + {{(NBITS-1){1'b0}},1'b1};
        end
    end
end

//////////////////////////////////////////////////////////////////////
// Combinational logic
always @* begin
    if (count == max_count) begin
        rst_out = 1'b1;
    end
    else begin
        rst_out = 1'b0;
    end
end
endmodule
