//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Wed Sep 20 07:53:41 2023
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
    HMC_GPIO_0,
    HMC_GPIO_1,
    HMC_GPIO_2,
    HMC_GPIO_3,
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
    HMC_SYNC,
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
input         BTN_1;
input         BTN_2;
input         BTN_3;
input         BTN_4;
input         FTDI_CLK;
input         FTDI_nRXF;
input         FTDI_nTXE;
input         HMC_GPIO_0;
input         HMC_GPIO_1;
input         HMC_GPIO_2;
input         HMC_GPIO_3;
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
output        HMC_SYNC;
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
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire          ADC_FD;
wire          ADC_GPIO_0;
wire          ADC_GPIO_1;
wire          ADC_GPIO_2;
wire          ADC_GPIO_3;
wire          ADC_GPIO_4;
wire          ADC_LDO_PWR_GOOD;
wire          ADC_PWDN_net_0;
wire          ADC_PWR_RUN_net_0;
wire          ADC_sclk_net_0;
wire          ADC_sdio;
wire          ADC_ss_n_net_0;
wire          BOARD_PWR_RUN_net_0;
wire          BTN_1;
wire          BUFD_0_Y;
wire          CLK_OUT_N_net_0;
wire          CLK_OUT_P_net_0;
wire          Clock_Reset_0_Main_CLOCK_0;
wire          Clock_Reset_0_Main_RESET_N_0;
wire          Clock_Reset_0_UART_CLOCK_0;
wire          Clock_Reset_0_UART_RESER_N_0;
wire          Communication_Switch_0_busy;
wire   [31:0] Communication_Switch_0_DEST_1_Fifo_Data;
wire   [31:0] Communication_Switch_0_DEST_2_Fifo_Data;
wire          Communication_Switch_0_DEST_2_Fifo_Empty;
wire   [31:0] Communication_Switch_0_DEST_3_Fifo_Data;
wire   [15:0] Communication_Switch_0_read_data_frame;
wire   [7:0]  Controler_0_COMSW_addr;
wire   [15:0] Controler_0_COMSW_data;
wire          Controler_0_COMSW_enable_cmd;
wire          Controler_0_COMSW_write_read;
wire   [39:0] Controler_0_DEST_1_Fifo_Write_Data;
wire          Controler_0_DEST_1_Fifo_Write_Enable;
wire   [39:0] Controler_0_DEST_2_Fifo_Write_Data;
wire          Controler_0_DEST_2_Fifo_Write_Enable;
wire   [39:0] Controler_0_DEST_3_Fifo_Write_Data;
wire          Controler_0_SRC_1_Fifo_Read_Enable;
wire          Controler_0_SRC_2_Fifo_Read_Enable;
wire          Controler_0_SYNC_OUT_1;
wire          Controler_0_SYNC_OUT_2;
wire   [7:0]  Controler_0_TRG_addr;
wire   [15:0] Controler_0_TRG_data;
wire          Controler_0_TRG_enable_cmd;
wire          Controler_0_TRG_write_read;
wire          Data_Block_0_C_busy;
wire   [15:0] Data_Block_0_C_read_data_frame;
wire   [31:0] Data_Block_0_Communication_Data_Frame;
wire          DBGport_0_0;
wire          DBGport_0_1;
wire          DBGport_0_3;
wire          DBGport_1_net_0;
wire          DBGport_1_0;
wire          DBGport_1_2;
wire          DBGport_1_3;
wire          DBGport_2_net_0;
wire          DBGport_2_0;
wire          DBGport_2_1;
wire          DBGport_2_2;
wire          FTDI_nRXF;
wire          DBGport_2_4;
wire          DBGport_3_net_0;
wire          DBGport_3_0;
wire          DBGport_3_1;
wire          DBGport_3_2;
wire          DBGport_4_0;
wire          DBGport_4_1;
wire          DBGport_4_2;
wire          DBGport_4_3;
wire          FTDI_nTXE;
wire          DBGport_5_net_0;
wire          DBGport_5_0;
wire          DBGport_5_1;
wire          DBGport_5_3;
wire          DBGport_5_4;
wire          BTN_2;
wire          DBGport_6_1;
wire          DBGport_7_net_0;
wire   [3:0]  FTDI_BE;
wire          FTDI_CLK;
wire   [31:0] FTDI_DATA;
wire          FTDI_GPIO_0_net_0;
wire          FTDI_GPIO_1_net_0;
wire          FTDI_RESET_N_net_0;
wire          GPIO_0_net_0;
wire          GPIO_1_net_0;
wire          HMC_GPIO_0;
wire          HMC_GPIO_1;
wire          HMC_GPIO_2;
wire          HMC_GPIO_3;
wire          HMC_sdio;
wire          HMC_ss_n_net_0;
wire          HMC_SYNC_net_0;
wire          INBUF_DIFF_0_Y;
wire          LDO_PWR_GOOD;
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
wire          RX_1;
wire          SIWU_N_net_0;
wire          SMPS_PWR_GOOD;
wire          SYNC_IN_N;
wire          SYNC_IN_P;
wire          SYNC_OUT_1_N_net_0;
wire          SYNC_OUT_1_P_net_0;
wire          SYNC_OUT_2_N_net_0;
wire          SYNC_OUT_2_P_net_0;
wire          SYNCINB_N_net_0;
wire          SYNCINB_P_net_0;
wire          TX_0_net_0;
wire          TX_1_net_0;
wire   [39:0] UART_Protocol_0_RX_Fifo_Data;
wire          UART_Protocol_0_TX_FIFO_FULL;
wire          UART_Protocol_1_MD_Fifo_RE;
wire   [39:0] UART_Protocol_1_RX_Fifo_Data;
wire          UART_Protocol_1_TX_FIFO_FULL;
wire   [39:0] USB_3_Protocol_0_RX_FIFO_Data;
wire          DBGport_0_3_net_0;
wire          DBGport_1_3_net_0;
wire          DBGport_4_4_net_0;
wire          DBGport_5_4_net_0;
wire          TX_0_net_1;
wire          TX_1_net_1;
wire          LED_1_net_1;
wire          LED_2_net_1;
wire          LED_3_net_1;
wire          LED_4_net_1;
wire          DBGport_2_4_net_0;
wire          DBGport_3_2_net_0;
wire          DBGport_5_4_net_1;
wire          FTDI_GPIO_1_net_1;
wire          FTDI_GPIO_0_net_1;
wire          FTDI_RESET_N_net_1;
wire          DBGport_4_3_net_0;
wire          DBGport_5_1_net_0;
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
wire          DBGport_0_1_net_0;
wire          DBGport_1_0_net_0;
wire          DBGport_2_1_net_0;
wire          DBGport_3_1_net_0;
wire          HMC_SYNC_net_1;
wire          GPIO_1_net_1;
wire          GPIO_0_net_1;
wire          ADC_PWDN_net_1;
wire          ADC_PWR_RUN_net_1;
wire          BOARD_PWR_RUN_net_1;
wire          SYNC_OUT_1_P_net_1;
wire          SYNC_OUT_1_N_net_1;
wire          SYNC_OUT_2_P_net_1;
wire          SYNC_OUT_2_N_net_1;
wire          CLK_OUT_P_net_1;
wire          CLK_OUT_N_net_1;
wire          SYNCINB_P_net_1;
wire          SYNCINB_N_net_1;
wire          SIWU_N_net_1;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire          GND_net;
wire   [3:0]  Number_Communication_const_net_0;
wire   [3:0]  Number_Communication_const_net_1;
wire   [3:0]  Communication_Number_const_net_0;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign GND_net                          = 1'b0;
assign Number_Communication_const_net_0 = 4'h1;
assign Number_Communication_const_net_1 = 4'h2;
assign Communication_Number_const_net_0 = 4'h3;
//--------------------------------------------------------------------
// TieOff assignments
//--------------------------------------------------------------------
assign DBGport_6           = 1'b0;
assign DBGport_7           = 1'b0;
assign DBGport_8           = 1'b0;
assign DBGport_9           = 1'b0;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign DBGport_0_3_net_0   = DBGport_0_3;
assign DBGport_0           = DBGport_0_3_net_0;
assign DBGport_1_3_net_0   = DBGport_1_3;
assign DBGport_1           = DBGport_1_3_net_0;
assign DBGport_4_4_net_0   = FTDI_nTXE;
assign DBGport_4           = DBGport_4_4_net_0;
assign DBGport_5_4_net_0   = DBGport_5_4;
assign DBGport_5           = DBGport_5_4_net_0;
assign TX_0_net_1          = TX_0_net_0;
assign TX_0                = TX_0_net_1;
assign TX_1_net_1          = TX_1_net_0;
assign TX_1                = TX_1_net_1;
assign LED_1_net_1         = LED_1_net_0;
assign LED_1               = LED_1_net_1;
assign LED_2_net_1         = LED_2_net_0;
assign LED_2               = LED_2_net_1;
assign LED_3_net_1         = LED_3_net_0;
assign LED_3               = LED_3_net_1;
assign LED_4_net_1         = LED_4_net_0;
assign LED_4               = LED_4_net_1;
assign DBGport_2_4_net_0   = DBGport_2_4;
assign DBGport_2           = DBGport_2_4_net_0;
assign DBGport_3_2_net_0   = DBGport_3_2;
assign DBGport_3           = DBGport_3_2_net_0;
assign DBGport_5_4_net_1   = DBGport_5_4;
assign FTDI_nWR            = DBGport_5_4_net_1;
assign FTDI_GPIO_1_net_1   = FTDI_GPIO_1_net_0;
assign FTDI_GPIO_1         = FTDI_GPIO_1_net_1;
assign FTDI_GPIO_0_net_1   = FTDI_GPIO_0_net_0;
assign FTDI_GPIO_0         = FTDI_GPIO_0_net_1;
assign FTDI_RESET_N_net_1  = FTDI_RESET_N_net_0;
assign FTDI_RESET_N        = FTDI_RESET_N_net_1;
assign DBGport_4_3_net_0   = DBGport_4_3;
assign FTDI_nOE            = DBGport_4_3_net_0;
assign DBGport_5_1_net_0   = DBGport_5_1;
assign FTDI_nRD            = DBGport_5_1_net_0;
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
assign GPIO_1_net_1        = GPIO_1_net_0;
assign GPIO_1              = GPIO_1_net_1;
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
assign SIWU_N_net_1        = SIWU_N_net_0;
assign SIWU_N              = SIWU_N_net_1;
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------BUFD
BUFD BUFD_0(
        // Inputs
        .A ( FTDI_CLK ),
        // Outputs
        .Y ( BUFD_0_Y ) 
        );

