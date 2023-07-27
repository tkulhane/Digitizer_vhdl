//**********************************************************************
// Copyright 2016-2017 by Silicon Creations Inc.  All rights reserved. *
// No portion of this material may be reproduced in any form           *
// without the written permission from Silicon Creations.              *
// All information contained is Silicon Creations company private,     *
// proprietary, and trade secret.                                      *
//**********************************************************************
// Context:     		Silicon Creation RTL
// Filename:    		rot_sh_ctr.v
// Author:      		B. Tutro
// Version              1.0: 	Tue Aug 14 17:50:50 EDT 2018
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

module CORERFDshcnt(
    clk,
    en,
    rstn,
    timeout,
    rot,
    rot_sh,
    rot_err
);

//////////////////////////////////////////////////////////////////////
// Parameters
parameter   CTR_SIZE=5;     // Size of counter in bits. Has to be more than 2.
localparam  ROT_SIZE=2;     // Number of rotation steps for a full rotation.

//////////////////////////////////////////////////////////////////////
// Input signals
input clk;                  // Input clock
input en;                   // Enable
input rstn;                 // Reset
input timeout;              // Timeout signal from time counter
input [1:0] rot;            // Gray coded rotation position

//////////////////////////////////////////////////////////////////////
// Output signals
output reg [CTR_SIZE-1:0] rot_sh;   // Rotation shift. Tells what is the rotation shift from last reset or timeout. (SIGNED!!!)
output rot_err;                     // Rotation error. Indicates that rotation shifts was more than one step.

//////////////////////////////////////////////////////////////////////
// Variables
reg [CTR_SIZE-1:0] rot_sh_nxt;   
reg [ROT_SIZE-1:0] rot_last;    // Previous value of rot.
reg [ROT_SIZE:0] rot_diff;      // Difference between actual and last rotation value. (SIGNED!!!)

//////////////////////////////////////////////////////////////////////
// Sequential logic
always @(posedge clk, negedge rstn) begin
    if(!rstn) begin
        rot_sh      <= `REG_DELAY {CTR_SIZE{1'b0}};
        rot_last    <= `REG_DELAY {ROT_SIZE{1'b0}};
    end
    else if(en) begin
        rot_sh      <= `REG_DELAY rot_sh_nxt;
        rot_last    <= `REG_DELAY rot;
    end
end

//////////////////////////////////////////////////////////////////////
// Combinational logic
always @* begin
    if(timeout) begin
        rot_sh_nxt = {CTR_SIZE{1'b0}};                                  // Reset rotation shift value.
    end
    else begin
        if( ((rot_sh=={1'b0,{(CTR_SIZE-1){1'b1}}}) && (rot_diff==3'b001)) || ((rot_sh=={1'b1,{(CTR_SIZE-1){1'b0}}}) && (rot_diff==3'b111)) ) begin      // Prevent counter from overflow in both directions.
            rot_sh_nxt = rot_sh;
        end
        else begin
            rot_sh_nxt = rot_sh + {{(CTR_SIZE-3){rot_diff[2]}},rot_diff};   // Calculate actual rotation shift. Complement rot_diff properly if rot_diff<0 or rot_diff>0.
        end
    end
end

//////////////////////////////////////////////////////////////////////
// Look-up table for decoding rotation shift
always @* begin
    case ({rot,rot_last})
       4'b0000, 4'b0101, 4'b1010, 4'b1111:  // Actual value the same as the last one.
           rot_diff = 3'b000;
       4'b0001, 4'b0111, 4'b1110, 4'b1000:  // Faster by one step. Add 1.
           rot_diff = 3'b001;
       4'b0010, 4'b1011, 4'b1101, 4'b0100:  // Slower by one step. Subtract 1 (Add -1 in 2's complement).
           rot_diff = 3'b111;
       default:                             // Steps by more than one. Not allowed. Results in immediate error.
           rot_diff = 3'b010;
    endcase
end

//////////////////////////////////////////////////////////////////////
// Assigns
assign rot_err = (rot_diff == 3'b010) ? 1'b1 : 1'b0;

endmodule

