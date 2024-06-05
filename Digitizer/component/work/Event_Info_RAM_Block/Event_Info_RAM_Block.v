//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Wed Jun  5 15:51:38 2024
// Version: 2022.1 2022.1.0.10
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// Event_Info_RAM_Block
module Event_Info_RAM_Block(
    // Inputs
    A_ADDR,
    A_DIN_Event_Number,
    A_DIN_Event_Size,
    A_DIN_Event_Start_ADDR,
    A_DIN_Event_Status,
    A_WEN_Event_Number,
    A_WEN_Event_Size,
    A_WEN_Event_Start_ADDR,
    A_WEN_Event_Status,
    B_ADDR,
    B_DIN_Event_Status,
    B_WEN_Event_Status,
    CLK,
    // Outputs
    A_DOUT_Event_Status,
    B_DOUT_Event_Number,
    B_DOUT_Event_Size,
    B_DOUT_Event_Start_ADDR,
    B_DOUT_Event_Status
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input  [9:0]  A_ADDR;
input  [19:0] A_DIN_Event_Number;
input  [19:0] A_DIN_Event_Size;
input  [19:0] A_DIN_Event_Start_ADDR;
input  [7:0]  A_DIN_Event_Status;
input         A_WEN_Event_Number;
input         A_WEN_Event_Size;
input         A_WEN_Event_Start_ADDR;
input         A_WEN_Event_Status;
input  [9:0]  B_ADDR;
input  [7:0]  B_DIN_Event_Status;
input         B_WEN_Event_Status;
input         CLK;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output [7:0]  A_DOUT_Event_Status;
output [19:0] B_DOUT_Event_Number;
output [19:0] B_DOUT_Event_Size;
output [19:0] B_DOUT_Event_Start_ADDR;
output [7:0]  B_DOUT_Event_Status;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire   [9:0]  A_ADDR;
wire   [19:0] A_DIN_Event_Number;
wire   [19:0] A_DIN_Event_Size;
wire   [19:0] A_DIN_Event_Start_ADDR;
wire   [7:0]  A_DIN_Event_Status;
wire   [7:0]  A_DOUT_Event_Status_net_0;
wire          A_WEN_Event_Number;
wire          A_WEN_Event_Size;
wire          A_WEN_Event_Start_ADDR;
wire          A_WEN_Event_Status;
wire   [9:0]  B_ADDR;
wire   [7:0]  B_DIN_Event_Status;
wire   [19:0] B_DOUT_Event_Number_net_0;
wire   [19:0] B_DOUT_Event_Size_net_0;
wire   [19:0] B_DOUT_Event_Start_ADDR_net_0;
wire   [7:0]  B_DOUT_Event_Status_net_0;
wire          B_WEN_Event_Status;
wire          CLK;
wire   [7:0]  A_DOUT_Event_Status_net_1;
wire   [7:0]  B_DOUT_Event_Status_net_1;
wire   [19:0] B_DOUT_Event_Start_ADDR_net_1;
wire   [19:0] B_DOUT_Event_Number_net_1;
wire   [19:0] B_DOUT_Event_Size_net_1;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire          GND_net;
wire   [19:0] B_DIN_const_net_0;
wire   [19:0] B_DIN_const_net_1;
wire   [19:0] B_DIN_const_net_2;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign GND_net           = 1'b0;
assign B_DIN_const_net_0 = 20'h00000;
assign B_DIN_const_net_1 = 20'h00000;
assign B_DIN_const_net_2 = 20'h00000;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign A_DOUT_Event_Status_net_1     = A_DOUT_Event_Status_net_0;
assign A_DOUT_Event_Status[7:0]      = A_DOUT_Event_Status_net_1;
assign B_DOUT_Event_Status_net_1     = B_DOUT_Event_Status_net_0;
assign B_DOUT_Event_Status[7:0]      = B_DOUT_Event_Status_net_1;
assign B_DOUT_Event_Start_ADDR_net_1 = B_DOUT_Event_Start_ADDR_net_0;
assign B_DOUT_Event_Start_ADDR[19:0] = B_DOUT_Event_Start_ADDR_net_1;
assign B_DOUT_Event_Number_net_1     = B_DOUT_Event_Number_net_0;
assign B_DOUT_Event_Number[19:0]     = B_DOUT_Event_Number_net_1;
assign B_DOUT_Event_Size_net_1       = B_DOUT_Event_Size_net_0;
assign B_DOUT_Event_Size[19:0]       = B_DOUT_Event_Size_net_1;
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------PF_DPSRAM_C7
PF_DPSRAM_C7 PF_DPSRAM_C7_0_Event_Start_ADDR(
        // Inputs
        .A_WEN  ( A_WEN_Event_Start_ADDR ),
        .B_WEN  ( GND_net ),
        .CLK    ( CLK ),
        .A_DIN  ( A_DIN_Event_Start_ADDR ),
        .A_ADDR ( A_ADDR ),
        .B_DIN  ( B_DIN_const_net_0 ),
        .B_ADDR ( B_ADDR ),
        // Outputs
        .A_DOUT (  ),
        .B_DOUT ( B_DOUT_Event_Start_ADDR_net_0 ) 
        );

//--------PF_DPSRAM_C7
PF_DPSRAM_C7 PF_DPSRAM_C7_1_Event_Number(
        // Inputs
        .A_WEN  ( A_WEN_Event_Number ),
        .B_WEN  ( GND_net ),
        .CLK    ( CLK ),
        .A_DIN  ( A_DIN_Event_Number ),
        .A_ADDR ( A_ADDR ),
        .B_DIN  ( B_DIN_const_net_1 ),
        .B_ADDR ( B_ADDR ),
        // Outputs
        .A_DOUT (  ),
        .B_DOUT ( B_DOUT_Event_Number_net_0 ) 
        );

//--------PF_DPSRAM_C7
PF_DPSRAM_C7 PF_DPSRAM_C7_2_Event_Size(
        // Inputs
        .A_WEN  ( A_WEN_Event_Size ),
        .B_WEN  ( GND_net ),
        .CLK    ( CLK ),
        .A_DIN  ( A_DIN_Event_Size ),
        .A_ADDR ( A_ADDR ),
        .B_DIN  ( B_DIN_const_net_2 ),
        .B_ADDR ( B_ADDR ),
        // Outputs
        .A_DOUT (  ),
        .B_DOUT ( B_DOUT_Event_Size_net_0 ) 
        );

//--------PF_DPSRAM_C8_Event_Status
PF_DPSRAM_C8_Event_Status PF_DPSRAM_C8_Event_Status_0(
        // Inputs
        .A_WEN  ( A_WEN_Event_Status ),
        .B_WEN  ( B_WEN_Event_Status ),
        .CLK    ( CLK ),
        .A_DIN  ( A_DIN_Event_Status ),
        .A_ADDR ( A_ADDR ),
        .B_DIN  ( B_DIN_Event_Status ),
        .B_ADDR ( B_ADDR ),
        // Outputs
        .A_DOUT ( A_DOUT_Event_Status_net_0 ),
        .B_DOUT ( B_DOUT_Event_Status_net_0 ) 
        );


endmodule
