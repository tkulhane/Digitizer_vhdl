//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Mon Aug 28 12:42:09 2023
// Version: 2022.1 2022.1.0.10
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// Transceiver
module Transceiver(
    // Inputs
    LANE0_RXD_N,
    LANE0_RXD_P,
    // Outputs
    LANE0_8B10B_RX_K,
    LANE0_RX_CLK_R,
    LANE0_RX_CODE_VIOLATION,
    LANE0_RX_DATA,
    LANE0_RX_DISPARITY_ERROR,
    LANE0_RX_IDLE,
    LANE0_RX_READY,
    LANE0_RX_READY_CDR,
    LANE0_RX_VAL,
    LANE0_RX_VAL_CDR,
    LANE0_TXD_N,
    LANE0_TXD_P,
    LANE0_TX_CLK_R,
    LANE0_TX_CLK_STABLE,
    SYNC_OK
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input         LANE0_RXD_N;
input         LANE0_RXD_P;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output [7:0]  LANE0_8B10B_RX_K;
output        LANE0_RX_CLK_R;
output [7:0]  LANE0_RX_CODE_VIOLATION;
output [63:0] LANE0_RX_DATA;
output [7:0]  LANE0_RX_DISPARITY_ERROR;
output        LANE0_RX_IDLE;
output        LANE0_RX_READY;
output        LANE0_RX_READY_CDR;
output        LANE0_RX_VAL;
output        LANE0_RX_VAL_CDR;
output        LANE0_TXD_N;
output        LANE0_TXD_P;
output        LANE0_TX_CLK_R;
output        LANE0_TX_CLK_STABLE;
output        SYNC_OK;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire          CORERESET_PF_C2_0_0_FABRIC_RESET_N;
wire          CORERESET_PF_C2_0_FABRIC_RESET_N;
wire   [7:0]  LANE0_8B10B_RX_K_net_0;
wire          LANE0_RX_CLK_R_net_0;
wire   [7:0]  LANE0_RX_CODE_VIOLATION_net_0;
wire   [63:0] LANE0_RX_DATA_net_0;
wire   [7:0]  LANE0_RX_DISPARITY_ERROR_net_0;
wire          LANE0_RX_IDLE_net_0;
wire          LANE0_RX_READY_net_0;
wire          LANE0_RX_READY_CDR_net_0;
wire          LANE0_RX_VAL_net_0;
wire          LANE0_RX_VAL_CDR_net_0;
wire          LANE0_RXD_N;
wire          LANE0_RXD_P;
wire          LANE0_TX_CLK_R_net_0;
wire          LANE0_TX_CLK_STABLE_net_0;
wire          LANE0_TXD_N_net_0;
wire          LANE0_TXD_P_net_0;
wire          PF_CCC_C2_0_OUT0_FABCLK_0;
wire          PF_CCC_C2_0_PLL_LOCK_0_0;
wire          PF_CLK_DIV_C0_0_CLK_OUT;
wire          PF_INIT_MONITOR_C1_0_DEVICE_INIT_DONE;
wire          PF_INIT_MONITOR_C1_0_FABRIC_POR_N;
wire          PF_INIT_MONITOR_C1_0_XCVR_INIT_DONE;
wire          PF_OSC_C0_0_RCOSC_160MHZ_GL;
wire          PF_TX_PLL_C0_0_CLKS_TO_XCVR_BIT_CLK;
wire          PF_TX_PLL_C0_0_CLKS_TO_XCVR_LOCK;
wire          PF_TX_PLL_C0_0_CLKS_TO_XCVR_REF_CLK_TO_LANE;
wire          SYNC_OK_net_0;
wire   [63:0] Test_Generator_XCVR_0_TX_Data;
wire   [7:0]  Test_Generator_XCVR_0_TX_K_Char;
wire          LANE0_TXD_P_net_1;
wire          LANE0_TXD_N_net_1;
wire          LANE0_TX_CLK_STABLE_net_1;
wire          LANE0_RX_CLK_R_net_1;
wire          LANE0_RX_IDLE_net_1;
wire          LANE0_RX_READY_net_1;
wire          LANE0_RX_VAL_net_1;
wire          LANE0_TX_CLK_R_net_1;
wire   [7:0]  LANE0_8B10B_RX_K_net_1;
wire   [7:0]  LANE0_RX_CODE_VIOLATION_net_1;
wire   [63:0] LANE0_RX_DATA_net_1;
wire   [7:0]  LANE0_RX_DISPARITY_ERROR_net_1;
wire          SYNC_OK_net_1;
wire          LANE0_RX_READY_CDR_net_1;
wire          LANE0_RX_VAL_CDR_net_1;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire          VCC_net;
wire          GND_net;
wire   [15:0] LANE0_TX_DISPFNC_const_net_0;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign VCC_net                      = 1'b1;
assign GND_net                      = 1'b0;
assign LANE0_TX_DISPFNC_const_net_0 = 16'h0000;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign LANE0_TXD_P_net_1              = LANE0_TXD_P_net_0;
assign LANE0_TXD_P                    = LANE0_TXD_P_net_1;
assign LANE0_TXD_N_net_1              = LANE0_TXD_N_net_0;
assign LANE0_TXD_N                    = LANE0_TXD_N_net_1;
assign LANE0_TX_CLK_STABLE_net_1      = LANE0_TX_CLK_STABLE_net_0;
assign LANE0_TX_CLK_STABLE            = LANE0_TX_CLK_STABLE_net_1;
assign LANE0_RX_CLK_R_net_1           = LANE0_RX_CLK_R_net_0;
assign LANE0_RX_CLK_R                 = LANE0_RX_CLK_R_net_1;
assign LANE0_RX_IDLE_net_1            = LANE0_RX_IDLE_net_0;
assign LANE0_RX_IDLE                  = LANE0_RX_IDLE_net_1;
assign LANE0_RX_READY_net_1           = LANE0_RX_READY_net_0;
assign LANE0_RX_READY                 = LANE0_RX_READY_net_1;
assign LANE0_RX_VAL_net_1             = LANE0_RX_VAL_net_0;
assign LANE0_RX_VAL                   = LANE0_RX_VAL_net_1;
assign LANE0_TX_CLK_R_net_1           = LANE0_TX_CLK_R_net_0;
assign LANE0_TX_CLK_R                 = LANE0_TX_CLK_R_net_1;
assign LANE0_8B10B_RX_K_net_1         = LANE0_8B10B_RX_K_net_0;
assign LANE0_8B10B_RX_K[7:0]          = LANE0_8B10B_RX_K_net_1;
assign LANE0_RX_CODE_VIOLATION_net_1  = LANE0_RX_CODE_VIOLATION_net_0;
assign LANE0_RX_CODE_VIOLATION[7:0]   = LANE0_RX_CODE_VIOLATION_net_1;
assign LANE0_RX_DATA_net_1            = LANE0_RX_DATA_net_0;
assign LANE0_RX_DATA[63:0]            = LANE0_RX_DATA_net_1;
assign LANE0_RX_DISPARITY_ERROR_net_1 = LANE0_RX_DISPARITY_ERROR_net_0;
assign LANE0_RX_DISPARITY_ERROR[7:0]  = LANE0_RX_DISPARITY_ERROR_net_1;
assign SYNC_OK_net_1                  = SYNC_OK_net_0;
assign SYNC_OK                        = SYNC_OK_net_1;
assign LANE0_RX_READY_CDR_net_1       = LANE0_RX_READY_CDR_net_0;
assign LANE0_RX_READY_CDR             = LANE0_RX_READY_CDR_net_1;
assign LANE0_RX_VAL_CDR_net_1         = LANE0_RX_VAL_CDR_net_0;
assign LANE0_RX_VAL_CDR               = LANE0_RX_VAL_CDR_net_1;
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------CORERESET_PF_C2
CORERESET_PF_C2 CORERESET_PF_C2_0(
        // Inputs
        .CLK                ( PF_OSC_C0_0_RCOSC_160MHZ_GL ),
        .EXT_RST_N          ( PF_INIT_MONITOR_C1_0_XCVR_INIT_DONE ),
        .BANK_x_VDDI_STATUS ( VCC_net ),
        .BANK_y_VDDI_STATUS ( VCC_net ),
        .PLL_LOCK           ( PF_CCC_C2_0_PLL_LOCK_0_0 ),
        .SS_BUSY            ( GND_net ),
        .INIT_DONE          ( PF_INIT_MONITOR_C1_0_DEVICE_INIT_DONE ),
        .FF_US_RESTORE      ( GND_net ),
        .FPGA_POR_N         ( PF_INIT_MONITOR_C1_0_FABRIC_POR_N ),
        // Outputs
        .PLL_POWERDOWN_B    (  ),
        .FABRIC_RESET_N     ( CORERESET_PF_C2_0_FABRIC_RESET_N ) 
        );

//--------CORERESET_PF_C2
CORERESET_PF_C2 CORERESET_PF_C2_0_0(
        // Inputs
        .CLK                ( LANE0_TX_CLK_R_net_0 ),
        .EXT_RST_N          ( VCC_net ),
        .BANK_x_VDDI_STATUS ( VCC_net ),
        .BANK_y_VDDI_STATUS ( VCC_net ),
        .PLL_LOCK           ( LANE0_TX_CLK_STABLE_net_0 ),
        .SS_BUSY            ( GND_net ),
        .INIT_DONE          ( PF_INIT_MONITOR_C1_0_DEVICE_INIT_DONE ),
        .FF_US_RESTORE      ( GND_net ),
        .FPGA_POR_N         ( PF_INIT_MONITOR_C1_0_FABRIC_POR_N ),
        // Outputs
        .PLL_POWERDOWN_B    (  ),
        .FABRIC_RESET_N     ( CORERESET_PF_C2_0_0_FABRIC_RESET_N ) 
        );

//--------PF_CCC_C2
PF_CCC_C2 PF_CCC_C2_0(
        // Inputs
        .REF_CLK_0         ( PF_OSC_C0_0_RCOSC_160MHZ_GL ),
        .PLL_POWERDOWN_N_0 ( VCC_net ),
        // Outputs
        .OUT0_FABCLK_0     ( PF_CCC_C2_0_OUT0_FABCLK_0 ),
        .PLL_LOCK_0        ( PF_CCC_C2_0_PLL_LOCK_0_0 ) 
        );

//--------PF_CLK_DIV_C0
PF_CLK_DIV_C0 PF_CLK_DIV_C0_0(
        // Inputs
        .CLK_IN  ( PF_OSC_C0_0_RCOSC_160MHZ_GL ),
        // Outputs
        .CLK_OUT ( PF_CLK_DIV_C0_0_CLK_OUT ) 
        );

//--------PF_INIT_MONITOR_C1
PF_INIT_MONITOR_C1 PF_INIT_MONITOR_C1_0(
        // Outputs
        .FABRIC_POR_N               ( PF_INIT_MONITOR_C1_0_FABRIC_POR_N ),
        .PCIE_INIT_DONE             (  ),
        .USRAM_INIT_DONE            (  ),
        .SRAM_INIT_DONE             (  ),
        .DEVICE_INIT_DONE           ( PF_INIT_MONITOR_C1_0_DEVICE_INIT_DONE ),
        .XCVR_INIT_DONE             ( PF_INIT_MONITOR_C1_0_XCVR_INIT_DONE ),
        .USRAM_INIT_FROM_SNVM_DONE  (  ),
        .USRAM_INIT_FROM_UPROM_DONE (  ),
        .USRAM_INIT_FROM_SPI_DONE   (  ),
        .SRAM_INIT_FROM_SNVM_DONE   (  ),
        .SRAM_INIT_FROM_UPROM_DONE  (  ),
        .SRAM_INIT_FROM_SPI_DONE    (  ),
        .AUTOCALIB_DONE             (  ) 
        );

//--------PF_OSC_C0
PF_OSC_C0 PF_OSC_C0_0(
        // Outputs
        .RCOSC_160MHZ_GL ( PF_OSC_C0_0_RCOSC_160MHZ_GL ) 
        );

//--------PF_TX_PLL_C0
PF_TX_PLL_C0 PF_TX_PLL_C0_0(
        // Inputs
        .REF_CLK         ( PF_CCC_C2_0_OUT0_FABCLK_0 ),
        // Outputs
        .PLL_LOCK        (  ),
        .LOCK            ( PF_TX_PLL_C0_0_CLKS_TO_XCVR_LOCK ),
        .BIT_CLK         ( PF_TX_PLL_C0_0_CLKS_TO_XCVR_BIT_CLK ),
        .REF_CLK_TO_LANE ( PF_TX_PLL_C0_0_CLKS_TO_XCVR_REF_CLK_TO_LANE ),
        .CLK_125         (  ) 
        );

//--------PF_XCVR_ERM_C5
PF_XCVR_ERM_C5 PF_XCVR_ERM_C5_0(
        // Inputs
        .LANE0_RXD_P              ( LANE0_RXD_P ),
        .LANE0_RXD_N              ( LANE0_RXD_N ),
        .LANE0_TX_DATA            ( Test_Generator_XCVR_0_TX_Data ),
        .LANE0_CDR_REF_CLK_0      ( PF_CCC_C2_0_OUT0_FABCLK_0 ),
        .LANE0_PCS_ARST_N         ( CORERESET_PF_C2_0_FABRIC_RESET_N ),
        .LANE0_PMA_ARST_N         ( CORERESET_PF_C2_0_FABRIC_RESET_N ),
        .LANE0_TX_DISPFNC         ( LANE0_TX_DISPFNC_const_net_0 ),
        .LANE0_8B10B_TX_K         ( Test_Generator_XCVR_0_TX_K_Char ),
        .TX_PLL_LOCK_0            ( PF_TX_PLL_C0_0_CLKS_TO_XCVR_LOCK ),
        .TX_BIT_CLK_0             ( PF_TX_PLL_C0_0_CLKS_TO_XCVR_BIT_CLK ),
        .TX_PLL_REF_CLK_0         ( PF_TX_PLL_C0_0_CLKS_TO_XCVR_REF_CLK_TO_LANE ),
        .CTRL_CLK                 ( PF_CLK_DIV_C0_0_CLK_OUT ),
        .CTRL_ARST_N              ( CORERESET_PF_C2_0_FABRIC_RESET_N ),
        .LANE0_LOS                ( GND_net ),
        // Outputs
        .LANE0_TXD_P              ( LANE0_TXD_P_net_0 ),
        .LANE0_TXD_N              ( LANE0_TXD_N_net_0 ),
        .LANE0_RX_DATA            ( LANE0_RX_DATA_net_0 ),
        .LANE0_TX_CLK_R           ( LANE0_TX_CLK_R_net_0 ),
        .LANE0_RX_CLK_R           ( LANE0_RX_CLK_R_net_0 ),
        .LANE0_RX_READY_CDR       ( LANE0_RX_READY_CDR_net_0 ),
        .LANE0_RX_VAL_CDR         ( LANE0_RX_VAL_CDR_net_0 ),
        .LANE0_RX_IDLE            ( LANE0_RX_IDLE_net_0 ),
        .LANE0_TX_CLK_STABLE      ( LANE0_TX_CLK_STABLE_net_0 ),
        .LANE0_RX_CODE_VIOLATION  ( LANE0_RX_CODE_VIOLATION_net_0 ),
        .LANE0_RX_DISPARITY_ERROR ( LANE0_RX_DISPARITY_ERROR_net_0 ),
        .LANE0_8B10B_RX_K         ( LANE0_8B10B_RX_K_net_0 ),
        .LANE0_RX_READY           ( LANE0_RX_READY_net_0 ),
        .LANE0_RX_VAL             ( LANE0_RX_VAL_net_0 ) 
        );

//--------SYNCinb_Handler
SYNCinb_Handler SYNCinb_Handler_0(
        // Inputs
        .Clock        ( LANE0_RX_CLK_R_net_0 ),
        .Reset_N      ( CORERESET_PF_C2_0_FABRIC_RESET_N ),
        .Lane_Rx_K    ( LANE0_8B10B_RX_K_net_0 ),
        .Lane_Rx_Data ( LANE0_RX_DATA_net_0 ),
        .Sync_Req     ( GND_net ),
        // Outputs
        .SYNC_OK      ( SYNC_OK_net_0 ) 
        );

//--------Test_Generator_XCVR
Test_Generator_XCVR Test_Generator_XCVR_0(
        // Inputs
        .Clock     ( LANE0_TX_CLK_R_net_0 ),
        .Reset_N   ( CORERESET_PF_C2_0_0_FABRIC_RESET_N ),
        .SYNC_OK   ( SYNC_OK_net_0 ),
        // Outputs
        .TX_Data   ( Test_Generator_XCVR_0_TX_Data ),
        .TX_K_Char ( Test_Generator_XCVR_0_TX_K_Char ) 
        );


endmodule
