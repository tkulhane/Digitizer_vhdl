//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Wed Aug  9 16:32:29 2023
// Version: 2022.1 2022.1.0.10
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

//////////////////////////////////////////////////////////////////////
// Component Description (Tcl) 
//////////////////////////////////////////////////////////////////////
/*
# Exporting Component Description of PF_XCVR_ERM_C2 to TCL
# Family: PolarFire
# Part Number: MPF300TS_ES-1FCG1152E
# Create and Configure the core component PF_XCVR_ERM_C2
create_and_configure_core -core_vlnv {Actel:SystemBuilder:PF_XCVR_ERM:3.1.200} -component_name {PF_XCVR_ERM_C2} -params {\
"EXPOSE_ALL_DEBUG_PORTS:false" \
"EXPOSE_FWF_EN_PORTS:false" \
"SHOW_UNIVERSAL_SOLN_PORTS:true" \
"UI_CDR_LOCK_MODE:Lock to data" \
"UI_CDR_REFERENCE_CLK_FREQ:80.0" \
"UI_CDR_REFERENCE_CLK_SOURCE:Fabric" \
"UI_CDR_REFERENCE_CLK_TOLERANCE:1" \
"UI_ENABLE_32BIT_DATA_WIDTH:false" \
"UI_ENABLE_64B66B:true" \
"UI_ENABLE_64B67B:false" \
"UI_ENABLE_64B6XB_MODE:false" \
"UI_ENABLE_8B10B_MODE:true" \
"UI_ENABLE_BER:false" \
"UI_ENABLE_DISPARITY:false" \
"UI_ENABLE_FIBRE_CHANNEL_DISPARITY:false" \
"UI_ENABLE_PHASE_COMP_MODE:false" \
"UI_ENABLE_PIPE_MODE:false" \
"UI_ENABLE_PMA_MODE:false" \
"UI_ENABLE_SCRAMBLING:false" \
"UI_ENABLE_SWITCH_BETWEEN_CDR_REFCLKS:false" \
"UI_ENABLE_SWITCH_BETWEEN_TXPLLS:false" \
"UI_EXPOSE_APBLINK_PORTS:false" \
"UI_EXPOSE_CDR_BITSLIP_PORT:false" \
"UI_EXPOSE_DYNAMIC_RECONFIGURATION_PORTS:false" \
"UI_EXPOSE_JA_CLOCK_PORT:false" \
"UI_EXPOSE_RX_READY_VAL_CDR_PORT:true" \
"UI_EXPOSE_TX_BYPASS_DATA:false" \
"UI_EXPOSE_TX_ELEC_IDLE:false" \
"UI_INTERFACE_RXCLOCK:Regional" \
"UI_INTERFACE_TXCLOCK:Regional" \
"UI_IS_CONFIGURED:true" \
"UI_NUMBER_OF_LANES:4" \
"UI_PCS_ARST_N:RX Only" \
"UI_PIPE_PROTOCOL_USED:PCIe Gen1 (2.5 Gbps)" \
"UI_PMA_ARST_N:TX and RX PMA" \
"UI_PROTOCOL_PRESET_USED:None" \
"UI_RX_DATA_RATE:10000" \
"UI_RX_PCS_FAB_IF_WIDTH:32" \
"UI_SATA_IDLE_BURST_TIMING:MAC" \
"UI_TX_CLK_DIV_FACTOR:1" \
"UI_TX_DATA_RATE:5000" \
"UI_TX_PCS_FAB_IF_WIDTH:32" \
"UI_TX_RX_MODE:Rx only" \
"UI_USE_INTERFACE_CLK_AS_PLL_REFCLK:false" \
"UI_XCVR_RX_CALIBRATION:None (CDR)" \
"UI_XCVR_RX_DATA_EYE_CALIBRATION:false" \
"UI_XCVR_RX_DFE_COEFF_CALIBRATION:false" \
"UI_XCVR_RX_ENHANCED_MANAGEMENT:true" \
"XT_ES_DEVICE:true" }
# Exporting Component Description of PF_XCVR_ERM_C2 to TCL done
*/

