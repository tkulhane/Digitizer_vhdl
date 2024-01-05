//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Thu Jan  4 21:34:39 2024
// Version: 2022.1 2022.1.0.10
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// DataSource_Transcievers
module DataSource_Transcievers(
    // Inputs
    CTRL_Clock_40M,
    Gen_Enable,
    LANE0_RXD_N,
    LANE0_RXD_P,
    LANE1_RXD_N,
    LANE1_RXD_P,
    Logic_Clock,
    Logic_Reset_N,
    REF_Clock,
    // Outputs
    Data_Valid,
    LANE0_TXD_N,
    LANE0_TXD_P,
    LANE1_TXD_N,
    LANE1_TXD_P,
    Output_Data_0_0,
    Output_Data_0_1,
    Output_Data_0_2,
    Output_Data_0_3,
    Output_Data_1_0,
    Output_Data_1_1,
    Output_Data_1_2,
    Output_Data_1_3
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input         CTRL_Clock_40M;
input         Gen_Enable;
input         LANE0_RXD_N;
input         LANE0_RXD_P;
input         LANE1_RXD_N;
input         LANE1_RXD_P;
input         Logic_Clock;
input         Logic_Reset_N;
input         REF_Clock;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output        Data_Valid;
output        LANE0_TXD_N;
output        LANE0_TXD_P;
output        LANE1_TXD_N;
output        LANE1_TXD_P;
output [11:0] Output_Data_0_0;
output [11:0] Output_Data_0_1;
output [11:0] Output_Data_0_2;
output [11:0] Output_Data_0_3;
output [11:0] Output_Data_1_0;
output [11:0] Output_Data_1_1;
output [11:0] Output_Data_1_2;
output [11:0] Output_Data_1_3;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire          AND2_0_Y;
wire          AND3_0_Y;
wire          CTRL_Clock_40M;
wire          Data_Valid_net_0;
wire          Gen_Enable;
wire          LANE0_RXD_N;
wire          LANE0_RXD_P;
wire          LANE0_TXD_N_net_0;
wire          LANE0_TXD_P_net_0;
wire          LANE1_RXD_N;
wire          LANE1_RXD_P;
wire          LANE1_TXD_N_net_0;
wire          LANE1_TXD_P_net_0;
wire          Logic_Clock;
wire          Logic_Reset_N;
wire          OneLane_NoTRV_test_0_0_CTRL_Data_Go;
wire          OneLane_NoTRV_test_0_0_CTRL_ILAS_Go;
wire          OneLane_NoTRV_test_0_0_CTRL_Synced;
wire          OneLane_NoTRV_test_0_0_Empty_For_NonAll;
wire          OneLane_NoTRV_test_0_0_Input_MainData_Read;
wire          OneLane_NoTRV_test_0_CTRL_Data_Go;
wire          OneLane_NoTRV_test_0_CTRL_ILAS_Go;
wire          OneLane_NoTRV_test_0_CTRL_Synced;
wire          OneLane_NoTRV_test_0_Empty_For_NonAll;
wire          OneLane_NoTRV_test_0_Input_MainData_Read;
wire          OneLane_Transciever_0_0_CTRL_Data_Go;
wire          OneLane_Transciever_0_0_CTRL_ILAS_Go;
wire          OneLane_Transciever_0_0_CTRL_Synced;
wire          OneLane_Transciever_0_0_Empty_For_NonAll;
wire          OneLane_Transciever_0_0_Input_MainData_Read;
wire          OneLane_Transciever_0_CTRL_Data_Go;
wire          OneLane_Transciever_0_CTRL_ILAS_Go;
wire          OneLane_Transciever_0_CTRL_Synced;
wire          OneLane_Transciever_0_Empty_For_NonAll;
wire          OneLane_Transciever_0_Input_MainData_Read;
wire   [11:0] Output_Data_0_0_net_0;
wire   [11:0] Output_Data_0_1_net_0;
wire   [11:0] Output_Data_0_2_net_0;
wire   [11:0] Output_Data_0_3_net_0;
wire   [11:0] Output_Data_1_0_net_0;
wire   [11:0] Output_Data_1_1_net_0;
wire   [11:0] Output_Data_1_2_net_0;
wire   [11:0] Output_Data_1_3_net_0;
wire          PF_CCC_C5_0_OUT0_FABCLK_0;
wire          PF_CCC_C5_0_PLL_LOCK_0;
wire          REF_Clock;
wire          RxMainLinkController_0_SYNCINB;
wire   [7:0]  SampleTxDeCompose_0_0_Output_Data_0;
wire   [7:0]  SampleTxDeCompose_0_0_Output_Data_1;
wire   [7:0]  SampleTxDeCompose_0_1_Output_Data_0;
wire   [7:0]  SampleTxDeCompose_0_1_Output_Data_1;
wire   [7:0]  SampleTxDeCompose_0_2_0_Output_Data_0;
wire   [7:0]  SampleTxDeCompose_0_2_0_Output_Data_1;
wire   [7:0]  SampleTxDeCompose_0_2_1_Output_Data_0;
wire   [7:0]  SampleTxDeCompose_0_2_1_Output_Data_1;
wire   [7:0]  SampleTxDeCompose_0_2_2_Output_Data_0;
wire   [7:0]  SampleTxDeCompose_0_2_2_Output_Data_1;
wire   [7:0]  SampleTxDeCompose_0_2_3_Output_Data_0;
wire   [7:0]  SampleTxDeCompose_0_2_3_Output_Data_1;
wire   [7:0]  SampleTxDeCompose_0_2_Output_Data_0;
wire   [7:0]  SampleTxDeCompose_0_2_Output_Data_1;
wire   [7:0]  SampleTxDeCompose_0_Output_Data_0;
wire   [7:0]  SampleTxDeCompose_0_Output_Data_1;
wire          Synchronizer_0_2_Data_Out_0;
wire   [11:0] Test_Generator_for_Lanes_0_Test_Data_0;
wire   [11:0] Test_Generator_for_Lanes_0_Test_Data_1;
wire   [11:0] Test_Generator_for_Lanes_0_Test_Data_2;
wire   [11:0] Test_Generator_for_Lanes_0_Test_Data_3;
wire   [11:0] Test_Generator_for_Lanes_0_Test_Data_4;
wire   [11:0] Test_Generator_for_Lanes_0_Test_Data_5;
wire   [11:0] Test_Generator_for_Lanes_0_Test_Data_6;
wire   [11:0] Test_Generator_for_Lanes_0_Test_Data_7;
wire          TxMainLinkController_0_Data_Read;
wire          TxMainLinkController_0_SYNC_OK;
wire          LANE0_TXD_P_net_1;
wire          LANE0_TXD_N_net_1;
wire          LANE1_TXD_P_net_1;
wire          LANE1_TXD_N_net_1;
wire   [11:0] Output_Data_1_1_net_1;
wire   [11:0] Output_Data_1_0_net_1;
wire   [11:0] Output_Data_0_1_net_1;
wire   [11:0] Output_Data_0_0_net_1;
wire          Data_Valid_net_1;
wire   [11:0] Output_Data_0_2_net_1;
wire   [11:0] Output_Data_1_2_net_1;
wire   [11:0] Output_Data_1_3_net_1;
wire   [11:0] Output_Data_0_3_net_1;
wire   [3:0]  LANE_Synced_net_0;
wire   [3:0]  LANE_ILAS_Go_net_0;
wire   [3:0]  LANE_Data_Go_net_0;
wire   [3:0]  LANE_Alignment_Fifo_Empty_net_0;
wire   [3:0]  Lanes_DataGo_net_0;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire          VCC_net;
wire   [3:0]  Input_TailBits_const_net_0;
wire   [3:0]  Input_TailBits_const_net_1;
wire   [3:0]  Input_TailBits_const_net_2;
wire   [3:0]  Input_TailBits_const_net_3;
wire   [3:0]  Input_TailBits_const_net_4;
wire   [3:0]  Input_TailBits_const_net_5;
wire   [3:0]  Input_TailBits_const_net_6;
wire   [3:0]  Input_TailBits_const_net_7;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign VCC_net                    = 1'b1;
assign Input_TailBits_const_net_0 = 4'h0;
assign Input_TailBits_const_net_1 = 4'h0;
assign Input_TailBits_const_net_2 = 4'h0;
assign Input_TailBits_const_net_3 = 4'h0;
assign Input_TailBits_const_net_4 = 4'h0;
assign Input_TailBits_const_net_5 = 4'h0;
assign Input_TailBits_const_net_6 = 4'h0;
assign Input_TailBits_const_net_7 = 4'h0;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign LANE0_TXD_P_net_1     = LANE0_TXD_P_net_0;
assign LANE0_TXD_P           = LANE0_TXD_P_net_1;
assign LANE0_TXD_N_net_1     = LANE0_TXD_N_net_0;
assign LANE0_TXD_N           = LANE0_TXD_N_net_1;
assign LANE1_TXD_P_net_1     = LANE1_TXD_P_net_0;
assign LANE1_TXD_P           = LANE1_TXD_P_net_1;
assign LANE1_TXD_N_net_1     = LANE1_TXD_N_net_0;
assign LANE1_TXD_N           = LANE1_TXD_N_net_1;
assign Output_Data_1_1_net_1 = Output_Data_1_1_net_0;
assign Output_Data_1_1[11:0] = Output_Data_1_1_net_1;
assign Output_Data_1_0_net_1 = Output_Data_1_0_net_0;
assign Output_Data_1_0[11:0] = Output_Data_1_0_net_1;
assign Output_Data_0_1_net_1 = Output_Data_0_1_net_0;
assign Output_Data_0_1[11:0] = Output_Data_0_1_net_1;
assign Output_Data_0_0_net_1 = Output_Data_0_0_net_0;
assign Output_Data_0_0[11:0] = Output_Data_0_0_net_1;
assign Data_Valid_net_1      = Data_Valid_net_0;
assign Data_Valid            = Data_Valid_net_1;
assign Output_Data_0_2_net_1 = Output_Data_0_2_net_0;
assign Output_Data_0_2[11:0] = Output_Data_0_2_net_1;
assign Output_Data_1_2_net_1 = Output_Data_1_2_net_0;
assign Output_Data_1_2[11:0] = Output_Data_1_2_net_1;
assign Output_Data_1_3_net_1 = Output_Data_1_3_net_0;
assign Output_Data_1_3[11:0] = Output_Data_1_3_net_1;
assign Output_Data_0_3_net_1 = Output_Data_0_3_net_0;
assign Output_Data_0_3[11:0] = Output_Data_0_3_net_1;
//--------------------------------------------------------------------
// Concatenation assignments
//--------------------------------------------------------------------
assign LANE_Synced_net_0               = { OneLane_NoTRV_test_0_0_CTRL_Synced , OneLane_NoTRV_test_0_CTRL_Synced , OneLane_Transciever_0_0_CTRL_Synced , OneLane_Transciever_0_CTRL_Synced };
assign LANE_ILAS_Go_net_0              = { OneLane_NoTRV_test_0_0_CTRL_ILAS_Go , OneLane_NoTRV_test_0_CTRL_ILAS_Go , OneLane_Transciever_0_0_CTRL_ILAS_Go , OneLane_Transciever_0_CTRL_ILAS_Go };
assign LANE_Data_Go_net_0              = { OneLane_NoTRV_test_0_0_CTRL_Data_Go , OneLane_NoTRV_test_0_CTRL_Data_Go , OneLane_Transciever_0_0_CTRL_Data_Go , OneLane_Transciever_0_CTRL_Data_Go };
assign LANE_Alignment_Fifo_Empty_net_0 = { OneLane_NoTRV_test_0_0_Empty_For_NonAll , OneLane_NoTRV_test_0_Empty_For_NonAll , OneLane_Transciever_0_0_Empty_For_NonAll , OneLane_Transciever_0_Empty_For_NonAll };
assign Lanes_DataGo_net_0              = { OneLane_NoTRV_test_0_0_Input_MainData_Read , OneLane_NoTRV_test_0_Input_MainData_Read , OneLane_Transciever_0_0_Input_MainData_Read , OneLane_Transciever_0_Input_MainData_Read };
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------AND2
AND2 AND2_0(
        // Inputs
        .A ( Gen_Enable ),
        .B ( TxMainLinkController_0_Data_Read ),
        // Outputs
        .Y ( AND2_0_Y ) 
        );

//--------AND3
AND3 AND3_0(
        // Inputs
        .A ( VCC_net ),
        .B ( PF_CCC_C5_0_PLL_LOCK_0 ),
        .C ( Logic_Reset_N ),
        // Outputs
        .Y ( AND3_0_Y ) 
        );

//--------OneLane_NoTRV_test
OneLane_NoTRV_test OneLane_NoTRV_test_0(
        // Inputs
        .Logic_Clock         ( Logic_Clock ),
        .Read_Enable         ( Data_Valid_net_0 ),
        .SYNC_OK             ( TxMainLinkController_0_SYNC_OK ),
        .Logic_Reser_N       ( Logic_Reset_N ),
        .Input_MainData_3    ( SampleTxDeCompose_0_2_1_Output_Data_1 ),
        .Input_MainData_2    ( SampleTxDeCompose_0_2_1_Output_Data_0 ),
        .Input_MainData_1    ( SampleTxDeCompose_0_2_0_Output_Data_1 ),
        .Input_MainData_0    ( SampleTxDeCompose_0_2_0_Output_Data_0 ),
        // Outputs
        .Input_MainData_Read ( OneLane_NoTRV_test_0_Input_MainData_Read ),
        .Empty_For_NonAll    ( OneLane_NoTRV_test_0_Empty_For_NonAll ),
        .CTRL_Data_Go        ( OneLane_NoTRV_test_0_CTRL_Data_Go ),
        .CTRL_Synced         ( OneLane_NoTRV_test_0_CTRL_Synced ),
        .CTRL_ILAS_Go        ( OneLane_NoTRV_test_0_CTRL_ILAS_Go ),
        .Output_Data_1       ( Output_Data_1_2_net_0 ),
        .Output_Data_0       ( Output_Data_0_2_net_0 ) 
        );

//--------OneLane_NoTRV_test
OneLane_NoTRV_test OneLane_NoTRV_test_0_0(
        // Inputs
        .Logic_Clock         ( Logic_Clock ),
        .Read_Enable         ( Data_Valid_net_0 ),
        .SYNC_OK             ( TxMainLinkController_0_SYNC_OK ),
        .Logic_Reser_N       ( Logic_Reset_N ),
        .Input_MainData_3    ( SampleTxDeCompose_0_2_3_Output_Data_1 ),
        .Input_MainData_2    ( SampleTxDeCompose_0_2_3_Output_Data_0 ),
        .Input_MainData_1    ( SampleTxDeCompose_0_2_2_Output_Data_1 ),
        .Input_MainData_0    ( SampleTxDeCompose_0_2_2_Output_Data_0 ),
        // Outputs
        .Input_MainData_Read ( OneLane_NoTRV_test_0_0_Input_MainData_Read ),
        .Empty_For_NonAll    ( OneLane_NoTRV_test_0_0_Empty_For_NonAll ),
        .CTRL_Data_Go        ( OneLane_NoTRV_test_0_0_CTRL_Data_Go ),
        .CTRL_Synced         ( OneLane_NoTRV_test_0_0_CTRL_Synced ),
        .CTRL_ILAS_Go        ( OneLane_NoTRV_test_0_0_CTRL_ILAS_Go ),
        .Output_Data_1       ( Output_Data_1_3_net_0 ),
        .Output_Data_0       ( Output_Data_0_3_net_0 ) 
        );

//--------OneLane_Transciever
OneLane_Transciever OneLane_Transciever_0(
        // Inputs
        .LANE0_RXD_P         ( LANE0_RXD_P ),
        .LANE0_RXD_N         ( LANE0_RXD_N ),
        .SYNC_OK             ( TxMainLinkController_0_SYNC_OK ),
        .Logic_Clock         ( Logic_Clock ),
        .Logic_Reser_N       ( Logic_Reset_N ),
        .CTRL_CLK            ( CTRL_Clock_40M ),
        .REF_CLK             ( PF_CCC_C5_0_OUT0_FABCLK_0 ),
        .Read_Enable         ( Data_Valid_net_0 ),
        .CTRL_RST_N          ( Synchronizer_0_2_Data_Out_0 ),
        .Input_MainData_3    ( SampleTxDeCompose_0_1_Output_Data_1 ),
        .Input_MainData_0    ( SampleTxDeCompose_0_Output_Data_0 ),
        .Input_MainData_1    ( SampleTxDeCompose_0_Output_Data_1 ),
        .Input_MainData_2    ( SampleTxDeCompose_0_1_Output_Data_0 ),
        // Outputs
        .LANE0_TXD_P         ( LANE0_TXD_P_net_0 ),
        .LANE0_TXD_N         ( LANE0_TXD_N_net_0 ),
        .CTRL_Synced         ( OneLane_Transciever_0_CTRL_Synced ),
        .CTRL_Data_Go        ( OneLane_Transciever_0_CTRL_Data_Go ),
        .CTRL_ILAS_Go        ( OneLane_Transciever_0_CTRL_ILAS_Go ),
        .Empty_For_NonAll    ( OneLane_Transciever_0_Empty_For_NonAll ),
        .Input_MainData_Read ( OneLane_Transciever_0_Input_MainData_Read ),
        .Output_Data_0       ( Output_Data_0_0_net_0 ),
        .Output_Data_1       ( Output_Data_1_0_net_0 ) 
        );

//--------OneLane_Transciever
OneLane_Transciever OneLane_Transciever_0_0(
        // Inputs
        .LANE0_RXD_P         ( LANE1_RXD_P ),
        .LANE0_RXD_N         ( LANE1_RXD_N ),
        .SYNC_OK             ( TxMainLinkController_0_SYNC_OK ),
        .Logic_Clock         ( Logic_Clock ),
        .Logic_Reser_N       ( Logic_Reset_N ),
        .CTRL_CLK            ( CTRL_Clock_40M ),
        .REF_CLK             ( PF_CCC_C5_0_OUT0_FABCLK_0 ),
        .Read_Enable         ( Data_Valid_net_0 ),
        .CTRL_RST_N          ( Synchronizer_0_2_Data_Out_0 ),
        .Input_MainData_3    ( SampleTxDeCompose_0_2_Output_Data_1 ),
        .Input_MainData_0    ( SampleTxDeCompose_0_0_Output_Data_0 ),
        .Input_MainData_1    ( SampleTxDeCompose_0_0_Output_Data_1 ),
        .Input_MainData_2    ( SampleTxDeCompose_0_2_Output_Data_0 ),
        // Outputs
        .LANE0_TXD_P         ( LANE1_TXD_P_net_0 ),
        .LANE0_TXD_N         ( LANE1_TXD_N_net_0 ),
        .CTRL_Synced         ( OneLane_Transciever_0_0_CTRL_Synced ),
        .CTRL_Data_Go        ( OneLane_Transciever_0_0_CTRL_Data_Go ),
        .CTRL_ILAS_Go        ( OneLane_Transciever_0_0_CTRL_ILAS_Go ),
        .Empty_For_NonAll    ( OneLane_Transciever_0_0_Empty_For_NonAll ),
        .Input_MainData_Read ( OneLane_Transciever_0_0_Input_MainData_Read ),
        .Output_Data_0       ( Output_Data_0_1_net_0 ),
        .Output_Data_1       ( Output_Data_1_1_net_0 ) 
        );

//--------PF_CCC_C5
PF_CCC_C5 PF_CCC_C5_0(
        // Inputs
        .REF_CLK_0         ( REF_Clock ),
        .PLL_POWERDOWN_N_0 ( VCC_net ),
        // Outputs
        .OUT0_FABCLK_0     ( PF_CCC_C5_0_OUT0_FABCLK_0 ),
        .PLL_LOCK_0        ( PF_CCC_C5_0_PLL_LOCK_0 ) 
        );

//--------RxMainLinkController
RxMainLinkController RxMainLinkController_0(
        // Inputs
        .Clock                     ( Logic_Clock ),
        .Reset_N                   ( Logic_Reset_N ),
        .LANE_Synced               ( LANE_Synced_net_0 ),
        .LANE_ILAS_Go              ( LANE_ILAS_Go_net_0 ),
        .LANE_Data_Go              ( LANE_Data_Go_net_0 ),
        .LANE_Alignment_Fifo_Empty ( LANE_Alignment_Fifo_Empty_net_0 ),
        // Outputs
        .SYNCINB                   ( RxMainLinkController_0_SYNCINB ),
        .Alignment_Fifo_Read       ( Data_Valid_net_0 ) 
        );

//--------SampleTxDeCompose
SampleTxDeCompose SampleTxDeCompose_0(
        // Inputs
        .Input_Data_0   ( Test_Generator_for_Lanes_0_Test_Data_0 ),
        .Input_TailBits ( Input_TailBits_const_net_0 ),
        // Outputs
        .Output_Data_1  ( SampleTxDeCompose_0_Output_Data_1 ),
        .Output_Data_0  ( SampleTxDeCompose_0_Output_Data_0 ) 
        );

//--------SampleTxDeCompose
SampleTxDeCompose SampleTxDeCompose_0_0(
        // Inputs
        .Input_Data_0   ( Test_Generator_for_Lanes_0_Test_Data_1 ),
        .Input_TailBits ( Input_TailBits_const_net_1 ),
        // Outputs
        .Output_Data_1  ( SampleTxDeCompose_0_0_Output_Data_1 ),
        .Output_Data_0  ( SampleTxDeCompose_0_0_Output_Data_0 ) 
        );

//--------SampleTxDeCompose
SampleTxDeCompose SampleTxDeCompose_0_1(
        // Inputs
        .Input_Data_0   ( Test_Generator_for_Lanes_0_Test_Data_4 ),
        .Input_TailBits ( Input_TailBits_const_net_2 ),
        // Outputs
        .Output_Data_1  ( SampleTxDeCompose_0_1_Output_Data_1 ),
        .Output_Data_0  ( SampleTxDeCompose_0_1_Output_Data_0 ) 
        );

//--------SampleTxDeCompose
SampleTxDeCompose SampleTxDeCompose_0_2(
        // Inputs
        .Input_Data_0   ( Test_Generator_for_Lanes_0_Test_Data_5 ),
        .Input_TailBits ( Input_TailBits_const_net_3 ),
        // Outputs
        .Output_Data_1  ( SampleTxDeCompose_0_2_Output_Data_1 ),
        .Output_Data_0  ( SampleTxDeCompose_0_2_Output_Data_0 ) 
        );

//--------SampleTxDeCompose
SampleTxDeCompose SampleTxDeCompose_0_2_0(
        // Inputs
        .Input_Data_0   ( Test_Generator_for_Lanes_0_Test_Data_2 ),
        .Input_TailBits ( Input_TailBits_const_net_4 ),
        // Outputs
        .Output_Data_1  ( SampleTxDeCompose_0_2_0_Output_Data_1 ),
        .Output_Data_0  ( SampleTxDeCompose_0_2_0_Output_Data_0 ) 
        );

//--------SampleTxDeCompose
SampleTxDeCompose SampleTxDeCompose_0_2_1(
        // Inputs
        .Input_Data_0   ( Test_Generator_for_Lanes_0_Test_Data_6 ),
        .Input_TailBits ( Input_TailBits_const_net_5 ),
        // Outputs
        .Output_Data_1  ( SampleTxDeCompose_0_2_1_Output_Data_1 ),
        .Output_Data_0  ( SampleTxDeCompose_0_2_1_Output_Data_0 ) 
        );

//--------SampleTxDeCompose
SampleTxDeCompose SampleTxDeCompose_0_2_2(
        // Inputs
        .Input_Data_0   ( Test_Generator_for_Lanes_0_Test_Data_3 ),
        .Input_TailBits ( Input_TailBits_const_net_6 ),
        // Outputs
        .Output_Data_1  ( SampleTxDeCompose_0_2_2_Output_Data_1 ),
        .Output_Data_0  ( SampleTxDeCompose_0_2_2_Output_Data_0 ) 
        );

//--------SampleTxDeCompose
SampleTxDeCompose SampleTxDeCompose_0_2_3(
        // Inputs
        .Input_Data_0   ( Test_Generator_for_Lanes_0_Test_Data_7 ),
        .Input_TailBits ( Input_TailBits_const_net_7 ),
        // Outputs
        .Output_Data_1  ( SampleTxDeCompose_0_2_3_Output_Data_1 ),
        .Output_Data_0  ( SampleTxDeCompose_0_2_3_Output_Data_0 ) 
        );

//--------Synchronizer
Synchronizer Synchronizer_0_2(
        // Inputs
        .nRST     ( AND3_0_Y ),
        .CLK      ( CTRL_Clock_40M ),
        .Data_In  ( VCC_net ),
        // Outputs
        .Data_Out ( Synchronizer_0_2_Data_Out_0 ) 
        );

//--------Test_Generator_for_Lanes
Test_Generator_for_Lanes Test_Generator_for_Lanes_0(
        // Inputs
        .Clock       ( Logic_Clock ),
        .Reset_N     ( Logic_Reset_N ),
        .Test_Enable ( AND2_0_Y ),
        // Outputs
        .Test_Data_0 ( Test_Generator_for_Lanes_0_Test_Data_0 ),
        .Test_Data_1 ( Test_Generator_for_Lanes_0_Test_Data_1 ),
        .Test_Data_2 ( Test_Generator_for_Lanes_0_Test_Data_2 ),
        .Test_Data_3 ( Test_Generator_for_Lanes_0_Test_Data_3 ),
        .Test_Data_4 ( Test_Generator_for_Lanes_0_Test_Data_4 ),
        .Test_Data_5 ( Test_Generator_for_Lanes_0_Test_Data_5 ),
        .Test_Data_6 ( Test_Generator_for_Lanes_0_Test_Data_6 ),
        .Test_Data_7 ( Test_Generator_for_Lanes_0_Test_Data_7 ) 
        );

//--------TxMainLinkController
TxMainLinkController TxMainLinkController_0(
        // Inputs
        .Clock        ( Logic_Clock ),
        .Reset_N      ( Logic_Reset_N ),
        .SYNCINB      ( RxMainLinkController_0_SYNCINB ),
        .Lanes_DataGo ( Lanes_DataGo_net_0 ),
        // Outputs
        .SYNC_OK      ( TxMainLinkController_0_SYNC_OK ),
        .Data_Read    ( TxMainLinkController_0_Data_Read ) 
        );


endmodule
