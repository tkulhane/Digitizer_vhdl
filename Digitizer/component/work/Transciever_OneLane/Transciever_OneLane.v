//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Thu May 30 09:25:05 2024
// Version: 2022.1 2022.1.0.10
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// Transciever_OneLane
module Transciever_OneLane(
    // Inputs
    CTRL_CLK,
    CTRL_Fault_CLR,
    CTRL_RST_N,
    Input_Data_0,
    Input_Data_1,
    Input_Data_2,
    Input_Data_3,
    LANE0_RXD_N,
    LANE0_RXD_P,
    LANE_CLK_REF,
    Logic_Clock,
    Logic_Reser_N,
    REF_CLK,
    Read_Enable,
    SYNC_OK,
    // Outputs
    CTRL_Data_Go,
    CTRL_Fault,
    CTRL_ILAS_Go,
    CTRL_Synced,
    Empty_For_NonAll,
    Input_MainData_Read,
    LANE0_TXD_N,
    LANE0_TXD_P,
    LANE_RX_DATA,
    LANE_RX_K,
    Output_Data_0,
    Output_Data_1,
    Output_Data_2,
    Output_Data_3,
    StatusVector
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input         CTRL_CLK;
input         CTRL_Fault_CLR;
input         CTRL_RST_N;
input  [15:0] Input_Data_0;
input  [15:0] Input_Data_1;
input  [15:0] Input_Data_2;
input  [15:0] Input_Data_3;
input         LANE0_RXD_N;
input         LANE0_RXD_P;
input         LANE_CLK_REF;
input         Logic_Clock;
input         Logic_Reser_N;
input         REF_CLK;
input         Read_Enable;
input         SYNC_OK;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output        CTRL_Data_Go;
output        CTRL_Fault;
output        CTRL_ILAS_Go;
output        CTRL_Synced;
output        Empty_For_NonAll;
output        Input_MainData_Read;
output        LANE0_TXD_N;
output        LANE0_TXD_P;
output [63:0] LANE_RX_DATA;
output [7:0]  LANE_RX_K;
output [15:0] Output_Data_0;
output [15:0] Output_Data_1;
output [15:0] Output_Data_2;
output [15:0] Output_Data_3;
output [31:0] StatusVector;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire   [15:0]  AlignmentLane_Fifo_0_Count;
wire           COREFIFO_C12_0_1_EMPTY;
wire           COREFIFO_C12_0_1_FULL;
wire           COREFIFO_C12_0_EMPTY;
wire           COREFIFO_C12_0_FULL;
wire   [63:0]  COREFIFO_C12_0_Q;
wire           COREFIFO_C13_0_0_EMPTY;
wire           COREFIFO_C13_0_0_FULL;
wire           COREFIFO_C13_0_EMPTY;
wire           COREFIFO_C13_0_FULL;
wire   [7:0]   COREFIFO_C13_0_Q;
wire           CTRL_CLK;
wire           CTRL_Data_Go_net_0;
wire           CTRL_Fault_net_0;
wire           CTRL_Fault_CLR;
wire           CTRL_ILAS_Go_net_0;
wire           CTRL_RST_N;
wire           CTRL_Synced_net_0;
wire           Empty_For_NonAll_net_0;
wire   [15:0]  Input_Data_0;
wire   [15:0]  Input_Data_1;
wire   [15:0]  Input_Data_2;
wire   [15:0]  Input_Data_3;
wire           Input_MainData_Read_net_0;
wire           LANE0_RXD_N;
wire           LANE0_RXD_P;
wire           LANE0_TXD_N_net_0;
wire           LANE0_TXD_P_net_0;
wire           LANE_CLK_REF;
wire   [63:0]  LANE_RX_DATA_net_0;
wire   [7:0]   LANE_RX_K_net_0;
wire           Logic_Clock;
wire           Logic_Reser_N;
wire           OR2_0_0_0_Y;
wire           OR2_0_0_1_Y;
wire           OR2_0_0_Y;
wire           OR2_0_Y;
wire   [15:0]  Output_Data_0_net_0;
wire   [31:16] Output_Data_1_net_0;
wire   [47:32] Output_Data_2_net_0;
wire   [63:48] Output_Data_3_net_0;
wire           PF_TX_PLL_C1_0_CLKS_TO_XCVR_BIT_CLK;
wire           PF_TX_PLL_C1_0_CLKS_TO_XCVR_LOCK;
wire           PF_TX_PLL_C1_0_CLKS_TO_XCVR_REF_CLK_TO_LANE;
wire   [7:0]   PF_XCVR_ERM_C8_0_LANE0_8B10B_RX_K;
wire           PF_XCVR_ERM_C8_0_LANE0_RX_CLK_R;
wire   [63:0]  PF_XCVR_ERM_C8_0_LANE0_RX_DATA;
wire           PF_XCVR_ERM_C8_0_LANE0_RX_READY;
wire           PF_XCVR_ERM_C8_0_LANE0_RX_VAL;
wire           PF_XCVR_ERM_C8_0_LANE0_TX_CLK_R_0;
wire           PF_XCVR_ERM_C8_0_LANE0_TX_CLK_STABLE;
wire           Read_Enable;
wire           REF_CLK;
wire   [63:0]  RxLaneControl_0_Output_Data;
wire   [7:0]   RxLaneControl_0_Output_DataWrite;
wire           RxLaneControl_0_Status_CTRL_Fault;
wire   [2:0]   RxLaneControl_0_Status_FSM_State;
wire   [31:0]  StatusVector_net_0;
wire           SYNC_OK;
wire           Synchronizer_0_0_Data_Out;
wire           Synchronizer_0_2_0_Data_Out;
wire           Synchronizer_0_2_1_Data_Out;
wire           Synchronizer_0_2_2_Data_Out;
wire           Synchronizer_0_2_3_Data_Out;
wire           Synchronizer_0_2_4_Data_Out;
wire           Synchronizer_0_2_Data_Out;
wire           Synchronizer_0_Data_Out;
wire   [63:0]  TxLaneControl_0_Output_Data;
wire   [7:0]   TxLaneControl_0_Output_K;
wire           Input_MainData_Read_net_1;
wire           Empty_For_NonAll_net_1;
wire           CTRL_Data_Go_net_1;
wire           CTRL_Synced_net_1;
wire           CTRL_ILAS_Go_net_1;
wire           LANE0_TXD_P_net_1;
wire           LANE0_TXD_N_net_1;
wire           CTRL_Fault_net_1;
wire   [15:0]  Output_Data_0_net_1;
wire   [15:0]  Output_Data_1_net_1;
wire   [15:0]  Output_Data_2_net_1;
wire   [15:0]  Output_Data_3_net_1;
wire   [31:0]  StatusVector_net_1;
wire   [63:0]  LANE_RX_DATA_net_1;
wire   [7:0]   LANE_RX_K_net_1;
wire   [63:0]  Read_Data_net_0;
wire   [63:0]  Input_MainData_net_0;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire           VCC_net;
wire   [7:0]   Read_Data_Enable_const_net_0;
wire   [15:0]  LANE0_TX_DISPFNC_const_net_0;
wire           GND_net;
//--------------------------------------------------------------------
// Inverted Nets
//--------------------------------------------------------------------
wire           WE_IN_POST_INV0_0;
wire           RE_IN_POST_INV1_0;
wire           WE_IN_POST_INV2_0;
wire           RE_IN_POST_INV3_0;
wire           WE_IN_POST_INV4_0;
wire           RE_IN_POST_INV5_0;
wire           WE_IN_POST_INV6_0;
wire           RE_IN_POST_INV7_0;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign VCC_net                      = 1'b1;
assign Read_Data_Enable_const_net_0 = 8'hFF;
assign LANE0_TX_DISPFNC_const_net_0 = 16'h0000;
assign GND_net                      = 1'b0;
//--------------------------------------------------------------------
// Inversions
//--------------------------------------------------------------------
assign WE_IN_POST_INV0_0 = ~ COREFIFO_C12_0_FULL;
assign RE_IN_POST_INV1_0 = ~ COREFIFO_C12_0_EMPTY;
assign WE_IN_POST_INV2_0 = ~ COREFIFO_C12_0_1_FULL;
assign RE_IN_POST_INV3_0 = ~ COREFIFO_C12_0_1_EMPTY;
assign WE_IN_POST_INV4_0 = ~ COREFIFO_C13_0_FULL;
assign RE_IN_POST_INV5_0 = ~ COREFIFO_C13_0_EMPTY;
assign WE_IN_POST_INV6_0 = ~ COREFIFO_C13_0_0_FULL;
assign RE_IN_POST_INV7_0 = ~ COREFIFO_C13_0_0_EMPTY;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign Input_MainData_Read_net_1 = Input_MainData_Read_net_0;
assign Input_MainData_Read       = Input_MainData_Read_net_1;
assign Empty_For_NonAll_net_1    = Empty_For_NonAll_net_0;
assign Empty_For_NonAll          = Empty_For_NonAll_net_1;
assign CTRL_Data_Go_net_1        = CTRL_Data_Go_net_0;
assign CTRL_Data_Go              = CTRL_Data_Go_net_1;
assign CTRL_Synced_net_1         = CTRL_Synced_net_0;
assign CTRL_Synced               = CTRL_Synced_net_1;
assign CTRL_ILAS_Go_net_1        = CTRL_ILAS_Go_net_0;
assign CTRL_ILAS_Go              = CTRL_ILAS_Go_net_1;
assign LANE0_TXD_P_net_1         = LANE0_TXD_P_net_0;
assign LANE0_TXD_P               = LANE0_TXD_P_net_1;
assign LANE0_TXD_N_net_1         = LANE0_TXD_N_net_0;
assign LANE0_TXD_N               = LANE0_TXD_N_net_1;
assign CTRL_Fault_net_1          = CTRL_Fault_net_0;
assign CTRL_Fault                = CTRL_Fault_net_1;
assign Output_Data_0_net_1       = Output_Data_0_net_0;
assign Output_Data_0[15:0]       = Output_Data_0_net_1;
assign Output_Data_1_net_1       = Output_Data_1_net_0;
assign Output_Data_1[15:0]       = Output_Data_1_net_1;
assign Output_Data_2_net_1       = Output_Data_2_net_0;
assign Output_Data_2[15:0]       = Output_Data_2_net_1;
assign Output_Data_3_net_1       = Output_Data_3_net_0;
assign Output_Data_3[15:0]       = Output_Data_3_net_1;
assign StatusVector_net_1        = StatusVector_net_0;
assign StatusVector[31:0]        = StatusVector_net_1;
assign LANE_RX_DATA_net_1        = LANE_RX_DATA_net_0;
assign LANE_RX_DATA[63:0]        = LANE_RX_DATA_net_1;
assign LANE_RX_K_net_1           = LANE_RX_K_net_0;
assign LANE_RX_K[7:0]            = LANE_RX_K_net_1;
//--------------------------------------------------------------------
// Slices assignments
//--------------------------------------------------------------------
assign Output_Data_0_net_0 = Read_Data_net_0[15:0];
assign Output_Data_1_net_0 = Read_Data_net_0[31:16];
assign Output_Data_2_net_0 = Read_Data_net_0[47:32];
assign Output_Data_3_net_0 = Read_Data_net_0[63:48];
//--------------------------------------------------------------------
// Concatenation assignments
//--------------------------------------------------------------------
assign Input_MainData_net_0 = { Input_Data_3 , Input_Data_2 , Input_Data_1 , Input_Data_0 };
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------AlignmentLane_Fifo
AlignmentLane_Fifo #( 
        .g_BYTE_WIDTH ( 8 ),
        .g_DEPTH      ( 256 ),
        .g_NumOfBYTES ( 8 ) )
