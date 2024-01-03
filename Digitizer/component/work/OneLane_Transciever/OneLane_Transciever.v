//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Wed Jan  3 15:10:22 2024
// Version: 2022.1 2022.1.0.10
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// OneLane_Transciever
module OneLane_Transciever(
    // Inputs
    CTRL_CLK,
    CTRL_RST_N,
    Input_MainData_0,
    Input_MainData_1,
    Input_MainData_2,
    Input_MainData_3,
    LANE0_RXD_N,
    LANE0_RXD_P,
    Logic_Clock,
    Logic_Reser_N,
    REF_CLK,
    Read_Enable,
    SYNC_OK,
    // Outputs
    CTRL_Data_Go,
    CTRL_ILAS_Go,
    CTRL_Synced,
    Empty_For_NonAll,
    Input_MainData_Read,
    LANE0_TXD_N,
    LANE0_TXD_P,
    Output_Data_0,
    Output_Data_1,
    Output_Data_2,
    Output_Data_3
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input         CTRL_CLK;
input         CTRL_RST_N;
input  [7:0]  Input_MainData_0;
input  [7:0]  Input_MainData_1;
input  [7:0]  Input_MainData_2;
input  [7:0]  Input_MainData_3;
input         LANE0_RXD_N;
input         LANE0_RXD_P;
input         Logic_Clock;
input         Logic_Reser_N;
input         REF_CLK;
input         Read_Enable;
input         SYNC_OK;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output        CTRL_Data_Go;
output        CTRL_ILAS_Go;
output        CTRL_Synced;
output        Empty_For_NonAll;
output        Input_MainData_Read;
output        LANE0_TXD_N;
output        LANE0_TXD_P;
output [11:0] Output_Data_0;
output [11:0] Output_Data_1;
output [11:0] Output_Data_2;
output [11:0] Output_Data_3;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire   [7:0]   Alignment_Fifo_0_Read_Data_0;
wire   [7:0]   Alignment_Fifo_0_Read_Data_1;
wire   [7:0]   Alignment_Fifo_0_Read_Data_2;
wire   [7:0]   Alignment_Fifo_0_Read_Data_3;
wire           COREFIFO_C12_0_1_EMPTY;
wire           COREFIFO_C12_0_1_FULL;
wire   [7:0]   COREFIFO_C12_0_1_Q7to0;
wire   [15:8]  COREFIFO_C12_0_1_Q15to8;
wire   [23:16] COREFIFO_C12_0_1_Q23to16;
wire   [31:24] COREFIFO_C12_0_1_Q31to24;
wire           COREFIFO_C12_0_EMPTY;
wire           COREFIFO_C12_0_FULL;
wire   [31:0]  COREFIFO_C12_0_Q;
wire           COREFIFO_C13_0_0_EMPTY;
wire           COREFIFO_C13_0_0_FULL;
wire   [0:0]   COREFIFO_C13_0_0_Q0to0;
wire   [1:1]   COREFIFO_C13_0_0_Q1to1;
wire   [2:2]   COREFIFO_C13_0_0_Q2to2;
wire   [3:3]   COREFIFO_C13_0_0_Q3to3;
wire           COREFIFO_C13_0_EMPTY;
wire           COREFIFO_C13_0_FULL;
wire   [3:0]   COREFIFO_C13_0_Q;
wire           CTRL_CLK;
wire           CTRL_Data_Go_net_0;
wire           CTRL_ILAS_Go_net_0;
wire           CTRL_RST_N;
wire           CTRL_Synced_net_0;
wire           Empty_For_NonAll_net_0;
wire   [7:0]   Input_MainData_0;
wire   [7:0]   Input_MainData_1;
wire   [7:0]   Input_MainData_2;
wire   [7:0]   Input_MainData_3;
wire           Input_MainData_Read_net_0;
wire           LANE0_RXD_N;
wire           LANE0_RXD_P;
wire           LANE0_TXD_N_net_0;
wire           LANE0_TXD_P_net_0;
wire           Logic_Clock;
wire           Logic_Reser_N;
wire   [11:0]  Output_Data_0_net_0;
wire   [11:0]  Output_Data_1_net_0;
wire   [11:0]  Output_Data_2_net_0;
wire   [11:0]  Output_Data_3_net_0;
wire           PF_TX_PLL_C1_0_CLKS_TO_XCVR_BIT_CLK;
wire           PF_TX_PLL_C1_0_CLKS_TO_XCVR_LOCK;
wire           PF_TX_PLL_C1_0_CLKS_TO_XCVR_REF_CLK_TO_LANE;
wire   [3:0]   PF_XCVR_ERM_C8_0_LANE0_8B10B_RX_K;
wire           PF_XCVR_ERM_C8_0_LANE0_RX_CLK_R;
wire   [31:0]  PF_XCVR_ERM_C8_0_LANE0_RX_DATA;
wire           PF_XCVR_ERM_C8_0_LANE0_RX_READY;
wire           PF_XCVR_ERM_C8_0_LANE0_RX_VAL;
wire           PF_XCVR_ERM_C8_0_LANE0_TX_CLK_R;
wire           PF_XCVR_ERM_C8_0_LANE0_TX_CLK_STABLE_0;
wire           Read_Enable;
wire           REF_CLK;
wire   [7:0]   RxLaneControl_0_Output_Data_0;
wire   [7:0]   RxLaneControl_0_Output_Data_1;
wire   [7:0]   RxLaneControl_0_Output_Data_2;
wire   [7:0]   RxLaneControl_0_Output_Data_3;
wire   [3:0]   RxLaneControl_0_Output_DataWrite;
wire           SYNC_OK;
wire           Synchronizer_0_0_Data_Out;
wire           Synchronizer_0_2_Data_Out;
wire           Synchronizer_0_Data_Out;
wire   [7:0]   TxLaneControl_0_Output_Data_0;
wire   [7:0]   TxLaneControl_0_Output_Data_1;
wire   [7:0]   TxLaneControl_0_Output_Data_2;
wire   [7:0]   TxLaneControl_0_Output_Data_3;
wire           TxLaneControl_0_Output_K_0;
wire           TxLaneControl_0_Output_K_1;
wire           TxLaneControl_0_Output_K_2;
wire           TxLaneControl_0_Output_K_3;
wire           LANE0_TXD_P_net_1;
wire           LANE0_TXD_N_net_1;
wire           CTRL_Synced_net_1;
wire           CTRL_Data_Go_net_1;
wire           CTRL_ILAS_Go_net_1;
wire           Empty_For_NonAll_net_1;
wire           Input_MainData_Read_net_1;
wire   [11:0]  Output_Data_2_net_1;
wire   [11:0]  Output_Data_3_net_1;
wire   [11:0]  Output_Data_0_net_1;
wire   [11:0]  Output_Data_1_net_1;
wire   [31:0]  DATA_net_0;
wire   [31:0]  Q_net_0;
wire   [3:0]   DATA_net_1;
wire   [3:0]   Q_net_1;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire           VCC_net;
wire   [3:0]   Read_Data_Enable_const_net_0;
wire   [7:0]   LANE0_TX_DISPFNC_const_net_0;
wire           GND_net;
//--------------------------------------------------------------------
// Inverted Nets
//--------------------------------------------------------------------
wire           FULL_OUT_PRE_INV0_0;
wire           EMPTY_OUT_PRE_INV1_0;
wire           FULL_OUT_PRE_INV2_0;
wire           EMPTY_OUT_PRE_INV3_0;
wire           FULL_OUT_PRE_INV4_0;
wire           EMPTY_OUT_PRE_INV5_0;
wire           FULL_OUT_PRE_INV6_0;
wire           EMPTY_OUT_PRE_INV7_0;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign VCC_net                      = 1'b1;
assign Read_Data_Enable_const_net_0 = 4'hF;
assign LANE0_TX_DISPFNC_const_net_0 = 8'h00;
assign GND_net                      = 1'b0;
//--------------------------------------------------------------------
// Inversions
//--------------------------------------------------------------------
assign COREFIFO_C12_0_FULL    = ~ FULL_OUT_PRE_INV0_0;
assign COREFIFO_C12_0_EMPTY   = ~ EMPTY_OUT_PRE_INV1_0;
assign COREFIFO_C12_0_1_FULL  = ~ FULL_OUT_PRE_INV2_0;
assign COREFIFO_C12_0_1_EMPTY = ~ EMPTY_OUT_PRE_INV3_0;
assign COREFIFO_C13_0_FULL    = ~ FULL_OUT_PRE_INV4_0;
assign COREFIFO_C13_0_EMPTY   = ~ EMPTY_OUT_PRE_INV5_0;
assign COREFIFO_C13_0_0_FULL  = ~ FULL_OUT_PRE_INV6_0;
assign COREFIFO_C13_0_0_EMPTY = ~ EMPTY_OUT_PRE_INV7_0;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign LANE0_TXD_P_net_1         = LANE0_TXD_P_net_0;
assign LANE0_TXD_P               = LANE0_TXD_P_net_1;
assign LANE0_TXD_N_net_1         = LANE0_TXD_N_net_0;
assign LANE0_TXD_N               = LANE0_TXD_N_net_1;
assign CTRL_Synced_net_1         = CTRL_Synced_net_0;
assign CTRL_Synced               = CTRL_Synced_net_1;
assign CTRL_Data_Go_net_1        = CTRL_Data_Go_net_0;
assign CTRL_Data_Go              = CTRL_Data_Go_net_1;
assign CTRL_ILAS_Go_net_1        = CTRL_ILAS_Go_net_0;
assign CTRL_ILAS_Go              = CTRL_ILAS_Go_net_1;
assign Empty_For_NonAll_net_1    = Empty_For_NonAll_net_0;
assign Empty_For_NonAll          = Empty_For_NonAll_net_1;
assign Input_MainData_Read_net_1 = Input_MainData_Read_net_0;
assign Input_MainData_Read       = Input_MainData_Read_net_1;
assign Output_Data_2_net_1       = Output_Data_2_net_0;
assign Output_Data_2[11:0]       = Output_Data_2_net_1;
assign Output_Data_3_net_1       = Output_Data_3_net_0;
assign Output_Data_3[11:0]       = Output_Data_3_net_1;
assign Output_Data_0_net_1       = Output_Data_0_net_0;
assign Output_Data_0[11:0]       = Output_Data_0_net_1;
assign Output_Data_1_net_1       = Output_Data_1_net_0;
assign Output_Data_1[11:0]       = Output_Data_1_net_1;
//--------------------------------------------------------------------
// Slices assignments
//--------------------------------------------------------------------
assign COREFIFO_C12_0_1_Q7to0    = Q_net_0[7:0];
assign COREFIFO_C12_0_1_Q15to8   = Q_net_0[15:8];
assign COREFIFO_C12_0_1_Q23to16  = Q_net_0[23:16];
assign COREFIFO_C12_0_1_Q31to24  = Q_net_0[31:24];
assign COREFIFO_C13_0_0_Q0to0[0] = Q_net_1[0:0];
assign COREFIFO_C13_0_0_Q1to1[1] = Q_net_1[1:1];
assign COREFIFO_C13_0_0_Q2to2[2] = Q_net_1[2:2];
assign COREFIFO_C13_0_0_Q3to3[3] = Q_net_1[3:3];
//--------------------------------------------------------------------
// Concatenation assignments
//--------------------------------------------------------------------
assign DATA_net_0 = { TxLaneControl_0_Output_Data_3 , TxLaneControl_0_Output_Data_2 , TxLaneControl_0_Output_Data_1 , TxLaneControl_0_Output_Data_0 };
assign DATA_net_1 = { TxLaneControl_0_Output_K_3 , TxLaneControl_0_Output_K_2 , TxLaneControl_0_Output_K_1 , TxLaneControl_0_Output_K_0 };
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------Alignment_Fifo
Alignment_Fifo Alignment_Fifo_0(
        // Inputs
        .Clock             ( Logic_Clock ),
        .Reset_N           ( Logic_Reser_N ),
        .Write_Enable      ( VCC_net ),
        .Read_Enable       ( Read_Enable ),
        .Write_Data_0      ( RxLaneControl_0_Output_Data_0 ),
        .Write_Data_1      ( RxLaneControl_0_Output_Data_1 ),
        .Write_Data_2      ( RxLaneControl_0_Output_Data_2 ),
        .Write_Data_3      ( RxLaneControl_0_Output_Data_3 ),
        .Write_Data_Enable ( RxLaneControl_0_Output_DataWrite ),
        .Read_Data_Enable  ( Read_Data_Enable_const_net_0 ),
        // Outputs
        .Full              (  ),
        .Full_For_All      (  ),
        .Empty             (  ),
        .Empty_For_NonAll  ( Empty_For_NonAll_net_0 ),
        .Read_Data_0       ( Alignment_Fifo_0_Read_Data_0 ),
        .Read_Data_1       ( Alignment_Fifo_0_Read_Data_1 ),
        .Read_Data_2       ( Alignment_Fifo_0_Read_Data_2 ),
        .Read_Data_3       ( Alignment_Fifo_0_Read_Data_3 ),
        .Read_Data_Empty   (  ) 
        );

//--------COREFIFO_C12
COREFIFO_C12 COREFIFO_C12_0(
        // Inputs
        .WCLOCK   ( Logic_Clock ),
        .RCLOCK   ( PF_XCVR_ERM_C8_0_LANE0_TX_CLK_R ),
        .WRESET_N ( Logic_Reser_N ),
        .RRESET_N ( PF_XCVR_ERM_C8_0_LANE0_TX_CLK_STABLE_0 ),
        .WE       ( COREFIFO_C12_0_FULL ),
        .RE       ( COREFIFO_C12_0_EMPTY ),
        .DATA     ( DATA_net_0 ),
        // Outputs
        .FULL     ( FULL_OUT_PRE_INV0_0 ),
        .EMPTY    ( EMPTY_OUT_PRE_INV1_0 ),
        .Q        ( COREFIFO_C12_0_Q ) 
        );

//--------COREFIFO_C12
COREFIFO_C12 COREFIFO_C12_0_1(
        // Inputs
        .WCLOCK   ( PF_XCVR_ERM_C8_0_LANE0_RX_CLK_R ),
        .RCLOCK   ( Logic_Clock ),
        .WRESET_N ( Synchronizer_0_2_Data_Out ),
        .RRESET_N ( Logic_Reser_N ),
        .WE       ( COREFIFO_C12_0_1_FULL ),
        .RE       ( COREFIFO_C12_0_1_EMPTY ),
        .DATA     ( PF_XCVR_ERM_C8_0_LANE0_RX_DATA ),
        // Outputs
        .FULL     ( FULL_OUT_PRE_INV2_0 ),
        .EMPTY    ( EMPTY_OUT_PRE_INV3_0 ),
        .Q        ( Q_net_0 ) 
        );

//--------COREFIFO_C13
COREFIFO_C13 COREFIFO_C13_0(
        // Inputs
        .WCLOCK   ( Logic_Clock ),
        .RCLOCK   ( PF_XCVR_ERM_C8_0_LANE0_TX_CLK_R ),
        .WRESET_N ( Logic_Reser_N ),
        .RRESET_N ( PF_XCVR_ERM_C8_0_LANE0_TX_CLK_STABLE_0 ),
        .WE       ( COREFIFO_C13_0_FULL ),
        .RE       ( COREFIFO_C13_0_EMPTY ),
        .DATA     ( DATA_net_1 ),
        // Outputs
        .FULL     ( FULL_OUT_PRE_INV4_0 ),
        .EMPTY    ( EMPTY_OUT_PRE_INV5_0 ),
        .Q        ( COREFIFO_C13_0_Q ) 
        );

//--------COREFIFO_C13
COREFIFO_C13 COREFIFO_C13_0_0(
        // Inputs
        .WCLOCK   ( PF_XCVR_ERM_C8_0_LANE0_RX_CLK_R ),
        .RCLOCK   ( Logic_Clock ),
        .WRESET_N ( Synchronizer_0_2_Data_Out ),
        .RRESET_N ( Logic_Reser_N ),
        .WE       ( COREFIFO_C13_0_0_FULL ),
        .RE       ( COREFIFO_C13_0_0_EMPTY ),
        .DATA     ( PF_XCVR_ERM_C8_0_LANE0_8B10B_RX_K ),
        // Outputs
        .FULL     ( FULL_OUT_PRE_INV6_0 ),
        .EMPTY    ( EMPTY_OUT_PRE_INV7_0 ),
        .Q        ( Q_net_1 ) 
        );

//--------LaneOutExtender
LaneOutExtender LaneOutExtender_0(
        // Inputs
        .Input_Data_3  ( Alignment_Fifo_0_Read_Data_3 ),
        .Input_Data_2  ( Alignment_Fifo_0_Read_Data_2 ),
        .Input_Data_1  ( Alignment_Fifo_0_Read_Data_1 ),
        .Input_Data_0  ( Alignment_Fifo_0_Read_Data_0 ),
        // Outputs
        .Output_Data_3 ( Output_Data_3_net_0 ),
        .Output_Data_2 ( Output_Data_2_net_0 ),
        .Output_Data_1 ( Output_Data_1_net_0 ),
        .Output_Data_0 ( Output_Data_0_net_0 ) 
        );

//--------PF_TX_PLL_C1
PF_TX_PLL_C1 PF_TX_PLL_C1_0(
        // Inputs
        .FAB_REF_CLK     ( REF_CLK ),
        // Outputs
        .PLL_LOCK        (  ),
        .LOCK            ( PF_TX_PLL_C1_0_CLKS_TO_XCVR_LOCK ),
        .BIT_CLK         ( PF_TX_PLL_C1_0_CLKS_TO_XCVR_BIT_CLK ),
        .REF_CLK_TO_LANE ( PF_TX_PLL_C1_0_CLKS_TO_XCVR_REF_CLK_TO_LANE ),
        .CLK_125         (  ) 
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
        // Outputs
        .LANE0_TXD_P              ( LANE0_TXD_P_net_0 ),
        .LANE0_TXD_N              ( LANE0_TXD_N_net_0 ),
        .LANE0_RX_DATA            ( PF_XCVR_ERM_C8_0_LANE0_RX_DATA ),
        .LANE0_TX_CLK_R           ( PF_XCVR_ERM_C8_0_LANE0_TX_CLK_R ),
        .LANE0_RX_CLK_R           ( PF_XCVR_ERM_C8_0_LANE0_RX_CLK_R ),
        .LANE0_RX_IDLE            (  ),
        .LANE0_TX_CLK_STABLE      ( PF_XCVR_ERM_C8_0_LANE0_TX_CLK_STABLE_0 ),
        .LANE0_RX_CODE_VIOLATION  (  ),
        .LANE0_RX_DISPARITY_ERROR (  ),
        .LANE0_8B10B_RX_K         ( PF_XCVR_ERM_C8_0_LANE0_8B10B_RX_K ),
        .LANE0_RX_READY           ( PF_XCVR_ERM_C8_0_LANE0_RX_READY ),
        .LANE0_RX_VAL             ( PF_XCVR_ERM_C8_0_LANE0_RX_VAL ) 
        );

//--------RxLaneControl
RxLaneControl RxLaneControl_0(
        // Inputs
        .Clock            ( Logic_Clock ),
        .Reset_N          ( Logic_Reser_N ),
        .Input_K_3        ( COREFIFO_C13_0_0_Q3to3 ),
        .Input_K_2        ( COREFIFO_C13_0_0_Q2to2 ),
        .Input_K_1        ( COREFIFO_C13_0_0_Q1to1 ),
        .Input_K_0        ( COREFIFO_C13_0_0_Q0to0 ),
        .CDR_READY        ( Synchronizer_0_Data_Out ),
        .CDR_VAL          ( Synchronizer_0_0_Data_Out ),
        .Input_Data_3     ( COREFIFO_C12_0_1_Q31to24 ),
        .Input_Data_2     ( COREFIFO_C12_0_1_Q23to16 ),
        .Input_Data_1     ( COREFIFO_C12_0_1_Q15to8 ),
        .Input_Data_0     ( COREFIFO_C12_0_1_Q7to0 ),
        // Outputs
        .CTRL_Synced      ( CTRL_Synced_net_0 ),
        .CTRL_ILAS_Go     ( CTRL_ILAS_Go_net_0 ),
        .CTRL_Data_Go     ( CTRL_Data_Go_net_0 ),
        .CTRL_Fault_Sync  (  ),
        .CTRL_Fault_ILAS  (  ),
        .Output_Data_3    ( RxLaneControl_0_Output_Data_3 ),
        .Output_Data_2    ( RxLaneControl_0_Output_Data_2 ),
        .Output_Data_1    ( RxLaneControl_0_Output_Data_1 ),
        .Output_Data_0    ( RxLaneControl_0_Output_Data_0 ),
        .Output_DataWrite ( RxLaneControl_0_Output_DataWrite ) 
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

//--------TxLaneControl
TxLaneControl TxLaneControl_0(
        // Inputs
        .Clock               ( Logic_Clock ),
        .Reset_N             ( PF_XCVR_ERM_C8_0_LANE0_TX_CLK_STABLE_0 ),
        .SYNC_OK             ( SYNC_OK ),
        .Input_MainData_3    ( Input_MainData_3 ),
        .Input_MainData_2    ( Input_MainData_2 ),
        .Input_MainData_1    ( Input_MainData_1 ),
        .Input_MainData_0    ( Input_MainData_0 ),
        // Outputs
        .Input_MainData_Read ( Input_MainData_Read_net_0 ),
        .Output_K_3          ( TxLaneControl_0_Output_K_3 ),
        .Output_K_2          ( TxLaneControl_0_Output_K_2 ),
        .Output_K_1          ( TxLaneControl_0_Output_K_1 ),
        .Output_K_0          ( TxLaneControl_0_Output_K_0 ),
        .Output_Data_3       ( TxLaneControl_0_Output_Data_3 ),
        .Output_Data_2       ( TxLaneControl_0_Output_Data_2 ),
        .Output_Data_1       ( TxLaneControl_0_Output_Data_1 ),
        .Output_Data_0       ( TxLaneControl_0_Output_Data_0 ) 
        );


endmodule