// PF_XCVR_ERM_C2
module PF_XCVR_ERM_C2(
    // Inputs
    CTRL_ARST_N,
    CTRL_CLK,
    LANE0_CDR_REF_CLK_FAB,
    LANE0_CLK_REF,
    LANE0_LOS,
    LANE0_PCS_ARST_N,
    LANE0_PMA_ARST_N,
    LANE0_RXD_N,
    LANE0_RXD_P,
    LANE1_CDR_REF_CLK_FAB,
    LANE1_CLK_REF,
    LANE1_LOS,
    LANE1_PCS_ARST_N,
    LANE1_PMA_ARST_N,
    LANE1_RXD_N,
    LANE1_RXD_P,
    LANE2_CDR_REF_CLK_FAB,
    LANE2_CLK_REF,
    LANE2_LOS,
    LANE2_PCS_ARST_N,
    LANE2_PMA_ARST_N,
    LANE2_RXD_N,
    LANE2_RXD_P,
    LANE3_CDR_REF_CLK_FAB,
    LANE3_CLK_REF,
    LANE3_LOS,
    LANE3_PCS_ARST_N,
    LANE3_PMA_ARST_N,
    LANE3_RXD_N,
    LANE3_RXD_P,
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
    LANE1_8B10B_RX_K,
    LANE1_RX_CLK_R,
    LANE1_RX_CODE_VIOLATION,
    LANE1_RX_DATA,
    LANE1_RX_DISPARITY_ERROR,
    LANE1_RX_IDLE,
    LANE1_RX_READY,
    LANE1_RX_READY_CDR,
    LANE1_RX_VAL,
    LANE1_RX_VAL_CDR,
    LANE2_8B10B_RX_K,
    LANE2_RX_CLK_R,
    LANE2_RX_CODE_VIOLATION,
    LANE2_RX_DATA,
    LANE2_RX_DISPARITY_ERROR,
    LANE2_RX_IDLE,
    LANE2_RX_READY,
    LANE2_RX_READY_CDR,
    LANE2_RX_VAL,
    LANE2_RX_VAL_CDR,
    LANE3_8B10B_RX_K,
    LANE3_RX_CLK_R,
    LANE3_RX_CODE_VIOLATION,
    LANE3_RX_DATA,
    LANE3_RX_DISPARITY_ERROR,
    LANE3_RX_IDLE,
    LANE3_RX_READY,
    LANE3_RX_READY_CDR,
    LANE3_RX_VAL,
    LANE3_RX_VAL_CDR
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input         CTRL_ARST_N;
input         CTRL_CLK;
input         LANE0_CDR_REF_CLK_FAB;
input         LANE0_CLK_REF;
input         LANE0_LOS;
input         LANE0_PCS_ARST_N;
input         LANE0_PMA_ARST_N;
input         LANE0_RXD_N;
input         LANE0_RXD_P;
input         LANE1_CDR_REF_CLK_FAB;
input         LANE1_CLK_REF;
input         LANE1_LOS;
input         LANE1_PCS_ARST_N;
input         LANE1_PMA_ARST_N;
input         LANE1_RXD_N;
input         LANE1_RXD_P;
input         LANE2_CDR_REF_CLK_FAB;
input         LANE2_CLK_REF;
input         LANE2_LOS;
input         LANE2_PCS_ARST_N;
input         LANE2_PMA_ARST_N;
input         LANE2_RXD_N;
input         LANE2_RXD_P;
input         LANE3_CDR_REF_CLK_FAB;
input         LANE3_CLK_REF;
input         LANE3_LOS;
input         LANE3_PCS_ARST_N;
input         LANE3_PMA_ARST_N;
input         LANE3_RXD_N;
input         LANE3_RXD_P;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output [3:0]  LANE0_8B10B_RX_K;
output        LANE0_RX_CLK_R;
output [3:0]  LANE0_RX_CODE_VIOLATION;
output [31:0] LANE0_RX_DATA;
output [3:0]  LANE0_RX_DISPARITY_ERROR;
output        LANE0_RX_IDLE;
output        LANE0_RX_READY;
output        LANE0_RX_READY_CDR;
output        LANE0_RX_VAL;
output        LANE0_RX_VAL_CDR;
output [3:0]  LANE1_8B10B_RX_K;
output        LANE1_RX_CLK_R;
output [3:0]  LANE1_RX_CODE_VIOLATION;
output [31:0] LANE1_RX_DATA;
output [3:0]  LANE1_RX_DISPARITY_ERROR;
output        LANE1_RX_IDLE;
output        LANE1_RX_READY;
output        LANE1_RX_READY_CDR;
output        LANE1_RX_VAL;
output        LANE1_RX_VAL_CDR;
output [3:0]  LANE2_8B10B_RX_K;
output        LANE2_RX_CLK_R;
output [3:0]  LANE2_RX_CODE_VIOLATION;
output [31:0] LANE2_RX_DATA;
output [3:0]  LANE2_RX_DISPARITY_ERROR;
output        LANE2_RX_IDLE;
output        LANE2_RX_READY;
output        LANE2_RX_READY_CDR;
output        LANE2_RX_VAL;
output        LANE2_RX_VAL_CDR;
output [3:0]  LANE3_8B10B_RX_K;
output        LANE3_RX_CLK_R;
output [3:0]  LANE3_RX_CODE_VIOLATION;
output [31:0] LANE3_RX_DATA;
output [3:0]  LANE3_RX_DISPARITY_ERROR;
output        LANE3_RX_IDLE;
output        LANE3_RX_READY;
output        LANE3_RX_READY_CDR;
output        LANE3_RX_VAL;
output        LANE3_RX_VAL_CDR;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire          CTRL_ARST_N;
wire          CTRL_CLK;
wire          I_AND2_FINE_LOCK_0_Y;
wire          I_AND2_FINE_LOCK_1_Y;
wire          I_AND2_FINE_LOCK_2_Y;
wire          I_AND2_FINE_LOCK_3_Y;
wire          I_OR2_RX_IDLE_0_Y;
wire          I_OR2_RX_IDLE_1_Y;
wire          I_OR2_RX_IDLE_2_Y;
wire          I_OR2_RX_IDLE_3_Y;
wire          I_XCVR_APBLINK_V_0_GRANT;
wire   [2:0]  I_XCVR_APBLINK_V_0_LINK_0_ADDR;
wire          I_XCVR_APBLINK_V_0_LINK_0_ARST_N;
wire          I_XCVR_APBLINK_V_0_LINK_0_CLK;
wire          I_XCVR_APBLINK_V_0_LINK_0_EN;
wire   [3:0]  I_XCVR_APBLINK_V_0_LINK_0_RDATA;
wire   [3:0]  I_XCVR_APBLINK_V_0_LINK_0_WDATA;
wire   [1:0]  I_XCVR_APBLINK_V_0_RQR;
wire          I_XCVR_APBLINK_V_1_GRANT;
wire   [2:0]  I_XCVR_APBLINK_V_1_LINK_0_ADDR;
wire          I_XCVR_APBLINK_V_1_LINK_0_ARST_N;
wire          I_XCVR_APBLINK_V_1_LINK_0_CLK;
wire          I_XCVR_APBLINK_V_1_LINK_0_EN;
wire   [3:0]  I_XCVR_APBLINK_V_1_LINK_0_RDATA;
wire   [3:0]  I_XCVR_APBLINK_V_1_LINK_0_WDATA;
wire   [1:0]  I_XCVR_APBLINK_V_1_RQR;
wire          I_XCVR_APBLINK_V_2_GRANT;
wire   [2:0]  I_XCVR_APBLINK_V_2_LINK_0_ADDR;
wire          I_XCVR_APBLINK_V_2_LINK_0_ARST_N;
wire          I_XCVR_APBLINK_V_2_LINK_0_CLK;
wire          I_XCVR_APBLINK_V_2_LINK_0_EN;
wire   [3:0]  I_XCVR_APBLINK_V_2_LINK_0_RDATA;
wire   [3:0]  I_XCVR_APBLINK_V_2_LINK_0_WDATA;
wire   [1:0]  I_XCVR_APBLINK_V_2_RQR;
wire          I_XCVR_APBLINK_V_3_GRANT;
wire   [2:0]  I_XCVR_APBLINK_V_3_LINK_0_ADDR;
wire          I_XCVR_APBLINK_V_3_LINK_0_ARST_N;
wire          I_XCVR_APBLINK_V_3_LINK_0_CLK;
wire          I_XCVR_APBLINK_V_3_LINK_0_EN;
wire   [3:0]  I_XCVR_APBLINK_V_3_LINK_0_RDATA;
wire   [3:0]  I_XCVR_APBLINK_V_3_LINK_0_WDATA;
wire   [1:0]  I_XCVR_APBLINK_V_3_RQR;
wire          I_XCVR_CORELANEMSTR_0_CALIB_SYNC_HOLD;
wire          I_XCVR_CORELANEMSTR_0_M_REQUEST;
wire          I_XCVR_CORELANEMSTR_0_O_LCKFRC;
wire   [5:0]  I_XCVR_CORELANEMSTR_0_RQI;
wire          I_XCVR_CORELANEMSTR_0_RX_OK;
wire          I_XCVR_CORELANEMSTR_1_CALIB_SYNC_HOLD;
wire          I_XCVR_CORELANEMSTR_1_M_REQUEST;
wire          I_XCVR_CORELANEMSTR_1_O_LCKFRC;
wire   [5:0]  I_XCVR_CORELANEMSTR_1_RQI;
wire          I_XCVR_CORELANEMSTR_1_RX_OK;
wire          I_XCVR_CORELANEMSTR_2_CALIB_SYNC_HOLD;
wire          I_XCVR_CORELANEMSTR_2_M_REQUEST;
wire          I_XCVR_CORELANEMSTR_2_O_LCKFRC;
wire   [5:0]  I_XCVR_CORELANEMSTR_2_RQI;
wire          I_XCVR_CORELANEMSTR_2_RX_OK;
wire          I_XCVR_CORELANEMSTR_3_CALIB_SYNC_HOLD;
wire          I_XCVR_CORELANEMSTR_3_M_REQUEST;
wire          I_XCVR_CORELANEMSTR_3_O_LCKFRC;
wire   [5:0]  I_XCVR_CORELANEMSTR_3_RQI;
wire          I_XCVR_CORELANEMSTR_3_RX_OK;
wire          I_XCVR_CORELCKMGT_0_O_LCKFRC;
wire          I_XCVR_CORELCKMGT_1_O_LCKFRC;
wire          I_XCVR_CORELCKMGT_2_O_LCKFRC;
wire          I_XCVR_CORELCKMGT_3_O_LCKFRC;
wire          I_XCVR_CORELNKTMR_CTRL_SRST_N;
wire   [20:0] I_XCVR_CORELNKTMR_LTPULSE;
wire          I_XCVR_LANE0_RX_READY;
wire          I_XCVR_LANE0_RX_VAL;
wire          I_XCVR_LANE0_SD_DFN1_Q;
wire          I_XCVR_LANE0_SD_DFN2_Q;
wire          I_XCVR_LANE0_SD_OR2_Y;
wire          I_XCVR_LANE0_SD_SLE_DEBUG_Q;
wire          I_XCVR_LANE1_RX_READY;
wire          I_XCVR_LANE1_RX_VAL;
wire          I_XCVR_LANE1_SD_DFN1_Q;
wire          I_XCVR_LANE1_SD_DFN2_Q;
wire          I_XCVR_LANE1_SD_OR2_Y;
wire          I_XCVR_LANE1_SD_SLE_DEBUG_Q;
wire          I_XCVR_LANE2_RX_READY;
wire          I_XCVR_LANE2_RX_VAL;
wire          I_XCVR_LANE2_SD_DFN1_Q;
wire          I_XCVR_LANE2_SD_DFN2_Q;
wire          I_XCVR_LANE2_SD_OR2_Y;
wire          I_XCVR_LANE2_SD_SLE_DEBUG_Q;
wire          I_XCVR_LANE3_RX_READY;
wire          I_XCVR_LANE3_RX_VAL;
wire          I_XCVR_LANE3_SD_DFN1_Q;
wire          I_XCVR_LANE3_SD_DFN2_Q;
wire          I_XCVR_LANE3_SD_OR2_Y;
wire          I_XCVR_LANE3_SD_SLE_DEBUG_Q;
wire   [3:0]  LANE0_8B10B_RX_K_net_0;
wire          LANE0_CDR_REF_CLK_FAB;
wire          LANE0_CLK_REF;
wire          LANE0_LOS;
wire          LANE0_PCS_ARST_N;
wire          LANE0_PMA_ARST_N;
wire          LANE0_RX_CLK_R_net_0;
wire   [3:0]  LANE0_RX_CODE_VIOLATION_net_0;
wire   [31:0] LANE0_RX_DATA_net_0;
wire   [3:0]  LANE0_RX_DISPARITY_ERROR_net_0;
wire          LANE0_RX_IDLE_net_0;
wire          LANE0_RX_READY_net_0;
wire          LANE0_RX_READY_CDR_net_0;
wire          LANE0_RX_VAL_net_0;
wire          LANE0_RX_VAL_CDR_net_0;
wire          LANE0_RXD_N;
wire          LANE0_RXD_P;
wire   [3:0]  LANE1_8B10B_RX_K_net_0;
wire          LANE1_CDR_REF_CLK_FAB;
wire          LANE1_CLK_REF;
wire          LANE1_LOS;
wire          LANE1_PCS_ARST_N;
wire          LANE1_PMA_ARST_N;
wire          LANE1_RX_CLK_R_net_0;
wire   [3:0]  LANE1_RX_CODE_VIOLATION_net_0;
wire   [31:0] LANE1_RX_DATA_net_0;
wire   [3:0]  LANE1_RX_DISPARITY_ERROR_net_0;
wire          LANE1_RX_IDLE_net_0;
wire          LANE1_RX_READY_net_0;
wire          LANE1_RX_READY_CDR_net_0;
wire          LANE1_RX_VAL_net_0;
wire          LANE1_RX_VAL_CDR_net_0;
wire          LANE1_RXD_N;
wire          LANE1_RXD_P;
wire   [3:0]  LANE2_8B10B_RX_K_net_0;
wire          LANE2_CDR_REF_CLK_FAB;
wire          LANE2_CLK_REF;
wire          LANE2_LOS;
wire          LANE2_PCS_ARST_N;
wire          LANE2_PMA_ARST_N;
wire          LANE2_RX_CLK_R_net_0;
wire   [3:0]  LANE2_RX_CODE_VIOLATION_net_0;
wire   [31:0] LANE2_RX_DATA_net_0;
wire   [3:0]  LANE2_RX_DISPARITY_ERROR_net_0;
wire          LANE2_RX_IDLE_net_0;
wire          LANE2_RX_READY_net_0;
wire          LANE2_RX_READY_CDR_net_0;
wire          LANE2_RX_VAL_net_0;
wire          LANE2_RX_VAL_CDR_net_0;
wire          LANE2_RXD_N;
wire          LANE2_RXD_P;
wire   [3:0]  LANE3_8B10B_RX_K_net_0;
wire          LANE3_CDR_REF_CLK_FAB;
wire          LANE3_CLK_REF;
wire          LANE3_LOS;
wire          LANE3_PCS_ARST_N;
wire          LANE3_PMA_ARST_N;
wire          LANE3_RX_CLK_R_net_0;
wire   [3:0]  LANE3_RX_CODE_VIOLATION_net_0;
wire   [31:0] LANE3_RX_DATA_net_0;
wire   [3:0]  LANE3_RX_DISPARITY_ERROR_net_0;
wire          LANE3_RX_IDLE_net_0;
wire          LANE3_RX_READY_net_0;
wire          LANE3_RX_READY_CDR_net_0;
wire          LANE3_RX_VAL_net_0;
wire          LANE3_RX_VAL_CDR_net_0;
wire          LANE3_RXD_N;
wire          LANE3_RXD_P;
wire   [31:0] LANE0_RX_DATA_net_1;
wire          LANE0_RX_CLK_R_net_1;
wire          LANE0_RX_READY_CDR_net_1;
wire          LANE0_RX_VAL_CDR_net_1;
wire          LANE0_RX_IDLE_net_1;
wire   [3:0]  LANE0_RX_CODE_VIOLATION_net_1;
wire   [3:0]  LANE0_RX_DISPARITY_ERROR_net_1;
wire   [3:0]  LANE0_8B10B_RX_K_net_1;
wire   [31:0] LANE1_RX_DATA_net_1;
wire          LANE1_RX_CLK_R_net_1;
wire          LANE1_RX_READY_CDR_net_1;
wire          LANE1_RX_VAL_CDR_net_1;
wire          LANE1_RX_IDLE_net_1;
wire   [3:0]  LANE1_RX_CODE_VIOLATION_net_1;
wire   [3:0]  LANE1_RX_DISPARITY_ERROR_net_1;
wire   [3:0]  LANE1_8B10B_RX_K_net_1;
wire   [31:0] LANE2_RX_DATA_net_1;
wire          LANE2_RX_CLK_R_net_1;
wire          LANE2_RX_READY_CDR_net_1;
wire          LANE2_RX_VAL_CDR_net_1;
wire          LANE2_RX_IDLE_net_1;
wire   [3:0]  LANE2_RX_CODE_VIOLATION_net_1;
wire   [3:0]  LANE2_RX_DISPARITY_ERROR_net_1;
wire   [3:0]  LANE2_8B10B_RX_K_net_1;
wire   [31:0] LANE3_RX_DATA_net_1;
wire          LANE3_RX_CLK_R_net_1;
wire          LANE3_RX_READY_CDR_net_1;
wire          LANE3_RX_VAL_CDR_net_1;
wire          LANE3_RX_IDLE_net_1;
wire   [3:0]  LANE3_RX_CODE_VIOLATION_net_1;
wire   [3:0]  LANE3_RX_DISPARITY_ERROR_net_1;
wire   [3:0]  LANE3_8B10B_RX_K_net_1;
wire          LANE0_RX_READY_net_1;
wire          LANE0_RX_VAL_net_1;
wire          LANE1_RX_READY_net_1;
wire          LANE1_RX_VAL_net_1;
wire          LANE2_RX_READY_net_1;
wire          LANE2_RX_VAL_net_1;
wire          LANE3_RX_READY_net_1;
wire          LANE3_RX_VAL_net_1;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire          GND_net;
wire          VCC_net;
wire   [31:0] LANE0_TX_DATA_const_net_0;
wire   [7:0]  LANE0_TX_DISPFNC_const_net_0;
wire   [3:0]  LANE0_8B10B_TX_K_const_net_0;
wire   [3:0]  LANE0_TX_HDR_const_net_0;
wire   [3:0]  LANE0_TXDATAK_const_net_0;
wire   [1:0]  LANE0_SATA_TX_OOB_const_net_0;
wire   [1:0]  LANE0_POWERDOWN_const_net_0;
wire   [1:0]  LANE0_SATA_RATE_const_net_0;
wire   [1:0]  LANE0_TXPATTERN_const_net_0;
wire   [1:0]  LANE0_CDR_LOCKMODE_const_net_0;
wire   [31:0] LANE1_TX_DATA_const_net_0;
wire   [7:0]  LANE1_TX_DISPFNC_const_net_0;
wire   [3:0]  LANE1_8B10B_TX_K_const_net_0;
wire   [3:0]  LANE1_TX_HDR_const_net_0;
wire   [3:0]  LANE1_TXDATAK_const_net_0;
wire   [1:0]  LANE1_SATA_TX_OOB_const_net_0;
wire   [1:0]  LANE1_POWERDOWN_const_net_0;
wire   [1:0]  LANE1_SATA_RATE_const_net_0;
wire   [1:0]  LANE1_TXPATTERN_const_net_0;
wire   [1:0]  LANE1_CDR_LOCKMODE_const_net_0;
wire   [31:0] LANE2_TX_DATA_const_net_0;
wire   [7:0]  LANE2_TX_DISPFNC_const_net_0;
wire   [3:0]  LANE2_8B10B_TX_K_const_net_0;
wire   [3:0]  LANE2_TX_HDR_const_net_0;
wire   [3:0]  LANE2_TXDATAK_const_net_0;
wire   [1:0]  LANE2_SATA_TX_OOB_const_net_0;
wire   [1:0]  LANE2_POWERDOWN_const_net_0;
wire   [1:0]  LANE2_SATA_RATE_const_net_0;
wire   [1:0]  LANE2_TXPATTERN_const_net_0;
wire   [1:0]  LANE2_CDR_LOCKMODE_const_net_0;
wire   [31:0] LANE3_TX_DATA_const_net_0;
wire   [7:0]  LANE3_TX_DISPFNC_const_net_0;
wire   [3:0]  LANE3_8B10B_TX_K_const_net_0;
wire   [3:0]  LANE3_TX_HDR_const_net_0;
wire   [3:0]  LANE3_TXDATAK_const_net_0;
wire   [1:0]  LANE3_SATA_TX_OOB_const_net_0;
wire   [1:0]  LANE3_POWERDOWN_const_net_0;
wire   [1:0]  LANE3_SATA_RATE_const_net_0;
wire   [1:0]  LANE3_TXPATTERN_const_net_0;
wire   [1:0]  LANE3_CDR_LOCKMODE_const_net_0;
wire   [1:0]  POWERDOWN_const_net_0;
wire   [2:0]  TXMARGIN_const_net_0;
wire   [32:0] LANE0_DRI_WDATA_const_net_0;
wire   [10:0] LANE0_DRI_CTRL_const_net_0;
wire   [32:0] LANE1_DRI_WDATA_const_net_0;
wire   [10:0] LANE1_DRI_CTRL_const_net_0;
wire   [32:0] LANE2_DRI_WDATA_const_net_0;
wire   [10:0] LANE2_DRI_CTRL_const_net_0;
wire   [32:0] LANE3_DRI_WDATA_const_net_0;
wire   [10:0] LANE3_DRI_CTRL_const_net_0;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign GND_net                        = 1'b0;
assign VCC_net                        = 1'b1;
assign LANE0_TX_DATA_const_net_0      = 32'h00000000;
assign LANE0_TX_DISPFNC_const_net_0   = 8'h00;
assign LANE0_8B10B_TX_K_const_net_0   = 4'h0;
assign LANE0_TX_HDR_const_net_0       = 4'h0;
assign LANE0_TXDATAK_const_net_0      = 4'h0;
assign LANE0_SATA_TX_OOB_const_net_0  = 2'h0;
assign LANE0_POWERDOWN_const_net_0    = 2'h0;
assign LANE0_SATA_RATE_const_net_0    = 2'h0;
assign LANE0_TXPATTERN_const_net_0    = 2'h0;
assign LANE0_CDR_LOCKMODE_const_net_0 = 2'h0;
assign LANE1_TX_DATA_const_net_0      = 32'h00000000;
assign LANE1_TX_DISPFNC_const_net_0   = 8'h00;
assign LANE1_8B10B_TX_K_const_net_0   = 4'h0;
assign LANE1_TX_HDR_const_net_0       = 4'h0;
assign LANE1_TXDATAK_const_net_0      = 4'h0;
assign LANE1_SATA_TX_OOB_const_net_0  = 2'h0;
assign LANE1_POWERDOWN_const_net_0    = 2'h0;
assign LANE1_SATA_RATE_const_net_0    = 2'h0;
assign LANE1_TXPATTERN_const_net_0    = 2'h0;
assign LANE1_CDR_LOCKMODE_const_net_0 = 2'h0;
assign LANE2_TX_DATA_const_net_0      = 32'h00000000;
assign LANE2_TX_DISPFNC_const_net_0   = 8'h00;
assign LANE2_8B10B_TX_K_const_net_0   = 4'h0;
assign LANE2_TX_HDR_const_net_0       = 4'h0;
assign LANE2_TXDATAK_const_net_0      = 4'h0;
assign LANE2_SATA_TX_OOB_const_net_0  = 2'h0;
assign LANE2_POWERDOWN_const_net_0    = 2'h0;
assign LANE2_SATA_RATE_const_net_0    = 2'h0;
assign LANE2_TXPATTERN_const_net_0    = 2'h0;
assign LANE2_CDR_LOCKMODE_const_net_0 = 2'h0;
assign LANE3_TX_DATA_const_net_0      = 32'h00000000;
assign LANE3_TX_DISPFNC_const_net_0   = 8'h00;
assign LANE3_8B10B_TX_K_const_net_0   = 4'h0;
assign LANE3_TX_HDR_const_net_0       = 4'h0;
assign LANE3_TXDATAK_const_net_0      = 4'h0;
assign LANE3_SATA_TX_OOB_const_net_0  = 2'h0;
assign LANE3_POWERDOWN_const_net_0    = 2'h0;
assign LANE3_SATA_RATE_const_net_0    = 2'h0;
assign LANE3_TXPATTERN_const_net_0    = 2'h0;
assign LANE3_CDR_LOCKMODE_const_net_0 = 2'h0;
assign POWERDOWN_const_net_0          = 2'h0;
assign TXMARGIN_const_net_0           = 3'h0;
assign LANE0_DRI_WDATA_const_net_0    = 33'h000000000;
assign LANE0_DRI_CTRL_const_net_0     = 11'h000;
assign LANE1_DRI_WDATA_const_net_0    = 33'h000000000;
assign LANE1_DRI_CTRL_const_net_0     = 11'h000;
assign LANE2_DRI_WDATA_const_net_0    = 33'h000000000;
assign LANE2_DRI_CTRL_const_net_0     = 11'h000;
assign LANE3_DRI_WDATA_const_net_0    = 33'h000000000;
assign LANE3_DRI_CTRL_const_net_0     = 11'h000;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign LANE0_RX_DATA_net_1            = LANE0_RX_DATA_net_0;
assign LANE0_RX_DATA[31:0]            = LANE0_RX_DATA_net_1;
assign LANE0_RX_CLK_R_net_1           = LANE0_RX_CLK_R_net_0;
assign LANE0_RX_CLK_R                 = LANE0_RX_CLK_R_net_1;
assign LANE0_RX_READY_CDR_net_1       = LANE0_RX_READY_CDR_net_0;
assign LANE0_RX_READY_CDR             = LANE0_RX_READY_CDR_net_1;
assign LANE0_RX_VAL_CDR_net_1         = LANE0_RX_VAL_CDR_net_0;
assign LANE0_RX_VAL_CDR               = LANE0_RX_VAL_CDR_net_1;
assign LANE0_RX_IDLE_net_1            = LANE0_RX_IDLE_net_0;
assign LANE0_RX_IDLE                  = LANE0_RX_IDLE_net_1;
assign LANE0_RX_CODE_VIOLATION_net_1  = LANE0_RX_CODE_VIOLATION_net_0;
assign LANE0_RX_CODE_VIOLATION[3:0]   = LANE0_RX_CODE_VIOLATION_net_1;
assign LANE0_RX_DISPARITY_ERROR_net_1 = LANE0_RX_DISPARITY_ERROR_net_0;
assign LANE0_RX_DISPARITY_ERROR[3:0]  = LANE0_RX_DISPARITY_ERROR_net_1;
assign LANE0_8B10B_RX_K_net_1         = LANE0_8B10B_RX_K_net_0;
assign LANE0_8B10B_RX_K[3:0]          = LANE0_8B10B_RX_K_net_1;
assign LANE1_RX_DATA_net_1            = LANE1_RX_DATA_net_0;
assign LANE1_RX_DATA[31:0]            = LANE1_RX_DATA_net_1;
assign LANE1_RX_CLK_R_net_1           = LANE1_RX_CLK_R_net_0;
assign LANE1_RX_CLK_R                 = LANE1_RX_CLK_R_net_1;
assign LANE1_RX_READY_CDR_net_1       = LANE1_RX_READY_CDR_net_0;
assign LANE1_RX_READY_CDR             = LANE1_RX_READY_CDR_net_1;
assign LANE1_RX_VAL_CDR_net_1         = LANE1_RX_VAL_CDR_net_0;
assign LANE1_RX_VAL_CDR               = LANE1_RX_VAL_CDR_net_1;
assign LANE1_RX_IDLE_net_1            = LANE1_RX_IDLE_net_0;
assign LANE1_RX_IDLE                  = LANE1_RX_IDLE_net_1;
assign LANE1_RX_CODE_VIOLATION_net_1  = LANE1_RX_CODE_VIOLATION_net_0;
assign LANE1_RX_CODE_VIOLATION[3:0]   = LANE1_RX_CODE_VIOLATION_net_1;
assign LANE1_RX_DISPARITY_ERROR_net_1 = LANE1_RX_DISPARITY_ERROR_net_0;
assign LANE1_RX_DISPARITY_ERROR[3:0]  = LANE1_RX_DISPARITY_ERROR_net_1;
assign LANE1_8B10B_RX_K_net_1         = LANE1_8B10B_RX_K_net_0;
assign LANE1_8B10B_RX_K[3:0]          = LANE1_8B10B_RX_K_net_1;
assign LANE2_RX_DATA_net_1            = LANE2_RX_DATA_net_0;
assign LANE2_RX_DATA[31:0]            = LANE2_RX_DATA_net_1;
assign LANE2_RX_CLK_R_net_1           = LANE2_RX_CLK_R_net_0;
assign LANE2_RX_CLK_R                 = LANE2_RX_CLK_R_net_1;
assign LANE2_RX_READY_CDR_net_1       = LANE2_RX_READY_CDR_net_0;
assign LANE2_RX_READY_CDR             = LANE2_RX_READY_CDR_net_1;
assign LANE2_RX_VAL_CDR_net_1         = LANE2_RX_VAL_CDR_net_0;
assign LANE2_RX_VAL_CDR               = LANE2_RX_VAL_CDR_net_1;
assign LANE2_RX_IDLE_net_1            = LANE2_RX_IDLE_net_0;
assign LANE2_RX_IDLE                  = LANE2_RX_IDLE_net_1;
assign LANE2_RX_CODE_VIOLATION_net_1  = LANE2_RX_CODE_VIOLATION_net_0;
assign LANE2_RX_CODE_VIOLATION[3:0]   = LANE2_RX_CODE_VIOLATION_net_1;
assign LANE2_RX_DISPARITY_ERROR_net_1 = LANE2_RX_DISPARITY_ERROR_net_0;
assign LANE2_RX_DISPARITY_ERROR[3:0]  = LANE2_RX_DISPARITY_ERROR_net_1;
assign LANE2_8B10B_RX_K_net_1         = LANE2_8B10B_RX_K_net_0;
assign LANE2_8B10B_RX_K[3:0]          = LANE2_8B10B_RX_K_net_1;
assign LANE3_RX_DATA_net_1            = LANE3_RX_DATA_net_0;
assign LANE3_RX_DATA[31:0]            = LANE3_RX_DATA_net_1;
assign LANE3_RX_CLK_R_net_1           = LANE3_RX_CLK_R_net_0;
assign LANE3_RX_CLK_R                 = LANE3_RX_CLK_R_net_1;
assign LANE3_RX_READY_CDR_net_1       = LANE3_RX_READY_CDR_net_0;
assign LANE3_RX_READY_CDR             = LANE3_RX_READY_CDR_net_1;
assign LANE3_RX_VAL_CDR_net_1         = LANE3_RX_VAL_CDR_net_0;
assign LANE3_RX_VAL_CDR               = LANE3_RX_VAL_CDR_net_1;
assign LANE3_RX_IDLE_net_1            = LANE3_RX_IDLE_net_0;
assign LANE3_RX_IDLE                  = LANE3_RX_IDLE_net_1;
assign LANE3_RX_CODE_VIOLATION_net_1  = LANE3_RX_CODE_VIOLATION_net_0;
assign LANE3_RX_CODE_VIOLATION[3:0]   = LANE3_RX_CODE_VIOLATION_net_1;
assign LANE3_RX_DISPARITY_ERROR_net_1 = LANE3_RX_DISPARITY_ERROR_net_0;
assign LANE3_RX_DISPARITY_ERROR[3:0]  = LANE3_RX_DISPARITY_ERROR_net_1;
assign LANE3_8B10B_RX_K_net_1         = LANE3_8B10B_RX_K_net_0;
assign LANE3_8B10B_RX_K[3:0]          = LANE3_8B10B_RX_K_net_1;
assign LANE0_RX_READY_net_1           = LANE0_RX_READY_net_0;
assign LANE0_RX_READY                 = LANE0_RX_READY_net_1;
assign LANE0_RX_VAL_net_1             = LANE0_RX_VAL_net_0;
assign LANE0_RX_VAL                   = LANE0_RX_VAL_net_1;
assign LANE1_RX_READY_net_1           = LANE1_RX_READY_net_0;
assign LANE1_RX_READY                 = LANE1_RX_READY_net_1;
assign LANE1_RX_VAL_net_1             = LANE1_RX_VAL_net_0;
assign LANE1_RX_VAL                   = LANE1_RX_VAL_net_1;
assign LANE2_RX_READY_net_1           = LANE2_RX_READY_net_0;
assign LANE2_RX_READY                 = LANE2_RX_READY_net_1;
assign LANE2_RX_VAL_net_1             = LANE2_RX_VAL_net_0;
assign LANE2_RX_VAL                   = LANE2_RX_VAL_net_1;
assign LANE3_RX_READY_net_1           = LANE3_RX_READY_net_0;
assign LANE3_RX_READY                 = LANE3_RX_READY_net_1;
assign LANE3_RX_VAL_net_1             = LANE3_RX_VAL_net_0;
assign LANE3_RX_VAL                   = LANE3_RX_VAL_net_1;
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------AND2
AND2 I_AND2_FINE_LOCK_0(
        // Inputs
        .A ( LANE0_RX_READY_net_0 ),
        .B ( I_XCVR_CORELANEMSTR_0_RX_OK ),
        // Outputs
        .Y ( I_AND2_FINE_LOCK_0_Y ) 
        );

//--------AND2
AND2 I_AND2_FINE_LOCK_1(
        // Inputs
        .A ( LANE1_RX_READY_net_0 ),
        .B ( I_XCVR_CORELANEMSTR_1_RX_OK ),
        // Outputs
        .Y ( I_AND2_FINE_LOCK_1_Y ) 
        );

//--------AND2
AND2 I_AND2_FINE_LOCK_2(
        // Inputs
        .A ( LANE2_RX_READY_net_0 ),
        .B ( I_XCVR_CORELANEMSTR_2_RX_OK ),
        // Outputs
        .Y ( I_AND2_FINE_LOCK_2_Y ) 
        );

//--------AND2
AND2 I_AND2_FINE_LOCK_3(
        // Inputs
        .A ( LANE3_RX_READY_net_0 ),
        .B ( I_XCVR_CORELANEMSTR_3_RX_OK ),
        // Outputs
        .Y ( I_AND2_FINE_LOCK_3_Y ) 
        );

//--------AND2
AND2 I_AND2_RX_VAL_0(
        // Inputs
        .A ( I_XCVR_LANE0_RX_VAL ),
        .B ( I_XCVR_CORELANEMSTR_0_RX_OK ),
        // Outputs
        .Y ( LANE0_RX_VAL_net_0 ) 
        );

//--------AND2
AND2 I_AND2_RX_VAL_1(
        // Inputs
        .A ( I_XCVR_LANE1_RX_VAL ),
        .B ( I_XCVR_CORELANEMSTR_1_RX_OK ),
        // Outputs
        .Y ( LANE1_RX_VAL_net_0 ) 
        );

//--------AND2
AND2 I_AND2_RX_VAL_2(
        // Inputs
        .A ( I_XCVR_LANE2_RX_VAL ),
        .B ( I_XCVR_CORELANEMSTR_2_RX_OK ),
        // Outputs
        .Y ( LANE2_RX_VAL_net_0 ) 
        );

//--------AND2
AND2 I_AND2_RX_VAL_3(
        // Inputs
        .A ( I_XCVR_LANE3_RX_VAL ),
        .B ( I_XCVR_CORELANEMSTR_3_RX_OK ),
        // Outputs
        .Y ( LANE3_RX_VAL_net_0 ) 
        );

//--------OR2
OR2 I_OR2_RX_IDLE_0(
        // Inputs
        .A ( LANE0_LOS ),
        .B ( LANE0_RX_IDLE_net_0 ),
        // Outputs
        .Y ( I_OR2_RX_IDLE_0_Y ) 
        );

//--------OR2
OR2 I_OR2_RX_IDLE_1(
        // Inputs
        .A ( LANE1_LOS ),
        .B ( LANE1_RX_IDLE_net_0 ),
        // Outputs
        .Y ( I_OR2_RX_IDLE_1_Y ) 
        );

//--------OR2
OR2 I_OR2_RX_IDLE_2(
        // Inputs
        .A ( LANE2_LOS ),
        .B ( LANE2_RX_IDLE_net_0 ),
        // Outputs
        .Y ( I_OR2_RX_IDLE_2_Y ) 
        );

//--------OR2
OR2 I_OR2_RX_IDLE_3(
        // Inputs
        .A ( LANE3_LOS ),
        .B ( LANE3_RX_IDLE_net_0 ),
        // Outputs
        .Y ( I_OR2_RX_IDLE_3_Y ) 
        );

//--------PF_XCVR_ERM_C2_I_XCVR_PF_XCVR   -   Actel:SgCore:PF_XCVR:2.1.101
PF_XCVR_ERM_C2_I_XCVR_PF_XCVR I_XCVR(
        // Inputs
        .LANE0_CDR_REF_CLK_FAB    ( LANE0_CDR_REF_CLK_FAB ),
        .LANE0_PCS_ARST_N         ( LANE0_PCS_ARST_N ),
        .LANE0_PMA_ARST_N         ( LANE0_PMA_ARST_N ),
        .LANE1_CDR_REF_CLK_FAB    ( LANE1_CDR_REF_CLK_FAB ),
        .LANE1_PCS_ARST_N         ( LANE1_PCS_ARST_N ),
        .LANE1_PMA_ARST_N         ( LANE1_PMA_ARST_N ),
        .LANE2_CDR_REF_CLK_FAB    ( LANE2_CDR_REF_CLK_FAB ),
        .LANE2_PCS_ARST_N         ( LANE2_PCS_ARST_N ),
        .LANE2_PMA_ARST_N         ( LANE2_PMA_ARST_N ),
        .LANE3_CDR_REF_CLK_FAB    ( LANE3_CDR_REF_CLK_FAB ),
        .LANE3_PCS_ARST_N         ( LANE3_PCS_ARST_N ),
        .LANE3_PMA_ARST_N         ( LANE3_PMA_ARST_N ),
        .LANE0_LINK_CLK           ( I_XCVR_APBLINK_V_0_LINK_0_CLK ),
        .LANE0_LINK_EN            ( I_XCVR_APBLINK_V_0_LINK_0_EN ),
        .LANE0_LINK_ARST_N        ( I_XCVR_APBLINK_V_0_LINK_0_ARST_N ),
        .LANE0_LINK_ADDR          ( I_XCVR_APBLINK_V_0_LINK_0_ADDR ),
        .LANE0_LINK_WDATA         ( I_XCVR_APBLINK_V_0_LINK_0_WDATA ),
        .LANE1_LINK_CLK           ( I_XCVR_APBLINK_V_1_LINK_0_CLK ),
        .LANE1_LINK_EN            ( I_XCVR_APBLINK_V_1_LINK_0_EN ),
        .LANE1_LINK_ARST_N        ( I_XCVR_APBLINK_V_1_LINK_0_ARST_N ),
        .LANE1_LINK_ADDR          ( I_XCVR_APBLINK_V_1_LINK_0_ADDR ),
        .LANE1_LINK_WDATA         ( I_XCVR_APBLINK_V_1_LINK_0_WDATA ),
        .LANE2_LINK_CLK           ( I_XCVR_APBLINK_V_2_LINK_0_CLK ),
        .LANE2_LINK_EN            ( I_XCVR_APBLINK_V_2_LINK_0_EN ),
        .LANE2_LINK_ARST_N        ( I_XCVR_APBLINK_V_2_LINK_0_ARST_N ),
        .LANE2_LINK_ADDR          ( I_XCVR_APBLINK_V_2_LINK_0_ADDR ),
        .LANE2_LINK_WDATA         ( I_XCVR_APBLINK_V_2_LINK_0_WDATA ),
        .LANE3_LINK_CLK           ( I_XCVR_APBLINK_V_3_LINK_0_CLK ),
        .LANE3_LINK_EN            ( I_XCVR_APBLINK_V_3_LINK_0_EN ),
        .LANE3_LINK_ARST_N        ( I_XCVR_APBLINK_V_3_LINK_0_ARST_N ),
        .LANE3_LINK_ADDR          ( I_XCVR_APBLINK_V_3_LINK_0_ADDR ),
        .LANE3_LINK_WDATA         ( I_XCVR_APBLINK_V_3_LINK_0_WDATA ),
        .LANE0_RXD_P              ( LANE0_RXD_P ),
        .LANE0_RXD_N              ( LANE0_RXD_N ),
        .LANE1_RXD_P              ( LANE1_RXD_P ),
        .LANE1_RXD_N              ( LANE1_RXD_N ),
        .LANE2_RXD_P              ( LANE2_RXD_P ),
        .LANE2_RXD_N              ( LANE2_RXD_N ),
        .LANE3_RXD_P              ( LANE3_RXD_P ),
        .LANE3_RXD_N              ( LANE3_RXD_N ),
        // Outputs
        .LANE0_RX_DATA            ( LANE0_RX_DATA_net_0 ),
        .LANE0_RX_CLK_R           ( LANE0_RX_CLK_R_net_0 ),
        .LANE0_RX_READY_CDR       ( LANE0_RX_READY_CDR_net_0 ),
        .LANE0_RX_VAL_CDR         ( LANE0_RX_VAL_CDR_net_0 ),
        .LANE0_RX_IDLE            ( LANE0_RX_IDLE_net_0 ),
        .LANE0_RX_READY           ( I_XCVR_LANE0_RX_READY ),
        .LANE0_RX_VAL             ( I_XCVR_LANE0_RX_VAL ),
        .LANE0_RX_CODE_VIOLATION  ( LANE0_RX_CODE_VIOLATION_net_0 ),
        .LANE0_RX_DISPARITY_ERROR ( LANE0_RX_DISPARITY_ERROR_net_0 ),
        .LANE0_8B10B_RX_K         ( LANE0_8B10B_RX_K_net_0 ),
        .LANE1_RX_DATA            ( LANE1_RX_DATA_net_0 ),
        .LANE1_RX_CLK_R           ( LANE1_RX_CLK_R_net_0 ),
        .LANE1_RX_READY_CDR       ( LANE1_RX_READY_CDR_net_0 ),
        .LANE1_RX_VAL_CDR         ( LANE1_RX_VAL_CDR_net_0 ),
        .LANE1_RX_IDLE            ( LANE1_RX_IDLE_net_0 ),
        .LANE1_RX_READY           ( I_XCVR_LANE1_RX_READY ),
        .LANE1_RX_VAL             ( I_XCVR_LANE1_RX_VAL ),
        .LANE1_RX_CODE_VIOLATION  ( LANE1_RX_CODE_VIOLATION_net_0 ),
        .LANE1_RX_DISPARITY_ERROR ( LANE1_RX_DISPARITY_ERROR_net_0 ),
        .LANE1_8B10B_RX_K         ( LANE1_8B10B_RX_K_net_0 ),
        .LANE2_RX_DATA            ( LANE2_RX_DATA_net_0 ),
        .LANE2_RX_CLK_R           ( LANE2_RX_CLK_R_net_0 ),
        .LANE2_RX_READY_CDR       ( LANE2_RX_READY_CDR_net_0 ),
        .LANE2_RX_VAL_CDR         ( LANE2_RX_VAL_CDR_net_0 ),
        .LANE2_RX_IDLE            ( LANE2_RX_IDLE_net_0 ),
        .LANE2_RX_READY           ( I_XCVR_LANE2_RX_READY ),
        .LANE2_RX_VAL             ( I_XCVR_LANE2_RX_VAL ),
        .LANE2_RX_CODE_VIOLATION  ( LANE2_RX_CODE_VIOLATION_net_0 ),
        .LANE2_RX_DISPARITY_ERROR ( LANE2_RX_DISPARITY_ERROR_net_0 ),
        .LANE2_8B10B_RX_K         ( LANE2_8B10B_RX_K_net_0 ),
        .LANE3_RX_DATA            ( LANE3_RX_DATA_net_0 ),
        .LANE3_RX_CLK_R           ( LANE3_RX_CLK_R_net_0 ),
        .LANE3_RX_READY_CDR       ( LANE3_RX_READY_CDR_net_0 ),
        .LANE3_RX_VAL_CDR         ( LANE3_RX_VAL_CDR_net_0 ),
        .LANE3_RX_IDLE            ( LANE3_RX_IDLE_net_0 ),
        .LANE3_RX_READY           ( I_XCVR_LANE3_RX_READY ),
        .LANE3_RX_VAL             ( I_XCVR_LANE3_RX_VAL ),
        .LANE3_RX_CODE_VIOLATION  ( LANE3_RX_CODE_VIOLATION_net_0 ),
        .LANE3_RX_DISPARITY_ERROR ( LANE3_RX_DISPARITY_ERROR_net_0 ),
        .LANE3_8B10B_RX_K         ( LANE3_8B10B_RX_K_net_0 ),
        .LANE0_LINK_RDATA         ( I_XCVR_APBLINK_V_0_LINK_0_RDATA ),
        .LANE1_LINK_RDATA         ( I_XCVR_APBLINK_V_1_LINK_0_RDATA ),
        .LANE2_LINK_RDATA         ( I_XCVR_APBLINK_V_2_LINK_0_RDATA ),
        .LANE3_LINK_RDATA         ( I_XCVR_APBLINK_V_3_LINK_0_RDATA ) 
        );

//--------PF_XCVR_APBLINK_V   -   Actel:SgCore:PF_XCVR_APBLINK_V:1.1.104
PF_XCVR_APBLINK_V I_XCVR_APBLINK_V_0(
        // Inputs
        .CTRL_CLK    ( CTRL_CLK ),
        .CTRL_SRST_N ( I_XCVR_CORELNKTMR_CTRL_SRST_N ),
        .ARST_N      ( CTRL_ARST_N ),
        .REQUEST     ( I_XCVR_CORELANEMSTR_0_M_REQUEST ),
        .RQI         ( I_XCVR_CORELANEMSTR_0_RQI ),
        .LINK_RDATA  ( I_XCVR_APBLINK_V_0_LINK_0_RDATA ),
        // Outputs
        .RQR         ( I_XCVR_APBLINK_V_0_RQR ),
        .GRANT       ( I_XCVR_APBLINK_V_0_GRANT ),
        .LINK_CLK    ( I_XCVR_APBLINK_V_0_LINK_0_CLK ),
        .LINK_ADDR   ( I_XCVR_APBLINK_V_0_LINK_0_ADDR ),
        .LINK_EN     ( I_XCVR_APBLINK_V_0_LINK_0_EN ),
        .LINK_ARST_N ( I_XCVR_APBLINK_V_0_LINK_0_ARST_N ),
        .LINK_WDATA  ( I_XCVR_APBLINK_V_0_LINK_0_WDATA ) 
        );

//--------PF_XCVR_APBLINK_V   -   Actel:SgCore:PF_XCVR_APBLINK_V:1.1.104
PF_XCVR_APBLINK_V I_XCVR_APBLINK_V_1(
        // Inputs
        .CTRL_CLK    ( CTRL_CLK ),
        .CTRL_SRST_N ( I_XCVR_CORELNKTMR_CTRL_SRST_N ),
        .ARST_N      ( CTRL_ARST_N ),
        .REQUEST     ( I_XCVR_CORELANEMSTR_1_M_REQUEST ),
        .RQI         ( I_XCVR_CORELANEMSTR_1_RQI ),
        .LINK_RDATA  ( I_XCVR_APBLINK_V_1_LINK_0_RDATA ),
        // Outputs
        .RQR         ( I_XCVR_APBLINK_V_1_RQR ),
        .GRANT       ( I_XCVR_APBLINK_V_1_GRANT ),
        .LINK_CLK    ( I_XCVR_APBLINK_V_1_LINK_0_CLK ),
        .LINK_ADDR   ( I_XCVR_APBLINK_V_1_LINK_0_ADDR ),
        .LINK_EN     ( I_XCVR_APBLINK_V_1_LINK_0_EN ),
        .LINK_ARST_N ( I_XCVR_APBLINK_V_1_LINK_0_ARST_N ),
        .LINK_WDATA  ( I_XCVR_APBLINK_V_1_LINK_0_WDATA ) 
        );

//--------PF_XCVR_APBLINK_V   -   Actel:SgCore:PF_XCVR_APBLINK_V:1.1.104
PF_XCVR_APBLINK_V I_XCVR_APBLINK_V_2(
        // Inputs
        .CTRL_CLK    ( CTRL_CLK ),
        .CTRL_SRST_N ( I_XCVR_CORELNKTMR_CTRL_SRST_N ),
        .ARST_N      ( CTRL_ARST_N ),
        .REQUEST     ( I_XCVR_CORELANEMSTR_2_M_REQUEST ),
        .RQI         ( I_XCVR_CORELANEMSTR_2_RQI ),
        .LINK_RDATA  ( I_XCVR_APBLINK_V_2_LINK_0_RDATA ),
        // Outputs
        .RQR         ( I_XCVR_APBLINK_V_2_RQR ),
        .GRANT       ( I_XCVR_APBLINK_V_2_GRANT ),
        .LINK_CLK    ( I_XCVR_APBLINK_V_2_LINK_0_CLK ),
        .LINK_ADDR   ( I_XCVR_APBLINK_V_2_LINK_0_ADDR ),
        .LINK_EN     ( I_XCVR_APBLINK_V_2_LINK_0_EN ),
        .LINK_ARST_N ( I_XCVR_APBLINK_V_2_LINK_0_ARST_N ),
        .LINK_WDATA  ( I_XCVR_APBLINK_V_2_LINK_0_WDATA ) 
        );

//--------PF_XCVR_APBLINK_V   -   Actel:SgCore:PF_XCVR_APBLINK_V:1.1.104
PF_XCVR_APBLINK_V I_XCVR_APBLINK_V_3(
        // Inputs
        .CTRL_CLK    ( CTRL_CLK ),
        .CTRL_SRST_N ( I_XCVR_CORELNKTMR_CTRL_SRST_N ),
        .ARST_N      ( CTRL_ARST_N ),
        .REQUEST     ( I_XCVR_CORELANEMSTR_3_M_REQUEST ),
        .RQI         ( I_XCVR_CORELANEMSTR_3_RQI ),
        .LINK_RDATA  ( I_XCVR_APBLINK_V_3_LINK_0_RDATA ),
        // Outputs
        .RQR         ( I_XCVR_APBLINK_V_3_RQR ),
        .GRANT       ( I_XCVR_APBLINK_V_3_GRANT ),
        .LINK_CLK    ( I_XCVR_APBLINK_V_3_LINK_0_CLK ),
        .LINK_ADDR   ( I_XCVR_APBLINK_V_3_LINK_0_ADDR ),
        .LINK_EN     ( I_XCVR_APBLINK_V_3_LINK_0_EN ),
        .LINK_ARST_N ( I_XCVR_APBLINK_V_3_LINK_0_ARST_N ),
        .LINK_WDATA  ( I_XCVR_APBLINK_V_3_LINK_0_WDATA ) 
        );

//--------CORELANEMSTR   -   Actel:DirectCore:CORELANEMSTR:2.1.100
CORELANEMSTR #( 
        .MODE            ( 2 ),
        .SIMULATION_MODE ( 1 ) )