AlignmentLane_Fifo_0(
        // Inputs
        .Clock             ( Logic_Clock ),
        .Reset_N           ( Logic_Reser_N ),
        .Write_Enable      ( VCC_net ),
        .Read_Enable       ( Read_Enable ),
        .Write_Data        ( RxLaneControl_0_Output_Data ),
        .Write_Data_Enable ( RxLaneControl_0_Output_DataWrite ),
        .Read_Data_Enable  ( Read_Data_Enable_const_net_0 ),
        // Outputs
        .Full              (  ),
        .Full_For_All      (  ),
        .Empty             (  ),
        .Empty_For_NonAll  ( Empty_For_NonAll_net_0 ),
        .Count             ( AlignmentLane_Fifo_0_Count ),
        .Read_Data         ( Read_Data_net_0 ),
        .Read_Data_Empty   (  ) 
        );

//--------COREFIFO_C12
COREFIFO_C12 COREFIFO_C12_0(
        // Inputs
        .WCLOCK   ( Logic_Clock ),
        .RCLOCK   ( PF_XCVR_ERM_C8_0_LANE0_TX_CLK_R_0 ),
        .WRESET_N ( Logic_Reser_N ),
        .RRESET_N ( Synchronizer_0_2_4_Data_Out ),
        .WE       ( WE_IN_POST_INV0_0 ),
        .RE       ( RE_IN_POST_INV1_0 ),
        .DATA     ( TxLaneControl_0_Output_Data ),
        // Outputs
        .FULL     ( COREFIFO_C12_0_FULL ),
        .EMPTY    ( COREFIFO_C12_0_EMPTY ),
        .Q        ( COREFIFO_C12_0_Q ) 
        );

