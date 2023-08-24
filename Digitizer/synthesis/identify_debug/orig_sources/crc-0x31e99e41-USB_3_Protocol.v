//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Tue Aug 22 10:03:22 2023
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
    MD_Fifo_Data,
    MD_Fifo_Empty,
    Main_CLK,
    Main_RESET_N,
    RX_FIFO_RE,
    TX_FIFO_Data,
    TX_FIFO_WE,
    // Outputs
    DBG_EMPTY,
    DBG_FIFO_AFULL,
    DBG_FIFO_RD,
    DBG_FIFO_WR,
    FTDI_GPIO_0,
    FTDI_GPIO_1,
    FTDI_RESET_N,
    FTDI_nOE,
    FTDI_nRD,
    FTDI_nWR,
    MD_Fifo_RE,
    RX_FIFO_Data,
    RX_FIFO_EMPTY,
    SIWU_N,
    TX_FULL,
    // Inouts
    FTDI_BE,
    FTDI_DATA
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input  [3:0]  Communication_Number;
input         FTDI_CLK;
input         FTDI_nRXF;
input         FTDI_nTXE;
input  [31:0] MD_Fifo_Data;
input         MD_Fifo_Empty;
input         Main_CLK;
input         Main_RESET_N;
input         RX_FIFO_RE;
input  [39:0] TX_FIFO_Data;
input         TX_FIFO_WE;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output        DBG_EMPTY;
output        DBG_FIFO_AFULL;
output        DBG_FIFO_RD;
output        DBG_FIFO_WR;
output        FTDI_GPIO_0;
output        FTDI_GPIO_1;
output        FTDI_RESET_N;
output        FTDI_nOE;
output        FTDI_nRD;
output        FTDI_nWR;
output        MD_Fifo_RE;
output [39:0] RX_FIFO_Data;
output        RX_FIFO_EMPTY;
output        SIWU_N;
output        TX_FULL;
//--------------------------------------------------------------------
// Inout
//--------------------------------------------------------------------
inout  [3:0]  FTDI_BE;
inout  [31:0] FTDI_DATA;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire   [3:0]  Communication_Number;
wire   [39:0] Communication_TX_Arbiter2_0_TX_Fifo_Data;
wire          COREFIFO_C7_0_AFULL;
wire   [39:0] COREFIFO_C8_0_Q;
wire   [39:0] COREFIFO_C11_0_Q;
wire          DBG_EMPTY_net_0;
wire          DBG_EMPTY_0;
wire          DBG_FIFO_AFULL_net_0;
wire          DBG_FIFO_RD_net_0;
wire          DBG_FIFO_RD_0;
wire          DBG_FIFO_WR_net_0;
wire          DBG_FIFO_WR_0;
wire   [31:0] ft601_fifo_interface_0_CH_FA_DATA;
wire   [3:0]  FTDI_BE;
wire          FTDI_CLK;
wire   [31:0] FTDI_DATA;
wire          FTDI_nOE_net_0;
wire          FTDI_nRD_net_0;
wire          FTDI_nRXF;
wire          FTDI_nTXE;
wire          FTDI_nWR_net_0;
wire   [39:0] ftdi_to_fifo_interface_0_FIFO_FA;
wire   [31:0] ftdi_to_fifo_interface_0_FTDI_AF;
wire          Main_CLK;
wire          Main_RESET_N;
wire   [31:0] MD_Fifo_Data;
wire          MD_Fifo_Empty;
wire          MD_Fifo_RE_net_0;
wire   [39:0] RX_FIFO_Data_net_0;
wire          RX_FIFO_EMPTY_net_0;
wire          RX_FIFO_RE;
wire          Synchronizer_0_Data_Out;
wire   [39:0] TX_FIFO_Data;
wire          TX_FIFO_WE;
wire          TX_FULL_net_0;
wire          FTDI_nWR_net_1;
wire          FTDI_nOE_net_1;
wire          FTDI_nRD_net_1;
wire          Main_RESET_N_net_0;
wire          RX_FIFO_EMPTY_net_1;
wire          TX_FULL_net_1;
wire          DBG_FIFO_WR_0_net_0;
wire          DBG_FIFO_RD_net_1;
wire          DBG_EMPTY_0_net_0;
wire          MD_Fifo_RE_net_1;
wire   [39:0] RX_FIFO_Data_net_1;
wire          DBG_FIFO_AFULL_net_1;
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
assign SIWU_N               = 1'b1;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign FTDI_nWR_net_1       = FTDI_nWR_net_0;
assign FTDI_nWR             = FTDI_nWR_net_1;
assign FTDI_nOE_net_1       = FTDI_nOE_net_0;
assign FTDI_nOE             = FTDI_nOE_net_1;
assign FTDI_nRD_net_1       = FTDI_nRD_net_0;
assign FTDI_nRD             = FTDI_nRD_net_1;
assign Main_RESET_N_net_0   = Main_RESET_N;
assign FTDI_RESET_N         = Main_RESET_N_net_0;
assign RX_FIFO_EMPTY_net_1  = RX_FIFO_EMPTY_net_0;
assign RX_FIFO_EMPTY        = RX_FIFO_EMPTY_net_1;
assign TX_FULL_net_1        = TX_FULL_net_0;
assign TX_FULL              = TX_FULL_net_1;
assign DBG_FIFO_WR_0_net_0  = DBG_FIFO_WR_0;
assign DBG_FIFO_WR          = DBG_FIFO_WR_0_net_0;
assign DBG_FIFO_RD_net_1    = DBG_FIFO_RD_net_0;
assign DBG_FIFO_RD          = DBG_FIFO_RD_net_1;
assign DBG_EMPTY_0_net_0    = DBG_EMPTY_0;
assign DBG_EMPTY            = DBG_EMPTY_0_net_0;
assign MD_Fifo_RE_net_1     = MD_Fifo_RE_net_0;
assign MD_Fifo_RE           = MD_Fifo_RE_net_1;
assign RX_FIFO_Data_net_1   = RX_FIFO_Data_net_0;
assign RX_FIFO_Data[39:0]   = RX_FIFO_Data_net_1;
assign DBG_FIFO_AFULL_net_1 = DBG_FIFO_AFULL_net_0;
assign DBG_FIFO_AFULL       = DBG_FIFO_AFULL_net_1;
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------Communication_TX_Arbiter2
Communication_TX_Arbiter2 Communication_TX_Arbiter2_0(
        // Inputs
        .Clock              ( Main_CLK ),
        .Reset_N            ( Main_RESET_N ),
        .Control_Fifo_Empty ( DBG_EMPTY_net_0 ),
        .MD_Fifo_Empty      ( MD_Fifo_Empty ),
        .TX_Fifo_Full       ( DBG_FIFO_AFULL_net_0 ),
        .Control_Fifo_Data  ( COREFIFO_C11_0_Q ),
        .MD_Fifo_Data       ( MD_Fifo_Data ),
        // Outputs
        .Control_Fifo_RE    ( DBG_FIFO_RD_0 ),
        .MD_Fifo_RE         ( MD_Fifo_RE_net_0 ),
        .TX_Fifo_WE         ( DBG_FIFO_WR_0 ),
        .TX_Fifo_Data       ( Communication_TX_Arbiter2_0_TX_Fifo_Data ) 
        );