I_XCVR_CORELANEMSTR_0(
        // Inputs
        .LTPULSE                ( I_XCVR_CORELNKTMR_LTPULSE ),
        .I_LCKFRC               ( I_XCVR_CORELCKMGT_0_O_LCKFRC ),
        .M_GRANT                ( I_XCVR_APBLINK_V_0_GRANT ),
        .RQR                    ( I_XCVR_APBLINK_V_0_RQR ),
        .RX_READY               ( LANE0_RX_READY_net_0 ),
        .USR_DATACLK_RECAL      ( GND_net ),
        .USR_DFE_RECAL          ( GND_net ),
        .CTRL_CLK               ( CTRL_CLK ),
        .CTRL_SRST_N            ( I_XCVR_CORELNKTMR_CTRL_SRST_N ),
        .CALIB_REQ              ( GND_net ),
        // Outputs
        .O_LCKFRC               ( I_XCVR_CORELANEMSTR_0_O_LCKFRC ),
        .M_REQUEST              ( I_XCVR_CORELANEMSTR_0_M_REQUEST ),
        .RQI                    ( I_XCVR_CORELANEMSTR_0_RQI ),
        .CALIBRATING            (  ),
        .CALIB_SYNC_HOLD        ( I_XCVR_CORELANEMSTR_0_CALIB_SYNC_HOLD ),
        .RX_OK                  ( I_XCVR_CORELANEMSTR_0_RX_OK ),
        .USR_DATACLK_RECAL_DONE (  ),
        .USR_DFE_RECAL_DONE     (  ) 
        );

