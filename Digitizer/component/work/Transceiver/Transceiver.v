//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Wed Dec 27 22:22:20 2023
// Version: 2022.1 2022.1.0.10
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// Transceiver
module Transceiver(
    // Inputs
    LANE0_RXD_N,
    LANE0_RXD_P,
    LANE1_RXD_N,
    LANE1_RXD_P,
    LANE2_RXD_N,
    LANE2_RXD_P,
    LANE3_RXD_N,
    LANE3_RXD_P,
    // Outputs
    LANE0_8B10B_RX_K,
    LANE0_RX_DATA,
    LANE0_TXD_N,
    LANE0_TXD_P,
    LANE1_8B10B_RX_K,
    LANE1_RX_DATA,
    LANE1_TXD_N,
    LANE1_TXD_P,
    LANE2_8B10B_RX_K,
    LANE2_RX_DATA,
    LANE2_TXD_N,
    LANE2_TXD_P,
    LANE3_8B10B_RX_K,
    LANE3_RX_DATA,
    LANE3_TXD_N,
    LANE3_TXD_P,
    SYNC_OK
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input         LANE0_RXD_N;
input         LANE0_RXD_P;
input         LANE1_RXD_N;
input         LANE1_RXD_P;
input         LANE2_RXD_N;
input         LANE2_RXD_P;
input         LANE3_RXD_N;
input         LANE3_RXD_P;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output [7:0]  LANE0_8B10B_RX_K;
output [63:0] LANE0_RX_DATA;
output        LANE0_TXD_N;
output        LANE0_TXD_P;
output [7:0]  LANE1_8B10B_RX_K;
output [63:0] LANE1_RX_DATA;
output        LANE1_TXD_N;
output        LANE1_TXD_P;
output [7:0]  LANE2_8B10B_RX_K;
output [63:0] LANE2_RX_DATA;
output        LANE2_TXD_N;
output        LANE2_TXD_P;
output [7:0]  LANE3_8B10B_RX_K;
output [63:0] LANE3_RX_DATA;
output        LANE3_TXD_N;
output        LANE3_TXD_P;
output        SYNC_OK;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire          AND2_0_0_Y;
wire          AND2_0_Y;
wire          CORERESET_PF_C2_0_0_0_FABRIC_RESET_N;
wire          CORERESET_PF_C2_0_0_FABRIC_RESET_N;
wire          CORERESET_PF_C2_0_FABRIC_RESET_N_1;
wire   [7:0]  LANE0_8B10B_RX_K_net_0;
wire          LANE0_RX_CLK_R;
wire   [63:0] LANE0_RX_DATA_net_0;
wire          LANE0_RX_READY_CDR;
wire          LANE0_RX_VAL_CDR;
wire          LANE0_RXD_N;
wire          LANE0_RXD_P;
wire          LANE0_TX_CLK_STABLE;
wire          LANE0_TXD_N_net_0;
wire          LANE0_TXD_P_net_0;
wire   [7:0]  LANE1_8B10B_RX_K_net_0;
wire   [63:0] LANE1_RX_DATA_net_0;
wire          LANE1_RXD_N;
wire          LANE1_RXD_P;
wire          LANE1_TXD_N_net_0;
wire          LANE1_TXD_P_net_0;
wire   [7:0]  LANE2_8B10B_RX_K_net_0;
wire   [63:0] LANE2_RX_DATA_net_0;
wire          LANE2_RXD_N;
wire          LANE2_RXD_P;
wire          LANE2_TXD_N_net_0;
wire          LANE2_TXD_P_net_0;
wire   [7:0]  LANE3_8B10B_RX_K_net_0;
wire   [63:0] LANE3_RX_DATA_net_0;
wire          LANE3_RXD_N;
wire          LANE3_RXD_P;
wire          LANE3_TXD_N_net_0;
wire          LANE3_TXD_P_net_0;
wire          PF_CCC_C2_0_OUT0_FABCLK_0;
wire          PF_CCC_C2_0_PLL_LOCK_0_0;
wire          PF_CLK_DIV_C0_0_CLK_OUT;
wire          PF_INIT_MONITOR_C1_0_DEVICE_INIT_DONE;
wire          PF_INIT_MONITOR_C1_0_FABRIC_POR_N;
wire          PF_INIT_MONITOR_C1_0_XCVR_INIT_DONE;
wire          PF_OSC_C0_0_RCOSC_160MHZ_GL;
wire          PF_TX_PLL_C0_0_0_CLKS_TO_XCVR_BIT_CLK;
wire          PF_TX_PLL_C0_0_0_CLKS_TO_XCVR_LOCK;
wire          PF_TX_PLL_C0_0_0_CLKS_TO_XCVR_REF_CLK_TO_LANE;
wire          PF_TX_PLL_C0_0_CLKS_TO_XCVR_BIT_CLK;
wire          PF_TX_PLL_C0_0_CLKS_TO_XCVR_LOCK;
wire          PF_TX_PLL_C0_0_CLKS_TO_XCVR_REF_CLK_TO_LANE;
wire          PF_XCVR_ERM_C5_0_0_LANE0_RX_CLK_R;
wire          PF_XCVR_ERM_C5_0_0_LANE0_RX_READY_CDR;
wire          PF_XCVR_ERM_C5_0_0_LANE0_RX_VAL_CDR;
wire          PF_XCVR_ERM_C5_0_0_LANE0_TX_CLK_R;
wire          PF_XCVR_ERM_C5_0_0_LANE0_TX_CLK_STABLE;
wire          PF_XCVR_ERM_C5_0_0_LANE1_RX_CLK_R;
wire          PF_XCVR_ERM_C5_0_0_LANE1_RX_READY_CDR;
wire          PF_XCVR_ERM_C5_0_0_LANE1_RX_VAL_CDR;
wire          PF_XCVR_ERM_C5_0_0_LANE1_TX_CLK_R;
wire          PF_XCVR_ERM_C5_0_0_LANE1_TX_CLK_STABLE;
wire          PF_XCVR_ERM_C5_0_LANE0_TX_CLK_R;
wire          PF_XCVR_ERM_C5_0_LANE1_RX_CLK_R;
wire          PF_XCVR_ERM_C5_0_LANE1_RX_READY_CDR;
wire          PF_XCVR_ERM_C5_0_LANE1_RX_VAL_CDR;
wire          PF_XCVR_ERM_C5_0_LANE1_TX_CLK_R;
wire          PF_XCVR_ERM_C5_0_LANE1_TX_CLK_STABLE;
wire          SYNC_OK_2;
wire          SYNCinb_Handler_0_0_SYNC_OK;
wire          SYNCinb_Handler_0_1_SYNC_OK;
wire          SYNCinb_Handler_0_2_SYNC_OK;
wire          SYNCinb_Handler_0_SYNC_OK;
wire   [63:0] Test_Generator_XCVR_0_0_TX_Data;
wire   [7:0]  Test_Generator_XCVR_0_0_TX_K_Char;
wire   [63:0] Test_Generator_XCVR_0_1_0_TX_Data;
wire   [7:0]  Test_Generator_XCVR_0_1_0_TX_K_Char;
wire   [63:0] Test_Generator_XCVR_0_1_TX_Data;
wire   [7:0]  Test_Generator_XCVR_0_1_TX_K_Char;
wire   [63:0] Test_Generator_XCVR_0_TX_Data;
wire   [7:0]  Test_Generator_XCVR_0_TX_K_Char;
wire          LANE0_TXD_P_net_1;
wire          LANE0_TXD_N_net_1;
wire          SYNC_OK_2_net_0;
wire          LANE1_TXD_P_net_1;
wire          LANE1_TXD_N_net_1;
wire          LANE2_TXD_P_net_1;
wire          LANE2_TXD_N_net_1;
wire          LANE3_TXD_P_net_1;
wire          LANE3_TXD_N_net_1;
wire   [63:0] LANE0_RX_DATA_net_1;
wire   [7:0]  LANE0_8B10B_RX_K_net_1;
wire   [7:0]  LANE1_8B10B_RX_K_net_1;
wire   [63:0] LANE1_RX_DATA_net_1;
wire   [7:0]  LANE2_8B10B_RX_K_net_1;
wire   [7:0]  LANE3_8B10B_RX_K_net_1;
wire   [63:0] LANE2_RX_DATA_net_1;
wire   [63:0] LANE3_RX_DATA_net_1;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire          VCC_net;
wire          GND_net;
wire   [15:0] LANE0_TX_DISPFNC_const_net_0;
wire   [15:0] LANE1_TX_DISPFNC_const_net_0;
wire   [15:0] LANE0_TX_DISPFNC_const_net_1;
wire   [15:0] LANE1_TX_DISPFNC_const_net_1;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign VCC_net                      = 1'b1;
assign GND_net                      = 1'b0;
assign LANE0_TX_DISPFNC_const_net_0 = 16'h0000;
assign LANE1_TX_DISPFNC_const_net_0 = 16'h0000;
assign LANE0_TX_DISPFNC_const_net_1 = 16'h0000;
assign LANE1_TX_DISPFNC_const_net_1 = 16'h0000;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign LANE0_TXD_P_net_1      = LANE0_TXD_P_net_0;
assign LANE0_TXD_P            = LANE0_TXD_P_net_1;
assign LANE0_TXD_N_net_1      = LANE0_TXD_N_net_0;
assign LANE0_TXD_N            = LANE0_TXD_N_net_1;
assign SYNC_OK_2_net_0        = SYNC_OK_2;
assign SYNC_OK                = SYNC_OK_2_net_0;
assign LANE1_TXD_P_net_1      = LANE1_TXD_P_net_0;
assign LANE1_TXD_P            = LANE1_TXD_P_net_1;
assign LANE1_TXD_N_net_1      = LANE1_TXD_N_net_0;
assign LANE1_TXD_N            = LANE1_TXD_N_net_1;
assign LANE2_TXD_P_net_1      = LANE2_TXD_P_net_0;
assign LANE2_TXD_P            = LANE2_TXD_P_net_1;
assign LANE2_TXD_N_net_1      = LANE2_TXD_N_net_0;
assign LANE2_TXD_N            = LANE2_TXD_N_net_1;
assign LANE3_TXD_P_net_1      = LANE3_TXD_P_net_0;
assign LANE3_TXD_P            = LANE3_TXD_P_net_1;
assign LANE3_TXD_N_net_1      = LANE3_TXD_N_net_0;
assign LANE3_TXD_N            = LANE3_TXD_N_net_1;
assign LANE0_RX_DATA_net_1    = LANE0_RX_DATA_net_0;
assign LANE0_RX_DATA[63:0]    = LANE0_RX_DATA_net_1;
assign LANE0_8B10B_RX_K_net_1 = LANE0_8B10B_RX_K_net_0;
assign LANE0_8B10B_RX_K[7:0]  = LANE0_8B10B_RX_K_net_1;
assign LANE1_8B10B_RX_K_net_1 = LANE1_8B10B_RX_K_net_0;
assign LANE1_8B10B_RX_K[7:0]  = LANE1_8B10B_RX_K_net_1;
assign LANE1_RX_DATA_net_1    = LANE1_RX_DATA_net_0;
assign LANE1_RX_DATA[63:0]    = LANE1_RX_DATA_net_1;
assign LANE2_8B10B_RX_K_net_1 = LANE2_8B10B_RX_K_net_0;
assign LANE2_8B10B_RX_K[7:0]  = LANE2_8B10B_RX_K_net_1;
assign LANE3_8B10B_RX_K_net_1 = LANE3_8B10B_RX_K_net_0;
assign LANE3_8B10B_RX_K[7:0]  = LANE3_8B10B_RX_K_net_1;
assign LANE2_RX_DATA_net_1    = LANE2_RX_DATA_net_0;
assign LANE2_RX_DATA[63:0]    = LANE2_RX_DATA_net_1;
assign LANE3_RX_DATA_net_1    = LANE3_RX_DATA_net_0;
assign LANE3_RX_DATA[63:0]    = LANE3_RX_DATA_net_1;
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------AND2
AND2 AND2_0(
        // Inputs
        .A ( SYNCinb_Handler_0_SYNC_OK ),
        .B ( SYNCinb_Handler_0_0_SYNC_OK ),
        // Outputs
        .Y ( AND2_0_Y ) 
        );

//--------AND2
AND2 AND2_0_0(
        // Inputs
        .A ( SYNCinb_Handler_0_1_SYNC_OK ),
        .B ( SYNCinb_Handler_0_2_SYNC_OK ),
        // Outputs
        .Y ( AND2_0_0_Y ) 
        );

//--------AND2
AND2 AND2_0_0_0(
        // Inputs
        .A ( AND2_0_Y ),
        .B ( AND2_0_0_Y ),
        // Outputs
        .Y ( SYNC_OK_2 ) 
        );

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
        .FABRIC_RESET_N     ( CORERESET_PF_C2_0_FABRIC_RESET_N_1 ) 
        );

