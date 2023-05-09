//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Tue Apr 18 13:33:42 2023
// Version: 2022.1 2022.1.0.10
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// SRAM
module SRAM(
    // Inputs
    A_ADDR,
    A_DIN,
    A_WBYTE_EN,
    A_WEN,
    B_ADDR,
    B_DIN,
    B_WBYTE_EN,
    B_WEN,
    CLK,
    // Outputs
    A_DOUT,
    B_DOUT
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input  [9:0]  A_ADDR;
input  [63:0] A_DIN;
input  [7:0]  A_WBYTE_EN;
input         A_WEN;
input  [9:0]  B_ADDR;
input  [63:0] B_DIN;
input  [7:0]  B_WBYTE_EN;
input         B_WEN;
input         CLK;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output [63:0] A_DOUT;
output [63:0] B_DOUT;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire   [9:0]  A_ADDR;
wire   [63:0] A_DIN;
wire   [63:0] A_DOUT_net_0;
wire   [7:0]  A_WBYTE_EN;
wire          A_WEN;
wire   [9:0]  B_ADDR;
wire   [63:0] B_DIN;
wire   [63:0] B_DOUT_net_0;
wire   [7:0]  B_WBYTE_EN;
wire          B_WEN;
wire          CLK;
wire   [63:0] A_DOUT_net_1;
wire   [63:0] B_DOUT_net_1;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign A_DOUT_net_1 = A_DOUT_net_0;
assign A_DOUT[63:0] = A_DOUT_net_1;
assign B_DOUT_net_1 = B_DOUT_net_0;
assign B_DOUT[63:0] = B_DOUT_net_1;
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------PF_DPSRAM_C2
PF_DPSRAM_C2 PF_DPSRAM_C2_0(
        // Inputs
        .A_WEN      ( A_WEN ),
        .B_WEN      ( B_WEN ),
        .CLK        ( CLK ),
        .A_DIN      ( A_DIN ),
        .A_ADDR     ( A_ADDR ),
        .B_DIN      ( B_DIN ),
        .B_ADDR     ( B_ADDR ),
        .A_WBYTE_EN ( A_WBYTE_EN ),
        .B_WBYTE_EN ( B_WBYTE_EN ),
        // Outputs
        .A_DOUT     ( A_DOUT_net_0 ),
        .B_DOUT     ( B_DOUT_net_0 ) 
        );


endmodule