//--------COREFIFO_C7
COREFIFO_C7 COREFIFO_C7_0(
        // Inputs
        .WCLOCK   ( FTDI_CLK ),
        .RCLOCK   ( Main_CLK ),
        .WRESET_N ( Synchronizer_0_Data_Out ),
        .RRESET_N ( Main_RESET_N ),
        .WE       ( DBG_FIFO_WR_net_0 ),
        .RE       ( RX_FIFO_RE ),
        .DATA     ( ftdi_to_fifo_interface_0_FIFO_FA ),
        // Outputs
        .FULL     (  ),
        .EMPTY    ( RX_FIFO_EMPTY_net_0 ),
        .AFULL    ( COREFIFO_C7_0_AFULL ),
        .Q        ( RX_FIFO_Data_net_0 ) 
        );

//--------COREFIFO_C8
COREFIFO_C8 COREFIFO_C8_0(
        // Inputs
        .WCLOCK   ( Main_CLK ),
        .RCLOCK   ( FTDI_CLK ),
        .WRESET_N ( Main_RESET_N ),
        .RRESET_N ( Synchronizer_0_Data_Out ),
        .WE       ( DBG_FIFO_WR_0 ),
        .RE       ( DBG_FIFO_RD_net_0 ),
        .DATA     ( Communication_TX_Arbiter2_0_TX_Fifo_Data ),
        // Outputs
        .FULL     (  ),
        .EMPTY    ( DBG_EMPTY_0 ),
        .AFULL    ( DBG_FIFO_AFULL_net_0 ),
        .AEMPTY   (  ),
        .Q        ( COREFIFO_C8_0_Q ) 
        );

//--------COREFIFO_C11
COREFIFO_C11 COREFIFO_C11_0(
        // Inputs
        .CLK     ( Main_CLK ),
        .RESET_N ( Main_RESET_N ),
        .WE      ( TX_FIFO_WE ),
        .RE      ( DBG_FIFO_RD_0 ),
        .DATA    ( TX_FIFO_Data ),
        // Outputs
        .FULL    ( TX_FULL_net_0 ),
        .EMPTY   ( DBG_EMPTY_net_0 ),
        .Q       ( COREFIFO_C11_0_Q ) 
        );

//--------ft601_fifo_interface
ft601_fifo_interface ft601_fifo_interface_0(
        // Inputs
        .nRESET            ( Synchronizer_0_Data_Out ),
        .FTDI_CLK          ( FTDI_CLK ),
        .FTDI_nRXF         ( FTDI_nRXF ),
        .FTDI_nTXE         ( FTDI_nTXE ),
        .CH_FA_ALMOST_FULL ( COREFIFO_C7_0_AFULL ),
        .CH_AF_EMPTY       ( DBG_EMPTY_0 ),
        .CH_AF_DATA        ( ftdi_to_fifo_interface_0_FTDI_AF ),
        // Outputs
        .FTDI_nOE          ( FTDI_nOE_net_0 ),
        .FTDI_nRD          ( FTDI_nRD_net_0 ),
        .FTDI_nWR          ( FTDI_nWR_net_0 ),
        .CH_FA_WREN        ( DBG_FIFO_WR_net_0 ),
        .CH_AF_RDEN        ( DBG_FIFO_RD_net_0 ),
        .CH_FA_DATA        ( ft601_fifo_interface_0_CH_FA_DATA ),
        // Inouts
        .FTDI_DATA         ( FTDI_DATA ),
        .FTDI_BE           ( FTDI_BE ) 
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
        .CLK      ( FTDI_CLK ),
        .Data_In  ( VCC_net ),
        // Outputs
        .Data_Out ( Synchronizer_0_Data_Out ) 
        );


endmodule