//--------CORERESET_PF_C2
CORERESET_PF_C2 CORERESET_PF_C2_0_0(
        // Inputs
        .CLK                ( PF_XCVR_ERM_C5_0_LANE0_TX_CLK_R ),
        .EXT_RST_N          ( VCC_net ),
        .BANK_x_VDDI_STATUS ( VCC_net ),
        .BANK_y_VDDI_STATUS ( VCC_net ),
        .PLL_LOCK           ( LANE0_TX_CLK_STABLE ),
        .SS_BUSY            ( GND_net ),
        .INIT_DONE          ( PF_INIT_MONITOR_C1_0_DEVICE_INIT_DONE ),
        .FF_US_RESTORE      ( GND_net ),
        .FPGA_POR_N         ( PF_INIT_MONITOR_C1_0_FABRIC_POR_N ),
        // Outputs
        .PLL_POWERDOWN_B    (  ),
        .FABRIC_RESET_N     ( CORERESET_PF_C2_0_0_FABRIC_RESET_N ) 
        );

//--------CORERESET_PF_C2
CORERESET_PF_C2 CORERESET_PF_C2_0_0_0(
        // Inputs
        .CLK                ( PF_XCVR_ERM_C5_0_LANE1_TX_CLK_R ),
        .EXT_RST_N          ( VCC_net ),
        .BANK_x_VDDI_STATUS ( VCC_net ),
        .BANK_y_VDDI_STATUS ( VCC_net ),
        .PLL_LOCK           ( PF_XCVR_ERM_C5_0_LANE1_TX_CLK_STABLE ),
        .SS_BUSY            ( GND_net ),
        .INIT_DONE          ( PF_INIT_MONITOR_C1_0_DEVICE_INIT_DONE ),
        .FF_US_RESTORE      ( GND_net ),
        .FPGA_POR_N         ( PF_INIT_MONITOR_C1_0_FABRIC_POR_N ),
        // Outputs
        .PLL_POWERDOWN_B    (  ),
        .FABRIC_RESET_N     ( CORERESET_PF_C2_0_0_0_FABRIC_RESET_N ) 
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
        .REF_CLK_TO_LANE ( PF_TX_PLL_C0_0_CLKS_TO_XCVR_REF_CLK_TO_LANE ) 
        );