//--------COREFIFO_C12
COREFIFO_C12 COREFIFO_C12_0_1(
        // Inputs
        .WCLOCK   ( PF_XCVR_ERM_C8_0_LANE0_RX_CLK_R ),
        .RCLOCK   ( Logic_Clock ),
        .WRESET_N ( Synchronizer_0_2_Data_Out ),
        .RRESET_N ( Logic_Reser_N ),
        .WE       ( WE_IN_POST_INV2_0 ),
        .RE       ( RE_IN_POST_INV3_0 ),
        .DATA     ( PF_XCVR_ERM_C8_0_LANE0_RX_DATA ),
        // Outputs
        .FULL     ( COREFIFO_C12_0_1_FULL ),
        .EMPTY    ( COREFIFO_C12_0_1_EMPTY ),
        .Q        ( LANE_RX_DATA_net_0 ) 
        );

//--------COREFIFO_C13
COREFIFO_C13 COREFIFO_C13_0(
        // Inputs
        .WCLOCK   ( Logic_Clock ),
        .RCLOCK   ( PF_XCVR_ERM_C8_0_LANE0_TX_CLK_R_0 ),
        .WRESET_N ( Logic_Reser_N ),
        .RRESET_N ( Synchronizer_0_2_4_Data_Out ),
        .WE       ( WE_IN_POST_INV4_0 ),
        .RE       ( RE_IN_POST_INV5_0 ),
        .DATA     ( TxLaneControl_0_Output_K ),
        // Outputs
        .FULL     ( COREFIFO_C13_0_FULL ),
        .EMPTY    ( COREFIFO_C13_0_EMPTY ),
        .Q        ( COREFIFO_C13_0_Q ) 
        );

