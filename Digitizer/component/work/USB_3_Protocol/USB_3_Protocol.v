//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Tue Aug  1 21:05:55 2023
// Version: 2022.1 2022.1.0.10
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// USB_3_Protocol
module USB_3_Protocol(
    // Inputs
    Communication_Number,
    FTDI_CLK,
    FTDI_nRXF,
    FTDI_nTXE,
    Main_CLK,
    Main_RESET_N,
    RX_FIFO_RE,
    TX_FIFO_Data,
    TX_FIFO_WE,
    // Outputs
    FTDI_BE,
    FTDI_GPIO_0,
    FTDI_GPIO_1,
    FTDI_RESET_N,
    FTDI_nOE,
    FTDI_nRD,
    FTDI_nWR,
    RX_FIFO_Data,
    RX_FIFO_EMPTY,
    TX_FULL,
    // Inouts
    FTDI_DATA
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input  [3:0]  Communication_Number;
input         FTDI_CLK;
input         FTDI_nRXF;
input         FTDI_nTXE;
input         Main_CLK;
input         Main_RESET_N;
input         RX_FIFO_RE;
input  [39:0] TX_FIFO_Data;
input         TX_FIFO_WE;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output [3:0]  FTDI_BE;
output        FTDI_GPIO_0;
output        FTDI_GPIO_1;
output        FTDI_RESET_N;
output        FTDI_nOE;
output        FTDI_nRD;
output        FTDI_nWR;
output [39:0] RX_FIFO_Data;
output        RX_FIFO_EMPTY;
output        TX_FULL;
//--------------------------------------------------------------------
// Inout
//--------------------------------------------------------------------
inout  [31:0] FTDI_DATA;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire   [3:0]  Communication_Number;
wire          COREFIFO_C7_0_AFULL;
wire          COREFIFO_C8_0_EMPTY;
wire   [39:0] COREFIFO_C8_0_Q;
wire          ft601_fifo_interface_0_CH_AF_RDEN;
wire   [31:0] ft601_fifo_interface_0_CH_FA_DATA;
wire          ft601_fifo_interface_0_CH_FA_WREN;
wire   [3:0]  FTDI_BE_net_0;
wire          FTDI_CLK;
wire   [31:0] FTDI_DATA;
wire          FTDI_nOE_net_0;
wire          FTDI_nRD_net_0;
wire          FTDI_nRXF;
wire          FTDI_nTXE;
wire          FTDI_nWR_net_0;
wire          FTDI_RESET_N_0;
wire   [39:0] ftdi_to_fifo_interface_0_FIFO_FA;
wire   [31:0] ftdi_to_fifo_interface_0_FTDI_AF;
wire          Main_CLK;
wire          Main_RESET_N;
wire   [39:0] RX_FIFO_Data_net_0;
wire          RX_FIFO_EMPTY_net_0;
wire          RX_FIFO_RE;
wire   [39:0] TX_FIFO_Data;
wire          TX_FIFO_WE;
wire          TX_FULL_net_0;
wire          FTDI_nWR_net_1;
wire   [3:0]  FTDI_BE_net_1;
wire          FTDI_nOE_net_1;
wire          FTDI_nRD_net_1;
wire          FTDI_RESET_N_0_net_0;
wire   [39:0] RX_FIFO_Data_net_1;
wire          RX_FIFO_EMPTY_net_1;
wire          TX_FULL_net_1;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire          GND_net;
wire          VCC_net;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign GND_net = 1'b0;
assign VCC_net = 1'b1;
//--------------------------------------------------------------------
// TieOff assignments
//--------------------------------------------------------------------
assign FTDI_GPIO_0          = 1'b0;
assign FTDI_GPIO_1          = 1'b0;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign FTDI_nWR_net_1       = FTDI_nWR_net_0;
assign FTDI_nWR             = FTDI_nWR_net_1;
assign FTDI_BE_net_1        = FTDI_BE_net_0;
assign FTDI_BE[3:0]         = FTDI_BE_net_1;
assign FTDI_nOE_net_1       = FTDI_nOE_net_0;
assign FTDI_nOE             = FTDI_nOE_net_1;
assign FTDI_nRD_net_1       = FTDI_nRD_net_0;
assign FTDI_nRD             = FTDI_nRD_net_1;
assign FTDI_RESET_N_0_net_0 = FTDI_RESET_N_0;
assign FTDI_RESET_N         = FTDI_RESET_N_0_net_0;
assign RX_FIFO_Data_net_1   = RX_FIFO_Data_net_0;
assign RX_FIFO_Data[39:0]   = RX_FIFO_Data_net_1;
assign RX_FIFO_EMPTY_net_1  = RX_FIFO_EMPTY_net_0;
assign RX_FIFO_EMPTY        = RX_FIFO_EMPTY_net_1;
assign TX_FULL_net_1        = TX_FULL_net_0;
assign TX_FULL              = TX_FULL_net_1;
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------COREFIFO_C7
COREFIFO_C7 COREFIFO_C7_0(
        // Inputs
        .WCLOCK   ( FTDI_CLK ),
        .RCLOCK   ( Main_CLK ),
        .WRESET_N ( FTDI_RESET_N_0 ),
        .RRESET_N ( Main_RESET_N ),
        .DATA     ( ftdi_to_fifo_interface_0_FIFO_FA ),
        .WE       ( ft601_fifo_interface_0_CH_FA_WREN ),
        .RE       ( RX_FIFO_RE ),
        // Outputs
        .Q        ( RX_FIFO_Data_net_0 ),
        .FULL     (  ),
        .EMPTY    ( RX_FIFO_EMPTY_net_0 ),
        .AFULL    ( COREFIFO_C7_0_AFULL ),
        .AEMPTY   (  ) 
        );

//--------COREFIFO_C8
COREFIFO_C8 COREFIFO_C8_0(
        // Inputs
        .WCLOCK   ( Main_CLK ),
        .RCLOCK   ( FTDI_CLK ),
        .WRESET_N ( Main_RESET_N ),
        .RRESET_N ( FTDI_RESET_N_0 ),
        .DATA     ( TX_FIFO_Data ),
        .WE       ( TX_FIFO_WE ),
        .RE       ( ft601_fifo_interface_0_CH_AF_RDEN ),
        // Outputs
        .Q        ( COREFIFO_C8_0_Q ),
        .FULL     ( TX_FULL_net_0 ),
        .EMPTY    ( COREFIFO_C8_0_EMPTY ),
        .AFULL    (  ),
        .AEMPTY   (  ) 
        );

//--------ft601_fifo_interface
ft601_fifo_interface ft601_fifo_interface_0(
        // Inputs
        .nRESET            ( FTDI_RESET_N_0 ),
        .FTDI_CLK          ( FTDI_CLK ),
        .FTDI_nRXF         ( FTDI_nRXF ),
        .FTDI_nTXE         ( FTDI_nTXE ),
        .CH_FA_ALMOST_FULL ( COREFIFO_C7_0_AFULL ),
        .CH_AF_DATA        ( ftdi_to_fifo_interface_0_FTDI_AF ),
        .CH_AF_EMPTY       ( COREFIFO_C8_0_EMPTY ),
        // Outputs
        .FTDI_nOE          ( FTDI_nOE_net_0 ),
        .FTDI_nRD          ( FTDI_nRD_net_0 ),
        .FTDI_nWR          ( FTDI_nWR_net_0 ),
        .FTDI_BE           ( FTDI_BE_net_0 ),
        .CH_FA_DATA        ( ft601_fifo_interface_0_CH_FA_DATA ),
        .CH_FA_WREN        ( ft601_fifo_interface_0_CH_FA_WREN ),
        .CH_AF_RDEN        ( ft601_fifo_interface_0_CH_AF_RDEN ),
        // Inouts
        .FTDI_DATA         ( FTDI_DATA ) 
        );

//--------ftdi_to_fifo_interface
ftdi_to_fifo_interface ftdi_to_fifo_interface_0(
        // Inputs
        .FTDI_FA              ( ft601_fifo_interface_0_CH_FA_DATA ),
        .FIFO_AF              ( COREFIFO_C8_0_Q ),
        .Communication_Number ( Communication_Number ),
        // Outputs
        .FIFO_FA              ( ftdi_to_fifo_interface_0_FIFO_FA ),
        .FTDI_AF              ( ftdi_to_fifo_interface_0_FTDI_AF ) 
        );

//--------Synchronizer
Synchronizer Synchronizer_0(
        // Inputs
        .nRST     ( Main_RESET_N ),
        .CLK      ( FTDI_RESET_N_0 ),
        .Data_In  ( VCC_net ),
        // Outputs
        .Data_Out ( FTDI_RESET_N_0 ) 
        );


endmodule