//--------PF_TX_PLL_C0
PF_TX_PLL_C0 PF_TX_PLL_C0_0_0(
        // Inputs
        .REF_CLK         ( PF_CCC_C2_0_OUT0_FABCLK_0 ),
        // Outputs
        .PLL_LOCK        (  ),
        .LOCK            ( PF_TX_PLL_C0_0_0_CLKS_TO_XCVR_LOCK ),
        .BIT_CLK         ( PF_TX_PLL_C0_0_0_CLKS_TO_XCVR_BIT_CLK ),
        .REF_CLK_TO_LANE ( PF_TX_PLL_C0_0_0_CLKS_TO_XCVR_REF_CLK_TO_LANE ) 
        );

//--------PF_XCVR_ERM_C5
PF_XCVR_ERM_C5 PF_XCVR_ERM_C5_0(
        // Inputs
        .LANE0_RXD_P              ( LANE0_RXD_P ),
        .LANE0_RXD_N              ( LANE0_RXD_N ),
        .LANE1_RXD_P              ( LANE1_RXD_P ),
        .LANE1_RXD_N              ( LANE1_RXD_N ),
        .LANE0_CDR_REF_CLK_0      ( PF_CCC_C2_0_OUT0_FABCLK_0 ),
        .LANE0_PCS_ARST_N         ( CORERESET_PF_C2_0_FABRIC_RESET_N_1 ),
        .LANE0_PMA_ARST_N         ( CORERESET_PF_C2_0_FABRIC_RESET_N_1 ),
        .LANE1_CDR_REF_CLK_0      ( PF_CCC_C2_0_OUT0_FABCLK_0 ),
        .LANE1_PCS_ARST_N         ( CORERESET_PF_C2_0_FABRIC_RESET_N_1 ),
        .LANE1_PMA_ARST_N         ( CORERESET_PF_C2_0_FABRIC_RESET_N_1 ),
        .TX_PLL_LOCK_0            ( PF_TX_PLL_C0_0_CLKS_TO_XCVR_LOCK ),
        .TX_BIT_CLK_0             ( PF_TX_PLL_C0_0_CLKS_TO_XCVR_BIT_CLK ),
        .TX_PLL_REF_CLK_0         ( PF_TX_PLL_C0_0_CLKS_TO_XCVR_REF_CLK_TO_LANE ),
        .CTRL_CLK                 ( PF_CLK_DIV_C0_0_CLK_OUT ),
        .CTRL_ARST_N              ( CORERESET_PF_C2_0_FABRIC_RESET_N_1 ),
        .LANE0_LOS                ( GND_net ),
        .LANE0_CLK_REF            ( PF_CCC_C2_0_OUT0_FABCLK_0 ),
        .LANE1_LOS                ( GND_net ),
        .LANE1_CLK_REF            ( PF_CCC_C2_0_OUT0_FABCLK_0 ),
        .LANE0_TX_DATA            ( Test_Generator_XCVR_0_TX_Data ),
        .LANE0_TX_DISPFNC         ( LANE0_TX_DISPFNC_const_net_0 ),
        .LANE0_8B10B_TX_K         ( Test_Generator_XCVR_0_TX_K_Char ),
        .LANE1_TX_DATA            ( Test_Generator_XCVR_0_0_TX_Data ),
        .LANE1_TX_DISPFNC         ( LANE1_TX_DISPFNC_const_net_0 ),
        .LANE1_8B10B_TX_K         ( Test_Generator_XCVR_0_0_TX_K_Char ),
        // Outputs
        .LANE0_TXD_P              ( LANE0_TXD_P_net_0 ),
        .LANE0_TXD_N              ( LANE0_TXD_N_net_0 ),
        .LANE1_TXD_P              ( LANE1_TXD_P_net_0 ),
        .LANE1_TXD_N              ( LANE1_TXD_N_net_0 ),
        .LANE0_TX_CLK_R           ( PF_XCVR_ERM_C5_0_LANE0_TX_CLK_R ),
        .LANE0_RX_CLK_R           ( LANE0_RX_CLK_R ),
        .LANE0_RX_READY_CDR       ( LANE0_RX_READY_CDR ),
        .LANE0_RX_VAL_CDR         ( LANE0_RX_VAL_CDR ),
        .LANE0_RX_IDLE            (  ),
        .LANE0_TX_CLK_STABLE      ( LANE0_TX_CLK_STABLE ),
        .LANE1_TX_CLK_R           ( PF_XCVR_ERM_C5_0_LANE1_TX_CLK_R ),
        .LANE1_RX_CLK_R           ( PF_XCVR_ERM_C5_0_LANE1_RX_CLK_R ),
        .LANE1_RX_READY_CDR       ( PF_XCVR_ERM_C5_0_LANE1_RX_READY_CDR ),
        .LANE1_RX_VAL_CDR         ( PF_XCVR_ERM_C5_0_LANE1_RX_VAL_CDR ),
        .LANE1_RX_IDLE            (  ),
        .LANE1_TX_CLK_STABLE      ( PF_XCVR_ERM_C5_0_LANE1_TX_CLK_STABLE ),
        .LANE0_RX_READY           (  ),
        .LANE0_RX_VAL             (  ),
        .LANE1_RX_READY           (  ),
        .LANE1_RX_VAL             (  ),
        .LANE0_RX_DATA            ( LANE0_RX_DATA_net_0 ),
        .LANE0_RX_CODE_VIOLATION  (  ),
        .LANE0_RX_DISPARITY_ERROR (  ),
        .LANE0_8B10B_RX_K         ( LANE0_8B10B_RX_K_net_0 ),
        .LANE1_RX_DATA            ( LANE1_RX_DATA_net_0 ),
        .LANE1_RX_CODE_VIOLATION  (  ),
        .LANE1_RX_DISPARITY_ERROR (  ),
        .LANE1_8B10B_RX_K         ( LANE1_8B10B_RX_K_net_0 ) 
        );

