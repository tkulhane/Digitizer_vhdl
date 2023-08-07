//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Mon Aug  7 12:59:30 2023
// Version: 2022.1 2022.1.0.10
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// Top
module Top(
    // Inputs
    BTN_1,
    BTN_2,
    BTN_3,
    BTN_4,
    FTDI_CLK,
    FTDI_nRXF,
    FTDI_nTXE,
    LMX1_miso,
    LMX2_miso,
    RX_0,
    RX_1,
    // Outputs
    ADC_sclk,
    ADC_ss_n,
    DBGport_0,
    DBGport_1,
    DBGport_2,
    DBGport_3,
    DBGport_4,
    DBGport_5,
    DBGport_6,
    DBGport_7,
    EXT_ADC_Reset_N,
    EXT_HMC_Reset_N,
    EXT_LMX1_Reset_N,
    EXT_LMX2_Reset_N,
    FTDI_BE,
    FTDI_GPIO_0,
    FTDI_GPIO_1,
    FTDI_RESET_N,
    FTDI_nOE,
    FTDI_nRD,
    FTDI_nWR,
    HMC_sclk,
    HMC_ss_n,
    LED_1,
    LED_2,
    LED_3,
    LED_4,
    LMX1_mosi,
    LMX1_sclk,
    LMX1_ss_n,
    LMX2_mosi,
    LMX2_sclk,
    LMX2_ss_n,
    TX_0,
    TX_1,
    // Inouts
    ADC_sdio,
    FTDI_DATA,
    HMC_sdio
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input         BTN_1;
input         BTN_2;
input         BTN_3;
input         BTN_4;
input         FTDI_CLK;
input         FTDI_nRXF;
input         FTDI_nTXE;
input         LMX1_miso;
input         LMX2_miso;
input         RX_0;
input         RX_1;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output        ADC_sclk;
output        ADC_ss_n;
output        DBGport_0;
output        DBGport_1;
output        DBGport_2;
output        DBGport_3;
output        DBGport_4;
output        DBGport_5;
output        DBGport_6;
output        DBGport_7;
output        EXT_ADC_Reset_N;
output        EXT_HMC_Reset_N;
output        EXT_LMX1_Reset_N;
output        EXT_LMX2_Reset_N;
output [3:0]  FTDI_BE;
output        FTDI_GPIO_0;
output        FTDI_GPIO_1;
output        FTDI_RESET_N;
output        FTDI_nOE;
output        FTDI_nRD;
output        FTDI_nWR;
output        HMC_sclk;
output        HMC_ss_n;
output        LED_1;
output        LED_2;
output        LED_3;
output        LED_4;
output        LMX1_mosi;
output        LMX1_sclk;
output        LMX1_ss_n;
output        LMX2_mosi;
output        LMX2_sclk;
output        LMX2_ss_n;
output        TX_0;
output        TX_1;
//--------------------------------------------------------------------
// Inout
//--------------------------------------------------------------------
inout         ADC_sdio;
inout  [31:0] FTDI_DATA;
inout         HMC_sdio;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire          ADC_sclk_net_0;
wire          ADC_sdio;
wire          ADC_ss_n_net_0;
wire          Clock_Reset_0_Main_CLOCK;
wire          Clock_Reset_0_Main_RESET_N;
wire          Clock_Reset_0_UART_CLOCK;
wire          Clock_Reset_0_UART_RESER_N;
wire   [39:0] Controler_0_DEST_1_Fifo_Write_Data;
wire          Controler_0_DEST_1_Fifo_Write_Enable;
wire   [39:0] Controler_0_DEST_2_Fifo_Write_Data;
wire          Controler_0_DEST_2_Fifo_Write_Enable;
wire   [39:0] Controler_0_DEST_3_Fifo_Write_Data;
wire          Controler_0_DEST_3_Fifo_Write_Enable;
wire          Controler_0_SRC_1_Fifo_Read_Enable;
wire          Controler_0_SRC_2_Fifo_Read_Enable;
wire          Controler_0_SRC_3_Fifo_Read_Enable;
wire   [7:0]  Controler_0_TRG_addr;
wire   [15:0] Controler_0_TRG_data;
wire          Controler_0_TRG_enable_cmd;
wire          Controler_0_TRG_write_read;
wire          Data_Block_0_C_busy;
wire   [15:0] Data_Block_0_C_read_data_frame;
wire   [31:0] Data_Block_0_Communication_Data_Frame;
wire          RX_1;
wire          DBGport_0_0;
wire          DBGport_0_1;
wire          DBGport_1_net_0;
wire          DBGport_1_0;
wire          DBGport_2_net_0;
wire          DBGport_2_0;
wire          DBGport_2_1;
wire          DBGport_3_net_0;
wire          DBGport_3_0;
wire          DBGport_3_1;
wire          DBGport_4_net_0;
wire          DBGport_4_1;
wire          BTN_1;
wire          BTN_2;
wire   [3:0]  FTDI_BE_net_0;
wire          FTDI_CLK;
wire   [31:0] FTDI_DATA;
wire          FTDI_GPIO_0_net_0;
wire          FTDI_GPIO_1_net_0;
wire          FTDI_nOE_net_0;
wire          FTDI_nRD_net_0;
wire          FTDI_nRXF;
wire          FTDI_nTXE;
wire          FTDI_nWR_net_0;
wire          FTDI_RESET_N_net_0;
wire          HMC_sdio;
wire          HMC_ss_n_net_0;
wire          LED_1_net_0;
wire          LED_2_net_0;
wire          LED_3_net_0;
wire          LED_4_net_0;
wire          LMX1_miso;
wire          LMX1_mosi_net_0;
wire          LMX1_sclk_net_0;
wire          LMX1_ss_n_net_0;
wire          LMX2_miso;
wire          LMX2_mosi_net_0;
wire          LMX2_sclk_net_0;
wire          LMX2_ss_n_net_0;
wire          RX_0;
wire          TX_0_net_0;
wire   [39:0] UART_Protocol_0_RX_Fifo_Data;
wire          UART_Protocol_0_RX_FIFO_EMPTY;
wire          UART_Protocol_0_TX_FIFO_FULL;
wire   [39:0] UART_Protocol_1_RX_Fifo_Data;
wire          UART_Protocol_1_RX_FIFO_EMPTY;
wire          UART_Protocol_1_TX_FIFO_FULL;
wire   [39:0] USB_3_Protocol_0_RX_FIFO_Data;
wire          USB_3_Protocol_0_RX_FIFO_EMPTY;
wire          USB_3_Protocol_0_TX_FULL;
wire          DBGport_0_1_net_0;
wire          DBGport_1_0_net_0;
wire          DBGport_4_1_net_0;
wire          TX_0_net_1;
wire          DBGport_1_net_1;
wire          LED_1_net_1;
wire          LED_2_net_1;
wire          LED_3_net_1;
wire          LED_4_net_1;
wire          DBGport_2_1_net_0;
wire          DBGport_3_1_net_0;
wire          FTDI_nWR_net_1;
wire          FTDI_GPIO_1_net_1;
wire          FTDI_GPIO_0_net_1;
wire          FTDI_RESET_N_net_1;
wire          FTDI_nOE_net_1;
wire          FTDI_nRD_net_1;
wire          ADC_sclk_net_1;
wire          ADC_ss_n_net_1;
wire          DBGport_3_0_net_0;
wire          HMC_ss_n_net_1;
wire          LMX1_mosi_net_1;
wire          LMX1_ss_n_net_1;
wire          LMX1_sclk_net_1;
wire          LMX2_sclk_net_1;
wire          LMX2_ss_n_net_1;
wire          LMX2_mosi_net_1;
wire          DBGport_0_1_net_1;
wire          DBGport_1_0_net_1;
wire          DBGport_2_1_net_1;
wire          DBGport_3_1_net_1;
wire   [3:0]  FTDI_BE_net_1;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire          GND_net;
wire   [3:0]  Number_Communication_const_net_0;
wire   [31:0] Communication_Data_Frame_const_net_0;
wire   [3:0]  Number_Communication_const_net_1;
wire   [3:0]  Communication_Number_const_net_0;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign GND_net                              = 1'b0;
assign Number_Communication_const_net_0     = 4'h1;
assign Communication_Data_Frame_const_net_0 = 32'h00000000;
assign Number_Communication_const_net_1     = 4'h2;
assign Communication_Number_const_net_0     = 4'h3;
//--------------------------------------------------------------------
// TieOff assignments
//--------------------------------------------------------------------
assign DBGport_5          = 1'b0;
assign DBGport_6          = 1'b0;
assign DBGport_7          = 1'b0;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign DBGport_0_1_net_0  = DBGport_0_1;
assign DBGport_0          = DBGport_0_1_net_0;
assign DBGport_1_0_net_0  = DBGport_1_0;
assign DBGport_1          = DBGport_1_0_net_0;
assign DBGport_4_1_net_0  = DBGport_4_1;
assign DBGport_4          = DBGport_4_1_net_0;
assign TX_0_net_1         = TX_0_net_0;
assign TX_0               = TX_0_net_1;
assign DBGport_1_net_1    = DBGport_1_net_0;
assign TX_1               = DBGport_1_net_1;
assign LED_1_net_1        = LED_1_net_0;
assign LED_1              = LED_1_net_1;
assign LED_2_net_1        = LED_2_net_0;
assign LED_2              = LED_2_net_1;
assign LED_3_net_1        = LED_3_net_0;
assign LED_3              = LED_3_net_1;
assign LED_4_net_1        = LED_4_net_0;
assign LED_4              = LED_4_net_1;
assign DBGport_2_1_net_0  = DBGport_2_1;
assign DBGport_2          = DBGport_2_1_net_0;
assign DBGport_3_1_net_0  = DBGport_3_1;
assign DBGport_3          = DBGport_3_1_net_0;
assign FTDI_nWR_net_1     = FTDI_nWR_net_0;
assign FTDI_nWR           = FTDI_nWR_net_1;
assign FTDI_GPIO_1_net_1  = FTDI_GPIO_1_net_0;
assign FTDI_GPIO_1        = FTDI_GPIO_1_net_1;
assign FTDI_GPIO_0_net_1  = FTDI_GPIO_0_net_0;
assign FTDI_GPIO_0        = FTDI_GPIO_0_net_1;
assign FTDI_RESET_N_net_1 = FTDI_RESET_N_net_0;
assign FTDI_RESET_N       = FTDI_RESET_N_net_1;
assign FTDI_nOE_net_1     = FTDI_nOE_net_0;
assign FTDI_nOE           = FTDI_nOE_net_1;
assign FTDI_nRD_net_1     = FTDI_nRD_net_0;
assign FTDI_nRD           = FTDI_nRD_net_1;
assign ADC_sclk_net_1     = ADC_sclk_net_0;
assign ADC_sclk           = ADC_sclk_net_1;
assign ADC_ss_n_net_1     = ADC_ss_n_net_0;
assign ADC_ss_n           = ADC_ss_n_net_1;
assign DBGport_3_0_net_0  = DBGport_3_0;
assign HMC_sclk           = DBGport_3_0_net_0;
assign HMC_ss_n_net_1     = HMC_ss_n_net_0;
assign HMC_ss_n           = HMC_ss_n_net_1;
assign LMX1_mosi_net_1    = LMX1_mosi_net_0;
assign LMX1_mosi          = LMX1_mosi_net_1;
assign LMX1_ss_n_net_1    = LMX1_ss_n_net_0;
assign LMX1_ss_n          = LMX1_ss_n_net_1;
assign LMX1_sclk_net_1    = LMX1_sclk_net_0;
assign LMX1_sclk          = LMX1_sclk_net_1;
assign LMX2_sclk_net_1    = LMX2_sclk_net_0;
assign LMX2_sclk          = LMX2_sclk_net_1;
assign LMX2_ss_n_net_1    = LMX2_ss_n_net_0;
assign LMX2_ss_n          = LMX2_ss_n_net_1;
assign LMX2_mosi_net_1    = LMX2_mosi_net_0;
assign LMX2_mosi          = LMX2_mosi_net_1;
assign DBGport_0_1_net_1  = DBGport_0_1;
assign EXT_ADC_Reset_N    = DBGport_0_1_net_1;
assign DBGport_1_0_net_1  = DBGport_1_0;
assign EXT_HMC_Reset_N    = DBGport_1_0_net_1;
assign DBGport_2_1_net_1  = DBGport_2_1;
assign EXT_LMX1_Reset_N   = DBGport_2_1_net_1;
assign DBGport_3_1_net_1  = DBGport_3_1;
assign EXT_LMX2_Reset_N   = DBGport_3_1_net_1;
assign FTDI_BE_net_1      = FTDI_BE_net_0;
assign FTDI_BE[3:0]       = FTDI_BE_net_1;
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
        .LMX1_miso                ( LMX1_miso ),
        .LMX2_miso                ( LMX2_miso ),
        .SRC_3_Fifo_Empty         ( USB_3_Protocol_0_RX_FIFO_EMPTY ),
        .DEST_3_Fifo_Full         ( USB_3_Protocol_0_TX_FULL ),
        .SRC_1_Fifo_Read_Data     ( UART_Protocol_0_RX_Fifo_Data ),
        .SRC_2_Fifo_Read_Data     ( UART_Protocol_1_RX_Fifo_Data ),
        .TRG_rx_data              ( Data_Block_0_C_read_data_frame ),
        .SRC_3_Fifo_Read_Data     ( USB_3_Protocol_0_RX_FIFO_Data ),
        .Input_2                  ( BTN_1 ),
        .Input_3                  ( BTN_2 ),
        // Outputs
        .ADC_sclk                 ( ADC_sclk_net_0 ),
        .ADC_ss_n                 ( ADC_ss_n_net_0 ),
        .SRC_1_Fifo_Read_Enable   ( Controler_0_SRC_1_Fifo_Read_Enable ),
        .DEST_1_Fifo_Write_Enable ( Controler_0_DEST_1_Fifo_Write_Enable ),
        .DEST_2_Fifo_Write_Enable ( Controler_0_DEST_2_Fifo_Write_Enable ),
        .SRC_2_Fifo_Read_Enable   ( Controler_0_SRC_2_Fifo_Read_Enable ),
        .TRG_enable_cmd           ( Controler_0_TRG_enable_cmd ),
        .TRG_write_read           ( Controler_0_TRG_write_read ),
        .SYS_Main_Reset_N         ( DBGport_2_net_0 ),
        .HMC_sclk                 ( DBGport_3_0 ),
        .HMC_ss_n                 ( HMC_ss_n_net_0 ),
        .LMX1_ss_n                ( LMX1_ss_n_net_0 ),
        .LMX1_mosi                ( LMX1_mosi_net_0 ),
        .LMX1_sclk                ( LMX1_sclk_net_0 ),
        .LMX2_ss_n                ( LMX2_ss_n_net_0 ),
        .LMX2_mosi                ( LMX2_mosi_net_0 ),
        .LMX2_sclk                ( LMX2_sclk_net_0 ),
        .SRC_3_Fifo_Read_Enable   ( Controler_0_SRC_3_Fifo_Read_Enable ),
        .DEST_3_Fifo_Write_Enable ( Controler_0_DEST_3_Fifo_Write_Enable ),
        .OUT_0                    ( LED_3_net_0 ),
        .OUT_1                    ( LED_4_net_0 ),
        .DEST_1_Fifo_Write_Data   ( Controler_0_DEST_1_Fifo_Write_Data ),
        .DEST_2_Fifo_Write_Data   ( Controler_0_DEST_2_Fifo_Write_Data ),
        .TRG_addr                 ( Controler_0_TRG_addr ),
        .TRG_data                 ( Controler_0_TRG_data ),
        .DEST_3_Fifo_Write_Data   ( Controler_0_DEST_3_Fifo_Write_Data ),
        .EXT_ADC_Reset_N          ( DBGport_0_1 ),
        .EXT_HMC_Reset_N          ( DBGport_1_0 ),
        .EXT_LMX2_Reset_N         ( DBGport_3_1 ),
        .EXT_LMX1_Reset_N         ( DBGport_2_1 ),
        .INT_DataFifo_Reset_N     ( DBGport_4_1 ),
        // Inouts
        .HMC_sdio                 ( HMC_sdio ),
        .ADC_sdio                 ( ADC_sdio ) 
        );