//--------CORELANEMSTR   -   Actel:DirectCore:CORELANEMSTR:2.1.100
CORELANEMSTR #( 
        .MODE            ( 2 ),
        .SIMULATION_MODE ( 1 ) )
I_XCVR_CORELANEMSTR_1(
        // Inputs
        .LTPULSE                ( I_XCVR_CORELNKTMR_LTPULSE ),
        .I_LCKFRC               ( I_XCVR_CORELCKMGT_1_O_LCKFRC ),
        .M_GRANT                ( I_XCVR_APBLINK_V_1_GRANT ),
        .RQR                    ( I_XCVR_APBLINK_V_1_RQR ),
        .RX_READY               ( LANE1_RX_READY_net_0 ),
        .USR_DATACLK_RECAL      ( GND_net ),
        .USR_DFE_RECAL          ( GND_net ),
        .CTRL_CLK               ( CTRL_CLK ),
        .CTRL_SRST_N            ( I_XCVR_CORELNKTMR_CTRL_SRST_N ),
        .CALIB_REQ              ( GND_net ),
        // Outputs
        .O_LCKFRC               ( I_XCVR_CORELANEMSTR_1_O_LCKFRC ),
        .M_REQUEST              ( I_XCVR_CORELANEMSTR_1_M_REQUEST ),
        .RQI                    ( I_XCVR_CORELANEMSTR_1_RQI ),
        .CALIBRATING            (  ),
        .CALIB_SYNC_HOLD        ( I_XCVR_CORELANEMSTR_1_CALIB_SYNC_HOLD ),
        .RX_OK                  ( I_XCVR_CORELANEMSTR_1_RX_OK ),
        .USR_DATACLK_RECAL_DONE (  ),
        .USR_DFE_RECAL_DONE     (  ) 
        );

