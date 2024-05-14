//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Tue May 14 15:14:16 2024
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
    ANICI_busy,
    ANICI_rx_data,
    ANW_Fifo_Full,
    BTN,
    CLKC_busy,
    CLKC_rx_data,
    CMD_Fifo_Empty,
    CMD_Fifo_Read_Data,
    COMM_busy,
    COMM_rx_data,
    Clock,
    HMC_GPIO_0,
    HMC_GPIO_1,
    LANE_VAL,
    LDO_PWR_GOOD,
    LMX1_miso,
    LMX2_miso,
    Reset_N,
    SMPS_PWR_GOOD,
    SYNC_Input,
    TRG_busy,
    TRG_rx_data,
    TRNV_busy,
    TRNV_rx_data,
    // Outputs
    ADC_PWDN,
    ADC_PWR_RUN,
    ADC_sclk,
    ADC_ss_n,
    ANICI_addr,
    ANICI_data,
    ANICI_enable_cmd,
    ANICI_write_read,
    ANW_Fifo_Write_Data,
    ANW_Fifo_Write_Enable,
    BOARD_PWR_RUN,
    CLKC_addr,
    CLKC_data,
    CLKC_enable_cmd,
    CLKC_write_read,
    CMD_Fifo_Read_Enable,
    COMM_addr,
    COMM_comm_number,
    COMM_data,
    COMM_enable_cmd,
    COMM_write_read,
    EXT_ADC_Reset_N,
    EXT_HMC_Reset_N,
    EXT_LMX1_Reset_N,
    EXT_LMX2_Reset_N,
    GPIO_0,
    GPIO_1,
    HMC_GPIO_2,
    HMC_GPIO_3,
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
    LMX_Sync,
    SYS_Main_Reset_N,
    TRG_addr,
    TRG_data,
    TRG_enable_cmd,
    TRG_write_read,
    TRNV_addr,
    TRNV_data,
    TRNV_enable_cmd,
    TRNV_write_read,
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
input         ANICI_busy;
input  [15:0] ANICI_rx_data;
input         ANW_Fifo_Full;
input         BTN;
input         CLKC_busy;
input  [15:0] CLKC_rx_data;
input         CMD_Fifo_Empty;
input  [39:0] CMD_Fifo_Read_Data;
input         COMM_busy;
input  [15:0] COMM_rx_data;
input         Clock;
input         HMC_GPIO_0;
input         HMC_GPIO_1;
input         LANE_VAL;
input         LDO_PWR_GOOD;
input         LMX1_miso;
input         LMX2_miso;
input         Reset_N;
input         SMPS_PWR_GOOD;
input         SYNC_Input;
input         TRG_busy;
input  [15:0] TRG_rx_data;
input         TRNV_busy;
input  [15:0] TRNV_rx_data;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output        ADC_PWDN;
output        ADC_PWR_RUN;
output        ADC_sclk;
output        ADC_ss_n;
output [7:0]  ANICI_addr;
output [15:0] ANICI_data;
output        ANICI_enable_cmd;
output        ANICI_write_read;
output [39:0] ANW_Fifo_Write_Data;
output        ANW_Fifo_Write_Enable;
output        BOARD_PWR_RUN;
output [7:0]  CLKC_addr;
output [15:0] CLKC_data;
output        CLKC_enable_cmd;
output        CLKC_write_read;
output        CMD_Fifo_Read_Enable;
output [7:0]  COMM_addr;
output [3:0]  COMM_comm_number;
output [15:0] COMM_data;
output        COMM_enable_cmd;
output        COMM_write_read;
output        EXT_ADC_Reset_N;
output        EXT_HMC_Reset_N;
output        EXT_LMX1_Reset_N;
output        EXT_LMX2_Reset_N;
output        GPIO_0;
output        GPIO_1;
output        HMC_GPIO_2;
output        HMC_GPIO_3;
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
output        LMX_Sync;
output        SYS_Main_Reset_N;
output [7:0]  TRG_addr;
output [15:0] TRG_data;
output        TRG_enable_cmd;
output        TRG_write_read;
output [7:0]  TRNV_addr;
output [15:0] TRNV_data;
output        TRNV_enable_cmd;
output        TRNV_write_read;
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
wire   [7:0]   ANICI_addr_net_0;
wire           ANICI_busy;
wire   [15:0]  ANICI_data_net_0;
wire           ANICI_enable_cmd_net_0;
wire   [15:0]  ANICI_rx_data;
wire           ANICI_write_read_net_0;
wire           Answer_Encoder_0_CD_busy;
wire           ANW_Fifo_Full;
wire   [39:0]  ANW_Fifo_Write_Data_net_0;
wire           ANW_Fifo_Write_Enable_net_0;
wire   [6:6]   BOARD_PWR_RUN_net_0;
wire           BTN;
wire   [7:0]   CLKC_addr_net_0;
wire           CLKC_busy;
wire   [15:0]  CLKC_data_net_0;
wire           CLKC_enable_cmd_net_0;
wire   [15:0]  CLKC_rx_data;
wire           CLKC_write_read_net_0;
wire           Clock;
wire           CMD;
wire           CMD_Fifo_Empty;
wire   [39:0]  CMD_Fifo_Read_Data;
wire           CMD_Fifo_Read_Enable_net_0;
wire   [7:0]   COMM_addr_net_0;
wire           COMM_busy;
wire   [3:0]   COMM_comm_number_net_0;
wire   [15:0]  COMM_data_net_0;
wire           COMM_enable_cmd_net_0;
wire   [15:0]  COMM_rx_data;
wire           COMM_write_read_net_0;
wire   [14:0]  Command_Decoder_0_ADCSPI_addr_frame;
wire           Command_Decoder_0_ADCSPI_enable_cmd;
wire   [7:0]   Command_Decoder_0_ADCSPI_tx_data_frame;
wire           Command_Decoder_0_ADCSPI_write_read;
wire   [39:0]  Command_Decoder_0_AE_CMD_Data;
wire           Command_Decoder_0_AE_enable_cmd;
wire           Command_Decoder_0_AE_FAULT_PROCESSED_EXECUTE;
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
wire   [4:4]   HMC_GPIO_2_net_0;
wire   [5:5]   HMC_GPIO_3_net_0;
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
wire   [2:2]   LMX_Sync_net_0;
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
wire           SYNC_Input;
wire           SYS_Main_Reset_N_net_0;
wire   [7:0]   TRG_addr_net_0;
wire           TRG_busy;
wire   [15:0]  TRG_data_net_0;
wire           TRG_enable_cmd_net_0;
wire   [15:0]  TRG_rx_data;
wire           TRG_write_read_net_0;
wire   [7:0]   TRNV_addr_net_0;
wire           TRNV_busy;
wire   [15:0]  TRNV_data_net_0;
wire           TRNV_enable_cmd_net_0;
wire   [15:0]  TRNV_rx_data;
wire           TRNV_write_read_net_0;
wire           ADC_sclk_net_1;
wire           ADC_ss_n_net_1;
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
wire           INT_FtdiReset_N_net_1;
wire           HMC_GPIO_3_net_1;
wire           HMC_GPIO_2_net_1;
wire           LMX_Sync_net_1;
wire           CMD_Fifo_Read_Enable_net_1;
wire           ANW_Fifo_Write_Enable_net_1;
wire           COMM_write_read_net_1;
wire           COMM_enable_cmd_net_1;
wire           TRNV_write_read_net_1;
wire           TRNV_enable_cmd_net_1;
wire           ANICI_write_read_net_1;
wire           ANICI_enable_cmd_net_1;
wire   [7:0]   TRG_addr_net_1;
wire   [15:0]  TRG_data_net_1;
wire   [39:0]  ANW_Fifo_Write_Data_net_1;
wire   [7:0]   COMM_addr_net_1;
wire   [3:0]   COMM_comm_number_net_1;
wire   [15:0]  COMM_data_net_1;
wire   [7:0]   TRNV_addr_net_1;
wire   [15:0]  TRNV_data_net_1;
wire   [7:0]   ANICI_addr_net_1;
wire   [15:0]  ANICI_data_net_1;
wire           CLKC_write_read_net_1;
wire   [7:0]   CLKC_addr_net_1;
wire   [15:0]  CLKC_data_net_1;
wire           CLKC_enable_cmd_net_1;
wire   [10:10] Outputs_slice_0;
wire   [11:11] Outputs_slice_1;
wire   [3:3]   Outputs_slice_2;
wire   [8:8]   Outputs_slice_3;
wire   [9:9]   Outputs_slice_4;
wire   [15:0]  Inputs_net_0;
wire   [15:0]  Outputs_net_0;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign ADC_sclk_net_1              = ADC_sclk_net_0;
assign ADC_sclk                    = ADC_sclk_net_1;
assign ADC_ss_n_net_1              = ADC_ss_n_net_0;
assign ADC_ss_n                    = ADC_ss_n_net_1;
assign TRG_enable_cmd_net_1        = TRG_enable_cmd_net_0;
assign TRG_enable_cmd              = TRG_enable_cmd_net_1;
assign TRG_write_read_net_1        = TRG_write_read_net_0;
assign TRG_write_read              = TRG_write_read_net_1;
assign SYS_Main_Reset_N_net_1      = SYS_Main_Reset_N_net_0;
assign SYS_Main_Reset_N            = SYS_Main_Reset_N_net_1;
assign HMC_sclk_net_1              = HMC_sclk_net_0;
assign HMC_sclk                    = HMC_sclk_net_1;
assign HMC_ss_n_net_1              = HMC_ss_n_net_0;
assign HMC_ss_n                    = HMC_ss_n_net_1;
assign LMX1_ss_n_net_1             = LMX1_ss_n_net_0;
assign LMX1_ss_n                   = LMX1_ss_n_net_1;
assign LMX1_mosi_net_1             = LMX1_mosi_net_0;
assign LMX1_mosi                   = LMX1_mosi_net_1;
assign LMX1_sclk_net_1             = LMX1_sclk_net_0;
assign LMX1_sclk                   = LMX1_sclk_net_1;
assign LMX2_ss_n_net_1             = LMX2_ss_n_net_0;
assign LMX2_ss_n                   = LMX2_ss_n_net_1;
assign LMX2_mosi_net_1             = LMX2_mosi_net_0;
assign LMX2_mosi                   = LMX2_mosi_net_1;
assign LMX2_sclk_net_1             = LMX2_sclk_net_0;
assign LMX2_sclk                   = LMX2_sclk_net_1;
assign EXT_ADC_Reset_N_net_1       = EXT_ADC_Reset_N_net_0;
assign EXT_ADC_Reset_N             = EXT_ADC_Reset_N_net_1;
assign EXT_HMC_Reset_N_net_1       = EXT_HMC_Reset_N_net_0;
assign EXT_HMC_Reset_N             = EXT_HMC_Reset_N_net_1;
assign EXT_LMX2_Reset_N_net_1      = EXT_LMX2_Reset_N_net_0;
assign EXT_LMX2_Reset_N            = EXT_LMX2_Reset_N_net_1;
assign EXT_LMX1_Reset_N_net_1      = EXT_LMX1_Reset_N_net_0;
assign EXT_LMX1_Reset_N            = EXT_LMX1_Reset_N_net_1;
assign INT_DataFifo_Reset_N_net_1  = INT_DataFifo_Reset_N_net_0;
assign INT_DataFifo_Reset_N        = INT_DataFifo_Reset_N_net_1;
assign ADC_PWDN_net_1              = ADC_PWDN_net_0[0];
assign ADC_PWDN                    = ADC_PWDN_net_1;
assign HMC_SYNC_net_1              = HMC_SYNC_net_0[1];
assign HMC_SYNC                    = HMC_SYNC_net_1;
assign ADC_PWR_RUN_net_1           = ADC_PWR_RUN_net_0[7];
assign ADC_PWR_RUN                 = ADC_PWR_RUN_net_1;
assign BOARD_PWR_RUN_net_1         = BOARD_PWR_RUN_net_0[6];
assign BOARD_PWR_RUN               = BOARD_PWR_RUN_net_1;
assign LED_2_net_1                 = LED_2_net_0[14];
assign LED_2                       = LED_2_net_1;
assign LED_3_net_1                 = LED_3_net_0[15];
assign LED_3                       = LED_3_net_1;
assign GPIO_0_net_1                = GPIO_0_net_0[12];
assign GPIO_0                      = GPIO_0_net_1;
assign GPIO_1_net_1                = GPIO_1_net_0[13];
assign GPIO_1                      = GPIO_1_net_1;
assign INT_FtdiReset_N_net_1       = INT_FtdiReset_N_net_0;
assign INT_FtdiReset_N             = INT_FtdiReset_N_net_1;
assign HMC_GPIO_3_net_1            = HMC_GPIO_3_net_0[5];
assign HMC_GPIO_3                  = HMC_GPIO_3_net_1;
assign HMC_GPIO_2_net_1            = HMC_GPIO_2_net_0[4];
assign HMC_GPIO_2                  = HMC_GPIO_2_net_1;
assign LMX_Sync_net_1              = LMX_Sync_net_0[2];
assign LMX_Sync                    = LMX_Sync_net_1;
assign CMD_Fifo_Read_Enable_net_1  = CMD_Fifo_Read_Enable_net_0;
assign CMD_Fifo_Read_Enable        = CMD_Fifo_Read_Enable_net_1;
assign ANW_Fifo_Write_Enable_net_1 = ANW_Fifo_Write_Enable_net_0;
assign ANW_Fifo_Write_Enable       = ANW_Fifo_Write_Enable_net_1;
assign COMM_write_read_net_1       = COMM_write_read_net_0;
assign COMM_write_read             = COMM_write_read_net_1;
assign COMM_enable_cmd_net_1       = COMM_enable_cmd_net_0;
assign COMM_enable_cmd             = COMM_enable_cmd_net_1;
assign TRNV_write_read_net_1       = TRNV_write_read_net_0;
assign TRNV_write_read             = TRNV_write_read_net_1;
assign TRNV_enable_cmd_net_1       = TRNV_enable_cmd_net_0;
assign TRNV_enable_cmd             = TRNV_enable_cmd_net_1;
assign ANICI_write_read_net_1      = ANICI_write_read_net_0;
assign ANICI_write_read            = ANICI_write_read_net_1;
assign ANICI_enable_cmd_net_1      = ANICI_enable_cmd_net_0;
assign ANICI_enable_cmd            = ANICI_enable_cmd_net_1;
assign TRG_addr_net_1              = TRG_addr_net_0;
assign TRG_addr[7:0]               = TRG_addr_net_1;
assign TRG_data_net_1              = TRG_data_net_0;
assign TRG_data[15:0]              = TRG_data_net_1;
assign ANW_Fifo_Write_Data_net_1   = ANW_Fifo_Write_Data_net_0;
assign ANW_Fifo_Write_Data[39:0]   = ANW_Fifo_Write_Data_net_1;
assign COMM_addr_net_1             = COMM_addr_net_0;
assign COMM_addr[7:0]              = COMM_addr_net_1;
assign COMM_comm_number_net_1      = COMM_comm_number_net_0;
assign COMM_comm_number[3:0]       = COMM_comm_number_net_1;
assign COMM_data_net_1             = COMM_data_net_0;
assign COMM_data[15:0]             = COMM_data_net_1;
assign TRNV_addr_net_1             = TRNV_addr_net_0;
assign TRNV_addr[7:0]              = TRNV_addr_net_1;
assign TRNV_data_net_1             = TRNV_data_net_0;
assign TRNV_data[15:0]             = TRNV_data_net_1;
assign ANICI_addr_net_1            = ANICI_addr_net_0;
assign ANICI_addr[7:0]             = ANICI_addr_net_1;
assign ANICI_data_net_1            = ANICI_data_net_0;
assign ANICI_data[15:0]            = ANICI_data_net_1;
assign CLKC_write_read_net_1       = CLKC_write_read_net_0;
assign CLKC_write_read             = CLKC_write_read_net_1;
assign CLKC_addr_net_1             = CLKC_addr_net_0;
assign CLKC_addr[7:0]              = CLKC_addr_net_1;
assign CLKC_data_net_1             = CLKC_data_net_0;
assign CLKC_data[15:0]             = CLKC_data_net_1;
assign CLKC_enable_cmd_net_1       = CLKC_enable_cmd_net_0;
assign CLKC_enable_cmd             = CLKC_enable_cmd_net_1;
//--------------------------------------------------------------------
// Slices assignments
//--------------------------------------------------------------------
assign ADC_PWDN_net_0[0]      = Outputs_net_0[0:0];
assign ADC_PWR_RUN_net_0[7]   = Outputs_net_0[7:7];
assign BOARD_PWR_RUN_net_0[6] = Outputs_net_0[6:6];
assign GPIO_0_net_0[12]       = Outputs_net_0[12:12];
assign GPIO_1_net_0[13]       = Outputs_net_0[13:13];
assign HMC_GPIO_2_net_0[4]    = Outputs_net_0[4:4];
assign HMC_GPIO_3_net_0[5]    = Outputs_net_0[5:5];
assign HMC_SYNC_net_0[1]      = Outputs_net_0[1:1];
assign LED_2_net_0[14]        = Outputs_net_0[14:14];
assign LED_3_net_0[15]        = Outputs_net_0[15:15];
assign LMX_Sync_net_0[2]      = Outputs_net_0[2:2];
assign Outputs_slice_0[10]    = Outputs_net_0[10:10];
assign Outputs_slice_1[11]    = Outputs_net_0[11:11];
assign Outputs_slice_2[3]     = Outputs_net_0[3:3];
assign Outputs_slice_3[8]     = Outputs_net_0[8:8];
assign Outputs_slice_4[9]     = Outputs_net_0[9:9];
//--------------------------------------------------------------------
// Concatenation assignments
//--------------------------------------------------------------------
assign Inputs_net_0 = { LANE_VAL , SYNC_Input , ADC_LDO_PWR_GOOD , LDO_PWR_GOOD , SMPS_PWR_GOOD , TRNV_busy , TRNV_enable_cmd_net_0 , HMC_GPIO_1 , HMC_GPIO_0 , ADC_FD , ADC_GPIO_4 , ADC_GPIO_3 , ADC_GPIO_2 , ADC_GPIO_1 , ADC_GPIO_0 , BTN };
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
        .Fifo_Full                  ( ANW_Fifo_Full ),
        .CD_CMD_Data                ( Command_Decoder_0_AE_CMD_Data ),
        .CD_enable_cmd              ( Command_Decoder_0_AE_enable_cmd ),
        .CD_FAULT_PROCESSED_EXECUTE ( Command_Decoder_0_AE_FAULT_PROCESSED_EXECUTE ),
        .RST_rx_data                ( Reset_Controler_0_read_data_frame ),
        .CLKC_rx_data               ( CLKC_rx_data ),
        .REG_rx_data                ( REGISTERS_0_read_data_frame ),
        .ADCSPI_rx_data             ( ADI_SPI_0_rx_data_frame ),
        .HMCSPI_rx_data             ( ADI_SPI_0_0_rx_data_frame ),
        .LMX1SPI_rx_data            ( SPI_LMX_0_rx_data_frame ),
        .LMX2SPI_rx_data            ( SPI_LMX_0_0_rx_data_frame ),
        .TRG_rx_data                ( TRG_rx_data ),
        .GPIO_rx_data               ( gpio_controler_0_read_data_frame ),
        .COMM_rx_data               ( COMM_rx_data ),
        .TRNV_rx_data               ( TRNV_rx_data ),
        .ANICI_rx_data              ( ANICI_rx_data ),
        // Outputs
        .Fifo_Write_Data            ( ANW_Fifo_Write_Data_net_0 ),
        .Fifo_Write_Enable          ( ANW_Fifo_Write_Enable_net_0 ),
        .CD_busy                    ( Answer_Encoder_0_CD_busy ),
        .Diag_Valid                 (  ) 
        );

