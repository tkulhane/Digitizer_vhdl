//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Mon Aug 21 14:41:40 2023
// Version: 2022.1 2022.1.0.10
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// Controler
module Controler(
    // Inputs
    ADC_FD,
    ADC_GPIO_0,
    ADC_GPIO_1,
    ADC_GPIO_2,
    ADC_GPIO_3,
    ADC_GPIO_4,
    ADC_LDO_PWR_GOOD,
    BTN,
    COMSW_busy,
    COMSW_rx_data,
    Clock,
    DEST_1_Fifo_Full,
    DEST_2_Fifo_Full,
    DEST_3_Fifo_Full,
    HMC_GPIO_0,
    HMC_GPIO_1,
    HMC_GPIO_2,
    HMC_GPIO_3,
    LANE_VAL,
    LDO_PWR_GOOD,
    LMX1_miso,
    LMX2_miso,
    Reset_N,
    SMPS_PWR_GOOD,
    SRC_1_Fifo_Empty,
    SRC_1_Fifo_Read_Data,
    SRC_2_Fifo_Empty,
    SRC_2_Fifo_Read_Data,
    SRC_3_Fifo_Empty,
    SRC_3_Fifo_Read_Data,
    SYNC_Input,
    TRG_busy,
    TRG_rx_data,
    // Outputs
    ADC_PWDN,
    ADC_PWR_RUN,
    ADC_sclk,
    ADC_ss_n,
    BOARD_PWR_RUN,
    COMSW_addr,
    COMSW_data,
    COMSW_enable_cmd,
    COMSW_write_read,
    DEST_1_Fifo_Write_Data,
    DEST_1_Fifo_Write_Enable,
    DEST_2_Fifo_Write_Data,
    DEST_2_Fifo_Write_Enable,
    DEST_3_Fifo_Write_Data,
    DEST_3_Fifo_Write_Enable,
    EXT_ADC_Reset_N,
    EXT_HMC_Reset_N,
    EXT_LMX1_Reset_N,
    EXT_LMX2_Reset_N,
    GPIO_0,
    GPIO_1,
    HMC_SYNC,
    HMC_sclk,
    HMC_ss_n,
    INT_DataFifo_Reset_N,
    INT_FtdiReset_N,
    LED_2,
    LED_3,
    LMX1_mosi,
    LMX1_sclk,
    LMX1_ss_n,
    LMX2_mosi,
    LMX2_sclk,
    LMX2_ss_n,
    SRC_1_Fifo_Read_Enable,
    SRC_2_Fifo_Read_Enable,
    SRC_3_Fifo_Read_Enable,
    SYNC_OUT_1,
    SYNC_OUT_2,
    SYS_Main_Reset_N,
    TRG_addr,
    TRG_data,
    TRG_enable_cmd,
    TRG_write_read,
    // Inouts
    ADC_sdio,
    HMC_sdio
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input         ADC_FD;
input         ADC_GPIO_0;
input         ADC_GPIO_1;
input         ADC_GPIO_2;
input         ADC_GPIO_3;
input         ADC_GPIO_4;
input         ADC_LDO_PWR_GOOD;
input         BTN;
input         COMSW_busy;
input  [15:0] COMSW_rx_data;
input         Clock;
input         DEST_1_Fifo_Full;
input         DEST_2_Fifo_Full;
input         DEST_3_Fifo_Full;
input         HMC_GPIO_0;
input         HMC_GPIO_1;
input         HMC_GPIO_2;
input         HMC_GPIO_3;
input         LANE_VAL;
input         LDO_PWR_GOOD;
input         LMX1_miso;
input         LMX2_miso;
input         Reset_N;
input         SMPS_PWR_GOOD;
input         SRC_1_Fifo_Empty;
input  [39:0] SRC_1_Fifo_Read_Data;
input         SRC_2_Fifo_Empty;
input  [39:0] SRC_2_Fifo_Read_Data;
input         SRC_3_Fifo_Empty;
input  [39:0] SRC_3_Fifo_Read_Data;
input         SYNC_Input;
input         TRG_busy;
input  [15:0] TRG_rx_data;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output        ADC_PWDN;
output        ADC_PWR_RUN;
output        ADC_sclk;
output        ADC_ss_n;
output        BOARD_PWR_RUN;
output [7:0]  COMSW_addr;
output [15:0] COMSW_data;
output        COMSW_enable_cmd;
output        COMSW_write_read;
output [39:0] DEST_1_Fifo_Write_Data;
output        DEST_1_Fifo_Write_Enable;
output [39:0] DEST_2_Fifo_Write_Data;
output        DEST_2_Fifo_Write_Enable;
output [39:0] DEST_3_Fifo_Write_Data;
output        DEST_3_Fifo_Write_Enable;
output        EXT_ADC_Reset_N;
output        EXT_HMC_Reset_N;
output        EXT_LMX1_Reset_N;
output        EXT_LMX2_Reset_N;
output        GPIO_0;
output        GPIO_1;
output        HMC_SYNC;
output        HMC_sclk;
output        HMC_ss_n;
output        INT_DataFifo_Reset_N;
output        INT_FtdiReset_N;
output        LED_2;
output        LED_3;
output        LMX1_mosi;
output        LMX1_sclk;
output        LMX1_ss_n;
output        LMX2_mosi;
output        LMX2_sclk;
output        LMX2_ss_n;
output        SRC_1_Fifo_Read_Enable;
output        SRC_2_Fifo_Read_Enable;
output        SRC_3_Fifo_Read_Enable;
output        SYNC_OUT_1;
output        SYNC_OUT_2;
output        SYS_Main_Reset_N;
output [7:0]  TRG_addr;
output [15:0] TRG_data;
output        TRG_enable_cmd;
output        TRG_write_read;
//--------------------------------------------------------------------
// Inout
//--------------------------------------------------------------------
inout         ADC_sdio;
inout         HMC_sdio;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire           ADC_FD;
wire           ADC_GPIO_0;
wire           ADC_GPIO_1;
wire           ADC_GPIO_2;
wire           ADC_GPIO_3;
wire           ADC_GPIO_4;
wire           ADC_LDO_PWR_GOOD;
wire   [0:0]   ADC_PWDN_net_0;
wire   [7:7]   ADC_PWR_RUN_net_0;
wire           ADC_sclk_net_0;
wire           ADC_sdio;
wire           ADC_ss_n_net_0;
wire           ADI_SPI_0_0_busy;
wire   [7:0]   ADI_SPI_0_0_rx_data_frame;
wire           ADI_SPI_0_busy;
wire   [7:0]   ADI_SPI_0_rx_data_frame;
wire           Answer_Encoder_0_CD_busy;
wire   [39:0]  Answer_Encoder_0_Fifo_Write_Data;
wire           Answer_Encoder_0_Fifo_Write_Enable;
wire   [6:6]   BOARD_PWR_RUN_net_0;
wire           BTN;
wire           Clock;
wire           CMD;
wire   [14:0]  Command_Decoder_0_ADCSPI_addr_frame;
wire           Command_Decoder_0_ADCSPI_enable_cmd;
wire   [7:0]   Command_Decoder_0_ADCSPI_tx_data_frame;
wire           Command_Decoder_0_ADCSPI_write_read;
wire   [39:0]  Command_Decoder_0_AE_CMD_Data;
wire           Command_Decoder_0_AE_enable_cmd;
wire           Command_Decoder_0_AE_FAULT_PROCESSED_EXECUTE;
wire           Command_Decoder_0_Fifo_Read_Enable;
wire   [7:0]   Command_Decoder_0_GPIO_addr;
wire   [15:0]  Command_Decoder_0_GPIO_data;
wire           Command_Decoder_0_GPIO_enable_cmd;
wire           Command_Decoder_0_GPIO_write_read;
wire   [14:0]  Command_Decoder_0_HMCSPI_addr_frame;
wire           Command_Decoder_0_HMCSPI_enable_cmd;
wire   [7:0]   Command_Decoder_0_HMCSPI_tx_data_frame;
wire           Command_Decoder_0_HMCSPI_write_read;
wire   [6:0]   Command_Decoder_0_LMX1SPI_addr_frame;
wire           Command_Decoder_0_LMX1SPI_enable_cmd;
wire   [15:0]  Command_Decoder_0_LMX1SPI_tx_data_frame;
wire           Command_Decoder_0_LMX1SPI_write_read;
wire   [6:0]   Command_Decoder_0_LMX2SPI_addr_frame;
wire           Command_Decoder_0_LMX2SPI_enable_cmd;
wire   [15:0]  Command_Decoder_0_LMX2SPI_tx_data_frame;
wire           Command_Decoder_0_LMX2SPI_write_read;
wire   [15:0]  Command_Decoder_0_REG_addr;
wire   [7:0]   Command_Decoder_0_REG_data;
wire   [7:0]   Command_Decoder_0_RST_addr;
wire   [15:0]  Command_Decoder_0_RST_data;
wire           Command_Decoder_0_RST_enable_cmd;
wire           Command_Decoder_0_RST_write_read;
wire           Communication_ANW_MUX_0_ANW_Fifo_Read_Enable;
wire   [39:0]  Communication_CMD_MUX_0_CMD_Fifo_Write_Data;
wire           Communication_CMD_MUX_0_CMD_Fifo_Write_Enable;
wire   [7:0]   COMSW_addr_net_0;
wire           COMSW_busy;
wire   [15:0]  COMSW_data_net_0;
wire           COMSW_enable_cmd_net_0;
wire   [15:0]  COMSW_rx_data;
wire           COMSW_write_read_net_0;
wire           COREFIFO_C1_0_EMPTY;
wire           COREFIFO_C1_0_FULL;
wire   [39:0]  COREFIFO_C1_0_Q;
wire           COREFIFO_C3_0_EMPTY;
wire           COREFIFO_C3_0_FULL;
wire   [39:0]  COREFIFO_C3_0_Q;
wire           DEST_1_Fifo_Full;
wire   [39:0]  DEST_1_Fifo_Write_Data_net_0;
wire           DEST_1_Fifo_Write_Enable_net_0;
wire           DEST_2_Fifo_Full;
wire   [39:0]  DEST_2_Fifo_Write_Data_net_0;
wire           DEST_2_Fifo_Write_Enable_net_0;
wire           DEST_3_Fifo_Full;
wire   [39:0]  DEST_3_Fifo_Write_Data_net_0;
wire           DEST_3_Fifo_Write_Enable_net_0;
wire           EXT_ADC_Reset_N_net_0;
wire           EXT_HMC_Reset_N_net_0;
wire           EXT_LMX1_Reset_N_net_0;
wire           EXT_LMX2_Reset_N_net_0;
wire   [12:12] GPIO_0_net_0;
wire   [13:13] GPIO_1_net_0;
wire           gpio_controler_0_busy;
wire   [15:0]  gpio_controler_0_read_data_frame;
wire           HMC_GPIO_0;
wire           HMC_GPIO_1;
wire           HMC_GPIO_2;
wire           HMC_GPIO_3;
wire           HMC_sclk_net_0;
wire           HMC_sdio;
wire           HMC_ss_n_net_0;
wire   [1:1]   HMC_SYNC_net_0;
wire           INT_DataFifo_Reset_N_net_0;
wire           INT_FtdiReset_N_net_0;
wire           LANE_VAL;
wire           LDO_PWR_GOOD;
wire   [14:14] LED_2_net_0;
wire   [15:15] LED_3_net_0;
wire           LMX1_miso;
wire           LMX1_mosi_net_0;
wire           LMX1_sclk_net_0;
wire           LMX1_ss_n_net_0;
wire           LMX2_miso;
wire           LMX2_mosi_net_0;
wire           LMX2_sclk_net_0;
wire           LMX2_ss_n_net_0;
wire           REGISTERS_0_busy;
wire   [7:0]   REGISTERS_0_read_data_frame;
wire           Reset_Controler_0_busy;
wire   [15:0]  Reset_Controler_0_read_data_frame;
wire           Reset_N;
wire           RW;
wire           SMPS_PWR_GOOD;
wire           SPI_LMX_0_0_busy;
wire   [15:0]  SPI_LMX_0_0_rx_data_frame;
wire           SPI_LMX_0_busy;
wire   [15:0]  SPI_LMX_0_rx_data_frame;
wire           SRC_1_Fifo_Empty;
wire   [39:0]  SRC_1_Fifo_Read_Data;
wire           SRC_1_Fifo_Read_Enable_net_0;
wire           SRC_2_Fifo_Empty;
wire   [39:0]  SRC_2_Fifo_Read_Data;
wire           SRC_2_Fifo_Read_Enable_net_0;
wire           SRC_3_Fifo_Empty;
wire   [39:0]  SRC_3_Fifo_Read_Data;
wire           SRC_3_Fifo_Read_Enable_net_0;
wire           SYNC_Input;
wire   [2:2]   SYNC_OUT_1_net_0;
wire   [3:3]   SYNC_OUT_2_net_0;
wire           SYS_Main_Reset_N_net_0;
wire   [7:0]   TRG_addr_net_0;
wire           TRG_busy;
wire   [15:0]  TRG_data_net_0;
wire           TRG_enable_cmd_net_0;
wire   [15:0]  TRG_rx_data;
wire           TRG_write_read_net_0;
wire           ADC_sclk_net_1;
wire           ADC_ss_n_net_1;
wire           SRC_1_Fifo_Read_Enable_net_1;
wire           DEST_1_Fifo_Write_Enable_net_1;
wire           DEST_2_Fifo_Write_Enable_net_1;
wire           SRC_2_Fifo_Read_Enable_net_1;
wire           TRG_enable_cmd_net_1;
wire           TRG_write_read_net_1;
wire           SYS_Main_Reset_N_net_1;
wire           HMC_sclk_net_1;
wire           HMC_ss_n_net_1;
wire           LMX1_ss_n_net_1;
wire           LMX1_mosi_net_1;
wire           LMX1_sclk_net_1;
wire           LMX2_ss_n_net_1;
wire           LMX2_mosi_net_1;
wire           LMX2_sclk_net_1;
wire           SRC_3_Fifo_Read_Enable_net_1;
wire           DEST_3_Fifo_Write_Enable_net_1;
wire           EXT_ADC_Reset_N_net_1;
wire           EXT_HMC_Reset_N_net_1;
wire           EXT_LMX2_Reset_N_net_1;
wire           EXT_LMX1_Reset_N_net_1;
wire           INT_DataFifo_Reset_N_net_1;
wire           ADC_PWDN_net_1;
wire           HMC_SYNC_net_1;
wire           ADC_PWR_RUN_net_1;
wire           BOARD_PWR_RUN_net_1;
wire           LED_2_net_1;
wire           LED_3_net_1;
wire           GPIO_0_net_1;
wire           GPIO_1_net_1;
wire           SYNC_OUT_1_net_1;
wire           SYNC_OUT_2_net_1;
wire           COMSW_enable_cmd_net_1;
wire           COMSW_write_read_net_1;
wire           INT_FtdiReset_N_net_1;
wire   [39:0]  DEST_1_Fifo_Write_Data_net_1;
wire   [39:0]  DEST_2_Fifo_Write_Data_net_1;
wire   [7:0]   TRG_addr_net_1;
wire   [15:0]  TRG_data_net_1;
wire   [39:0]  DEST_3_Fifo_Write_Data_net_1;
wire   [7:0]   COMSW_addr_net_1;
wire   [15:0]  COMSW_data_net_1;
wire   [10:10] Outputs_slice_0;
wire   [11:11] Outputs_slice_1;
wire   [4:4]   Outputs_slice_2;
wire   [5:5]   Outputs_slice_3;
wire   [8:8]   Outputs_slice_4;
wire   [9:9]   Outputs_slice_5;
wire   [15:0]  Inputs_net_0;
wire   [15:0]  Outputs_net_0;
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
assign HMC_sclk_net_1                 = HMC_sclk_net_0;
assign HMC_sclk                       = HMC_sclk_net_1;
assign HMC_ss_n_net_1                 = HMC_ss_n_net_0;
assign HMC_ss_n                       = HMC_ss_n_net_1;
assign LMX1_ss_n_net_1                = LMX1_ss_n_net_0;
assign LMX1_ss_n                      = LMX1_ss_n_net_1;
assign LMX1_mosi_net_1                = LMX1_mosi_net_0;
assign LMX1_mosi                      = LMX1_mosi_net_1;
assign LMX1_sclk_net_1                = LMX1_sclk_net_0;
assign LMX1_sclk                      = LMX1_sclk_net_1;
assign LMX2_ss_n_net_1                = LMX2_ss_n_net_0;
assign LMX2_ss_n                      = LMX2_ss_n_net_1;
assign LMX2_mosi_net_1                = LMX2_mosi_net_0;
assign LMX2_mosi                      = LMX2_mosi_net_1;
assign LMX2_sclk_net_1                = LMX2_sclk_net_0;
assign LMX2_sclk                      = LMX2_sclk_net_1;
assign SRC_3_Fifo_Read_Enable_net_1   = SRC_3_Fifo_Read_Enable_net_0;
assign SRC_3_Fifo_Read_Enable         = SRC_3_Fifo_Read_Enable_net_1;
assign DEST_3_Fifo_Write_Enable_net_1 = DEST_3_Fifo_Write_Enable_net_0;
assign DEST_3_Fifo_Write_Enable       = DEST_3_Fifo_Write_Enable_net_1;
assign EXT_ADC_Reset_N_net_1          = EXT_ADC_Reset_N_net_0;
assign EXT_ADC_Reset_N                = EXT_ADC_Reset_N_net_1;
assign EXT_HMC_Reset_N_net_1          = EXT_HMC_Reset_N_net_0;
assign EXT_HMC_Reset_N                = EXT_HMC_Reset_N_net_1;
assign EXT_LMX2_Reset_N_net_1         = EXT_LMX2_Reset_N_net_0;
assign EXT_LMX2_Reset_N               = EXT_LMX2_Reset_N_net_1;
assign EXT_LMX1_Reset_N_net_1         = EXT_LMX1_Reset_N_net_0;
assign EXT_LMX1_Reset_N               = EXT_LMX1_Reset_N_net_1;
assign INT_DataFifo_Reset_N_net_1     = INT_DataFifo_Reset_N_net_0;
assign INT_DataFifo_Reset_N           = INT_DataFifo_Reset_N_net_1;
assign ADC_PWDN_net_1                 = ADC_PWDN_net_0[0];
assign ADC_PWDN                       = ADC_PWDN_net_1;
assign HMC_SYNC_net_1                 = HMC_SYNC_net_0[1];
assign HMC_SYNC                       = HMC_SYNC_net_1;
assign ADC_PWR_RUN_net_1              = ADC_PWR_RUN_net_0[7];
assign ADC_PWR_RUN                    = ADC_PWR_RUN_net_1;
assign BOARD_PWR_RUN_net_1            = BOARD_PWR_RUN_net_0[6];
assign BOARD_PWR_RUN                  = BOARD_PWR_RUN_net_1;
assign LED_2_net_1                    = LED_2_net_0[14];
assign LED_2                          = LED_2_net_1;
assign LED_3_net_1                    = LED_3_net_0[15];
assign LED_3                          = LED_3_net_1;
assign GPIO_0_net_1                   = GPIO_0_net_0[12];
assign GPIO_0                         = GPIO_0_net_1;
assign GPIO_1_net_1                   = GPIO_1_net_0[13];
assign GPIO_1                         = GPIO_1_net_1;
assign SYNC_OUT_1_net_1               = SYNC_OUT_1_net_0[2];
assign SYNC_OUT_1                     = SYNC_OUT_1_net_1;
assign SYNC_OUT_2_net_1               = SYNC_OUT_2_net_0[3];
assign SYNC_OUT_2                     = SYNC_OUT_2_net_1;
assign COMSW_enable_cmd_net_1         = COMSW_enable_cmd_net_0;
assign COMSW_enable_cmd               = COMSW_enable_cmd_net_1;
assign COMSW_write_read_net_1         = COMSW_write_read_net_0;
assign COMSW_write_read               = COMSW_write_read_net_1;
assign INT_FtdiReset_N_net_1          = INT_FtdiReset_N_net_0;
assign INT_FtdiReset_N                = INT_FtdiReset_N_net_1;
assign DEST_1_Fifo_Write_Data_net_1   = DEST_1_Fifo_Write_Data_net_0;
assign DEST_1_Fifo_Write_Data[39:0]   = DEST_1_Fifo_Write_Data_net_1;
assign DEST_2_Fifo_Write_Data_net_1   = DEST_2_Fifo_Write_Data_net_0;
assign DEST_2_Fifo_Write_Data[39:0]   = DEST_2_Fifo_Write_Data_net_1;
assign TRG_addr_net_1                 = TRG_addr_net_0;
assign TRG_addr[7:0]                  = TRG_addr_net_1;
assign TRG_data_net_1                 = TRG_data_net_0;
assign TRG_data[15:0]                 = TRG_data_net_1;
assign DEST_3_Fifo_Write_Data_net_1   = DEST_3_Fifo_Write_Data_net_0;
assign DEST_3_Fifo_Write_Data[39:0]   = DEST_3_Fifo_Write_Data_net_1;
assign COMSW_addr_net_1               = COMSW_addr_net_0;
assign COMSW_addr[7:0]                = COMSW_addr_net_1;
assign COMSW_data_net_1               = COMSW_data_net_0;
assign COMSW_data[15:0]               = COMSW_data_net_1;
//--------------------------------------------------------------------
// Slices assignments
//--------------------------------------------------------------------
assign ADC_PWDN_net_0[0]      = Outputs_net_0[0:0];
assign ADC_PWR_RUN_net_0[7]   = Outputs_net_0[7:7];
assign BOARD_PWR_RUN_net_0[6] = Outputs_net_0[6:6];
assign GPIO_0_net_0[12]       = Outputs_net_0[12:12];
assign GPIO_1_net_0[13]       = Outputs_net_0[13:13];
assign HMC_SYNC_net_0[1]      = Outputs_net_0[1:1];
assign LED_2_net_0[14]        = Outputs_net_0[14:14];
assign LED_3_net_0[15]        = Outputs_net_0[15:15];
assign SYNC_OUT_1_net_0[2]    = Outputs_net_0[2:2];
assign SYNC_OUT_2_net_0[3]    = Outputs_net_0[3:3];
assign Outputs_slice_0[10]    = Outputs_net_0[10:10];
assign Outputs_slice_1[11]    = Outputs_net_0[11:11];
assign Outputs_slice_2[4]     = Outputs_net_0[4:4];
assign Outputs_slice_3[5]     = Outputs_net_0[5:5];
assign Outputs_slice_4[8]     = Outputs_net_0[8:8];
assign Outputs_slice_5[9]     = Outputs_net_0[9:9];
//--------------------------------------------------------------------
// Concatenation assignments
//--------------------------------------------------------------------
assign Inputs_net_0 = { LANE_VAL , SYNC_Input , ADC_LDO_PWR_GOOD , LDO_PWR_GOOD , SMPS_PWR_GOOD , HMC_GPIO_3 , HMC_GPIO_2 , HMC_GPIO_1 , HMC_GPIO_0 , ADC_FD , ADC_GPIO_4 , ADC_GPIO_3 , ADC_GPIO_2 , ADC_GPIO_1 , ADC_GPIO_0 , BTN };
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

//--------ADI_SPI
ADI_SPI ADI_SPI_1(
        // Inputs
        .Clock         ( Clock ),
        .Reset_N       ( Reset_N ),
        .enable_cmd    ( Command_Decoder_0_HMCSPI_enable_cmd ),
        .write_read    ( Command_Decoder_0_HMCSPI_write_read ),
        .addr_frame    ( Command_Decoder_0_HMCSPI_addr_frame ),
        .tx_data_frame ( Command_Decoder_0_HMCSPI_tx_data_frame ),
        // Outputs
        .busy          ( ADI_SPI_0_0_busy ),
        .sclk          ( HMC_sclk_net_0 ),
        .ss_n          ( HMC_ss_n_net_0 ),
        .rx_data_frame ( ADI_SPI_0_0_rx_data_frame ),
        // Inouts
        .sdio          ( HMC_sdio ) 
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
        .RST_rx_data                ( Reset_Controler_0_read_data_frame ),
        .REG_rx_data                ( REGISTERS_0_read_data_frame ),
        .ADCSPI_rx_data             ( ADI_SPI_0_rx_data_frame ),
        .HMCSPI_rx_data             ( ADI_SPI_0_0_rx_data_frame ),
        .LMX1SPI_rx_data            ( SPI_LMX_0_rx_data_frame ),
        .LMX2SPI_rx_data            ( SPI_LMX_0_0_rx_data_frame ),
        .TRG_rx_data                ( TRG_rx_data ),
        .GPIO_rx_data               ( gpio_controler_0_read_data_frame ),
        .COMSW_rx_data              ( COMSW_rx_data ),
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
        .RST_busy                   ( Reset_Controler_0_busy ),
        .REG_busy                   ( REGISTERS_0_busy ),
        .ADCSPI_busy                ( ADI_SPI_0_busy ),
        .HMCSPI_busy                ( ADI_SPI_0_0_busy ),
        .LMX1SPI_busy               ( SPI_LMX_0_busy ),
        .LMX2SPI_busy               ( SPI_LMX_0_0_busy ),
        .TRG_busy                   ( TRG_busy ),
        .GPIO_busy                  ( gpio_controler_0_busy ),
        .COMSW_busy                 ( COMSW_busy ),
        .Fifo_Read_Data             ( COREFIFO_C1_0_Q ),
        // Outputs
        .Fifo_Read_Enable           ( Command_Decoder_0_Fifo_Read_Enable ),
        .AE_enable_cmd              ( Command_Decoder_0_AE_enable_cmd ),
        .AE_FAULT_PROCESSED_EXECUTE ( Command_Decoder_0_AE_FAULT_PROCESSED_EXECUTE ),
        .RST_enable_cmd             ( Command_Decoder_0_RST_enable_cmd ),
        .RST_write_read             ( Command_Decoder_0_RST_write_read ),
        .REG_enable_cmd             ( CMD ),
        .REG_write_read             ( RW ),
        .ADCSPI_enable_cmd          ( Command_Decoder_0_ADCSPI_enable_cmd ),
        .ADCSPI_write_read          ( Command_Decoder_0_ADCSPI_write_read ),
        .HMCSPI_enable_cmd          ( Command_Decoder_0_HMCSPI_enable_cmd ),
        .HMCSPI_write_read          ( Command_Decoder_0_HMCSPI_write_read ),
        .LMX1SPI_enable_cmd         ( Command_Decoder_0_LMX1SPI_enable_cmd ),
        .LMX1SPI_write_read         ( Command_Decoder_0_LMX1SPI_write_read ),
        .LMX2SPI_enable_cmd         ( Command_Decoder_0_LMX2SPI_enable_cmd ),
        .LMX2SPI_write_read         ( Command_Decoder_0_LMX2SPI_write_read ),
        .TRG_enable_cmd             ( TRG_enable_cmd_net_0 ),
        .TRG_write_read             ( TRG_write_read_net_0 ),
        .GPIO_enable_cmd            ( Command_Decoder_0_GPIO_enable_cmd ),
        .GPIO_write_read            ( Command_Decoder_0_GPIO_write_read ),
        .COMSW_enable_cmd           ( COMSW_enable_cmd_net_0 ),
        .COMSW_write_read           ( COMSW_write_read_net_0 ),
        .Diag_Valid                 (  ),
        .AE_CMD_Data                ( Command_Decoder_0_AE_CMD_Data ),
        .RST_addr                   ( Command_Decoder_0_RST_addr ),
        .RST_data                   ( Command_Decoder_0_RST_data ),
        .REG_addr                   ( Command_Decoder_0_REG_addr ),
        .REG_data                   ( Command_Decoder_0_REG_data ),
        .ADCSPI_addr_frame          ( Command_Decoder_0_ADCSPI_addr_frame ),
        .ADCSPI_tx_data_frame       ( Command_Decoder_0_ADCSPI_tx_data_frame ),
        .HMCSPI_addr_frame          ( Command_Decoder_0_HMCSPI_addr_frame ),
        .HMCSPI_tx_data_frame       ( Command_Decoder_0_HMCSPI_tx_data_frame ),
        .LMX1SPI_addr_frame         ( Command_Decoder_0_LMX1SPI_addr_frame ),
        .LMX1SPI_tx_data_frame      ( Command_Decoder_0_LMX1SPI_tx_data_frame ),
        .LMX2SPI_addr_frame         ( Command_Decoder_0_LMX2SPI_addr_frame ),
        .LMX2SPI_tx_data_frame      ( Command_Decoder_0_LMX2SPI_tx_data_frame ),
        .TRG_addr                   ( TRG_addr_net_0 ),
        .TRG_data                   ( TRG_data_net_0 ),
        .GPIO_addr                  ( Command_Decoder_0_GPIO_addr ),
        .GPIO_data                  ( Command_Decoder_0_GPIO_data ),
        .COMSW_addr                 ( COMSW_addr_net_0 ),
        .COMSW_data                 ( COMSW_data_net_0 ) 
        );

//--------Communication_ANW_MUX
Communication_ANW_MUX Communication_ANW_MUX_0(
        // Inputs
        .Clock                    ( Clock ),
        .Reset_N                  ( Reset_N ),
        .DEST_1_Fifo_Full         ( DEST_1_Fifo_Full ),
        .DEST_2_Fifo_Full         ( DEST_2_Fifo_Full ),
        .DEST_3_Fifo_Full         ( DEST_3_Fifo_Full ),
        .ANW_Fifo_Empty           ( COREFIFO_C3_0_EMPTY ),
        .ANW_Fifo_Read_Data       ( COREFIFO_C3_0_Q ),
        // Outputs
        .DEST_1_Fifo_Write_Enable ( DEST_1_Fifo_Write_Enable_net_0 ),
        .DEST_2_Fifo_Write_Enable ( DEST_2_Fifo_Write_Enable_net_0 ),
        .DEST_3_Fifo_Write_Enable ( DEST_3_Fifo_Write_Enable_net_0 ),
        .ANW_Fifo_Read_Enable     ( Communication_ANW_MUX_0_ANW_Fifo_Read_Enable ),
        .Diag_Valid               (  ),
        .DEST_1_Fifo_Write_Data   ( DEST_1_Fifo_Write_Data_net_0 ),
        .DEST_2_Fifo_Write_Data   ( DEST_2_Fifo_Write_Data_net_0 ),
        .DEST_3_Fifo_Write_Data   ( DEST_3_Fifo_Write_Data_net_0 ) 
        );

//--------Communication_CMD_MUX
Communication_CMD_MUX Communication_CMD_MUX_0(
        // Inputs
        .Clock                  ( Clock ),
        .Reset_N                ( Reset_N ),
        .SRC_1_Fifo_Empty       ( SRC_1_Fifo_Empty ),
        .SRC_2_Fifo_Empty       ( SRC_2_Fifo_Empty ),
        .SRC_3_Fifo_Empty       ( SRC_3_Fifo_Empty ),
        .CMD_Fifo_Full          ( COREFIFO_C1_0_FULL ),
        .SRC_1_Fifo_Read_Data   ( SRC_1_Fifo_Read_Data ),
        .SRC_2_Fifo_Read_Data   ( SRC_2_Fifo_Read_Data ),
        .SRC_3_Fifo_Read_Data   ( SRC_3_Fifo_Read_Data ),
        // Outputs
        .SRC_1_Fifo_Read_Enable ( SRC_1_Fifo_Read_Enable_net_0 ),
        .SRC_2_Fifo_Read_Enable ( SRC_2_Fifo_Read_Enable_net_0 ),
        .SRC_3_Fifo_Read_Enable ( SRC_3_Fifo_Read_Enable_net_0 ),
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

//--------gpio_controler
gpio_controler gpio_controler_0(
        // Inputs
        .Clock            ( Clock ),
        .Reset_N          ( Reset_N ),
        .enable_cmd       ( Command_Decoder_0_GPIO_enable_cmd ),
        .write_read       ( Command_Decoder_0_GPIO_write_read ),
        .addr_frame       ( Command_Decoder_0_GPIO_addr ),
        .write_data_frame ( Command_Decoder_0_GPIO_data ),
        .Inputs           ( Inputs_net_0 ),
        // Outputs
        .busy             ( gpio_controler_0_busy ),
        .Diag_Valid       (  ),
        .read_data_frame  ( gpio_controler_0_read_data_frame ),
        .Outputs          ( Outputs_net_0 ) 
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

//--------Reset_Controler
Reset_Controler Reset_Controler_0(
        // Inputs
        .Clock                ( Clock ),
        .Reset_N              ( Reset_N ),
        .enable_cmd           ( Command_Decoder_0_RST_enable_cmd ),
        .write_read           ( Command_Decoder_0_RST_write_read ),
        .addr_frame           ( Command_Decoder_0_RST_addr ),
        .write_data_frame     ( Command_Decoder_0_RST_data ),
        // Outputs
        .busy                 ( Reset_Controler_0_busy ),
        .SYS_Main_Reset_N     ( SYS_Main_Reset_N_net_0 ),
        .EXT_ADC_Reset_N      ( EXT_ADC_Reset_N_net_0 ),
        .EXT_HMC_Reset_N      ( EXT_HMC_Reset_N_net_0 ),
        .EXT_LMX1_Reset_N     ( EXT_LMX1_Reset_N_net_0 ),
        .EXT_LMX2_Reset_N     ( EXT_LMX2_Reset_N_net_0 ),
        .INT_DataFifo_Reset_N ( INT_DataFifo_Reset_N_net_0 ),
        .INT_FtdiReset_N      ( INT_FtdiReset_N_net_0 ),
        .Diag_Valid           (  ),
        .read_data_frame      ( Reset_Controler_0_read_data_frame ) 
        );

//--------SPI_LMX
SPI_LMX SPI_LMX_0(
        // Inputs
        .Clock         ( Clock ),
        .Reset_N       ( Reset_N ),
        .miso          ( LMX1_miso ),
        .enable_cmd    ( Command_Decoder_0_LMX1SPI_enable_cmd ),
        .write_read    ( Command_Decoder_0_LMX1SPI_write_read ),
        .tx_data_frame ( Command_Decoder_0_LMX1SPI_tx_data_frame ),
        .addr_frame    ( Command_Decoder_0_LMX1SPI_addr_frame ),
        // Outputs
        .ss_n          ( LMX1_ss_n_net_0 ),
        .mosi          ( LMX1_mosi_net_0 ),
        .sclk          ( LMX1_sclk_net_0 ),
        .busy          ( SPI_LMX_0_busy ),
        .rx_data_frame ( SPI_LMX_0_rx_data_frame ) 
        );

//--------SPI_LMX
SPI_LMX SPI_LMX_0_0(
        // Inputs
        .Clock         ( Clock ),
        .Reset_N       ( Reset_N ),
        .miso          ( LMX2_miso ),
        .enable_cmd    ( Command_Decoder_0_LMX2SPI_enable_cmd ),
        .write_read    ( Command_Decoder_0_LMX2SPI_write_read ),
        .tx_data_frame ( Command_Decoder_0_LMX2SPI_tx_data_frame ),
        .addr_frame    ( Command_Decoder_0_LMX2SPI_addr_frame ),
        // Outputs
        .ss_n          ( LMX2_ss_n_net_0 ),
        .mosi          ( LMX2_mosi_net_0 ),
        .sclk          ( LMX2_sclk_net_0 ),
        .busy          ( SPI_LMX_0_0_busy ),
        .rx_data_frame ( SPI_LMX_0_0_rx_data_frame ) 
        );


endmodule