//--------PF_XCVR_ERM_C5
PF_XCVR_ERM_C5 PF_XCVR_ERM_C5_0_0(
        // Inputs
        .LANE0_RXD_P              ( LANE2_RXD_P ),
        .LANE0_RXD_N              ( LANE2_RXD_N ),
        .LANE1_RXD_P              ( LANE3_RXD_P ),
        .LANE1_RXD_N              ( LANE3_RXD_N ),
        .LANE0_CDR_REF_CLK_0      ( PF_CCC_C2_0_OUT0_FABCLK_0 ),
        .LANE0_PCS_ARST_N         ( CORERESET_PF_C2_0_FABRIC_RESET_N_1 ),
        .LANE0_PMA_ARST_N         ( CORERESET_PF_C2_0_FABRIC_RESET_N_1 ),
        .LANE1_CDR_REF_CLK_0      ( PF_CCC_C2_0_OUT0_FABCLK_0 ),
        .LANE1_PCS_ARST_N         ( CORERESET_PF_C2_0_FABRIC_RESET_N_1 ),
        .LANE1_PMA_ARST_N         ( CORERESET_PF_C2_0_FABRIC_RESET_N_1 ),
        .TX_PLL_LOCK_0            ( PF_TX_PLL_C0_0_0_CLKS_TO_XCVR_LOCK ),
        .TX_BIT_CLK_0             ( PF_TX_PLL_C0_0_0_CLKS_TO_XCVR_BIT_CLK ),
        .TX_PLL_REF_CLK_0         ( PF_TX_PLL_C0_0_0_CLKS_TO_XCVR_REF_CLK_TO_LANE ),
        .CTRL_CLK                 ( PF_CLK_DIV_C0_0_CLK_OUT ),
        .CTRL_ARST_N              ( CORERESET_PF_C2_0_FABRIC_RESET_N_1 ),
        .LANE0_LOS                ( GND_net ),
        .LANE0_CLK_REF            ( PF_CCC_C2_0_OUT0_FABCLK_0 ),
        .LANE1_LOS                ( GND_net ),
        .LANE1_CLK_REF            ( PF_CCC_C2_0_OUT0_FABCLK_0 ),
        .LANE0_TX_DATA            ( Test_Generator_XCVR_0_1_TX_Data ),
        .LANE0_TX_DISPFNC         ( LANE0_TX_DISPFNC_const_net_1 ),
        .LANE0_8B10B_TX_K         ( Test_Generator_XCVR_0_1_TX_K_Char ),
        .LANE1_TX_DATA            ( Test_Generator_XCVR_0_1_0_TX_Data ),
        .LANE1_TX_DISPFNC         ( LANE1_TX_DISPFNC_const_net_1 ),
        .LANE1_8B10B_TX_K         ( Test_Generator_XCVR_0_1_0_TX_K_Char ),
        // Outputs
        .LANE0_TXD_P              ( LANE2_TXD_P_net_0 ),
        .LANE0_TXD_N              ( LANE2_TXD_N_net_0 ),
        .LANE1_TXD_P              ( LANE3_TXD_P_net_0 ),
        .LANE1_TXD_N              ( LANE3_TXD_N_net_0 ),
        .LANE0_TX_CLK_R           ( PF_XCVR_ERM_C5_0_0_LANE0_TX_CLK_R ),
        .LANE0_RX_CLK_R           ( PF_XCVR_ERM_C5_0_0_LANE0_RX_CLK_R ),
        .LANE0_RX_READY_CDR       ( PF_XCVR_ERM_C5_0_0_LANE0_RX_READY_CDR ),
        .LANE0_RX_VAL_CDR         ( PF_XCVR_ERM_C5_0_0_LANE0_RX_VAL_CDR ),
        .LANE0_RX_IDLE            (  ),
        .LANE0_TX_CLK_STABLE      ( PF_XCVR_ERM_C5_0_0_LANE0_TX_CLK_STABLE ),
        .LANE1_TX_CLK_R           ( PF_XCVR_ERM_C5_0_0_LANE1_TX_CLK_R ),
        .LANE1_RX_CLK_R           ( PF_XCVR_ERM_C5_0_0_LANE1_RX_CLK_R ),
        .LANE1_RX_READY_CDR       ( PF_XCVR_ERM_C5_0_0_LANE1_RX_READY_CDR ),
        .LANE1_RX_VAL_CDR         ( PF_XCVR_ERM_C5_0_0_LANE1_RX_VAL_CDR ),
        .LANE1_RX_IDLE            (  ),
        .LANE1_TX_CLK_STABLE      ( PF_XCVR_ERM_C5_0_0_LANE1_TX_CLK_STABLE ),
        .LANE0_RX_READY           (  ),
        .LANE0_RX_VAL             (  ),
        .LANE1_RX_READY           (  ),
        .LANE1_RX_VAL             (  ),
        .LANE0_RX_DATA            ( LANE2_RX_DATA_net_0 ),
        .LANE0_RX_CODE_VIOLATION  (  ),
        .LANE0_RX_DISPARITY_ERROR (  ),
        .LANE0_8B10B_RX_K         ( LANE2_8B10B_RX_K_net_0 ),
        .LANE1_RX_DATA            ( LANE3_RX_DATA_net_0 ),
        .LANE1_RX_CODE_VIOLATION  (  ),
        .LANE1_RX_DISPARITY_ERROR (  ),
        .LANE1_8B10B_RX_K         ( LANE3_8B10B_RX_K_net_0 ) 
        );

