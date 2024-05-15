//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Tue May 14 18:30:16 2024
// Version: 2022.1 2022.1.0.10
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// Top
module Top(
    // Inputs
    ADC_FD,
    ADC_GPIO_0,
    ADC_GPIO_1,
    ADC_GPIO_2,
    ADC_GPIO_3,
    ADC_GPIO_4,
    ADC_LDO_PWR_GOOD,
    BTN_1,
    BTN_2,
    BTN_3,
    BTN_4,
    FTDI_CLK,
    FTDI_nRXF,
    FTDI_nTXE,
    HMC_CLK_IN_N,
    HMC_CLK_IN_P,
    HMC_GPIO_0,
    HMC_GPIO_1,
    LANE0_RXD_N,
    LANE0_RXD_P,
    LANE1_RXD_N,
    LANE1_RXD_P,
    LDO_PWR_GOOD,
    LMX1_miso,
    LMX2_miso,
    RX_0,
    RX_1,
    SMPS_PWR_GOOD,
    SYNC_IN_N,
    SYNC_IN_P,
    // Outputs
    ADC_PWDN,
    ADC_PWR_RUN,
    ADC_sclk,
    ADC_ss_n,
    BOARD_PWR_RUN,
    CLK_OUT_N,
    CLK_OUT_P,
    DBGport_0,
    DBGport_1,
    DBGport_2,
    DBGport_3,
    DBGport_4,
    DBGport_5,
    DBGport_6,
    DBGport_7,
    DBGport_8,
    DBGport_9,
    EXT_ADC_Reset_N,
    EXT_HMC_Reset_N,
    EXT_LMX1_Reset_N,
    EXT_LMX2_Reset_N,
    FTDI_GPIO_0,
    FTDI_GPIO_1,
    FTDI_RESET_N,
    FTDI_nOE,
    FTDI_nRD,
    FTDI_nWR,
    GPIO_0,
    GPIO_1,
    HMC_GPIO_2,
    HMC_GPIO_3,
    HMC_SYNC,
    HMC_sclk,
    HMC_ss_n,
    LANE0_TXD_N,
    LANE0_TXD_P,
    LANE1_TXD_N,
    LANE1_TXD_P,
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
    SIWU_N,
    SYNCINB_N,
    SYNCINB_P,
    SYNC_OUT_1_N,
    SYNC_OUT_1_P,
    SYNC_OUT_2_N,
    SYNC_OUT_2_P,
    TX_0,
    TX_1,
    // Inouts
    ADC_sdio,
    FTDI_BE,
    FTDI_DATA,
    HMC_sdio,
    IO_0,
    IO_1
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
input         BTN_1;
input         BTN_2;
input         BTN_3;
input         BTN_4;
input         FTDI_CLK;
input         FTDI_nRXF;
input         FTDI_nTXE;
input         HMC_CLK_IN_N;
input         HMC_CLK_IN_P;
input         HMC_GPIO_0;
input         HMC_GPIO_1;
input         LANE0_RXD_N;
input         LANE0_RXD_P;
input         LANE1_RXD_N;
input         LANE1_RXD_P;
input         LDO_PWR_GOOD;
input         LMX1_miso;
input         LMX2_miso;
input         RX_0;
input         RX_1;
input         SMPS_PWR_GOOD;
input         SYNC_IN_N;
input         SYNC_IN_P;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output        ADC_PWDN;
output        ADC_PWR_RUN;
output        ADC_sclk;
output        ADC_ss_n;
output        BOARD_PWR_RUN;
output        CLK_OUT_N;
output        CLK_OUT_P;
output        DBGport_0;
output        DBGport_1;
output        DBGport_2;
output        DBGport_3;
output        DBGport_4;
output        DBGport_5;
output        DBGport_6;
output        DBGport_7;
output        DBGport_8;
output        DBGport_9;
output        EXT_ADC_Reset_N;
output        EXT_HMC_Reset_N;
output        EXT_LMX1_Reset_N;
output        EXT_LMX2_Reset_N;
output        FTDI_GPIO_0;
output        FTDI_GPIO_1;
output        FTDI_RESET_N;
output        FTDI_nOE;
output        FTDI_nRD;
output        FTDI_nWR;
output        GPIO_0;
output        GPIO_1;
output        HMC_GPIO_2;
output        HMC_GPIO_3;
output        HMC_SYNC;
output        HMC_sclk;
output        HMC_ss_n;
output        LANE0_TXD_N;
output        LANE0_TXD_P;
output        LANE1_TXD_N;
output        LANE1_TXD_P;
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
output        SIWU_N;
output        SYNCINB_N;
output        SYNCINB_P;
output        SYNC_OUT_1_N;
output        SYNC_OUT_1_P;
output        SYNC_OUT_2_N;
output        SYNC_OUT_2_P;
output        TX_0;
output        TX_1;
//--------------------------------------------------------------------
// Inout
//--------------------------------------------------------------------
inout         ADC_sdio;
inout  [3:0]  FTDI_BE;
inout  [31:0] FTDI_DATA;
inout         HMC_sdio;
inout         IO_0;
inout         IO_1;
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
wire           ADC_PWDN_net_0;
wire           ADC_PWR_RUN_net_0;
wire           ADC_sclk_net_0;
wire           ADC_sdio;
wire           ADC_ss_n_net_0;
wire           AnalyzInCirc_Top_0_busy;
wire   [15:0]  AnalyzInCirc_Top_0_read_data_frame;
wire           BOARD_PWR_RUN_net_0;
wire           BTN_1;
wire           CLK_OUT_N_net_0;
wire           CLK_OUT_P_net_0;
wire           Clock_Reset_0_busy;
wire           Clock_Reset_0_Clock_LogicData;
wire           Clock_Reset_0_Clock_XcvrRef;
wire           Clock_Reset_0_HMC_CLK;
wire           Clock_Reset_0_Main_CLOCK_0;
wire           Clock_Reset_0_Main_RESET_N_0;
wire   [15:0]  Clock_Reset_0_read_data_frame;
wire           Clock_Reset_0_Reset_N_LogicData;
wire           Clock_Reset_0_Reset_N_XcvrRef;
wire           Clock_Reset_0_UART_CLOCK_1;
wire           Clock_Reset_0_UART_RESER_N_1;
wire           Clock_Reset_0_XCVR_CTRL_Clock_40M;
wire           Communication_0_ANW_FULL;
wire           Communication_0_Builder_Enable;
wire           Communication_0_busy;
wire           Communication_0_CMD_EMPTY;
wire   [39:0]  Communication_0_CMD_Q;
wire           Communication_0_DataFifo_RD;
wire   [15:0]  Communication_0_read_data_frame;
wire   [7:0]   Controler_0_ANICI_addr;
wire   [15:0]  Controler_0_ANICI_data;
wire           Controler_0_ANICI_enable_cmd;
wire           Controler_0_ANICI_write_read;
wire   [39:0]  Controler_0_ANW_Fifo_Write_Data;
wire           Controler_0_ANW_Fifo_Write_Enable;
wire   [7:0]   Controler_0_CLKC_addr;
wire   [15:0]  Controler_0_CLKC_data;
wire           Controler_0_CLKC_enable_cmd;
wire           Controler_0_CLKC_write_read;
wire           Controler_0_CMD_Fifo_Read_Enable;
wire   [7:0]   Controler_0_COMM_addr;
wire   [3:0]   Controler_0_COMM_comm_number;
wire   [15:0]  Controler_0_COMM_data;
wire           Controler_0_COMM_enable_cmd;
wire           Controler_0_COMM_write_read;
wire           Controler_0_LMX_Sync;
wire   [7:0]   Controler_0_TRG_addr;
wire   [15:0]  Controler_0_TRG_data;
wire           Controler_0_TRG_enable_cmd;
wire           Controler_0_TRG_write_read;
wire   [7:0]   Controler_0_TRNV_addr;
wire   [15:0]  Controler_0_TRNV_data;
wire           Controler_0_TRNV_enable_cmd;
wire           Controler_0_TRNV_write_read;
wire           Data_Block_0_ACQ_RunOut;
wire           Data_Block_0_C_busy;
wire   [15:0]  Data_Block_0_C_read_data_frame;
wire   [31:0]  Data_Block_0_Communication_Data_Frame;
wire           Data_Block_0_Communication_Empty;
wire           Data_Block_0_Control_Test_Generator_Enable;
wire           DBGport_0_1;
wire           DBGport_1_0;
wire           DBGport_2_net_0;
wire           DBGport_2_1;
wire           DBGport_3_0;
wire           DBGport_3_1;
wire           DBGport_4_1;
wire           BTN_2;
wire           DBGport_7_1;
wire   [3:0]   FTDI_BE;
wire           FTDI_CLK;
wire   [31:0]  FTDI_DATA;
wire           FTDI_GPIO_0_net_0;
wire           FTDI_GPIO_1_net_0;
wire           FTDI_nOE_net_0;
wire           FTDI_nRD_net_0;
wire           FTDI_nRXF;
wire           FTDI_nTXE;
wire           FTDI_nWR_net_0;
wire           FTDI_RESET_N_net_0;
wire           GPIO_0_net_0;
wire           HMC_CLK_IN_N;
wire           HMC_CLK_IN_P;
wire           HMC_GPIO_0;
wire           HMC_GPIO_1;
wire           HMC_GPIO_2_net_0;
wire           HMC_GPIO_3_net_0;
wire           HMC_sdio;
wire           HMC_ss_n_net_0;
wire           HMC_SYNC_net_0;
wire           INBUF_DIFF_0_Y;
wire           IO_0;
wire           IO_1;
wire           LANE0_RXD_N;
wire           LANE0_RXD_P;
wire           LANE0_TXD_N_net_0;
wire           LANE0_TXD_P_net_0;
wire           LANE1_RXD_N;
wire           LANE1_RXD_P;
wire           LANE1_TXD_N_net_0;
wire           LANE1_TXD_P_net_0;
wire           LDO_PWR_GOOD;
wire           LED_3_net_0;
wire           LED_4_net_0;
wire           LMX1_miso;
wire           LMX1_mosi_net_0;
wire           LMX1_sclk_net_0;
wire           LMX1_ss_n_net_0;
wire           LMX2_miso;
wire           LMX2_mosi_net_0;
wire           LMX2_sclk_net_0;
wire           LMX2_ss_n_net_0;
wire           RX_0;
wire           RX_1;
wire           SIWU_N_net_0;
wire           SMPS_PWR_GOOD;
wire           SYNC_IN_N;
wire           SYNC_IN_P;
wire           SYNC_OUT_1_N_net_0;
wire           SYNC_OUT_1_P_net_0;
wire           SYNC_OUT_2_N_net_0;
wire           SYNC_OUT_2_P_net_0;
wire           Synchronizer_0_Data_Out;
wire           SYNCINB_N_net_0;
wire           SYNCINB_P_net_0;
wire           Transceiver_Main_0_busy;
wire   [11:0]  Transceiver_Main_0_Output_Data_0;
wire   [23:12] Transceiver_Main_0_Output_Data_1;
wire   [35:24] Transceiver_Main_0_Output_Data_2;
wire   [47:36] Transceiver_Main_0_Output_Data_3;
wire   [59:48] Transceiver_Main_0_Output_Data_4;
wire   [71:60] Transceiver_Main_0_Output_Data_5;
wire   [83:72] Transceiver_Main_0_Output_Data_6;
wire   [95:84] Transceiver_Main_0_Output_Data_7;
wire   [15:0]  Transceiver_Main_0_read_data_frame;
wire           Transceiver_Main_0_SYNCINB_OUT;
wire   [127:0] Transceiver_Main_0_Transceivers_Rx_Data;
wire   [15:0]  Transceiver_Main_0_Transceivers_Rx_K;
wire           TX_0_net_0;
wire           TX_1_net_0;
wire           LED_3_net_1;
wire           LED_4_net_1;
wire           FTDI_nWR_net_1;
wire           FTDI_RESET_N_net_1;
wire           FTDI_nOE_net_1;
wire           FTDI_nRD_net_1;
wire           ADC_sclk_net_1;
wire           ADC_ss_n_net_1;
wire           DBGport_3_0_net_0;
wire           HMC_ss_n_net_1;
wire           LMX1_mosi_net_1;
wire           LMX1_ss_n_net_1;
wire           LMX1_sclk_net_1;
wire           LMX2_sclk_net_1;
wire           LMX2_ss_n_net_1;
wire           LMX2_mosi_net_1;
wire           DBGport_0_1_net_0;
wire           DBGport_1_0_net_0;
wire           DBGport_2_1_net_0;
wire           DBGport_3_1_net_0;
wire           HMC_SYNC_net_1;
wire           DBGport_7_1_net_0;
wire           GPIO_0_net_1;
wire           ADC_PWDN_net_1;
wire           ADC_PWR_RUN_net_1;
wire           BOARD_PWR_RUN_net_1;
wire           SYNC_OUT_1_P_net_1;
wire           SYNC_OUT_1_N_net_1;
wire           SYNC_OUT_2_P_net_1;
wire           SYNC_OUT_2_N_net_1;
wire           CLK_OUT_P_net_1;
wire           CLK_OUT_N_net_1;
wire           SYNCINB_P_net_1;
wire           SYNCINB_N_net_1;
wire           HMC_GPIO_2_net_1;
wire           HMC_GPIO_3_net_1;
wire           FTDI_GPIO_0_net_1;
wire           FTDI_GPIO_1_net_1;
wire           SIWU_N_net_1;
wire           TX_0_net_1;
wire           TX_1_net_1;
wire           LANE1_TXD_N_net_1;
wire           LANE1_TXD_P_net_1;
wire           LANE0_TXD_N_net_1;
wire           LANE0_TXD_P_net_1;
wire   [7:0]   Start_Triggers_net_0;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire           GND_net;
wire           VCC_net;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign GND_net    = 1'b0;
assign VCC_net    = 1'b1;
//--------------------------------------------------------------------
// TieOff assignments
//--------------------------------------------------------------------
assign DBGport_1           = 1'b0;
assign DBGport_4           = 1'b0;
assign DBGport_5           = 1'b0;
assign DBGport_6           = 1'b0;
assign DBGport_7           = 1'b0;
assign LED_1               = 1'b0;
assign LED_2               = 1'b0;
assign DBGport_8           = 1'b0;
assign DBGport_9           = 1'b0;
assign DBGport_3           = 1'b0;
assign DBGport_2           = 1'b0;
assign DBGport_0           = 1'b0;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign LED_3_net_1         = LED_3_net_0;
assign LED_3               = LED_3_net_1;
assign LED_4_net_1         = LED_4_net_0;
assign LED_4               = LED_4_net_1;
assign FTDI_nWR_net_1      = FTDI_nWR_net_0;
assign FTDI_nWR            = FTDI_nWR_net_1;
assign FTDI_RESET_N_net_1  = FTDI_RESET_N_net_0;
assign FTDI_RESET_N        = FTDI_RESET_N_net_1;
assign FTDI_nOE_net_1      = FTDI_nOE_net_0;
assign FTDI_nOE            = FTDI_nOE_net_1;
assign FTDI_nRD_net_1      = FTDI_nRD_net_0;
assign FTDI_nRD            = FTDI_nRD_net_1;
assign ADC_sclk_net_1      = ADC_sclk_net_0;
assign ADC_sclk            = ADC_sclk_net_1;
assign ADC_ss_n_net_1      = ADC_ss_n_net_0;
assign ADC_ss_n            = ADC_ss_n_net_1;
assign DBGport_3_0_net_0   = DBGport_3_0;
assign HMC_sclk            = DBGport_3_0_net_0;
assign HMC_ss_n_net_1      = HMC_ss_n_net_0;
assign HMC_ss_n            = HMC_ss_n_net_1;
assign LMX1_mosi_net_1     = LMX1_mosi_net_0;
assign LMX1_mosi           = LMX1_mosi_net_1;
assign LMX1_ss_n_net_1     = LMX1_ss_n_net_0;
assign LMX1_ss_n           = LMX1_ss_n_net_1;
assign LMX1_sclk_net_1     = LMX1_sclk_net_0;
assign LMX1_sclk           = LMX1_sclk_net_1;
assign LMX2_sclk_net_1     = LMX2_sclk_net_0;
assign LMX2_sclk           = LMX2_sclk_net_1;
assign LMX2_ss_n_net_1     = LMX2_ss_n_net_0;
assign LMX2_ss_n           = LMX2_ss_n_net_1;
assign LMX2_mosi_net_1     = LMX2_mosi_net_0;
assign LMX2_mosi           = LMX2_mosi_net_1;
assign DBGport_0_1_net_0   = DBGport_0_1;
assign EXT_ADC_Reset_N     = DBGport_0_1_net_0;
assign DBGport_1_0_net_0   = DBGport_1_0;
assign EXT_HMC_Reset_N     = DBGport_1_0_net_0;
assign DBGport_2_1_net_0   = DBGport_2_1;
assign EXT_LMX1_Reset_N    = DBGport_2_1_net_0;
assign DBGport_3_1_net_0   = DBGport_3_1;
assign EXT_LMX2_Reset_N    = DBGport_3_1_net_0;
assign HMC_SYNC_net_1      = HMC_SYNC_net_0;
assign HMC_SYNC            = HMC_SYNC_net_1;
assign DBGport_7_1_net_0   = DBGport_7_1;
assign GPIO_1              = DBGport_7_1_net_0;
assign GPIO_0_net_1        = GPIO_0_net_0;
assign GPIO_0              = GPIO_0_net_1;
assign ADC_PWDN_net_1      = ADC_PWDN_net_0;
assign ADC_PWDN            = ADC_PWDN_net_1;
assign ADC_PWR_RUN_net_1   = ADC_PWR_RUN_net_0;
assign ADC_PWR_RUN         = ADC_PWR_RUN_net_1;
assign BOARD_PWR_RUN_net_1 = BOARD_PWR_RUN_net_0;
assign BOARD_PWR_RUN       = BOARD_PWR_RUN_net_1;
assign SYNC_OUT_1_P_net_1  = SYNC_OUT_1_P_net_0;
assign SYNC_OUT_1_P        = SYNC_OUT_1_P_net_1;
assign SYNC_OUT_1_N_net_1  = SYNC_OUT_1_N_net_0;
assign SYNC_OUT_1_N        = SYNC_OUT_1_N_net_1;
assign SYNC_OUT_2_P_net_1  = SYNC_OUT_2_P_net_0;
assign SYNC_OUT_2_P        = SYNC_OUT_2_P_net_1;
assign SYNC_OUT_2_N_net_1  = SYNC_OUT_2_N_net_0;
assign SYNC_OUT_2_N        = SYNC_OUT_2_N_net_1;
assign CLK_OUT_P_net_1     = CLK_OUT_P_net_0;
assign CLK_OUT_P           = CLK_OUT_P_net_1;
assign CLK_OUT_N_net_1     = CLK_OUT_N_net_0;
assign CLK_OUT_N           = CLK_OUT_N_net_1;
assign SYNCINB_P_net_1     = SYNCINB_P_net_0;
assign SYNCINB_P           = SYNCINB_P_net_1;
assign SYNCINB_N_net_1     = SYNCINB_N_net_0;
assign SYNCINB_N           = SYNCINB_N_net_1;
assign HMC_GPIO_2_net_1    = HMC_GPIO_2_net_0;
assign HMC_GPIO_2          = HMC_GPIO_2_net_1;
assign HMC_GPIO_3_net_1    = HMC_GPIO_3_net_0;
assign HMC_GPIO_3          = HMC_GPIO_3_net_1;
assign FTDI_GPIO_0_net_1   = FTDI_GPIO_0_net_0;
assign FTDI_GPIO_0         = FTDI_GPIO_0_net_1;
assign FTDI_GPIO_1_net_1   = FTDI_GPIO_1_net_0;
assign FTDI_GPIO_1         = FTDI_GPIO_1_net_1;
assign SIWU_N_net_1        = SIWU_N_net_0;
assign SIWU_N              = SIWU_N_net_1;
assign TX_0_net_1          = TX_0_net_0;
assign TX_0                = TX_0_net_1;
assign TX_1_net_1          = TX_1_net_0;
assign TX_1                = TX_1_net_1;
assign LANE1_TXD_N_net_1   = LANE1_TXD_N_net_0;
assign LANE1_TXD_N         = LANE1_TXD_N_net_1;
assign LANE1_TXD_P_net_1   = LANE1_TXD_P_net_0;
assign LANE1_TXD_P         = LANE1_TXD_P_net_1;
assign LANE0_TXD_N_net_1   = LANE0_TXD_N_net_0;
assign LANE0_TXD_N         = LANE0_TXD_N_net_1;
assign LANE0_TXD_P_net_1   = LANE0_TXD_P_net_0;
assign LANE0_TXD_P         = LANE0_TXD_P_net_1;
//--------------------------------------------------------------------
// Concatenation assignments
//--------------------------------------------------------------------
assign Start_Triggers_net_0 = { 1'b0 , 1'b0 , 1'b0 , 1'b0 , 1'b0 , 1'b0 , 1'b0 , Transceiver_Main_0_SYNCINB_OUT };
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------AnalyzInCirc_Top
AnalyzInCirc_Top AnalyzInCirc_Top_0(
        // Inputs
        .Clock               ( Clock_Reset_0_Main_CLOCK_0 ),
        .Reset_N             ( Clock_Reset_0_Main_RESET_N_0 ),
        .enable_cmd          ( Controler_0_ANICI_enable_cmd ),
        .write_read          ( Controler_0_ANICI_write_read ),
        .addr_frame          ( Controler_0_ANICI_addr ),
        .write_data_frame    ( Controler_0_ANICI_data ),
        .Start_Triggers      ( Start_Triggers_net_0 ),
        .Transceiver_Rx_Data ( Transceiver_Main_0_Transceivers_Rx_Data ),
        .Transceiver_Rx_K    ( Transceiver_Main_0_Transceivers_Rx_K ),
        // Outputs
        .busy                ( AnalyzInCirc_Top_0_busy ),
        .read_data_frame     ( AnalyzInCirc_Top_0_read_data_frame ) 
        );

//--------Clock_Reset
Clock_Reset Clock_Reset_0(
        // Inputs
        .EXT_RST_N           ( DBGport_2_net_0 ),
        .addr_frame          ( Controler_0_CLKC_addr ),
        .enable_cmd          ( Controler_0_CLKC_enable_cmd ),
        .write_data_frame    ( Controler_0_CLKC_data ),
        .write_read          ( Controler_0_CLKC_write_read ),
        .ClockInput_Ext2     ( GND_net ),
        .ClockInput_ExtHMC   ( GPIO_0_net_0 ),
        .ClockInput_Ext1     ( GND_net ),
        // Outputs
        .Main_CLOCK          ( Clock_Reset_0_Main_CLOCK_0 ),
        .Main_RESET_N        ( Clock_Reset_0_Main_RESET_N_0 ),
        .UART_CLOCK          ( Clock_Reset_0_UART_CLOCK_1 ),
        .UART_RESER_N        ( Clock_Reset_0_UART_RESER_N_1 ),
        .HMC_CLK             ( Clock_Reset_0_HMC_CLK ),
        .XCVR_CTRL_Clock_40M ( Clock_Reset_0_XCVR_CTRL_Clock_40M ),
        .Clock_LogicData     ( Clock_Reset_0_Clock_LogicData ),
        .Reset_N_LogicData   ( Clock_Reset_0_Reset_N_LogicData ),
        .Clock_XcvrRef       ( Clock_Reset_0_Clock_XcvrRef ),
        .Reset_N_XcvrRef     ( Clock_Reset_0_Reset_N_XcvrRef ),
        .busy                ( Clock_Reset_0_busy ),
        .read_data_frame     ( Clock_Reset_0_read_data_frame ) 
        );

//--------Communication
Communication Communication_0(
        // Inputs
        .UART_Clock       ( Clock_Reset_0_UART_CLOCK_1 ),
        .UART_RESET_N     ( Clock_Reset_0_UART_RESER_N_1 ),
        .Logic_Clock      ( Clock_Reset_0_Main_CLOCK_0 ),
        .Logic_RESET_N    ( Clock_Reset_0_Main_RESET_N_0 ),
        .write_read       ( Controler_0_COMM_write_read ),
        .enable_cmd       ( Controler_0_COMM_enable_cmd ),
        .DataFifo_Empty   ( Data_Block_0_Communication_Empty ),
        .CMD_RE           ( Controler_0_CMD_Fifo_Read_Enable ),
        .ANW_WE           ( Controler_0_ANW_Fifo_Write_Enable ),
        .RX_0             ( RX_0 ),
        .RX_1             ( RX_1 ),
        .FTDI_nTXE        ( FTDI_nTXE ),
        .FTDI_nRXF        ( FTDI_nRXF ),
        .FTDI_CLK         ( FTDI_CLK ),
        .write_data_frame ( Controler_0_COMM_data ),
        .addr_frame       ( Controler_0_COMM_addr ),
        .comm_number      ( Controler_0_COMM_comm_number ),
        .DafaFifo_Data    ( Data_Block_0_Communication_Data_Frame ),
        .ANW_DATA         ( Controler_0_ANW_Fifo_Write_Data ),
        // Outputs
        .busy             ( Communication_0_busy ),
        .DataFifo_RD      ( Communication_0_DataFifo_RD ),
        .Builder_Enable   ( Communication_0_Builder_Enable ),
        .CMD_EMPTY        ( Communication_0_CMD_EMPTY ),
        .ANW_FULL         ( Communication_0_ANW_FULL ),
        .TX_0             ( TX_0_net_0 ),
        .TX_1             ( TX_1_net_0 ),
        .SIWU_N           ( SIWU_N_net_0 ),
        .FTDI_nWR         ( FTDI_nWR_net_0 ),
        .FTDI_nRD         ( FTDI_nRD_net_0 ),
        .FTDI_nOE         ( FTDI_nOE_net_0 ),
        .FTDI_GPIO_0      ( FTDI_GPIO_0_net_0 ),
        .FTDI_GPIO_1      ( FTDI_GPIO_1_net_0 ),
        .read_data_frame  ( Communication_0_read_data_frame ),
        .CMD_Q            ( Communication_0_CMD_Q ),
        // Inouts
        .FTDI_BE          ( FTDI_BE ),
        .FTDI_DATA        ( FTDI_DATA ) 
        );

//--------Controler
Controler Controler_0(
        // Inputs
        .Clock                 ( Clock_Reset_0_Main_CLOCK_0 ),
        .Reset_N               ( Clock_Reset_0_Main_RESET_N_0 ),
        .TRG_busy              ( Data_Block_0_C_busy ),
        .LMX1_miso             ( LMX1_miso ),
        .LMX2_miso             ( LMX2_miso ),
        .ADC_FD                ( ADC_FD ),
        .ADC_GPIO_0            ( ADC_GPIO_0 ),
        .ADC_GPIO_1            ( ADC_GPIO_1 ),
        .ADC_GPIO_2            ( ADC_GPIO_2 ),
        .ADC_GPIO_3            ( ADC_GPIO_3 ),
        .ADC_GPIO_4            ( ADC_GPIO_4 ),
        .HMC_GPIO_0            ( HMC_GPIO_0 ),
        .HMC_GPIO_1            ( HMC_GPIO_1 ),
        .SMPS_PWR_GOOD         ( SMPS_PWR_GOOD ),
        .LDO_PWR_GOOD          ( LDO_PWR_GOOD ),
        .ADC_LDO_PWR_GOOD      ( ADC_LDO_PWR_GOOD ),
        .SYNC_Input            ( INBUF_DIFF_0_Y ),
        .BTN                   ( BTN_1 ),
        .LANE_VAL              ( GND_net ),
        .CMD_Fifo_Empty        ( Communication_0_CMD_EMPTY ),
        .ANW_Fifo_Full         ( Communication_0_ANW_FULL ),
        .COMM_busy             ( Communication_0_busy ),
        .TRNV_busy             ( Transceiver_Main_0_busy ),
        .ANICI_busy            ( AnalyzInCirc_Top_0_busy ),
        .TRG_rx_data           ( Data_Block_0_C_read_data_frame ),
        .CMD_Fifo_Read_Data    ( Communication_0_CMD_Q ),
        .COMM_rx_data          ( Communication_0_read_data_frame ),
        .TRNV_rx_data          ( Transceiver_Main_0_read_data_frame ),
        .ANICI_rx_data         ( AnalyzInCirc_Top_0_read_data_frame ),
        .CLKC_busy             ( Clock_Reset_0_busy ),
        .CLKC_rx_data          ( Clock_Reset_0_read_data_frame ),
        // Outputs
        .ADC_sclk              ( ADC_sclk_net_0 ),
        .ADC_ss_n              ( ADC_ss_n_net_0 ),
        .TRG_enable_cmd        ( Controler_0_TRG_enable_cmd ),
        .TRG_write_read        ( Controler_0_TRG_write_read ),
        .SYS_Main_Reset_N      ( DBGport_2_net_0 ),
        .HMC_sclk              ( DBGport_3_0 ),
        .HMC_ss_n              ( HMC_ss_n_net_0 ),
        .LMX1_ss_n             ( LMX1_ss_n_net_0 ),
        .LMX1_mosi             ( LMX1_mosi_net_0 ),
        .LMX1_sclk             ( LMX1_sclk_net_0 ),
        .LMX2_ss_n             ( LMX2_ss_n_net_0 ),
        .LMX2_mosi             ( LMX2_mosi_net_0 ),
        .LMX2_sclk             ( LMX2_sclk_net_0 ),
        .EXT_ADC_Reset_N       ( DBGport_0_1 ),
        .EXT_HMC_Reset_N       ( DBGport_1_0 ),
        .EXT_LMX2_Reset_N      ( DBGport_3_1 ),
        .EXT_LMX1_Reset_N      ( DBGport_2_1 ),
        .INT_DataFifo_Reset_N  ( DBGport_4_1 ),
        .ADC_PWDN              ( ADC_PWDN_net_0 ),
        .HMC_SYNC              ( HMC_SYNC_net_0 ),
        .ADC_PWR_RUN           ( ADC_PWR_RUN_net_0 ),
        .BOARD_PWR_RUN         ( BOARD_PWR_RUN_net_0 ),
        .LED_2                 ( LED_4_net_0 ),
        .LED_3                 ( LED_3_net_0 ),
        .GPIO_0                (  ),
        .GPIO_1                ( DBGport_7_1 ),
        .INT_FtdiReset_N       ( FTDI_RESET_N_net_0 ),
        .HMC_GPIO_3            ( HMC_GPIO_3_net_0 ),
        .HMC_GPIO_2            ( HMC_GPIO_2_net_0 ),
        .LMX_Sync              ( Controler_0_LMX_Sync ),
        .CMD_Fifo_Read_Enable  ( Controler_0_CMD_Fifo_Read_Enable ),
        .ANW_Fifo_Write_Enable ( Controler_0_ANW_Fifo_Write_Enable ),
        .COMM_write_read       ( Controler_0_COMM_write_read ),
        .COMM_enable_cmd       ( Controler_0_COMM_enable_cmd ),
        .TRNV_write_read       ( Controler_0_TRNV_write_read ),
        .TRNV_enable_cmd       ( Controler_0_TRNV_enable_cmd ),
        .ANICI_write_read      ( Controler_0_ANICI_write_read ),
        .ANICI_enable_cmd      ( Controler_0_ANICI_enable_cmd ),
        .TRG_addr              ( Controler_0_TRG_addr ),
        .TRG_data              ( Controler_0_TRG_data ),
        .ANW_Fifo_Write_Data   ( Controler_0_ANW_Fifo_Write_Data ),
        .COMM_addr             ( Controler_0_COMM_addr ),
        .COMM_comm_number      ( Controler_0_COMM_comm_number ),
        .COMM_data             ( Controler_0_COMM_data ),
        .TRNV_addr             ( Controler_0_TRNV_addr ),
        .TRNV_data             ( Controler_0_TRNV_data ),
        .ANICI_addr            ( Controler_0_ANICI_addr ),
        .ANICI_data            ( Controler_0_ANICI_data ),
        .CLKC_write_read       ( Controler_0_CLKC_write_read ),
        .CLKC_addr             ( Controler_0_CLKC_addr ),
        .CLKC_data             ( Controler_0_CLKC_data ),
        .CLKC_enable_cmd       ( Controler_0_CLKC_enable_cmd ),
        // Inouts
        .HMC_sdio              ( HMC_sdio ),
        .ADC_sdio              ( ADC_sdio ) 
        );

//--------Data_Block
Data_Block Data_Block_0(
        // Inputs
        .C_enable_cmd                  ( Controler_0_TRG_enable_cmd ),
        .C_write_read                  ( Controler_0_TRG_write_read ),
        .Communication_Read            ( Communication_0_DataFifo_RD ),
        .Communication_Builder_RUN     ( Communication_0_Builder_Enable ),
        .Fifo_RESET_N                  ( DBGport_4_1 ),
        .Reset_N_Logic                 ( Clock_Reset_0_Reset_N_LogicData ),
        .Clock_Logic                   ( Clock_Reset_0_Clock_LogicData ),
        .C_addr_frame                  ( Controler_0_TRG_addr ),
        .C_write_data_frame            ( Controler_0_TRG_data ),
        .Input_Data_0_00               ( Transceiver_Main_0_Output_Data_1 ),
        .Input_Data_3_00               ( Transceiver_Main_0_Output_Data_2 ),
        .Input_Data_2_00               ( Transceiver_Main_0_Output_Data_3 ),
        .Input_Data_1_00               ( Transceiver_Main_0_Output_Data_0 ),
        .Input_Data_0_01               ( Transceiver_Main_0_Output_Data_5 ),
        .Input_Data_3_01               ( Transceiver_Main_0_Output_Data_6 ),
        .Input_Data_2_01               ( Transceiver_Main_0_Output_Data_7 ),
        .Input_Data_1_01               ( Transceiver_Main_0_Output_Data_4 ),
        .CTRL_Reset_N                  ( Clock_Reset_0_Main_RESET_N_0 ),
        .CTRL_Clock                    ( Clock_Reset_0_Main_CLOCK_0 ),
        // Outputs
        .C_busy                        ( Data_Block_0_C_busy ),
        .Communication_Empty           ( Data_Block_0_Communication_Empty ),
        .Diag_0                        (  ),
        .Diag_1                        (  ),
        .Diag_2                        (  ),
        .Diag_3                        (  ),
        .Communication_Data_Req        (  ),
        .Control_Test_Generator_Enable ( Data_Block_0_Control_Test_Generator_Enable ),
        .ACQ_RunOut                    ( Data_Block_0_ACQ_RunOut ),
        .C_read_data_frame             ( Data_Block_0_C_read_data_frame ),
        .Communication_Data_Frame      ( Data_Block_0_Communication_Data_Frame ) 
        );

//--------INBUF_DIFF
INBUF_DIFF INBUF_DIFF_0(
        // Inputs
        .PADP ( SYNC_IN_P ),
        .PADN ( SYNC_IN_N ),
        // Outputs
        .Y    ( INBUF_DIFF_0_Y ) 
        );

//--------INBUF_DIFF
INBUF_DIFF INBUF_DIFF_0_0(
        // Inputs
        .PADP ( HMC_CLK_IN_P ),
        .PADN ( HMC_CLK_IN_N ),
        // Outputs
        .Y    ( GPIO_0_net_0 ) 
        );

//--------OUTBUF_DIFF
OUTBUF_DIFF OUTBUF_DIFF_0(
        // Inputs
        .D    ( Synchronizer_0_Data_Out ),
        // Outputs
        .PADP ( SYNC_OUT_1_P_net_0 ),
        .PADN ( SYNC_OUT_1_N_net_0 ) 
        );

//--------OUTBUF_DIFF
OUTBUF_DIFF OUTBUF_DIFF_0_0(
        // Inputs
        .D    ( Synchronizer_0_Data_Out ),
        // Outputs
        .PADP ( SYNC_OUT_2_P_net_0 ),
        .PADN ( SYNC_OUT_2_N_net_0 ) 
        );

//--------OUTBUF_DIFF
OUTBUF_DIFF OUTBUF_DIFF_0_0_0(
        // Inputs
        .D    ( Clock_Reset_0_HMC_CLK ),
        // Outputs
        .PADP ( CLK_OUT_P_net_0 ),
        .PADN ( CLK_OUT_N_net_0 ) 
        );

//--------OUTBUF_DIFF
OUTBUF_DIFF OUTBUF_DIFF_0_0_1(
        // Inputs
        .D    ( GND_net ),
        // Outputs
        .PADP ( SYNCINB_P_net_0 ),
        .PADN ( SYNCINB_N_net_0 ) 
        );

//--------PF_IO_C0
PF_IO_C0 PF_IO_C0_0(
        // Inputs
        .D   ( GND_net ), // tied to 1'b0 from definition
        .E   ( GND_net ),
        // Outputs
        .Y   (  ),
        // Inouts
        .PAD ( IO_0 ) 
        );

//--------PF_IO_C0
PF_IO_C0 PF_IO_C0_0_0(
        // Inputs
        .D   ( Data_Block_0_ACQ_RunOut ),
        .E   ( VCC_net ),
        // Outputs
        .Y   (  ),
        // Inouts
        .PAD ( IO_1 ) 
        );

//--------Synchronizer
Synchronizer Synchronizer_0(
        // Inputs
        .nRST     ( Clock_Reset_0_Main_RESET_N_0 ),
        .CLK      ( GPIO_0_net_0 ),
        .Data_In  ( Controler_0_LMX_Sync ),
        // Outputs
        .Data_Out ( Synchronizer_0_Data_Out ) 
        );

//--------Transceiver_Main
Transceiver_Main Transceiver_Main_0(
        // Inputs
        .LANE1_RXD_N          ( LANE1_RXD_N ),
        .LANE0_RXD_P          ( LANE0_RXD_P ),
        .LANE0_RXD_N          ( LANE0_RXD_N ),
        .LANE1_RXD_P          ( LANE1_RXD_P ),
        .REF_Clock            ( Clock_Reset_0_Clock_XcvrRef ),
        .CTRL_Clock_40M       ( Clock_Reset_0_XCVR_CTRL_Clock_40M ),
        .Logic_Clock          ( Clock_Reset_0_Clock_LogicData ),
        .Logic_Reset_N        ( Clock_Reset_0_Reset_N_LogicData ),
        .Gen_Enable           ( Data_Block_0_Control_Test_Generator_Enable ),
        .write_read           ( Controler_0_TRNV_write_read ),
        .enable_cmd           ( Controler_0_TRNV_enable_cmd ),
        .addr_frame           ( Controler_0_TRNV_addr ),
        .write_data_frame     ( Controler_0_TRNV_data ),
        .CTRL_Reset_N         ( Clock_Reset_0_Main_RESET_N_0 ),
        .CTRL_Clock           ( Clock_Reset_0_Main_CLOCK_0 ),
        .REF_Reset_N          ( Clock_Reset_0_Reset_N_XcvrRef ),
        // Outputs
        .LANE1_TXD_N          ( LANE1_TXD_N_net_0 ),
        .LANE0_TXD_P          ( LANE0_TXD_P_net_0 ),
        .LANE0_TXD_N          ( LANE0_TXD_N_net_0 ),
        .LANE1_TXD_P          ( LANE1_TXD_P_net_0 ),
        .Data_Valid           (  ),
        .busy                 ( Transceiver_Main_0_busy ),
        .SYNCINB_OUT          ( Transceiver_Main_0_SYNCINB_OUT ),
        .Output_Data_7        ( Transceiver_Main_0_Output_Data_7 ),
        .Output_Data_0        ( Transceiver_Main_0_Output_Data_0 ),
        .Output_Data_1        ( Transceiver_Main_0_Output_Data_1 ),
        .Output_Data_2        ( Transceiver_Main_0_Output_Data_2 ),
        .Output_Data_3        ( Transceiver_Main_0_Output_Data_3 ),
        .Output_Data_4        ( Transceiver_Main_0_Output_Data_4 ),
        .Output_Data_5        ( Transceiver_Main_0_Output_Data_5 ),
        .Output_Data_6        ( Transceiver_Main_0_Output_Data_6 ),
        .read_data_frame      ( Transceiver_Main_0_read_data_frame ),
        .Transceivers_Rx_Data ( Transceiver_Main_0_Transceivers_Rx_Data ),
        .Transceivers_Rx_K    ( Transceiver_Main_0_Transceivers_Rx_K ) 
        );


endmodule