//--------CORELANEMSTR   -   Actel:DirectCore:CORELANEMSTR:2.1.100
CORELANEMSTR #( 
        .MODE            ( 2 ),
        .SIMULATION_MODE ( 1 ) )
I_XCVR_CORELANEMSTR_2(
        // Inputs
        .LTPULSE                ( I_XCVR_CORELNKTMR_LTPULSE ),
        .I_LCKFRC               ( I_XCVR_CORELCKMGT_2_O_LCKFRC ),
        .M_GRANT                ( I_XCVR_APBLINK_V_2_GRANT ),
        .RQR                    ( I_XCVR_APBLINK_V_2_RQR ),
        .RX_READY               ( LANE2_RX_READY_net_0 ),
        .USR_DATACLK_RECAL      ( GND_net ),
        .USR_DFE_RECAL          ( GND_net ),
        .CTRL_CLK               ( CTRL_CLK ),
        .CTRL_SRST_N            ( I_XCVR_CORELNKTMR_CTRL_SRST_N ),
        .CALIB_REQ              ( GND_net ),
        // Outputs
        .O_LCKFRC               ( I_XCVR_CORELANEMSTR_2_O_LCKFRC ),
        .M_REQUEST              ( I_XCVR_CORELANEMSTR_2_M_REQUEST ),
        .RQI                    ( I_XCVR_CORELANEMSTR_2_RQI ),
        .CALIBRATING            (  ),
        .CALIB_SYNC_HOLD        ( I_XCVR_CORELANEMSTR_2_CALIB_SYNC_HOLD ),
        .RX_OK                  ( I_XCVR_CORELANEMSTR_2_RX_OK ),
        .USR_DATACLK_RECAL_DONE (  ),
        .USR_DFE_RECAL_DONE     (  ) 
        );