//--------SYNCinb_Handler
SYNCinb_Handler SYNCinb_Handler_0(
        // Inputs
        .Clock             ( LANE0_RX_CLK_R ),
        .Reset_N           ( CORERESET_PF_C2_0_FABRIC_RESET_N_1 ),
        .LANE_RX_READY_CDR ( LANE0_RX_READY_CDR ),
        .LANE_RX_VAL_CDR   ( LANE0_RX_VAL_CDR ),
        .Sync_Req          ( GND_net ),
        .Lane_Rx_K         ( LANE0_8B10B_RX_K_net_0 ),
        .Lane_Rx_Data      ( LANE0_RX_DATA_net_0 ),
        // Outputs
        .SYNC_OK           ( SYNCinb_Handler_0_SYNC_OK ) 
        );

//--------SYNCinb_Handler
SYNCinb_Handler SYNCinb_Handler_0_0(
        // Inputs
        .Clock             ( PF_XCVR_ERM_C5_0_LANE1_RX_CLK_R ),
        .Reset_N           ( CORERESET_PF_C2_0_FABRIC_RESET_N_1 ),
        .LANE_RX_READY_CDR ( PF_XCVR_ERM_C5_0_LANE1_RX_READY_CDR ),
        .LANE_RX_VAL_CDR   ( PF_XCVR_ERM_C5_0_LANE1_RX_VAL_CDR ),
        .Sync_Req          ( GND_net ),
        .Lane_Rx_K         ( LANE1_8B10B_RX_K_net_0 ),
        .Lane_Rx_Data      ( LANE1_RX_DATA_net_0 ),
        // Outputs
        .SYNC_OK           ( SYNCinb_Handler_0_0_SYNC_OK ) 
        );