//--------Clock_Reset
Clock_Reset Clock_Reset_0(
        // Inputs
        .EXT_RST_N    ( DBGport_2_net_0 ),
        // Outputs
        .Main_CLOCK   ( Clock_Reset_0_Main_CLOCK_0 ),
        .Main_RESET_N ( Clock_Reset_0_Main_RESET_N_0 ),
        .UART_CLOCK   ( Clock_Reset_0_UART_CLOCK_0 ),
        .UART_RESER_N ( Clock_Reset_0_UART_RESER_N_0 ) 
        );

//--------Communication_Switch
Communication_Switch Communication_Switch_0(
        // Inputs
        .Clock             ( Clock_Reset_0_Main_CLOCK_0 ),
        .Reset_N           ( Clock_Reset_0_Main_RESET_N_0 ),
        .enable_cmd        ( Controler_0_COMSW_enable_cmd ),
        .write_read        ( Controler_0_COMSW_write_read ),
        .DataFifo_Empty    ( DBGport_2_0 ),
        .DEST_1_Fifo_Read  ( DBGport_5_3 ),
        .DEST_2_Fifo_Read  ( UART_Protocol_1_MD_Fifo_RE ),
        .DEST_3_Fifo_Read  ( DBGport_3_net_0 ),
        .addr_frame        ( Controler_0_COMSW_addr ),
        .write_data_frame  ( Controler_0_COMSW_data ),
        .DafaFifo_Data     ( Data_Block_0_Communication_Data_Frame ),
        // Outputs
        .busy              ( Communication_Switch_0_busy ),
        .Builder_Enable    ( DBGport_1_net_0 ),
        .DataFifo_RD       ( DBGport_7_net_0 ),
        .DEST_1_Fifo_Empty ( DBGport_4_2 ),
        .DEST_2_Fifo_Empty ( Communication_Switch_0_DEST_2_Fifo_Empty ),
        .DEST_3_Fifo_Empty ( DBGport_2_2 ),
        .read_data_frame   ( Communication_Switch_0_read_data_frame ),
        .DEST_1_Fifo_Data  ( Communication_Switch_0_DEST_1_Fifo_Data ),
        .DEST_2_Fifo_Data  ( Communication_Switch_0_DEST_2_Fifo_Data ),
        .DEST_3_Fifo_Data  ( Communication_Switch_0_DEST_3_Fifo_Data ) 
        );

