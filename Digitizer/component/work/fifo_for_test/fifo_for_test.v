//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Wed Aug 23 10:19:20 2023
// Version: 2022.1 2022.1.0.10
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// fifo_for_test
module fifo_for_test(
    // Inputs
    DATA,
    RCLOCK,
    RE,
    RRESET_N,
    WCLOCK,
    WE,
    WRESET_N,
    // Outputs
    EMPTY,
    FULL,
    Q
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input  [31:0] DATA;
input         RCLOCK;
input         RE;
input         RRESET_N;
input         WCLOCK;
input         WE;
input         WRESET_N;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output        EMPTY;
output        FULL;
output [31:0] Q;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire   [31:0] DATA;
wire          EMPTY_net_0;
wire          FULL_net_0;
wire   [31:0] Q_net_0;
wire          RCLOCK;
wire          RE;
wire          RRESET_N;
wire          WCLOCK;
wire          WE;
wire          WRESET_N;
wire          FULL_net_1;
wire          EMPTY_net_1;
wire   [31:0] Q_net_1;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign FULL_net_1  = FULL_net_0;
assign FULL        = FULL_net_1;
assign EMPTY_net_1 = EMPTY_net_0;
assign EMPTY       = EMPTY_net_1;
assign Q_net_1     = Q_net_0;
assign Q[31:0]     = Q_net_1;
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------COREFIFO_Ctest
COREFIFO_Ctest COREFIFO_Ctest_0(
        // Inputs
        .WCLOCK   ( WCLOCK ),
        .RCLOCK   ( RCLOCK ),
        .WRESET_N ( WRESET_N ),
        .RRESET_N ( RRESET_N ),
        .WE       ( WE ),
        .RE       ( RE ),
        .DATA     ( DATA ),
        // Outputs
        .FULL     ( FULL_net_0 ),
        .EMPTY    ( EMPTY_net_0 ),
        .Q        ( Q_net_0 ) 
        );


endmodule