//--------COREFIFO_C13
COREFIFO_C13 COREFIFO_C13_0_0(
        // Inputs
        .WCLOCK   ( PF_XCVR_ERM_C8_0_LANE0_RX_CLK_R ),
        .RCLOCK   ( Logic_Clock ),
        .WRESET_N ( Synchronizer_0_2_Data_Out ),
        .RRESET_N ( Logic_Reser_N ),
        .WE       ( WE_IN_POST_INV6_0 ),
        .RE       ( RE_IN_POST_INV7_0 ),
        .DATA     ( PF_XCVR_ERM_C8_0_LANE0_8B10B_RX_K ),
        // Outputs
        .FULL     ( COREFIFO_C13_0_0_FULL ),
        .EMPTY    ( COREFIFO_C13_0_0_EMPTY ),
        .Q        ( LANE_RX_K_net_0 ) 
        );

//--------OR2
OR2 OR2_0(
        // Inputs
        .A ( COREFIFO_C12_0_1_EMPTY ),
        .B ( COREFIFO_C13_0_0_EMPTY ),
        // Outputs
        .Y ( OR2_0_Y ) 
        );

//--------OR2
OR2 OR2_0_0(
        // Inputs
        .A ( COREFIFO_C12_0_1_FULL ),
        .B ( COREFIFO_C13_0_0_FULL ),
        // Outputs
        .Y ( OR2_0_0_Y ) 
        );

//--------OR2
OR2 OR2_0_0_0(
        // Inputs
        .A ( COREFIFO_C12_0_EMPTY ),
        .B ( COREFIFO_C13_0_EMPTY ),
        // Outputs
        .Y ( OR2_0_0_0_Y ) 
        );

//--------OR2
OR2 OR2_0_0_1(
        // Inputs
        .A ( COREFIFO_C12_0_FULL ),
        .B ( COREFIFO_C13_0_FULL ),
        // Outputs
        .Y ( OR2_0_0_1_Y ) 
        );

//--------PF_TX_PLL_C1
PF_TX_PLL_C1 PF_TX_PLL_C1_0(
        // Inputs
        .FAB_REF_CLK     ( REF_CLK ),
        // Outputs
        .PLL_LOCK        (  ),
        .LOCK            ( PF_TX_PLL_C1_0_CLKS_TO_XCVR_LOCK ),
        .BIT_CLK         ( PF_TX_PLL_C1_0_CLKS_TO_XCVR_BIT_CLK ),
        .REF_CLK_TO_LANE ( PF_TX_PLL_C1_0_CLKS_TO_XCVR_REF_CLK_TO_LANE ) 
        );