//--------Command_Decoder
Command_Decoder Command_Decoder_0(
        // Inputs
        .Clock                      ( Clock ),
        .Reset_N                    ( Reset_N ),
        .Fifo_Read_Data             ( CMD_Fifo_Read_Data ),
        .Fifo_Empty                 ( CMD_Fifo_Empty ),
        .AE_busy                    ( Answer_Encoder_0_CD_busy ),
        .RST_busy                   ( Reset_Controler_0_busy ),
        .CLKC_busy                  ( CLKC_busy ),
        .REG_busy                   ( REGISTERS_0_busy ),
        .ADCSPI_busy                ( ADI_SPI_0_busy ),
        .HMCSPI_busy                ( ADI_SPI_0_0_busy ),
        .LMX1SPI_busy               ( SPI_LMX_0_busy ),
        .LMX2SPI_busy               ( SPI_LMX_0_0_busy ),
        .TRG_busy                   ( TRG_busy ),
        .GPIO_busy                  ( gpio_controler_0_busy ),
        .COMM_busy                  ( COMM_busy ),
        .TRNV_busy                  ( TRNV_busy ),
        .ANICI_busy                 ( ANICI_busy ),
        // Outputs
        .Fifo_Read_Enable           ( CMD_Fifo_Read_Enable_net_0 ),
        .AE_CMD_Data                ( Command_Decoder_0_AE_CMD_Data ),
        .AE_enable_cmd              ( Command_Decoder_0_AE_enable_cmd ),
        .AE_FAULT_PROCESSED_EXECUTE ( Command_Decoder_0_AE_FAULT_PROCESSED_EXECUTE ),
        .RST_enable_cmd             ( Command_Decoder_0_RST_enable_cmd ),
        .RST_write_read             ( Command_Decoder_0_RST_write_read ),
        .RST_addr                   ( Command_Decoder_0_RST_addr ),
        .RST_data                   ( Command_Decoder_0_RST_data ),
        .CLKC_enable_cmd            ( CLKC_enable_cmd_net_0 ),
        .CLKC_write_read            ( CLKC_write_read_net_0 ),
        .CLKC_addr                  ( CLKC_addr_net_0 ),
        .CLKC_data                  ( CLKC_data_net_0 ),
        .REG_enable_cmd             ( CMD ),
        .REG_write_read             ( RW ),
        .REG_addr                   ( Command_Decoder_0_REG_addr ),
        .REG_data                   ( Command_Decoder_0_REG_data ),
        .ADCSPI_enable_cmd          ( Command_Decoder_0_ADCSPI_enable_cmd ),
        .ADCSPI_write_read          ( Command_Decoder_0_ADCSPI_write_read ),
        .ADCSPI_addr_frame          ( Command_Decoder_0_ADCSPI_addr_frame ),
        .ADCSPI_tx_data_frame       ( Command_Decoder_0_ADCSPI_tx_data_frame ),
        .HMCSPI_enable_cmd          ( Command_Decoder_0_HMCSPI_enable_cmd ),
        .HMCSPI_write_read          ( Command_Decoder_0_HMCSPI_write_read ),
        .HMCSPI_addr_frame          ( Command_Decoder_0_HMCSPI_addr_frame ),
        .HMCSPI_tx_data_frame       ( Command_Decoder_0_HMCSPI_tx_data_frame ),
        .LMX1SPI_enable_cmd         ( Command_Decoder_0_LMX1SPI_enable_cmd ),
        .LMX1SPI_write_read         ( Command_Decoder_0_LMX1SPI_write_read ),
        .LMX1SPI_addr_frame         ( Command_Decoder_0_LMX1SPI_addr_frame ),
        .LMX1SPI_tx_data_frame      ( Command_Decoder_0_LMX1SPI_tx_data_frame ),
        .LMX2SPI_enable_cmd         ( Command_Decoder_0_LMX2SPI_enable_cmd ),
        .LMX2SPI_write_read         ( Command_Decoder_0_LMX2SPI_write_read ),
        .LMX2SPI_addr_frame         ( Command_Decoder_0_LMX2SPI_addr_frame ),
        .LMX2SPI_tx_data_frame      ( Command_Decoder_0_LMX2SPI_tx_data_frame ),
        .TRG_enable_cmd             ( TRG_enable_cmd_net_0 ),
        .TRG_write_read             ( TRG_write_read_net_0 ),
        .TRG_addr                   ( TRG_addr_net_0 ),
        .TRG_data                   ( TRG_data_net_0 ),
        .GPIO_enable_cmd            ( Command_Decoder_0_GPIO_enable_cmd ),
        .GPIO_write_read            ( Command_Decoder_0_GPIO_write_read ),
        .GPIO_addr                  ( Command_Decoder_0_GPIO_addr ),
        .GPIO_data                  ( Command_Decoder_0_GPIO_data ),
        .COMM_enable_cmd            ( COMM_enable_cmd_net_0 ),
        .COMM_write_read            ( COMM_write_read_net_0 ),
        .COMM_addr                  ( COMM_addr_net_0 ),
        .COMM_data                  ( COMM_data_net_0 ),
        .COMM_comm_number           ( COMM_comm_number_net_0 ),
        .TRNV_enable_cmd            ( TRNV_enable_cmd_net_0 ),
        .TRNV_write_read            ( TRNV_write_read_net_0 ),
        .TRNV_addr                  ( TRNV_addr_net_0 ),
        .TRNV_data                  ( TRNV_data_net_0 ),
        .ANICI_enable_cmd           ( ANICI_enable_cmd_net_0 ),
        .ANICI_write_read           ( ANICI_write_read_net_0 ),
        .ANICI_addr                 ( ANICI_addr_net_0 ),
        .ANICI_data                 ( ANICI_data_net_0 ),
        .Diag_Valid                 (  ) 
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
