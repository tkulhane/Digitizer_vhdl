//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Wed Jun  5 15:13:08 2024
// Version: 2022.1 2022.1.0.10
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// AnalyzatorInCircuit
module AnalyzatorInCircuit(
    // Inputs
    AlignmentFifo_Rx_Data,
    CTRL_Clock,
    CTRL_Reset_N,
    CTRL_addr_frame,
    CTRL_enable_cmd,
    CTRL_write_data_frame,
    CTRL_write_read,
    Logic_Clock,
    Logic_Reset_N,
    Start_Triggers,
    Transceiver_Rx_Data,
    Transceiver_Rx_K,
    // Outputs
    CTRL_busy,
    CTRL_read_data_frame
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input  [383:0] AlignmentFifo_Rx_Data;
input          CTRL_Clock;
input          CTRL_Reset_N;
input  [7:0]   CTRL_addr_frame;
input          CTRL_enable_cmd;
input  [15:0]  CTRL_write_data_frame;
input          CTRL_write_read;
input          Logic_Clock;
input          Logic_Reset_N;
input  [7:0]   Start_Triggers;
input  [383:0] Transceiver_Rx_Data;
input  [47:0]  Transceiver_Rx_K;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output         CTRL_busy;
output [15:0]  CTRL_read_data_frame;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire   [383:0] AlignmentFifo_Rx_Data;
wire           AnalyzInCirc_Top_0_busy;
wire   [15:0]  AnalyzInCirc_Top_0_read_data_frame;
wire   [7:0]   CTRL_addr_frame;
wire           CTRL_busy_net_0;
wire           CTRL_Clock;
wire           CTRL_enable_cmd;
wire   [15:0]  CTRL_read_data_frame_net_0;
wire           CTRL_Reset_N;
wire   [15:0]  CTRL_write_data_frame;
wire           CTRL_write_read;
wire   [7:0]   CtrlBus_HandShake_0_PRH_addr_frame;
wire           CtrlBus_HandShake_0_PRH_enable_cmd;
wire   [15:0]  CtrlBus_HandShake_0_PRH_write_data_frame;
wire           CtrlBus_HandShake_0_PRH_write_read;
wire           Logic_Clock;
wire           Logic_Reset_N;
wire   [7:0]   Start_Triggers;
wire   [383:0] Transceiver_Rx_Data;
wire   [47:0]  Transceiver_Rx_K;
wire           CTRL_busy_net_1;
wire   [15:0]  CTRL_read_data_frame_net_1;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign CTRL_busy_net_1            = CTRL_busy_net_0;
assign CTRL_busy                  = CTRL_busy_net_1;
assign CTRL_read_data_frame_net_1 = CTRL_read_data_frame_net_0;
assign CTRL_read_data_frame[15:0] = CTRL_read_data_frame_net_1;
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------AnalyzInCirc_Top
AnalyzInCirc_Top AnalyzInCirc_Top_0(
        // Inputs
        .Clock                 ( Logic_Clock ),
        .Reset_N               ( Logic_Reset_N ),
        .enable_cmd            ( CtrlBus_HandShake_0_PRH_enable_cmd ),
        .write_read            ( CtrlBus_HandShake_0_PRH_write_read ),
        .addr_frame            ( CtrlBus_HandShake_0_PRH_addr_frame ),
        .write_data_frame      ( CtrlBus_HandShake_0_PRH_write_data_frame ),
        .Start_Triggers        ( Start_Triggers ),
        .Transceiver_Rx_Data   ( Transceiver_Rx_Data ),
        .Transceiver_Rx_K      ( Transceiver_Rx_K ),
        .AlignmentFifo_Rx_Data ( AlignmentFifo_Rx_Data ),
        // Outputs
        .busy                  ( AnalyzInCirc_Top_0_busy ),
        .read_data_frame       ( AnalyzInCirc_Top_0_read_data_frame ) 
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
        .PRH_Reset_N           ( Logic_Reset_N ),
        .CTRL_enable_cmd       ( CTRL_enable_cmd ),
        .CTRL_write_read       ( CTRL_write_read ),
        .PRH_busy              ( AnalyzInCirc_Top_0_busy ),
        .PRH_In_Reset          ( Logic_Reset_N ),
        .CTRL_addr_frame       ( CTRL_addr_frame ),
        .CTRL_write_data_frame ( CTRL_write_data_frame ),
        .PRH_read_data_frame   ( AnalyzInCirc_Top_0_read_data_frame ),
        // Outputs
        .CTRL_busy             ( CTRL_busy_net_0 ),
        .PRH_enable_cmd        ( CtrlBus_HandShake_0_PRH_enable_cmd ),
        .PRH_write_read        ( CtrlBus_HandShake_0_PRH_write_read ),
        .CTRL_read_data_frame  ( CTRL_read_data_frame_net_0 ),
        .PRH_addr_frame        ( CtrlBus_HandShake_0_PRH_addr_frame ),
        .PRH_write_data_frame  ( CtrlBus_HandShake_0_PRH_write_data_frame ) 
        );


endmodule
