//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Wed May 17 16:53:30 2023
// Version: 2022.1 2022.1.0.10
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// UART_Protocol
module UART_Protocol(
    // Inputs
    Communication_Data_Enable,
    Communication_Data_Frame,
    Communication_Data_Req,
    Logic_Clock,
    Logic_RESET_N,
    Number_Communication,
    RX,
    RX_FIFO_RE,
    TX_FIFO_WE,
    TX_Fifo_Data,
    UART_Clock,
    UART_RESET_N,
    // Outputs
    Communication_DATA_Ack,
    Communication_Data_Full,
    Diag_0,
    Diag_1,
    Diag_2,
    Diag_Valid_LED,
    RX_FIFO_EMPTY,
    RX_Fifo_Data,
    TX,
    TX_FIFO_FULL
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input         Communication_Data_Enable;
input  [31:0] Communication_Data_Frame;
input         Communication_Data_Req;
input         Logic_Clock;
input         Logic_RESET_N;
input  [3:0]  Number_Communication;
input         RX;
input         RX_FIFO_RE;
input         TX_FIFO_WE;
input  [39:0] TX_Fifo_Data;
input         UART_Clock;
input         UART_RESET_N;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output        Communication_DATA_Ack;
output        Communication_Data_Full;
output        Diag_0;
output        Diag_1;
output        Diag_2;
output        Diag_Valid_LED;
output        RX_FIFO_EMPTY;
output [39:0] RX_Fifo_Data;
output        TX;
output        TX_FIFO_FULL;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire          Communication_DATA_Ack_net_0;
wire          Communication_Data_Enable;
wire   [31:0] Communication_Data_Frame;
wire          Communication_Data_Full_net_0;
wire          Communication_Data_Req;
wire   [39:0] Communication_TX_Arbiter_0_TX_Fifo_Data;
wire          COREFIFO_C0_0_0_FULL;
wire   [39:0] COREFIFO_C0_0_Q;
wire   [7:0]  COREUART_C0_0_DATA_OUT;
wire          COREUART_C0_0_RXRDY;
wire          COREUART_C0_0_TXRDY;
wire          Diag_0_net_0;
wire          Diag_1_net_0;
wire          Diag_2_net_0;
wire          Diag_Valid_LED_net_0;
wire          Diag_Valid_RX;
wire          Diag_Valid_TX;
wire          INV_0_Y;
wire          Logic_Clock;
wire          Logic_RESET_N;
wire   [3:0]  Number_Communication;
wire          OR2_0_Y;
wire          RX;
wire   [39:0] RX_Fifo_Data_net_0;
wire          RX_FIFO_EMPTY_net_0;
wire          RX_FIFO_RE;
wire          TX_net_0;
wire   [39:0] TX_Fifo_Data;
wire          TX_FIFO_FULL_net_0;
wire          TX_FIFO_WE;
wire          UART_Clock;
wire          UART_RESET_N;
wire          UART_RX_Protocol_0_Diag_Valid;
wire   [39:0] UART_RX_Protocol_0_Fifo_Write_Data;
wire          UART_RX_Protocol_0_Fifo_Write_Enable;
wire          UART_RX_Protocol_0_UART_RX_OE_N;
wire          UART_TX_Protocol_0_Diag_Valid;
wire   [7:0]  UART_TX_Protocol_0_UART_TX_Data;
wire          UART_TX_Protocol_0_UART_TX_Enable;
wire          TX_net_1;
wire          Diag_Valid_LED_net_1;
wire          RX_FIFO_EMPTY_net_1;
wire          TX_FIFO_FULL_net_1;
wire          Communication_Data_Full_net_1;
wire   [39:0] RX_Fifo_Data_net_1;
wire          Diag_0_net_1;
wire          Diag_1_net_1;
wire          Diag_2_net_1;
wire          Communication_DATA_Ack_net_1;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire          VCC_net;
wire          GND_net;
wire   [12:0] BAUD_VAL_const_net_0;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign VCC_net              = 1'b1;
assign GND_net              = 1'b0;
assign BAUD_VAL_const_net_0 = 13'h0002;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign TX_net_1                      = TX_net_0;
assign TX                            = TX_net_1;
assign Diag_Valid_LED_net_1          = Diag_Valid_LED_net_0;
assign Diag_Valid_LED                = Diag_Valid_LED_net_1;
assign RX_FIFO_EMPTY_net_1           = RX_FIFO_EMPTY_net_0;
assign RX_FIFO_EMPTY                 = RX_FIFO_EMPTY_net_1;
assign TX_FIFO_FULL_net_1            = TX_FIFO_FULL_net_0;
assign TX_FIFO_FULL                  = TX_FIFO_FULL_net_1;
assign Communication_Data_Full_net_1 = Communication_Data_Full_net_0;
assign Communication_Data_Full       = Communication_Data_Full_net_1;
assign RX_Fifo_Data_net_1            = RX_Fifo_Data_net_0;
assign RX_Fifo_Data[39:0]            = RX_Fifo_Data_net_1;
assign Diag_0_net_1                  = Diag_0_net_0;
assign Diag_0                        = Diag_0_net_1;
assign Diag_1_net_1                  = Diag_1_net_0;
assign Diag_1                        = Diag_1_net_1;
assign Diag_2_net_1                  = Diag_2_net_0;
assign Diag_2                        = Diag_2_net_1;
assign Communication_DATA_Ack_net_1  = Communication_DATA_Ack_net_0;
assign Communication_DATA_Ack        = Communication_DATA_Ack_net_1;
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------Communication_TX_Arbiter
Communication_TX_Arbiter Communication_TX_Arbiter_0(
        // Inputs
        .Clock                     ( Logic_Clock ),
        .Reset_N                   ( Logic_RESET_N ),
        .Control_Fifo_WE           ( TX_FIFO_WE ),
        .Control_Fifo_Data         ( TX_Fifo_Data ),
        .Communication_Data_Frame  ( Communication_Data_Frame ),
        .Communication_Data_Enable ( Communication_Data_Enable ),
        .Communication_Data_Req    ( Communication_Data_Req ),
        .TX_Fifo_Full              ( Diag_1_net_0 ),
        // Outputs
        .Control_Fifo_Full         ( TX_FIFO_FULL_net_0 ),
        .Communication_Data_Full   ( Communication_Data_Full_net_0 ),
        .Communication_DATA_Ack    ( Communication_DATA_Ack_net_0 ),
        .TX_Fifo_WE                ( Diag_0_net_0 ),
        .TX_Fifo_Data              ( Communication_TX_Arbiter_0_TX_Fifo_Data ) 
        );

//--------COREFIFO_C0
COREFIFO_C0 COREFIFO_C0_inst_0(
        // Inputs
        .WCLOCK   ( Logic_Clock ),
        .RCLOCK   ( UART_Clock ),
        .WRESET_N ( Logic_RESET_N ),
        .RRESET_N ( UART_RESET_N ),
        .WE       ( Diag_0_net_0 ),
        .RE       ( Diag_Valid_TX ),
        .DATA     ( Communication_TX_Arbiter_0_TX_Fifo_Data ),
        // Outputs
        .FULL     (  ),
        .EMPTY    ( Diag_Valid_RX ),
        .AFULL    ( Diag_1_net_0 ),
        .WACK     ( Diag_2_net_0 ),
        .Q        ( COREFIFO_C0_0_Q ) 
        );

//--------COREFIFO_C0
COREFIFO_C0 COREFIFO_C0_0_0(
        // Inputs
        .WCLOCK   ( UART_Clock ),
        .RCLOCK   ( Logic_Clock ),
        .WRESET_N ( UART_RESET_N ),
        .RRESET_N ( Logic_RESET_N ),
        .WE       ( UART_RX_Protocol_0_Fifo_Write_Enable ),
        .RE       ( RX_FIFO_RE ),
        .DATA     ( UART_RX_Protocol_0_Fifo_Write_Data ),
        // Outputs
        .FULL     ( COREFIFO_C0_0_0_FULL ),
        .EMPTY    ( RX_FIFO_EMPTY_net_0 ),
        .AFULL    (  ),
        .WACK     (  ),
        .Q        ( RX_Fifo_Data_net_0 ) 
        );

//--------COREUART_C0
COREUART_C0 COREUART_C0_0(
        // Inputs
        .BIT8        ( VCC_net ),
        .CLK         ( UART_Clock ),
        .CSN         ( GND_net ),
        .ODD_N_EVEN  ( GND_net ),
        .OEN         ( UART_RX_Protocol_0_UART_RX_OE_N ),
        .PARITY_EN   ( GND_net ),
        .RESET_N     ( UART_RESET_N ),
        .RX          ( RX ),
        .WEN         ( INV_0_Y ),
        .BAUD_VAL    ( BAUD_VAL_const_net_0 ),
        .DATA_IN     ( UART_TX_Protocol_0_UART_TX_Data ),
        // Outputs
        .OVERFLOW    (  ),
        .PARITY_ERR  (  ),
        .RXRDY       ( COREUART_C0_0_RXRDY ),
        .TX          ( TX_net_0 ),
        .TXRDY       ( COREUART_C0_0_TXRDY ),
        .FRAMING_ERR (  ),
        .DATA_OUT    ( COREUART_C0_0_DATA_OUT ) 
        );

//--------INV
INV INV_0(
        // Inputs
        .A ( UART_TX_Protocol_0_UART_TX_Enable ),
        // Outputs
        .Y ( INV_0_Y ) 
        );

//--------mko
mko #( 
        .Time_Period ( 330000 ) )