//--------SYNCinb_Handler
SYNCinb_Handler SYNCinb_Handler_0_1(
        // Inputs
        .Clock             ( PF_XCVR_ERM_C5_0_0_LANE0_RX_CLK_R ),
        .Reset_N           ( CORERESET_PF_C2_0_FABRIC_RESET_N_1 ),
        .LANE_RX_READY_CDR ( PF_XCVR_ERM_C5_0_0_LANE0_RX_READY_CDR ),
        .LANE_RX_VAL_CDR   ( PF_XCVR_ERM_C5_0_0_LANE0_RX_VAL_CDR ),
        .Sync_Req          ( GND_net ),
        .Lane_Rx_K         ( LANE2_8B10B_RX_K_net_0 ),
        .Lane_Rx_Data      ( LANE2_RX_DATA_net_0 ),
        // Outputs
        .SYNC_OK           ( SYNCinb_Handler_0_1_SYNC_OK ) 
        );

//--------SYNCinb_Handler
SYNCinb_Handler SYNCinb_Handler_0_2(
        // Inputs
        .Clock             ( PF_XCVR_ERM_C5_0_0_LANE1_RX_CLK_R ),
        .Reset_N           ( CORERESET_PF_C2_0_FABRIC_RESET_N_1 ),
        .LANE_RX_READY_CDR ( PF_XCVR_ERM_C5_0_0_LANE1_RX_READY_CDR ),
        .LANE_RX_VAL_CDR   ( PF_XCVR_ERM_C5_0_0_LANE1_RX_VAL_CDR ),
        .Sync_Req          ( GND_net ),
        .Lane_Rx_K         ( LANE3_8B10B_RX_K_net_0 ),
        .Lane_Rx_Data      ( LANE3_RX_DATA_net_0 ),
        // Outputs
        .SYNC_OK           ( SYNCinb_Handler_0_2_SYNC_OK ) 
        );