//--------Controler
Controler Controler_0(
        // Inputs
        .Clock                    ( Clock_Reset_0_Main_CLOCK_0 ),
        .Reset_N                  ( Clock_Reset_0_Main_RESET_N_0 ),
        .SRC_1_Fifo_Empty         ( DBGport_5_0 ),
        .DEST_1_Fifo_Full         ( UART_Protocol_0_TX_FIFO_FULL ),
        .DEST_2_Fifo_Full         ( UART_Protocol_1_TX_FIFO_FULL ),
        .SRC_2_Fifo_Empty         ( DBGport_6_1 ),
        .TRG_busy                 ( Data_Block_0_C_busy ),
        .LMX1_miso                ( LMX1_miso ),
        .LMX2_miso                ( LMX2_miso ),
        .SRC_3_Fifo_Empty         ( DBGport_0_0 ),
        .DEST_3_Fifo_Full         ( DBGport_4_0 ),
        .ADC_FD                   ( ADC_FD ),
        .ADC_GPIO_0               ( ADC_GPIO_0 ),
        .ADC_GPIO_1               ( ADC_GPIO_1 ),
        .ADC_GPIO_2               ( ADC_GPIO_2 ),
        .ADC_GPIO_3               ( ADC_GPIO_3 ),
        .ADC_GPIO_4               ( ADC_GPIO_4 ),
        .HMC_GPIO_2               ( HMC_GPIO_2 ),
        .HMC_GPIO_0               ( HMC_GPIO_0 ),
        .HMC_GPIO_1               ( HMC_GPIO_1 ),
        .HMC_GPIO_3               ( HMC_GPIO_3 ),
        .SMPS_PWR_GOOD            ( SMPS_PWR_GOOD ),
        .LDO_PWR_GOOD             ( LDO_PWR_GOOD ),
        .ADC_LDO_PWR_GOOD         ( ADC_LDO_PWR_GOOD ),
        .SYNC_Input               ( INBUF_DIFF_0_Y ),
        .BTN                      ( BTN_1 ),
        .LANE_VAL                 ( GND_net ),
        .COMSW_busy               ( Communication_Switch_0_busy ),
        .SRC_1_Fifo_Read_Data     ( UART_Protocol_0_RX_Fifo_Data ),
        .SRC_2_Fifo_Read_Data     ( UART_Protocol_1_RX_Fifo_Data ),
        .TRG_rx_data              ( Data_Block_0_C_read_data_frame ),
        .SRC_3_Fifo_Read_Data     ( USB_3_Protocol_0_RX_FIFO_Data ),
        .COMSW_rx_data            ( Communication_Switch_0_read_data_frame ),
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
        .SRC_3_Fifo_Read_Enable   ( DBGport_1_2 ),
        .DEST_3_Fifo_Write_Enable ( DBGport_5_net_0 ),
        .EXT_ADC_Reset_N          ( DBGport_0_1 ),
        .EXT_HMC_Reset_N          ( DBGport_1_0 ),
        .EXT_LMX2_Reset_N         ( DBGport_3_1 ),
        .EXT_LMX1_Reset_N         ( DBGport_2_1 ),
        .INT_DataFifo_Reset_N     ( DBGport_4_1 ),
        .ADC_PWDN                 ( ADC_PWDN_net_0 ),
        .HMC_SYNC                 ( HMC_SYNC_net_0 ),
        .ADC_PWR_RUN              ( ADC_PWR_RUN_net_0 ),
        .BOARD_PWR_RUN            ( BOARD_PWR_RUN_net_0 ),
        .LED_2                    ( LED_4_net_0 ),
        .LED_3                    ( LED_3_net_0 ),
        .GPIO_0                   ( GPIO_0_net_0 ),
        .GPIO_1                   ( GPIO_1_net_0 ),
        .SYNC_OUT_1               ( Controler_0_SYNC_OUT_1 ),
        .SYNC_OUT_2               ( Controler_0_SYNC_OUT_2 ),
        .COMSW_enable_cmd         ( Controler_0_COMSW_enable_cmd ),
        .COMSW_write_read         ( Controler_0_COMSW_write_read ),
        .INT_FtdiReset_N          ( FTDI_RESET_N_net_0 ),
        .DEST_1_Fifo_Write_Data   ( Controler_0_DEST_1_Fifo_Write_Data ),
        .DEST_2_Fifo_Write_Data   ( Controler_0_DEST_2_Fifo_Write_Data ),
        .TRG_addr                 ( Controler_0_TRG_addr ),
        .TRG_data                 ( Controler_0_TRG_data ),
        .DEST_3_Fifo_Write_Data   ( Controler_0_DEST_3_Fifo_Write_Data ),
        .COMSW_addr               ( Controler_0_COMSW_addr ),
        .COMSW_data               ( Controler_0_COMSW_data ),
        // Inouts
        .HMC_sdio                 ( HMC_sdio ),
        .ADC_sdio                 ( ADC_sdio ) 
        );