mko_0(
        // Inputs
        .CLK_input  ( UART_Clock ),
        .nRST_input ( UART_RESET_N ),
        .MKO_IN     ( OR2_0_Y ),
        // Outputs
        .MKO_OUT    ( Diag_Valid_LED_net_0 ) 
        );

//--------OR2
OR2 OR2_0(
        // Inputs
        .A ( UART_RX_Protocol_0_Diag_Valid ),
        .B ( UART_TX_Protocol_0_Diag_Valid ),
        // Outputs
        .Y ( OR2_0_Y ) 
        );

//--------UART_RX_Protocol
UART_RX_Protocol UART_RX_Protocol_0(
        // Inputs
        .Clock                ( UART_Clock ),
        .Reset_N              ( UART_RESET_N ),
        .UART_RX_Ready        ( COREUART_C0_0_RXRDY ),
        .Fifo_Full            ( COREFIFO_C0_0_0_FULL ),
        .Number_Communication ( Number_Communication ),
        .UART_RX_Data         ( COREUART_C0_0_DATA_OUT ),
        // Outputs
        .UART_RX_OE_N         ( UART_RX_Protocol_0_UART_RX_OE_N ),
        .Fifo_Write_Enable    ( UART_RX_Protocol_0_Fifo_Write_Enable ),
        .Diag_Valid           ( UART_RX_Protocol_0_Diag_Valid ),
        .Fifo_Write_Data      ( UART_RX_Protocol_0_Fifo_Write_Data ) 
        );

//--------UART_TX_Protocol
UART_TX_Protocol UART_TX_Protocol_0(
        // Inputs
        .Clock            ( UART_Clock ),
        .Reset_N          ( UART_RESET_N ),
        .UART_TX_Ready    ( COREUART_C0_0_TXRDY ),
        .Fifo_Empty       ( Diag_Valid_RX ),
        .Fifo_Read_Data   ( COREFIFO_C0_0_Q ),
        // Outputs
        .UART_TX_Enable   ( UART_TX_Protocol_0_UART_TX_Enable ),
        .Fifo_Read_Enable ( Diag_Valid_TX ),
        .Diag_Valid       ( UART_TX_Protocol_0_Diag_Valid ),
        .UART_TX_Data     ( UART_TX_Protocol_0_UART_TX_Data ) 
        );


endmodule
