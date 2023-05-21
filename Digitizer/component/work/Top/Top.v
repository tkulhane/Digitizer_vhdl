//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Sat May 20 14:40:49 2023
// Version: 2022.1 2022.1.0.10
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// Top
module Top(
    // Inputs
    RX_0,
    RX_1,
    // Outputs
    DBGport_0,
    DBGport_1,
    DBGport_2,
    DBGport_3,
    DBGport_4,
    DBGport_5,
    DBGport_6,
    DBGport_7,
    LED_1,
    LED_2,
    LED_3,
    LED_4,
    TX_0,
    TX_1,
    // Inouts
    ADC_sdio
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input  RX_0;
input  RX_1;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output DBGport_0;
output DBGport_1;
output DBGport_2;
output DBGport_3;
output DBGport_4;
output DBGport_5;
output DBGport_6;
output DBGport_7;
output LED_1;
output LED_2;
output LED_3;
output LED_4;
output TX_0;
output TX_1;
//--------------------------------------------------------------------
// Inout
//--------------------------------------------------------------------
inout  ADC_sdio;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire          Clock_Reset_0_Main_CLOCK;
wire          Clock_Reset_0_Main_RESET_N;
wire          Clock_Reset_0_UART_CLOCK;
wire          Clock_Reset_0_UART_RESER_N;
wire   [39:0] Controler_0_DEST_1_Fifo_Write_Data;
wire          Controler_0_DEST_1_Fifo_Write_Enable;
wire   [39:0] Controler_0_DEST_2_Fifo_Write_Data;
wire          Controler_0_DEST_2_Fifo_Write_Enable;
wire          Controler_0_SRC_1_Fifo_Read_Enable;
wire          Controler_0_SRC_2_Fifo_Read_Enable;
wire   [7:0]  Controler_0_TRG_addr;
wire   [15:0] Controler_0_TRG_data;
wire          Controler_0_TRG_enable_cmd;
wire          Controler_0_TRG_write_read;
wire          Data_Block_0_C_busy;
wire   [15:0] Data_Block_0_C_read_data_frame;
wire   [31:0] Data_Block_0_Communication_Data_Frame;
wire          RX_1;
wire          DBGport_0_0;
wire          DBGport_1_net_0;
wire          DBGport_2_net_0;
wire          DBGport_2_0;
wire          DBGport_3_net_0;
wire          DBGport_4_net_0;
wire          DBGport_4_0;
wire          ADC_sdio;
wire          DBGport_5_2;
wire          DBGport_6_net_0;
wire          DBGport_7_0;
wire          LED_1_net_0;
wire          LED_2_net_0;
wire          RX_0;
wire          TX_0_net_0;
wire   [39:0] UART_Protocol_0_RX_Fifo_Data;
wire          UART_Protocol_0_RX_FIFO_EMPTY;
wire          UART_Protocol_0_TX_FIFO_FULL;
wire   [39:0] UART_Protocol_1_RX_Fifo_Data;
wire          UART_Protocol_1_RX_FIFO_EMPTY;
wire          UART_Protocol_1_TX_FIFO_FULL;
wire          DBGport_0_0_net_0;
wire          DBGport_1_net_1;
wire          DBGport_4_0_net_0;
wire          DBGport_5_2_net_0;
wire          DBGport_6_net_1;
wire          DBGport_7_0_net_0;
wire          TX_0_net_1;
wire          DBGport_1_net_2;
wire          LED_1_net_1;
wire          LED_2_net_1;
wire          DBGport_2_0_net_0;
wire          DBGport_3_net_1;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire          GND_net;
wire   [3:0]  Number_Communication_const_net_0;
wire   [31:0] Communication_Data_Frame_const_net_0;
wire   [3:0]  Number_Communication_const_net_1;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign GND_net                              = 1'b0;
assign Number_Communication_const_net_0     = 4'h1;
assign Communication_Data_Frame_const_net_0 = 32'h00000000;
assign Number_Communication_const_net_1     = 4'h2;
//--------------------------------------------------------------------
// TieOff assignments
//--------------------------------------------------------------------
assign LED_3             = 1'b0;
assign LED_4             = 1'b0;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign DBGport_0_0_net_0 = DBGport_0_0;
assign DBGport_0         = DBGport_0_0_net_0;
assign DBGport_1_net_1   = DBGport_1_net_0;
assign DBGport_1         = DBGport_1_net_1;
assign DBGport_4_0_net_0 = DBGport_4_0;
assign DBGport_4         = DBGport_4_0_net_0;
assign DBGport_5_2_net_0 = DBGport_5_2;
assign DBGport_5         = DBGport_5_2_net_0;
assign DBGport_6_net_1   = DBGport_6_net_0;
assign DBGport_6         = DBGport_6_net_1;
assign DBGport_7_0_net_0 = DBGport_7_0;
assign DBGport_7         = DBGport_7_0_net_0;
assign TX_0_net_1        = TX_0_net_0;
assign TX_0              = TX_0_net_1;
assign DBGport_1_net_2   = DBGport_1_net_0;
assign TX_1              = DBGport_1_net_2;
assign LED_1_net_1       = LED_1_net_0;
assign LED_1             = LED_1_net_1;
assign LED_2_net_1       = LED_2_net_0;
assign LED_2             = LED_2_net_1;
assign DBGport_2_0_net_0 = DBGport_2_0;
assign DBGport_2         = DBGport_2_0_net_0;
assign DBGport_3_net_1   = DBGport_3_net_0;
assign DBGport_3         = DBGport_3_net_1;
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------Clock_Reset
Clock_Reset Clock_Reset_0(
        // Inputs
        .EXT_RST_N    ( DBGport_2_net_0 ),
        // Outputs
        .Main_CLOCK   ( Clock_Reset_0_Main_CLOCK ),
        .Main_RESET_N ( Clock_Reset_0_Main_RESET_N ),
        .UART_CLOCK   ( Clock_Reset_0_UART_CLOCK ),
        .UART_RESER_N ( Clock_Reset_0_UART_RESER_N ) 
        );

//--------Controler
Controler Controler_0(
        // Inputs
        .Clock                    ( Clock_Reset_0_Main_CLOCK ),
        .Reset_N                  ( Clock_Reset_0_Main_RESET_N ),
        .SRC_1_Fifo_Empty         ( UART_Protocol_0_RX_FIFO_EMPTY ),
        .DEST_1_Fifo_Full         ( UART_Protocol_0_TX_FIFO_FULL ),
        .DEST_2_Fifo_Full         ( UART_Protocol_1_TX_FIFO_FULL ),
        .SRC_2_Fifo_Empty         ( UART_Protocol_1_RX_FIFO_EMPTY ),
        .TRG_busy                 ( Data_Block_0_C_busy ),
        .SRC_1_Fifo_Read_Data     ( UART_Protocol_0_RX_Fifo_Data ),
        .SRC_2_Fifo_Read_Data     ( UART_Protocol_1_RX_Fifo_Data ),
        .TRG_rx_data              ( Data_Block_0_C_read_data_frame ),
        // Outputs
        .ADC_sclk                 (  ),
        .ADC_ss_n                 (  ),
        .SRC_1_Fifo_Read_Enable   ( Controler_0_SRC_1_Fifo_Read_Enable ),
        .DEST_1_Fifo_Write_Enable ( Controler_0_DEST_1_Fifo_Write_Enable ),
        .DEST_2_Fifo_Write_Enable ( Controler_0_DEST_2_Fifo_Write_Enable ),
        .SRC_2_Fifo_Read_Enable   ( Controler_0_SRC_2_Fifo_Read_Enable ),
        .TRG_enable_cmd           ( Controler_0_TRG_enable_cmd ),
        .TRG_write_read           ( Controler_0_TRG_write_read ),
        .SYS_Main_Reset_N         ( DBGport_2_net_0 ),
        .DEST_1_Fifo_Write_Data   ( Controler_0_DEST_1_Fifo_Write_Data ),
        .DEST_2_Fifo_Write_Data   ( Controler_0_DEST_2_Fifo_Write_Data ),
        .TRG_addr                 ( Controler_0_TRG_addr ),
        .TRG_data                 ( Controler_0_TRG_data ),
        // Inouts
        .ADC_sdio                 ( ADC_sdio ) 
        );

//--------Data_Block
Data_Block Data_Block_0(
        // Inputs
        .C_enable_cmd              ( Controler_0_TRG_enable_cmd ),
        .C_write_read              ( Controler_0_TRG_write_read ),
        .Clock                     ( Clock_Reset_0_Main_CLOCK ),
        .Reset_N                   ( Clock_Reset_0_Main_RESET_N ),
        .Communication_Data_Full   ( DBGport_3_net_0 ),
        .C_addr_frame              ( Controler_0_TRG_addr ),
        .C_write_data_frame        ( Controler_0_TRG_data ),
        .Communication_DATA_Ack    ( DBGport_4_net_0 ),
        // Outputs
        .C_busy                    ( Data_Block_0_C_busy ),
        .Communication_Data_Enable ( DBGport_2_0 ),
        .Communication_Data_Req    ( DBGport_0_0 ),
        .C_read_data_frame         ( Data_Block_0_C_read_data_frame ),
        .Communication_Data_Frame  ( Data_Block_0_Communication_Data_Frame ),
        .Diag_0                    ( DBGport_4_0 ),
        .Diag_1                    ( DBGport_5_2 ),
        .Diag_2                    ( DBGport_6_net_0 ),
        .Diag_3                    ( DBGport_7_0 ) 
        );

//--------UART_Protocol
UART_Protocol UART_Protocol_0(
        // Inputs
        .RX                        ( RX_0 ),
        .UART_Clock                ( Clock_Reset_0_UART_CLOCK ),
        .UART_RESET_N              ( Clock_Reset_0_UART_RESER_N ),
        .Logic_Clock               ( Clock_Reset_0_Main_CLOCK ),
        .Logic_RESET_N             ( Clock_Reset_0_Main_RESET_N ),
        .RX_FIFO_RE                ( Controler_0_SRC_1_Fifo_Read_Enable ),
        .TX_FIFO_WE                ( Controler_0_DEST_1_Fifo_Write_Enable ),
        .Communication_Data_Req    ( GND_net ),
        .Communication_Data_Enable ( GND_net ),
        .TX_Fifo_Data              ( Controler_0_DEST_1_Fifo_Write_Data ),
        .Number_Communication      ( Number_Communication_const_net_0 ),
        .Communication_Data_Frame  ( Communication_Data_Frame_const_net_0 ),
        // Outputs
        .TX                        ( TX_0_net_0 ),
        .Diag_Valid_LED            ( LED_1_net_0 ),
        .RX_FIFO_EMPTY             ( UART_Protocol_0_RX_FIFO_EMPTY ),
        .TX_FIFO_FULL              ( UART_Protocol_0_TX_FIFO_FULL ),
        .Communication_Data_Full   (  ),
        .RX_Fifo_Data              ( UART_Protocol_0_RX_Fifo_Data ),
        .Diag_0                    (  ),
        .Diag_1                    (  ),
        .Diag_2                    (  ),
        .Communication_DATA_Ack    (  ) 
        );

//--------UART_Protocol
UART_Protocol UART_Protocol_1(
        // Inputs
        .RX                        ( RX_1 ),
        .UART_Clock                ( Clock_Reset_0_UART_CLOCK ),
        .UART_RESET_N              ( Clock_Reset_0_UART_RESER_N ),
        .Logic_Clock               ( Clock_Reset_0_Main_CLOCK ),
        .Logic_RESET_N             ( Clock_Reset_0_Main_RESET_N ),
        .RX_FIFO_RE                ( Controler_0_SRC_2_Fifo_Read_Enable ),
        .TX_FIFO_WE                ( Controler_0_DEST_2_Fifo_Write_Enable ),
        .Communication_Data_Req    ( DBGport_0_0 ),
        .Communication_Data_Enable ( DBGport_2_0 ),
        .TX_Fifo_Data              ( Controler_0_DEST_2_Fifo_Write_Data ),
        .Number_Communication      ( Number_Communication_const_net_1 ),
        .Communication_Data_Frame  ( Data_Block_0_Communication_Data_Frame ),
        // Outputs
        .TX                        ( DBGport_1_net_0 ),
        .Diag_Valid_LED            ( LED_2_net_0 ),
        .RX_FIFO_EMPTY             ( UART_Protocol_1_RX_FIFO_EMPTY ),
        .TX_FIFO_FULL              ( UART_Protocol_1_TX_FIFO_FULL ),
        .Communication_Data_Full   ( DBGport_3_net_0 ),
        .RX_Fifo_Data              ( UART_Protocol_1_RX_Fifo_Data ),
        .Diag_0                    (  ),
        .Diag_1                    (  ),
        .Diag_2                    (  ),
        .Communication_DATA_Ack    ( DBGport_4_net_0 ) 
        );


endmodule