//--------Data_Block
Data_Block Data_Block_0(
        // Inputs
        .C_enable_cmd              ( Controler_0_TRG_enable_cmd ),
        .C_write_read              ( Controler_0_TRG_write_read ),
        .Clock                     ( Clock_Reset_0_Main_CLOCK_0 ),
        .Communication_Read        ( DBGport_7_net_0 ),
        .Communication_Builder_RUN ( DBGport_1_net_0 ),
        .Fifo_RESET_N              ( DBGport_4_1 ),
        .Reset_N                   ( Clock_Reset_0_Main_RESET_N_0 ),
        .C_addr_frame              ( Controler_0_TRG_addr ),
        .C_write_data_frame        ( Controler_0_TRG_data ),
        // Outputs
        .C_busy                    ( Data_Block_0_C_busy ),
        .Communication_Empty       ( DBGport_2_0 ),
        .Diag_0                    (  ),
        .Diag_1                    (  ),
        .Diag_2                    (  ),
        .Diag_3                    (  ),
        .Communication_Data_Req    (  ),
        .C_read_data_frame         ( Data_Block_0_C_read_data_frame ),
        .Communication_Data_Frame  ( Data_Block_0_Communication_Data_Frame ) 
        );

//--------INBUF_DIFF
INBUF_DIFF INBUF_DIFF_0(
        // Inputs
        .PADP ( SYNC_IN_P ),
        .PADN ( SYNC_IN_N ),
        // Outputs
        .Y    ( INBUF_DIFF_0_Y ) 
        );

