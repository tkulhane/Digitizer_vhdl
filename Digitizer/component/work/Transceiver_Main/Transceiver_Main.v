//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Wed Jun  5 18:23:48 2024
// Version: 2022.1 2022.1.0.10
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// Transceiver_Main
module Transceiver_Main(
    // Inputs
    CTRL_Clock,
    CTRL_Clock_40M,
    CTRL_Reset_N,
    Gen_Enable,
    LANE_RXD_N_Vector,
    LANE_RXD_P_Vector,
    Logic_Clock,
    Logic_Reset_N,
    REF_Clock,
    REF_Reset_N,
    addr_frame,
    enable_cmd,
    write_data_frame,
    write_read,
    // Outputs
    AlignmentFifo_Read_Out,
    AlignmentFifo_Rx_Data,
    Data_Valid,
    LANE_TXD_N_Vector,
    LANE_TXD_P_Vector,
    Output_Data,
    SYNCINB_OUT,
    Transceivers_Rx_Data,
    Transceivers_Rx_K,
    busy,
    read_data_frame
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input          CTRL_Clock;
input          CTRL_Clock_40M;
input          CTRL_Reset_N;
input          Gen_Enable;
input  [5:0]   LANE_RXD_N_Vector;
input  [5:0]   LANE_RXD_P_Vector;
input          Logic_Clock;
input          Logic_Reset_N;
input          REF_Clock;
input          REF_Reset_N;
input  [7:0]   addr_frame;
input          enable_cmd;
input  [15:0]  write_data_frame;
input          write_read;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output         AlignmentFifo_Read_Out;
output [383:0] AlignmentFifo_Rx_Data;
output         Data_Valid;
output [5:0]   LANE_TXD_N_Vector;
output [5:0]   LANE_TXD_P_Vector;
output [383:0] Output_Data;
output         SYNCINB_OUT;
output [383:0] Transceivers_Rx_Data;
output [47:0]  Transceivers_Rx_K;
output         busy;
output [15:0]  read_data_frame;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire   [7:0]   addr_frame;
wire           AlignmentFifo_Read_Out_net_0;
wire   [383:0] AlignmentFifo_Rx_Data_net_0;
wire           AND2_0_0_Y;
wire           AND2_0_Y;
wire           busy_net_0;
wire           CTRL_Clock;
wire           CTRL_Clock_40M;
wire           CTRL_Reset_N;
wire   [7:0]   CtrlBus_HandShake_0_PRH_addr_frame;
wire           CtrlBus_HandShake_0_PRH_enable_cmd;
wire   [15:0]  CtrlBus_HandShake_0_PRH_write_data_frame;
wire           CtrlBus_HandShake_0_PRH_write_read;
wire           Data_Valid_net_0;
wire           enable_cmd;
wire           Gen_Enable;
wire   [5:0]   LANE_RXD_N_Vector;
wire   [5:0]   LANE_RXD_P_Vector;
wire   [5:0]   LANE_TXD_N_Vector_net_0;
wire   [5:0]   LANE_TXD_P_Vector_net_0;
wire           Logic_Clock;
wire           Logic_Reset_N;
wire   [383:0] Output_Data_net_0;
wire           PF_TX_PLL_C2_0_0_BIT_CLK;
wire           PF_TX_PLL_C2_0_0_LOCK;
wire           PF_TX_PLL_C2_0_0_REF_CLK_TO_LANE;
wire           PF_TX_PLL_C2_0_BIT_CLK;
wire           PF_TX_PLL_C2_0_LOCK;
wire           PF_TX_PLL_C2_0_REF_CLK_TO_LANE;
wire   [15:0]  read_data_frame_net_0;
wire           REF_Clock;
wire           REF_Reset_N;
wire           Synchronizer_0_2_Data_Out;
wire           Synchronizer_0_3_Data_Out;
wire           SYNCINB_OUT_net_0;
wire   [383:0] Test_Generator_for_Lanes_0_Test_DataOut;
wire           Transceiver_Controller_0_busy;
wire           Transceiver_Controller_0_Lanes_Restart;
wire   [15:0]  Transceiver_Controller_0_read_data_frame;
wire           Transceiver_LanesConnection_0_Input_Data_Read;
wire   [191:0] Transceiver_LanesConnection_0_TRNV_CTRL_StatusLanes_Vector;
wire   [383:0] Transceivers_Rx_Data_net_0;
wire   [47:0]  Transceivers_Rx_K_net_0;
wire   [15:0]  write_data_frame;
wire           write_read;
wire           Data_Valid_net_1;
wire           busy_net_1;
wire           SYNCINB_OUT_net_1;
wire           AlignmentFifo_Read_Out_net_1;
wire   [15:0]  read_data_frame_net_1;
wire   [383:0] Output_Data_net_1;
wire   [383:0] AlignmentFifo_Rx_Data_net_1;
wire   [383:0] Transceivers_Rx_Data_net_1;
wire   [47:0]  Transceivers_Rx_K_net_1;
wire   [5:0]   LANE_TXD_N_Vector_net_1;
wire   [5:0]   LANE_TXD_P_Vector_net_1;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire           VCC_net;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign VCC_net = 1'b1;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign Data_Valid_net_1             = Data_Valid_net_0;
assign Data_Valid                   = Data_Valid_net_1;
assign busy_net_1                   = busy_net_0;
assign busy                         = busy_net_1;
assign SYNCINB_OUT_net_1            = SYNCINB_OUT_net_0;
assign SYNCINB_OUT                  = SYNCINB_OUT_net_1;
assign AlignmentFifo_Read_Out_net_1 = AlignmentFifo_Read_Out_net_0;
assign AlignmentFifo_Read_Out       = AlignmentFifo_Read_Out_net_1;
assign read_data_frame_net_1        = read_data_frame_net_0;
assign read_data_frame[15:0]        = read_data_frame_net_1;
assign Output_Data_net_1            = Output_Data_net_0;
assign Output_Data[383:0]           = Output_Data_net_1;
assign AlignmentFifo_Rx_Data_net_1  = AlignmentFifo_Rx_Data_net_0;
assign AlignmentFifo_Rx_Data[383:0] = AlignmentFifo_Rx_Data_net_1;
assign Transceivers_Rx_Data_net_1   = Transceivers_Rx_Data_net_0;
assign Transceivers_Rx_Data[383:0]  = Transceivers_Rx_Data_net_1;
assign Transceivers_Rx_K_net_1      = Transceivers_Rx_K_net_0;
assign Transceivers_Rx_K[47:0]      = Transceivers_Rx_K_net_1;
assign LANE_TXD_N_Vector_net_1      = LANE_TXD_N_Vector_net_0;
assign LANE_TXD_N_Vector[5:0]       = LANE_TXD_N_Vector_net_1;
assign LANE_TXD_P_Vector_net_1      = LANE_TXD_P_Vector_net_0;
assign LANE_TXD_P_Vector[5:0]       = LANE_TXD_P_Vector_net_1;
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------AND2
AND2 AND2_0(
        // Inputs
        .A ( Logic_Reset_N ),
        .B ( REF_Reset_N ),
        // Outputs
        .Y ( AND2_0_Y ) 
        );

//--------AND2
AND2 AND2_0_0(
        // Inputs
        .A ( Gen_Enable ),
        .B ( Transceiver_LanesConnection_0_Input_Data_Read ),
        // Outputs
        .Y ( AND2_0_0_Y ) 
        );

//--------CtrlBus_HandShake
CtrlBus_HandShake #( 
        .g_WidthADDR ( 8 ),
        .g_WidthDATA ( 16 ) )