//--------CORELANEMSTR   -   Actel:DirectCore:CORELANEMSTR:2.1.100
CORELANEMSTR #( 
        .MODE            ( 2 ),
        .SIMULATION_MODE ( 1 ) )
I_XCVR_CORELANEMSTR_3(
        // Inputs
        .LTPULSE                ( I_XCVR_CORELNKTMR_LTPULSE ),
        .I_LCKFRC               ( I_XCVR_CORELCKMGT_3_O_LCKFRC ),
        .M_GRANT                ( I_XCVR_APBLINK_V_3_GRANT ),
        .RQR                    ( I_XCVR_APBLINK_V_3_RQR ),
        .RX_READY               ( LANE3_RX_READY_net_0 ),
        .USR_DATACLK_RECAL      ( GND_net ),
        .USR_DFE_RECAL          ( GND_net ),
        .CTRL_CLK               ( CTRL_CLK ),
        .CTRL_SRST_N            ( I_XCVR_CORELNKTMR_CTRL_SRST_N ),
        .CALIB_REQ              ( GND_net ),
        // Outputs
        .O_LCKFRC               ( I_XCVR_CORELANEMSTR_3_O_LCKFRC ),
        .M_REQUEST              ( I_XCVR_CORELANEMSTR_3_M_REQUEST ),
        .RQI                    ( I_XCVR_CORELANEMSTR_3_RQI ),
        .CALIBRATING            (  ),
        .CALIB_SYNC_HOLD        ( I_XCVR_CORELANEMSTR_3_CALIB_SYNC_HOLD ),
        .RX_OK                  ( I_XCVR_CORELANEMSTR_3_RX_OK ),
        .USR_DATACLK_RECAL_DONE (  ),
        .USR_DFE_RECAL_DONE     (  ) 
        );