//--------OUTBUF_DIFF
OUTBUF_DIFF OUTBUF_DIFF_0(
        // Inputs
        .D    ( Controler_0_SYNC_OUT_1 ),
        // Outputs
        .PADP ( SYNC_OUT_1_P_net_0 ),
        .PADN ( SYNC_OUT_1_N_net_0 ) 
        );

//--------OUTBUF_DIFF
OUTBUF_DIFF OUTBUF_DIFF_0_0(
        // Inputs
        .D    ( Controler_0_SYNC_OUT_2 ),
        // Outputs
        .PADP ( SYNC_OUT_2_P_net_0 ),
        .PADN ( SYNC_OUT_2_N_net_0 ) 
        );

//--------OUTBUF_DIFF
OUTBUF_DIFF OUTBUF_DIFF_0_0_0(
        // Inputs
        .D    ( Clock_Reset_0_Main_CLOCK_0 ),
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

//--------UART_Protocol
UART_Protocol UART_Protocol_0(
        // Inputs
        .RX                   ( RX_0 ),
        .UART_Clock           ( Clock_Reset_0_UART_CLOCK_0 ),
        .UART_RESET_N         ( Clock_Reset_0_UART_RESER_N_0 ),
        .Logic_Clock          ( Clock_Reset_0_Main_CLOCK_0 ),
        .Logic_RESET_N        ( Clock_Reset_0_Main_RESET_N_0 ),
        .RX_FIFO_RE           ( Controler_0_SRC_1_Fifo_Read_Enable ),
        .TX_FIFO_WE           ( Controler_0_DEST_1_Fifo_Write_Enable ),
        .MD_Fifo_Empty        ( DBGport_4_2 ),
        .TX_Fifo_Data         ( Controler_0_DEST_1_Fifo_Write_Data ),
        .Number_Communication ( Number_Communication_const_net_0 ),
        .MD_Fifo_Data         ( Communication_Switch_0_DEST_1_Fifo_Data ),
        // Outputs
        .TX                   ( TX_0_net_0 ),
        .Diag_Valid_LED       ( LED_1_net_0 ),
        .RX_FIFO_EMPTY        ( DBGport_5_0 ),
        .TX_FIFO_FULL         ( UART_Protocol_0_TX_FIFO_FULL ),
        .MD_Fifo_RE           ( DBGport_5_3 ),
        .RX_Fifo_Data         ( UART_Protocol_0_RX_Fifo_Data ) 
        );

//--------UART_Protocol
UART_Protocol UART_Protocol_1(
        // Inputs
        .RX                   ( RX_1 ),
        .UART_Clock           ( Clock_Reset_0_UART_CLOCK_0 ),
        .UART_RESET_N         ( Clock_Reset_0_UART_RESER_N_0 ),
        .Logic_Clock          ( Clock_Reset_0_Main_CLOCK_0 ),
        .Logic_RESET_N        ( Clock_Reset_0_Main_RESET_N_0 ),
        .RX_FIFO_RE           ( Controler_0_SRC_2_Fifo_Read_Enable ),
        .TX_FIFO_WE           ( Controler_0_DEST_2_Fifo_Write_Enable ),
        .MD_Fifo_Empty        ( Communication_Switch_0_DEST_2_Fifo_Empty ),
        .TX_Fifo_Data         ( Controler_0_DEST_2_Fifo_Write_Data ),
        .Number_Communication ( Number_Communication_const_net_1 ),
        .MD_Fifo_Data         ( Communication_Switch_0_DEST_2_Fifo_Data ),
        // Outputs
        .TX                   ( TX_1_net_0 ),
        .Diag_Valid_LED       ( LED_2_net_0 ),
        .RX_FIFO_EMPTY        ( DBGport_6_1 ),
        .TX_FIFO_FULL         ( UART_Protocol_1_TX_FIFO_FULL ),
        .MD_Fifo_RE           ( UART_Protocol_1_MD_Fifo_RE ),
        .RX_Fifo_Data         ( UART_Protocol_1_RX_Fifo_Data ) 
        );

//--------USB_3_Protocol
USB_3_Protocol USB_3_Protocol_0(
        // Inputs
        .FTDI_CLK             ( BUFD_0_Y ),
        .FTDI_nRXF            ( FTDI_nRXF ),
        .FTDI_nTXE            ( FTDI_nTXE ),
        .Main_CLK             ( Clock_Reset_0_Main_CLOCK_0 ),
        .Main_RESET_N         ( Clock_Reset_0_Main_RESET_N_0 ),
        .RX_FIFO_RE           ( DBGport_1_2 ),
        .TX_FIFO_WE           ( DBGport_5_net_0 ),
        .MD_Fifo_Empty        ( DBGport_2_2 ),
        .TX_FIFO_Data         ( Controler_0_DEST_3_Fifo_Write_Data ),
        .Communication_Number ( Communication_Number_const_net_0 ),
        .MD_Fifo_Data         ( Communication_Switch_0_DEST_3_Fifo_Data ),
        // Outputs
        .FTDI_nWR             ( DBGport_5_4 ),
        .FTDI_nOE             ( DBGport_4_3 ),
        .FTDI_nRD             ( DBGport_5_1 ),
        .FTDI_RESET_N         (  ),
        .FTDI_GPIO_0          ( FTDI_GPIO_0_net_0 ),
        .FTDI_GPIO_1          ( FTDI_GPIO_1_net_0 ),
        .RX_FIFO_EMPTY        ( DBGport_0_0 ),
        .TX_FULL              ( DBGport_4_0 ),
        .SIWU_N               ( SIWU_N_net_0 ),
        .DBG_FIFO_WR          ( DBGport_1_3 ),
        .DBG_FIFO_RD          ( DBGport_3_2 ),
        .DBG_EMPTY            ( DBGport_2_4 ),
        .MD_Fifo_RE           ( DBGport_3_net_0 ),
        .DBG_FIFO_AFULL       ( DBGport_0_3 ),
        .RX_FIFO_Data         ( USB_3_Protocol_0_RX_FIFO_Data ),
        // Inouts
        .FTDI_DATA            ( FTDI_DATA ),
        .FTDI_BE              ( FTDI_BE ) 
        );


endmodule