CtrlBus_HandShake_0(
        // Inputs
        .CTRL_Clock            ( CTRL_Clock ),
        .CTRL_Reset_N          ( CTRL_Reset_N ),
        .PRH_Clock             ( Logic_Clock ),
        .PRH_Reset_N           ( Synchronizer_0_3_Data_Out ),
        .CTRL_enable_cmd       ( enable_cmd ),
        .CTRL_write_read       ( write_read ),
        .PRH_busy              ( Transceiver_Controller_0_busy ),
        .PRH_In_Reset          ( Synchronizer_0_3_Data_Out ),
        .CTRL_addr_frame       ( addr_frame ),
        .CTRL_write_data_frame ( write_data_frame ),
        .PRH_read_data_frame   ( Transceiver_Controller_0_read_data_frame ),
        // Outputs
        .CTRL_busy             ( busy_net_0 ),
        .PRH_enable_cmd        ( CtrlBus_HandShake_0_PRH_enable_cmd ),
        .PRH_write_read        ( CtrlBus_HandShake_0_PRH_write_read ),
        .CTRL_read_data_frame  ( read_data_frame_net_0 ),
        .PRH_addr_frame        ( CtrlBus_HandShake_0_PRH_addr_frame ),
        .PRH_write_data_frame  ( CtrlBus_HandShake_0_PRH_write_data_frame ) 
        );

//--------PF_TX_PLL_C2
PF_TX_PLL_C2 PF_TX_PLL_C2_0(
        // Inputs
        .FAB_REF_CLK     ( REF_Clock ),
        // Outputs
        .PLL_LOCK        (  ),
        .LOCK            ( PF_TX_PLL_C2_0_LOCK ),
        .BIT_CLK         ( PF_TX_PLL_C2_0_BIT_CLK ),
        .REF_CLK_TO_LANE ( PF_TX_PLL_C2_0_REF_CLK_TO_LANE ) 
        );

//--------PF_TX_PLL_C2
PF_TX_PLL_C2 PF_TX_PLL_C2_0_0(
        // Inputs
        .FAB_REF_CLK     ( REF_Clock ),
        // Outputs
        .PLL_LOCK        (  ),
        .LOCK            ( PF_TX_PLL_C2_0_0_LOCK ),
        .BIT_CLK         ( PF_TX_PLL_C2_0_0_BIT_CLK ),
        .REF_CLK_TO_LANE ( PF_TX_PLL_C2_0_0_REF_CLK_TO_LANE ) 
        );

