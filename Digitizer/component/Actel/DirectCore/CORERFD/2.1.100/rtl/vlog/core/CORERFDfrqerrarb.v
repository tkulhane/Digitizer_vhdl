//**********************************************************************
// Copyright 2016-2017 by Silicon Creations Inc.  All rights reserved. *
// No portion of this material may be reproduced in any form           *
// without the written permission from Silicon Creations.              *
// All information contained is Silicon Creations company private,     *
// proprietary, and trade secret.                                      *
//**********************************************************************
// Context:     		Silicon Creations RTL
// Filename:    		freq_err_arb.v
// Author:      		B. Tutro
// Version              1.0: 	Tue Aug 14 15:48:45 EDT 2018
// support@siliconcr.com
//**********************************************************************
//
//  Frequency error arbiter.
//

`timescale 1ps / 1ps

`ifdef SYNTHESIS
    `define REG_DELAY
`else
    `define REG_DELAY #1
`endif

module CORERFDfrqerrarb(
    clk,
    rstn,
    timeout,
    en,
    rot_sh,
    rot_max,
    rot_err,
    error
    );

//////////////////////////////////////////////////////////////////////
// Parameters
parameter ROT_SH_CTR_SIZE = 5;   // Size of a sample counter in bits. (SIGNED!!!)

//////////////////////////////////////////////////////////////////////
// Input signals
input clk;                              // Clock signal
input rstn;                             // Reset signal
input timeout;                          // Timeout signal
input en;                               // Enable signal
input [ROT_SH_CTR_SIZE-2:0] rot_max;    // Maximum allowable rotation shift value that do not cause error.
input [ROT_SH_CTR_SIZE-1:0] rot_sh;     // Rotation shift. Tells what is the rotation shift from last reset or timeout. (SIGNED!!!)
input rot_err;                          // Rotation error. Indicates that rotation shifts was more than one step.

//////////////////////////////////////////////////////////////////////
// Output signals
output reg error;                       // Frequency error. Indicates that frequency drifted over specified treshold (rot_max).

//////////////////////////////////////////////////////////////////////
// Variables
reg error_nxt;

//////////////////////////////////////////////////////////////////////
// Sequential logic
always @(posedge clk, negedge rstn) begin
    if(!rstn) begin
        error <= `REG_DELAY 1'b0;
    end
    else if (en) begin
        error <= `REG_DELAY error_nxt;

    end
end

//////////////////////////////////////////////////////////////////////
// Combinational logic
always @* begin
    if(timeout) begin
        error_nxt = 1'b0;
    end
    else if( (abs(rot_sh[ROT_SH_CTR_SIZE-1], rot_sh[ROT_SH_CTR_SIZE-2:0]) >= rot_max) || rot_err || error ) begin   // If abs(rot_sh) > rot_max or rot_err or error
        error_nxt = 1'b1;
    end
    else begin
        error_nxt = 1'b0;
    end
end

//////////////////////////////////////////////////////////////////////
// Functions
function [ROT_SH_CTR_SIZE-2:0] abs;
    input sign;
    input [ROT_SH_CTR_SIZE-2:0] value;

    reg [ROT_SH_CTR_SIZE-2:0] mask;

    begin
        mask = {(ROT_SH_CTR_SIZE-1){sign}};    // Create mask that contains all bits as a sign bit
        abs = (value + mask)^mask;
    end
endfunction

endmodule
