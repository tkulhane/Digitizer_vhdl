//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Sat Apr 15 00:45:37 2023
// Version: 2022.1 2022.1.0.10
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// Controler
module Controler(
    // Inputs
    Clock,
    DEST_1_Fifo_Full,
    DEST_2_Fifo_Full,
    Reset_N,
    SRC_1_Fifo_Empty,
    SRC_1_Fifo_Read_Data,
    SRC_2_Fifo_Empty,
    SRC_2_Fifo_Read_Data,
    TRG_busy,
    TRG_rx_data,
    // Outputs
    ADC_sclk,
    ADC_ss_n,
    DEST_1_Fifo_Write_Data,
    DEST_1_Fifo_Write_Enable,
    DEST_2_Fifo_Write_Data,
    DEST_2_Fifo_Write_Enable,
    SRC_1_Fifo_Read_Enable,
    SRC_2_Fifo_Read_Enable,
    SYS_Main_Reset_N,
    TRG_addr,
    TRG_data,
    TRG_enable_cmd,
    TRG_write_read,
    // Inouts
    ADC_sdio
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input         Clock;
input         DEST_1_Fifo_Full;
input         DEST_2_Fifo_Full;
input         Reset_N;
input         SRC_1_Fifo_Empty;
input  [39:0] SRC_1_Fifo_Read_Data;
input         SRC_2_Fifo_Empty;
input  [39:0] SRC_2_Fifo_Read_Data;
input         TRG_busy;
input  [15:0] TRG_rx_data;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output        ADC_sclk;
output        ADC_ss_n;
output [39:0] DEST_1_Fifo_Write_Data;
output        DEST_1_Fifo_Write_Enable;
output [39:0] DEST_2_Fifo_Write_Data;
output        DEST_2_Fifo_Write_Enable;
output        SRC_1_Fifo_Read_Enable;
output        SRC_2_Fifo_Read_Enable;
output        SYS_Main_Reset_N;
output [7:0]  TRG_addr;
output [15:0] TRG_data;
output        TRG_enable_cmd;
output        TRG_write_read;
//--------------------------------------------------------------------
// Inout
//--------------------------------------------------------------------
inout         ADC_sdio;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire          ADC_sclk_net_0;
wire          ADC_sdio;
wire          ADC_ss_n_net_0;
wire          ADI_SPI_0_busy;
wire   [7:0]  ADI_SPI_0_rx_data_frame;
wire          Answer_Encoder_0_CD_busy;
wire   [39:0] Answer_Encoder_0_Fifo_Write_Data;
wire          Answer_Encoder_0_Fifo_Write_Enable;
wire          Clock;
wire          CMD;
wire   [14:0] Command_Decoder_0_ADCSPI_addr_frame;
wire          Command_Decoder_0_ADCSPI_enable_cmd;
wire   [7:0]  Command_Decoder_0_ADCSPI_tx_data_frame;
wire          Command_Decoder_0_ADCSPI_write_read;
wire   [39:0] Command_Decoder_0_AE_CMD_Data;
wire          Command_Decoder_0_AE_enable_cmd;
wire          Command_Decoder_0_AE_FAULT_PROCESSED_EXECUTE;
wire          Command_Decoder_0_Fifo_Read_Enable;
wire   [15:0] Command_Decoder_0_REG_addr;
wire   [7:0]  Command_Decoder_0_REG_data;
wire   [7:0]  Command_Decoder_0_SYS_addr;
wire   [15:0] Command_Decoder_0_SYS_data;
wire          Command_Decoder_0_SYS_enable_cmd;
wire          Command_Decoder_0_SYS_write_read;
wire          Communication_ANW_MUX_0_ANW_Fifo_Read_Enable;
wire   [39:0] Communication_CMD_MUX_0_CMD_Fifo_Write_Data;
wire          Communication_CMD_MUX_0_CMD_Fifo_Write_Enable;
wire          COREFIFO_C1_0_EMPTY;
wire          COREFIFO_C1_0_FULL;
wire   [39:0] COREFIFO_C1_0_Q;
wire          COREFIFO_C3_0_EMPTY;
wire          COREFIFO_C3_0_FULL;
wire   [39:0] COREFIFO_C3_0_Q;
wire          DEST_1_Fifo_Full;
wire   [39:0] DEST_1_Fifo_Write_Data_net_0;
wire          DEST_1_Fifo_Write_Enable_net_0;
wire          DEST_2_Fifo_Full;
wire   [39:0] DEST_2_Fifo_Write_Data_net_0;
wire          DEST_2_Fifo_Write_Enable_net_0;
wire          REGISTERS_0_busy;
wire   [7:0]  REGISTERS_0_read_data_frame;
wire          Reset_N;
wire          RW;
wire          SRC_1_Fifo_Empty;
wire   [39:0] SRC_1_Fifo_Read_Data;
wire          SRC_1_Fifo_Read_Enable_net_0;
wire          SRC_2_Fifo_Empty;
wire   [39:0] SRC_2_Fifo_Read_Data;
wire          SRC_2_Fifo_Read_Enable_net_0;
wire          SYS_Main_Reset_N_net_0;
wire          System_Controler_0_busy;
wire   [15:0] System_Controler_0_read_data_frame;
wire   [7:0]  TRG_addr_net_0;
wire          TRG_busy;
wire   [15:0] TRG_data_net_0;
wire          TRG_enable_cmd_net_0;
wire   [15:0] TRG_rx_data;
wire          TRG_write_read_net_0;
wire          ADC_sclk_net_1;
wire          ADC_ss_n_net_1;
wire          SRC_1_Fifo_Read_Enable_net_1;
wire          DEST_1_Fifo_Write_Enable_net_1;
wire          DEST_2_Fifo_Write_Enable_net_1;
wire          SRC_2_Fifo_Read_Enable_net_1;
wire          TRG_enable_cmd_net_1;
wire          TRG_write_read_net_1;
wire          SYS_Main_Reset_N_net_1;
wire   [39:0] DEST_1_Fifo_Write_Data_net_1;
wire   [39:0] DEST_2_Fifo_Write_Data_net_1;
wire   [7:0]  TRG_addr_net_1;
wire   [15:0] TRG_data_net_1;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire          GND_net;
wire          VCC_net;
wire   [39:0] SRC_3_Fifo_Read_Data_const_net_0;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign GND_net                          = 1'b0;
assign VCC_net                          = 1'b1;
assign SRC_3_Fifo_Read_Data_const_net_0 = 40'h0000000000;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign ADC_sclk_net_1                 = ADC_sclk_net_0;
assign ADC_sclk                       = ADC_sclk_net_1;
assign ADC_ss_n_net_1                 = ADC_ss_n_net_0;
assign ADC_ss_n                       = ADC_ss_n_net_1;
assign SRC_1_Fifo_Read_Enable_net_1   = SRC_1_Fifo_Read_Enable_net_0;
assign SRC_1_Fifo_Read_Enable         = SRC_1_Fifo_Read_Enable_net_1;
assign DEST_1_Fifo_Write_Enable_net_1 = DEST_1_Fifo_Write_Enable_net_0;
assign DEST_1_Fifo_Write_Enable       = DEST_1_Fifo_Write_Enable_net_1;
assign DEST_2_Fifo_Write_Enable_net_1 = DEST_2_Fifo_Write_Enable_net_0;
assign DEST_2_Fifo_Write_Enable       = DEST_2_Fifo_Write_Enable_net_1;
assign SRC_2_Fifo_Read_Enable_net_1   = SRC_2_Fifo_Read_Enable_net_0;
assign SRC_2_Fifo_Read_Enable         = SRC_2_Fifo_Read_Enable_net_1;
assign TRG_enable_cmd_net_1           = TRG_enable_cmd_net_0;
assign TRG_enable_cmd                 = TRG_enable_cmd_net_1;
assign TRG_write_read_net_1           = TRG_write_read_net_0;
assign TRG_write_read                 = TRG_write_read_net_1;
assign SYS_Main_Reset_N_net_1         = SYS_Main_Reset_N_net_0;
assign SYS_Main_Reset_N               = SYS_Main_Reset_N_net_1;
assign DEST_1_Fifo_Write_Data_net_1   = DEST_1_Fifo_Write_Data_net_0;
assign DEST_1_Fifo_Write_Data[39:0]   = DEST_1_Fifo_Write_Data_net_1;
assign DEST_2_Fifo_Write_Data_net_1   = DEST_2_Fifo_Write_Data_net_0;
assign DEST_2_Fifo_Write_Data[39:0]   = DEST_2_Fifo_Write_Data_net_1;
assign TRG_addr_net_1                 = TRG_addr_net_0;
assign TRG_addr[7:0]                  = TRG_addr_net_1;
assign TRG_data_net_1                 = TRG_data_net_0;
assign TRG_data[15:0]                 = TRG_data_net_1;
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------ADI_SPI
ADI_SPI ADI_SPI_0(
        // Inputs
        .Clock         ( Clock ),
        .Reset_N       ( Reset_N ),
        .enable_cmd    ( Command_Decoder_0_ADCSPI_enable_cmd ),
        .write_read    ( Command_Decoder_0_ADCSPI_write_read ),
        .addr_frame    ( Command_Decoder_0_ADCSPI_addr_frame ),
        .tx_data_frame ( Command_Decoder_0_ADCSPI_tx_data_frame ),
        // Outputs
        .busy          ( ADI_SPI_0_busy ),
        .sclk          ( ADC_sclk_net_0 ),
        .ss_n          ( ADC_ss_n_net_0 ),
        .rx_data_frame ( ADI_SPI_0_rx_data_frame ),
        // Inouts
        .sdio          ( ADC_sdio ) 
        );

//--------Answer_Encoder
Answer_Encoder Answer_Encoder_0(
        // Inputs
        .Clock                      ( Clock ),
        .Reset_N                    ( Reset_N ),
        .Fifo_Full                  ( COREFIFO_C3_0_FULL ),
        .CD_enable_cmd              ( Command_Decoder_0_AE_enable_cmd ),
        .CD_FAULT_PROCESSED_EXECUTE ( Command_Decoder_0_AE_FAULT_PROCESSED_EXECUTE ),
        .CD_CMD_Data                ( Command_Decoder_0_AE_CMD_Data ),
        .SYS_rx_data                ( System_Controler_0_read_data_frame ),
        .REG_rx_data                ( REGISTERS_0_read_data_frame ),
        .ADCSPI_rx_data             ( ADI_SPI_0_rx_data_frame ),
        .TRG_rx_data                ( TRG_rx_data ),
        // Outputs
        .Fifo_Write_Enable          ( Answer_Encoder_0_Fifo_Write_Enable ),
        .CD_busy                    ( Answer_Encoder_0_CD_busy ),
        .Diag_Valid                 (  ),
        .Fifo_Write_Data            ( Answer_Encoder_0_Fifo_Write_Data ) 
        );

//--------Command_Decoder
Command_Decoder Command_Decoder_0(
        // Inputs
        .Clock                      ( Clock ),
        .Reset_N                    ( Reset_N ),
        .Fifo_Empty                 ( COREFIFO_C1_0_EMPTY ),
        .AE_busy                    ( Answer_Encoder_0_CD_busy ),
        .SYS_busy                   ( System_Controler_0_busy ),
        .REG_busy                   ( REGISTERS_0_busy ),
        .ADCSPI_busy                ( ADI_SPI_0_busy ),
        .TRG_busy                   ( TRG_busy ),
        .Fifo_Read_Data             ( COREFIFO_C1_0_Q ),
        // Outputs
        .Fifo_Read_Enable           ( Command_Decoder_0_Fifo_Read_Enable ),
        .AE_enable_cmd              ( Command_Decoder_0_AE_enable_cmd ),
        .AE_FAULT_PROCESSED_EXECUTE ( Command_Decoder_0_AE_FAULT_PROCESSED_EXECUTE ),
        .SYS_enable_cmd             ( Command_Decoder_0_SYS_enable_cmd ),
        .SYS_write_read             ( Command_Decoder_0_SYS_write_read ),
        .REG_enable_cmd             ( CMD ),
        .REG_write_read             ( RW ),
        .ADCSPI_enable_cmd          ( Command_Decoder_0_ADCSPI_enable_cmd ),
        .ADCSPI_write_read          ( Command_Decoder_0_ADCSPI_write_read ),
        .TRG_enable_cmd             ( TRG_enable_cmd_net_0 ),
        .TRG_write_read             ( TRG_write_read_net_0 ),
        .Diag_Valid                 (  ),
        .AE_CMD_Data                ( Command_Decoder_0_AE_CMD_Data ),
        .SYS_addr                   ( Command_Decoder_0_SYS_addr ),
        .SYS_data                   ( Command_Decoder_0_SYS_data ),
        .REG_addr                   ( Command_Decoder_0_REG_addr ),
        .REG_data                   ( Command_Decoder_0_REG_data ),
        .ADCSPI_addr_frame          ( Command_Decoder_0_ADCSPI_addr_frame ),
        .ADCSPI_tx_data_frame       ( Command_Decoder_0_ADCSPI_tx_data_frame ),
        .TRG_addr                   ( TRG_addr_net_0 ),
        .TRG_data                   ( TRG_data_net_0 ) 
        );

//--------Communication_ANW_MUX
Communication_ANW_MUX Communication_ANW_MUX_0(
        // Inputs
        .Clock                    ( Clock ),
        .Reset_N                  ( Reset_N ),
        .DEST_1_Fifo_Full         ( DEST_1_Fifo_Full ),
        .DEST_2_Fifo_Full         ( DEST_2_Fifo_Full ),
        .DEST_3_Fifo_Full         ( GND_net ),
        .ANW_Fifo_Empty           ( COREFIFO_C3_0_EMPTY ),
        .ANW_Fifo_Read_Data       ( COREFIFO_C3_0_Q ),
        // Outputs
        .DEST_1_Fifo_Write_Enable ( DEST_1_Fifo_Write_Enable_net_0 ),
        .DEST_2_Fifo_Write_Enable ( DEST_2_Fifo_Write_Enable_net_0 ),
        .DEST_3_Fifo_Write_Enable (  ),
        .ANW_Fifo_Read_Enable     ( Communication_ANW_MUX_0_ANW_Fifo_Read_Enable ),
        .Diag_Valid               (  ),
        .DEST_1_Fifo_Write_Data   ( DEST_1_Fifo_Write_Data_net_0 ),
        .DEST_2_Fifo_Write_Data   ( DEST_2_Fifo_Write_Data_net_0 ),
        .DEST_3_Fifo_Write_Data   (  ) 
        );

//--------Communication_CMD_MUX
Communication_CMD_MUX Communication_CMD_MUX_0(
        // Inputs
        .Clock                  ( Clock ),
        .Reset_N                ( Reset_N ),
        .SRC_1_Fifo_Empty       ( SRC_1_Fifo_Empty ),
        .SRC_2_Fifo_Empty       ( SRC_2_Fifo_Empty ),
        .SRC_3_Fifo_Empty       ( VCC_net ),
        .CMD_Fifo_Full          ( COREFIFO_C1_0_FULL ),
        .SRC_1_Fifo_Read_Data   ( SRC_1_Fifo_Read_Data ),
        .SRC_2_Fifo_Read_Data   ( SRC_2_Fifo_Read_Data ),
        .SRC_3_Fifo_Read_Data   ( SRC_3_Fifo_Read_Data_const_net_0 ),
        // Outputs
        .SRC_1_Fifo_Read_Enable ( SRC_1_Fifo_Read_Enable_net_0 ),
        .SRC_2_Fifo_Read_Enable ( SRC_2_Fifo_Read_Enable_net_0 ),
        .SRC_3_Fifo_Read_Enable (  ),
        .CMD_Fifo_Write_Enable  ( Communication_CMD_MUX_0_CMD_Fifo_Write_Enable ),
        .Diag_Valid             (  ),
        .CMD_Fifo_Write_Data    ( Communication_CMD_MUX_0_CMD_Fifo_Write_Data ) 
        );

//--------COREFIFO_C1
COREFIFO_C1 COREFIFO_C1_0(
        // Inputs
        .CLK     ( Clock ),
        .RESET_N ( Reset_N ),
        .WE      ( Communication_CMD_MUX_0_CMD_Fifo_Write_Enable ),
        .RE      ( Command_Decoder_0_Fifo_Read_Enable ),
        .DATA    ( Communication_CMD_MUX_0_CMD_Fifo_Write_Data ),
        // Outputs
        .FULL    ( COREFIFO_C1_0_FULL ),
        .EMPTY   ( COREFIFO_C1_0_EMPTY ),
        .Q       ( COREFIFO_C1_0_Q ) 
        );

//--------COREFIFO_C3
COREFIFO_C3 COREFIFO_C3_0(
        // Inputs
        .CLK     ( Clock ),
        .RESET_N ( Reset_N ),
        .WE      ( Answer_Encoder_0_Fifo_Write_Enable ),
        .RE      ( Communication_ANW_MUX_0_ANW_Fifo_Read_Enable ),
        .DATA    ( Answer_Encoder_0_Fifo_Write_Data ),
        // Outputs
        .FULL    ( COREFIFO_C3_0_FULL ),
        .EMPTY   ( COREFIFO_C3_0_EMPTY ),
        .Q       ( COREFIFO_C3_0_Q ) 
        );

//--------REGISTERS
REGISTERS REGISTERS_0(
        // Inputs
        .Clock            ( Clock ),
        .Reset_N          ( Reset_N ),
        .enable_cmd       ( CMD ),
        .write_read       ( RW ),
        .addr_frame       ( Command_Decoder_0_REG_addr ),
        .write_data_frame ( Command_Decoder_0_REG_data ),
        // Outputs
        .busy             ( REGISTERS_0_busy ),
        .Diag_Valid       (  ),
        .read_data_frame  ( REGISTERS_0_read_data_frame ) 
        );

//--------System_Controler
System_Controler System_Controler_0(
        // Inputs
        .Clock            ( Clock ),
        .Reset_N          ( Reset_N ),
        .enable_cmd       ( Command_Decoder_0_SYS_enable_cmd ),
        .write_read       ( Command_Decoder_0_SYS_write_read ),
        .addr_frame       ( Command_Decoder_0_SYS_addr ),
        .write_data_frame ( Command_Decoder_0_SYS_data ),
        // Outputs
        .busy             ( System_Controler_0_busy ),
        .SYS_Main_Reset_N ( SYS_Main_Reset_N_net_0 ),
        .Diag_Valid       (  ),
        .read_data_frame  ( System_Controler_0_read_data_frame ) 
        );


endmodule