//--------CORELCKMGT   -   Actel:DirectCore:CORELCKMGT:2.0.100
CORELCKMGT #( 
        .DEBOUNCEUS ( 10 ),
        .ILOCKDLYUS ( 0 ),
        .IQUIETUS   ( 10 ),
        .SDTHR      ( 0 ),
        .SDWIN      ( 0 ) )
I_XCVR_CORELCKMGT_0(
        // Inputs
        .CTRL_CLK        ( CTRL_CLK ),
        .CTRL_SRST_N     ( I_XCVR_CORELNKTMR_CTRL_SRST_N ),
        .LTPULSE         ( I_XCVR_CORELNKTMR_LTPULSE ),
        .I_LCKFRC        ( I_XCVR_CORELANEMSTR_0_O_LCKFRC ),
        .CALIB_SYNC_HOLD ( I_XCVR_LANE0_SD_OR2_Y ),
        .RX_IDLE         ( I_OR2_RX_IDLE_0_Y ),
        .SYNC            ( I_AND2_FINE_LOCK_0_Y ),
        // Outputs
        .O_LCKFRC        ( I_XCVR_CORELCKMGT_0_O_LCKFRC ) 
        );

//--------CORELCKMGT   -   Actel:DirectCore:CORELCKMGT:2.0.100
CORELCKMGT #( 
        .DEBOUNCEUS ( 10 ),
        .ILOCKDLYUS ( 0 ),
        .IQUIETUS   ( 10 ),
        .SDTHR      ( 0 ),
        .SDWIN      ( 0 ) )
I_XCVR_CORELCKMGT_1(
        // Inputs
        .CTRL_CLK        ( CTRL_CLK ),
        .CTRL_SRST_N     ( I_XCVR_CORELNKTMR_CTRL_SRST_N ),
        .LTPULSE         ( I_XCVR_CORELNKTMR_LTPULSE ),
        .I_LCKFRC        ( I_XCVR_CORELANEMSTR_1_O_LCKFRC ),
        .CALIB_SYNC_HOLD ( I_XCVR_LANE1_SD_OR2_Y ),
        .RX_IDLE         ( I_OR2_RX_IDLE_1_Y ),
        .SYNC            ( I_AND2_FINE_LOCK_1_Y ),
        // Outputs
        .O_LCKFRC        ( I_XCVR_CORELCKMGT_1_O_LCKFRC ) 
        );

//--------CORELCKMGT   -   Actel:DirectCore:CORELCKMGT:2.0.100
CORELCKMGT #( 
        .DEBOUNCEUS ( 10 ),
        .ILOCKDLYUS ( 0 ),
        .IQUIETUS   ( 10 ),
        .SDTHR      ( 0 ),
        .SDWIN      ( 0 ) )
I_XCVR_CORELCKMGT_2(
        // Inputs
        .CTRL_CLK        ( CTRL_CLK ),
        .CTRL_SRST_N     ( I_XCVR_CORELNKTMR_CTRL_SRST_N ),
        .LTPULSE         ( I_XCVR_CORELNKTMR_LTPULSE ),
        .I_LCKFRC        ( I_XCVR_CORELANEMSTR_2_O_LCKFRC ),
        .CALIB_SYNC_HOLD ( I_XCVR_LANE2_SD_OR2_Y ),
        .RX_IDLE         ( I_OR2_RX_IDLE_2_Y ),
        .SYNC            ( I_AND2_FINE_LOCK_2_Y ),
        // Outputs
        .O_LCKFRC        ( I_XCVR_CORELCKMGT_2_O_LCKFRC ) 
        );

//--------CORELCKMGT   -   Actel:DirectCore:CORELCKMGT:2.0.100
CORELCKMGT #( 
        .DEBOUNCEUS ( 10 ),
        .ILOCKDLYUS ( 0 ),
        .IQUIETUS   ( 10 ),
        .SDTHR      ( 0 ),
        .SDWIN      ( 0 ) )
I_XCVR_CORELCKMGT_3(
        // Inputs
        .CTRL_CLK        ( CTRL_CLK ),
        .CTRL_SRST_N     ( I_XCVR_CORELNKTMR_CTRL_SRST_N ),
        .LTPULSE         ( I_XCVR_CORELNKTMR_LTPULSE ),
        .I_LCKFRC        ( I_XCVR_CORELANEMSTR_3_O_LCKFRC ),
        .CALIB_SYNC_HOLD ( I_XCVR_LANE3_SD_OR2_Y ),
        .RX_IDLE         ( I_OR2_RX_IDLE_3_Y ),
        .SYNC            ( I_AND2_FINE_LOCK_3_Y ),
        // Outputs
        .O_LCKFRC        ( I_XCVR_CORELCKMGT_3_O_LCKFRC ) 
        );