//--------Test_Generator_XCVR
Test_Generator_XCVR Test_Generator_XCVR_0(
        // Inputs
        .Clock     ( PF_XCVR_ERM_C5_0_LANE0_TX_CLK_R ),
        .Reset_N   ( CORERESET_PF_C2_0_0_FABRIC_RESET_N ),
        .SYNC_OK   ( SYNC_OK_2 ),
        // Outputs
        .TX_Data   ( Test_Generator_XCVR_0_TX_Data ),
        .TX_K_Char ( Test_Generator_XCVR_0_TX_K_Char ) 
        );

//--------Test_Generator_XCVR
Test_Generator_XCVR Test_Generator_XCVR_0_0(
        // Inputs
        .Clock     ( PF_XCVR_ERM_C5_0_LANE1_TX_CLK_R ),
        .Reset_N   ( CORERESET_PF_C2_0_0_0_FABRIC_RESET_N ),
        .SYNC_OK   ( SYNC_OK_2 ),
        // Outputs
        .TX_Data   ( Test_Generator_XCVR_0_0_TX_Data ),
        .TX_K_Char ( Test_Generator_XCVR_0_0_TX_K_Char ) 
        );

//--------Test_Generator_XCVR
Test_Generator_XCVR Test_Generator_XCVR_0_1(
        // Inputs
        .Clock     ( PF_XCVR_ERM_C5_0_0_LANE0_TX_CLK_R ),
        .Reset_N   ( PF_XCVR_ERM_C5_0_0_LANE0_TX_CLK_STABLE ),
        .SYNC_OK   ( SYNC_OK_2 ),
        // Outputs
        .TX_Data   ( Test_Generator_XCVR_0_1_TX_Data ),
        .TX_K_Char ( Test_Generator_XCVR_0_1_TX_K_Char ) 
        );

//--------Test_Generator_XCVR
Test_Generator_XCVR Test_Generator_XCVR_0_1_0(
        // Inputs
        .Clock     ( PF_XCVR_ERM_C5_0_0_LANE1_TX_CLK_R ),
        .Reset_N   ( PF_XCVR_ERM_C5_0_0_LANE1_TX_CLK_STABLE ),
        .SYNC_OK   ( SYNC_OK_2 ),
        // Outputs
        .TX_Data   ( Test_Generator_XCVR_0_1_0_TX_Data ),
        .TX_K_Char ( Test_Generator_XCVR_0_1_0_TX_K_Char ) 
        );


endmodule