//--------Data_Block
Data_Block Data_Block_0(
        // Inputs
        .C_enable_cmd              ( Controler_0_TRG_enable_cmd ),
        .C_write_read              ( Controler_0_TRG_write_read ),
        .Clock                     ( Clock_Reset_0_Main_CLOCK ),
        .Communication_Data_Full   ( DBGport_3_net_0 ),
        .Communication_DATA_Ack    ( DBGport_4_net_0 ),
        .Fifo_RESET_N              ( DBGport_4_1 ),
        .C_addr_frame              ( Controler_0_TRG_addr ),
        .C_write_data_frame        ( Controler_0_TRG_data ),
        .Reset_N                   ( Clock_Reset_0_Main_RESET_N ),
        // Outputs
        .C_busy                    ( Data_Block_0_C_busy ),
        .Communication_Data_Enable ( DBGport_2_0 ),
        .Communication_Data_Req    ( DBGport_0_0 ),
        .Diag_0                    (  ),
        .Diag_1                    (  ),
        .Diag_2                    (  ),
        .Diag_3                    (  ),
        .C_read_data_frame         ( Data_Block_0_C_read_data_frame ),
        .Communication_Data_Frame  ( Data_Block_0_Communication_Data_Frame ) 
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
        .Diag_0                    (  ),
        .Diag_1                    (  ),
        .Diag_2                    (  ),
        .Communication_DATA_Ack    (  ),
        .RX_Fifo_Data              ( UART_Protocol_0_RX_Fifo_Data ) 
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
        .Diag_0                    (  ),
        .Diag_1                    (  ),
        .Diag_2                    (  ),
        .Communication_DATA_Ack    ( DBGport_4_net_0 ),
        .RX_Fifo_Data              ( UART_Protocol_1_RX_Fifo_Data ) 
        );