//--------PF_XCVR_ERM_C8
PF_XCVR_ERM_C8 PF_XCVR_ERM_C8_0(
        // Inputs
        .LANE0_RXD_P              ( LANE0_RXD_P ),
        .LANE0_RXD_N              ( LANE0_RXD_N ),
        .LANE0_TX_DATA            ( COREFIFO_C12_0_Q ),
        .LANE0_CDR_REF_CLK_FAB    ( REF_CLK ),
        .LANE0_PCS_ARST_N         ( CTRL_RST_N ),
        .LANE0_PMA_ARST_N         ( CTRL_RST_N ),
        .LANE0_TX_DISPFNC         ( LANE0_TX_DISPFNC_const_net_0 ),
        .LANE0_8B10B_TX_K         ( COREFIFO_C13_0_Q ),
        .TX_PLL_LOCK_0            ( PF_TX_PLL_C1_0_CLKS_TO_XCVR_LOCK ),
        .TX_BIT_CLK_0             ( PF_TX_PLL_C1_0_CLKS_TO_XCVR_BIT_CLK ),
        .TX_PLL_REF_CLK_0         ( PF_TX_PLL_C1_0_CLKS_TO_XCVR_REF_CLK_TO_LANE ),
        .CTRL_CLK                 ( CTRL_CLK ),
        .CTRL_ARST_N              ( CTRL_RST_N ),
        .LANE0_LOS                ( GND_net ),
        .LANE0_CLK_REF            ( LANE_CLK_REF ),
        // Outputs
        .LANE0_TXD_P              ( LANE0_TXD_P_net_0 ),
        .LANE0_TXD_N              ( LANE0_TXD_N_net_0 ),
        .LANE0_RX_DATA            ( PF_XCVR_ERM_C8_0_LANE0_RX_DATA ),
        .LANE0_TX_CLK_R           ( PF_XCVR_ERM_C8_0_LANE0_TX_CLK_R_0 ),
        .LANE0_RX_CLK_R           ( PF_XCVR_ERM_C8_0_LANE0_RX_CLK_R ),
        .LANE0_RX_IDLE            (  ),
        .LANE0_TX_CLK_STABLE      ( PF_XCVR_ERM_C8_0_LANE0_TX_CLK_STABLE ),
        .LANE0_RX_CODE_VIOLATION  (  ),
        .LANE0_RX_DISPARITY_ERROR (  ),
        .LANE0_8B10B_RX_K         ( PF_XCVR_ERM_C8_0_LANE0_8B10B_RX_K ),
        .LANE0_RX_READY           ( PF_XCVR_ERM_C8_0_LANE0_RX_READY ),
        .LANE0_RX_VAL             ( PF_XCVR_ERM_C8_0_LANE0_RX_VAL ) 
        );

//--------RxLaneControl
RxLaneControl #( 
        .g_NumberOfDataOutputBytes ( 8 ),
        .g_NumberOfIlasSequences   ( 3 ) )
RxLaneControl_0(
        // Inputs
        .Clock             ( Logic_Clock ),
        .Reset_N           ( Logic_Reser_N ),
        .CDR_READY         ( Synchronizer_0_Data_Out ),
        .CDR_VAL           ( Synchronizer_0_0_Data_Out ),
        .CTRL_Fault_CLR    ( CTRL_Fault_CLR ),
        .Status_Fault_CLR  ( GND_net ),
        .Input_Data        ( LANE_RX_DATA_net_0 ),
        .Input_K           ( LANE_RX_K_net_0 ),
        // Outputs
        .CTRL_Synced       ( CTRL_Synced_net_0 ),
        .CTRL_ILAS_Go      ( CTRL_ILAS_Go_net_0 ),
        .CTRL_Data_Go      ( CTRL_Data_Go_net_0 ),
        .CTRL_Fault        ( CTRL_Fault_net_0 ),
        .Status_CTRL_Fault ( RxLaneControl_0_Status_CTRL_Fault ),
        .Output_Data       ( RxLaneControl_0_Output_Data ),
        .Output_DataWrite  ( RxLaneControl_0_Output_DataWrite ),
        .Status_FSM_State  ( RxLaneControl_0_Status_FSM_State ) 
        );

//--------Synchronizer
Synchronizer Synchronizer_0(
        // Inputs
        .nRST     ( Logic_Reser_N ),
        .CLK      ( Logic_Clock ),
        .Data_In  ( PF_XCVR_ERM_C8_0_LANE0_RX_READY ),
        // Outputs
        .Data_Out ( Synchronizer_0_Data_Out ) 
        );