//--------Synchronizer
Synchronizer Synchronizer_0_2(
        // Inputs
        .nRST     ( AND2_0_Y ),
        .CLK      ( CTRL_Clock_40M ),
        .Data_In  ( VCC_net ),
        // Outputs
        .Data_Out ( Synchronizer_0_2_Data_Out ) 
        );

//--------Synchronizer
Synchronizer Synchronizer_0_3(
        // Inputs
        .nRST     ( AND2_0_Y ),
        .CLK      ( Logic_Clock ),
        .Data_In  ( VCC_net ),
        // Outputs
        .Data_Out ( Synchronizer_0_3_Data_Out ) 
        );

//--------Test_Generator_for_Lanes
Test_Generator_for_Lanes Test_Generator_for_Lanes_0(
        // Inputs
        .Clock        ( Logic_Clock ),
        .Reset_N      ( Synchronizer_0_3_Data_Out ),
        .Test_Enable  ( AND2_0_0_Y ),
        // Outputs
        .Test_DataOut ( Test_Generator_for_Lanes_0_Test_DataOut ) 
        );

//--------Transceiver_Controller
Transceiver_Controller #( 
        .g_NumberOfLanes ( 6 ) )
Transceiver_Controller_0(
        // Inputs
        .Clock              ( Logic_Clock ),
        .Reset_N            ( Synchronizer_0_3_Data_Out ),
        .enable_cmd         ( CtrlBus_HandShake_0_PRH_enable_cmd ),
        .write_read         ( CtrlBus_HandShake_0_PRH_write_read ),
        .addr_frame         ( CtrlBus_HandShake_0_PRH_addr_frame ),
        .write_data_frame   ( CtrlBus_HandShake_0_PRH_write_data_frame ),
        .StatusLanes_Vector ( Transceiver_LanesConnection_0_TRNV_CTRL_StatusLanes_Vector ),
        // Outputs
        .busy               ( Transceiver_Controller_0_busy ),
        .Lanes_Restart      ( Transceiver_Controller_0_Lanes_Restart ),
        .read_data_frame    ( Transceiver_Controller_0_read_data_frame ) 
        );

//--------Transceiver_LanesConnection
Transceiver_LanesConnection Transceiver_LanesConnection_0(
        // Inputs
        .Logic_Clock                        ( Logic_Clock ),
        .Logic_Reset_N                      ( Synchronizer_0_3_Data_Out ),
        .CTRL_Clock                         ( CTRL_Clock_40M ),
        .CTRL_Reset_N                       ( Synchronizer_0_2_Data_Out ),
        .REF_Clock                          ( REF_Clock ),
        .LANE_CLK_REF                       ( Logic_Clock ),
        .LANE_RXD_P_Vector                  ( LANE_RXD_P_Vector ),
        .LANE_RXD_N_Vector                  ( LANE_RXD_N_Vector ),
        .CLKS_FROM_TXPLL_0_TX_PLL_LOCK_0    ( PF_TX_PLL_C2_0_LOCK ),
        .CLKS_FROM_TXPLL_0_TX_BIT_CLK_0     ( PF_TX_PLL_C2_0_BIT_CLK ),
        .CLKS_FROM_TXPLL_0_TX_PLL_REF_CLK_0 ( PF_TX_PLL_C2_0_REF_CLK_TO_LANE ),
        .CLKS_FROM_TXPLL_0_TX_PLL_LOCK_1    ( PF_TX_PLL_C2_0_0_LOCK ),
        .CLKS_FROM_TXPLL_0_TX_BIT_CLK_1     ( PF_TX_PLL_C2_0_0_BIT_CLK ),
        .CLKS_FROM_TXPLL_0_TX_PLL_REF_CLK_1 ( PF_TX_PLL_C2_0_0_REF_CLK_TO_LANE ),
        .Input_Data                         ( Test_Generator_for_Lanes_0_Test_DataOut ),
        .TRNV_CTRL_RESTART                  ( Transceiver_Controller_0_Lanes_Restart ),
        // Outputs
        .LANE_TXD_P_Vector                  ( LANE_TXD_P_Vector_net_0 ),
        .LANE_TXD_N_Vector                  ( LANE_TXD_N_Vector_net_0 ),
        .Input_Data_Read                    ( Transceiver_LanesConnection_0_Input_Data_Read ),
        .Output_Data                        ( Output_Data_net_0 ),
        .Data_Valid                         ( Data_Valid_net_0 ),
        .TRNV_CTRL_StatusLanes_Vector       ( Transceiver_LanesConnection_0_TRNV_CTRL_StatusLanes_Vector ),
        .Transceivers_Rx_Data               ( Transceivers_Rx_Data_net_0 ),
        .Transceivers_Rx_K                  ( Transceivers_Rx_K_net_0 ),
        .AlignmentFifo_Rx_Data              ( AlignmentFifo_Rx_Data_net_0 ),
        .AlignmentFifo_Read_Out             ( AlignmentFifo_Read_Out_net_0 ),
        .SYNCINB_OUT                        ( SYNCINB_OUT_net_0 ) 
        );


endmodule