//--------USB_3_Protocol
USB_3_Protocol USB_3_Protocol_0(
        // Inputs
        .FTDI_CLK             ( FTDI_CLK ),
        .FTDI_nRXF            ( FTDI_nRXF ),
        .FTDI_nTXE            ( FTDI_nTXE ),
        .Main_CLK             ( Clock_Reset_0_Main_CLOCK ),
        .Main_RESET_N         ( Clock_Reset_0_Main_RESET_N ),
        .RX_FIFO_RE           ( Controler_0_SRC_3_Fifo_Read_Enable ),
        .TX_FIFO_WE           ( Controler_0_DEST_3_Fifo_Write_Enable ),
        .TX_FIFO_Data         ( Controler_0_DEST_3_Fifo_Write_Data ),
        .Communication_Number ( Communication_Number_const_net_0 ),
        // Outputs
        .FTDI_nWR             ( FTDI_nWR_net_0 ),
        .FTDI_nOE             ( FTDI_nOE_net_0 ),
        .FTDI_nRD             ( FTDI_nRD_net_0 ),
        .FTDI_RESET_N         ( FTDI_RESET_N_net_0 ),
        .FTDI_GPIO_0          ( FTDI_GPIO_0_net_0 ),
        .FTDI_GPIO_1          ( FTDI_GPIO_1_net_0 ),
        .RX_FIFO_EMPTY        ( USB_3_Protocol_0_RX_FIFO_EMPTY ),
        .TX_FULL              ( USB_3_Protocol_0_TX_FULL ),
        .FTDI_BE              ( FTDI_BE_net_0 ),
        .RX_FIFO_Data         ( USB_3_Protocol_0_RX_FIFO_Data ),
        // Inouts
        .FTDI_DATA            ( FTDI_DATA ) 
        );


endmodule