//--------Synchronizer
Synchronizer Synchronizer_0_0(
        // Inputs
        .nRST     ( Logic_Reser_N ),
        .CLK      ( Logic_Clock ),
        .Data_In  ( PF_XCVR_ERM_C8_0_LANE0_RX_VAL ),
        // Outputs
        .Data_Out ( Synchronizer_0_0_Data_Out ) 
        );

//--------Synchronizer
Synchronizer Synchronizer_0_2(
        // Inputs
        .nRST     ( Logic_Reser_N ),
        .CLK      ( PF_XCVR_ERM_C8_0_LANE0_RX_CLK_R ),
        .Data_In  ( VCC_net ),
        // Outputs
        .Data_Out ( Synchronizer_0_2_Data_Out ) 
        );

//--------Synchronizer
Synchronizer Synchronizer_0_2_0(
        // Inputs
        .nRST     ( Logic_Reser_N ),
        .CLK      ( Logic_Clock ),
        .Data_In  ( OR2_0_0_Y ),
        // Outputs
        .Data_Out ( Synchronizer_0_2_0_Data_Out ) 
        );

//--------Synchronizer
Synchronizer Synchronizer_0_2_1(
        // Inputs
        .nRST     ( Logic_Reser_N ),
        .CLK      ( Logic_Clock ),
        .Data_In  ( OR2_0_Y ),
        // Outputs
        .Data_Out ( Synchronizer_0_2_1_Data_Out ) 
        );

//--------Synchronizer
Synchronizer Synchronizer_0_2_2(
        // Inputs
        .nRST     ( Logic_Reser_N ),
        .CLK      ( Logic_Clock ),
        .Data_In  ( OR2_0_0_1_Y ),
        // Outputs
        .Data_Out ( Synchronizer_0_2_2_Data_Out ) 
        );

//--------Synchronizer
Synchronizer Synchronizer_0_2_3(
        // Inputs
        .nRST     ( Logic_Reser_N ),
        .CLK      ( Logic_Clock ),
        .Data_In  ( OR2_0_0_0_Y ),
        // Outputs
        .Data_Out ( Synchronizer_0_2_3_Data_Out ) 
        );

//--------Synchronizer
Synchronizer Synchronizer_0_2_4(
        // Inputs
        .nRST     ( Logic_Reser_N ),
        .CLK      ( Logic_Clock ),
        .Data_In  ( PF_XCVR_ERM_C8_0_LANE0_TX_CLK_STABLE ),
        // Outputs
        .Data_Out ( Synchronizer_0_2_4_Data_Out ) 
        );

//--------Transceiver_LaneStatus
Transceiver_LaneStatus Transceiver_LaneStatus_0(
        // Inputs
        .Clock               ( Logic_Clock ),
        .Reset_N             ( Logic_Reser_N ),
        .TxClk_Stable        ( Synchronizer_0_2_4_Data_Out ),
        .Rx_Ready            ( Synchronizer_0_Data_Out ),
        .Rx_Val              ( Synchronizer_0_0_Data_Out ),
        .Rx_LaneFault        ( RxLaneControl_0_Status_CTRL_Fault ),
        .RxFifo_Full         ( Synchronizer_0_2_0_Data_Out ),
        .RxFifo_Empty        ( Synchronizer_0_2_1_Data_Out ),
        .TxFifo_Full         ( Synchronizer_0_2_2_Data_Out ),
        .TxFifo_Empty        ( Synchronizer_0_2_3_Data_Out ),
        .AlligmentFifo_Count ( AlignmentLane_Fifo_0_Count ),
        .RxFsmState          ( RxLaneControl_0_Status_FSM_State ),
        // Outputs
        .StatusVector        ( StatusVector_net_0 ) 
        );

//--------TxLaneControl
TxLaneControl #( 
        .g_Delay                   ( 0 ),
        .g_NumberOfDataOutputBytes ( 8 ),
        .g_NumberOfIlasSequences   ( 3 ) )
TxLaneControl_0(
        // Inputs
        .Clock               ( Logic_Clock ),
        .Reset_N             ( Synchronizer_0_2_4_Data_Out ),
        .SYNC_OK             ( SYNC_OK ),
        .Input_MainData      ( Input_MainData_net_0 ),
        // Outputs
        .Input_MainData_Read ( Input_MainData_Read_net_0 ),
        .Output_Data         ( TxLaneControl_0_Output_Data ),
        .Output_K            ( TxLaneControl_0_Output_K ) 
        );


endmodule