//--------CORELNKTMR_V
CORELNKTMR_V I_XCVR_CORELNKTMR(
        // Inputs
        .CTRL_CLK    ( CTRL_CLK ),
        .CTRL_ARST_N ( CTRL_ARST_N ),
        // Outputs
        .CTRL_SRST_N ( I_XCVR_CORELNKTMR_CTRL_SRST_N ),
        .LTPULSE     ( I_XCVR_CORELNKTMR_LTPULSE ) 
        );

//--------CORERFD   -   Actel:DirectCore:CORERFD:2.1.100
CORERFD #( 
        .PPM ( 4000 ) )
I_XCVR_CORERFD_0(
        // Inputs
        .ARST_N        ( CTRL_ARST_N ),
        .CLK_IN        ( LANE0_RX_CLK_R_net_0 ),
        .CLK_REF       ( LANE0_CLK_REF ),
        .XCVR_RX_READY ( I_XCVR_LANE0_RX_READY ),
        // Outputs
        .RX_FINE_LOCK  ( LANE0_RX_READY_net_0 ) 
        );

//--------CORERFD   -   Actel:DirectCore:CORERFD:2.1.100
CORERFD #( 
        .PPM ( 4000 ) )
I_XCVR_CORERFD_1(
        // Inputs
        .ARST_N        ( CTRL_ARST_N ),
        .CLK_IN        ( LANE1_RX_CLK_R_net_0 ),
        .CLK_REF       ( LANE1_CLK_REF ),
        .XCVR_RX_READY ( I_XCVR_LANE1_RX_READY ),
        // Outputs
        .RX_FINE_LOCK  ( LANE1_RX_READY_net_0 ) 
        );

//--------CORERFD   -   Actel:DirectCore:CORERFD:2.1.100
CORERFD #( 
        .PPM ( 4000 ) )
I_XCVR_CORERFD_2(
        // Inputs
        .ARST_N        ( CTRL_ARST_N ),
        .CLK_IN        ( LANE2_RX_CLK_R_net_0 ),
        .CLK_REF       ( LANE2_CLK_REF ),
        .XCVR_RX_READY ( I_XCVR_LANE2_RX_READY ),
        // Outputs
        .RX_FINE_LOCK  ( LANE2_RX_READY_net_0 ) 
        );

//--------CORERFD   -   Actel:DirectCore:CORERFD:2.1.100
CORERFD #( 
        .PPM ( 4000 ) )
I_XCVR_CORERFD_3(
        // Inputs
        .ARST_N        ( CTRL_ARST_N ),
        .CLK_IN        ( LANE3_RX_CLK_R_net_0 ),
        .CLK_REF       ( LANE3_CLK_REF ),
        .XCVR_RX_READY ( I_XCVR_LANE3_RX_READY ),
        // Outputs
        .RX_FINE_LOCK  ( LANE3_RX_READY_net_0 ) 
        );

//--------DFN1
DFN1 I_XCVR_LANE0_SD_DFN1(
        // Inputs
        .D   ( I_XCVR_LANE0_SD_SLE_DEBUG_Q ),
        .CLK ( CTRL_CLK ),
        // Outputs
        .Q   ( I_XCVR_LANE0_SD_DFN1_Q ) 
        );

//--------DFN1
DFN1 I_XCVR_LANE0_SD_DFN2(
        // Inputs
        .D   ( I_XCVR_LANE0_SD_DFN1_Q ),
        .CLK ( CTRL_CLK ),
        // Outputs
        .Q   ( I_XCVR_LANE0_SD_DFN2_Q ) 
        );

//--------OR2
OR2 I_XCVR_LANE0_SD_OR2(
        // Inputs
        .A ( I_XCVR_LANE0_SD_DFN2_Q ),
        .B ( I_XCVR_CORELANEMSTR_0_CALIB_SYNC_HOLD ),
        // Outputs
        .Y ( I_XCVR_LANE0_SD_OR2_Y ) 
        );

//--------SLE_DEBUG
SLE_DEBUG I_XCVR_LANE0_SD_SLE_DEBUG(
        // Inputs
        .D   ( I_XCVR_LANE0_SD_SLE_DEBUG_Q ),
        .CLK ( VCC_net ),
        .EN  ( VCC_net ),
        .ALn ( CTRL_ARST_N ),
        .ADn ( VCC_net ),
        .SLn ( VCC_net ),
        .SD  ( GND_net ),
        .LAT ( VCC_net ),
        // Outputs
        .Q   ( I_XCVR_LANE0_SD_SLE_DEBUG_Q ) 
        );

//--------DFN1
DFN1 I_XCVR_LANE1_SD_DFN1(
        // Inputs
        .D   ( I_XCVR_LANE1_SD_SLE_DEBUG_Q ),
        .CLK ( CTRL_CLK ),
        // Outputs
        .Q   ( I_XCVR_LANE1_SD_DFN1_Q ) 
        );

//--------DFN1
DFN1 I_XCVR_LANE1_SD_DFN2(
        // Inputs
        .D   ( I_XCVR_LANE1_SD_DFN1_Q ),
        .CLK ( CTRL_CLK ),
        // Outputs
        .Q   ( I_XCVR_LANE1_SD_DFN2_Q ) 
        );

//--------OR2
OR2 I_XCVR_LANE1_SD_OR2(
        // Inputs
        .A ( I_XCVR_LANE1_SD_DFN2_Q ),
        .B ( I_XCVR_CORELANEMSTR_1_CALIB_SYNC_HOLD ),
        // Outputs
        .Y ( I_XCVR_LANE1_SD_OR2_Y ) 
        );

//--------SLE_DEBUG
SLE_DEBUG I_XCVR_LANE1_SD_SLE_DEBUG(
        // Inputs
        .D   ( I_XCVR_LANE1_SD_SLE_DEBUG_Q ),
        .CLK ( VCC_net ),
        .EN  ( VCC_net ),
        .ALn ( CTRL_ARST_N ),
        .ADn ( VCC_net ),
        .SLn ( VCC_net ),
        .SD  ( GND_net ),
        .LAT ( VCC_net ),
        // Outputs
        .Q   ( I_XCVR_LANE1_SD_SLE_DEBUG_Q ) 
        );

//--------DFN1
DFN1 I_XCVR_LANE2_SD_DFN1(
        // Inputs
        .D   ( I_XCVR_LANE2_SD_SLE_DEBUG_Q ),
        .CLK ( CTRL_CLK ),
        // Outputs
        .Q   ( I_XCVR_LANE2_SD_DFN1_Q ) 
        );

//--------DFN1
DFN1 I_XCVR_LANE2_SD_DFN2(
        // Inputs
        .D   ( I_XCVR_LANE2_SD_DFN1_Q ),
        .CLK ( CTRL_CLK ),
        // Outputs
        .Q   ( I_XCVR_LANE2_SD_DFN2_Q ) 
        );

//--------OR2
OR2 I_XCVR_LANE2_SD_OR2(
        // Inputs
        .A ( I_XCVR_LANE2_SD_DFN2_Q ),
        .B ( I_XCVR_CORELANEMSTR_2_CALIB_SYNC_HOLD ),
        // Outputs
        .Y ( I_XCVR_LANE2_SD_OR2_Y ) 
        );

//--------SLE_DEBUG
SLE_DEBUG I_XCVR_LANE2_SD_SLE_DEBUG(
        // Inputs
        .D   ( I_XCVR_LANE2_SD_SLE_DEBUG_Q ),
        .CLK ( VCC_net ),
        .EN  ( VCC_net ),
        .ALn ( CTRL_ARST_N ),
        .ADn ( VCC_net ),
        .SLn ( VCC_net ),
        .SD  ( GND_net ),
        .LAT ( VCC_net ),
        // Outputs
        .Q   ( I_XCVR_LANE2_SD_SLE_DEBUG_Q ) 
        );

//--------DFN1
DFN1 I_XCVR_LANE3_SD_DFN1(
        // Inputs
        .D   ( I_XCVR_LANE3_SD_SLE_DEBUG_Q ),
        .CLK ( CTRL_CLK ),
        // Outputs
        .Q   ( I_XCVR_LANE3_SD_DFN1_Q ) 
        );

//--------DFN1
DFN1 I_XCVR_LANE3_SD_DFN2(
        // Inputs
        .D   ( I_XCVR_LANE3_SD_DFN1_Q ),
        .CLK ( CTRL_CLK ),
        // Outputs
        .Q   ( I_XCVR_LANE3_SD_DFN2_Q ) 
        );

//--------OR2
OR2 I_XCVR_LANE3_SD_OR2(
        // Inputs
        .A ( I_XCVR_LANE3_SD_DFN2_Q ),
        .B ( I_XCVR_CORELANEMSTR_3_CALIB_SYNC_HOLD ),
        // Outputs
        .Y ( I_XCVR_LANE3_SD_OR2_Y ) 
        );

//--------SLE_DEBUG
SLE_DEBUG I_XCVR_LANE3_SD_SLE_DEBUG(
        // Inputs
        .D   ( I_XCVR_LANE3_SD_SLE_DEBUG_Q ),
        .CLK ( VCC_net ),
        .EN  ( VCC_net ),
        .ALn ( CTRL_ARST_N ),
        .ADn ( VCC_net ),
        .SLn ( VCC_net ),
        .SD  ( GND_net ),
        .LAT ( VCC_net ),
        // Outputs
        .Q   ( I_XCVR_LANE3_SD_SLE_DEBUG_Q ) 
        );


endmodule
