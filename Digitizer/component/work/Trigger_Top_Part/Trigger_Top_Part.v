//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Fri Feb 16 22:07:17 2024
// Version: 2022.1 2022.1.0.10
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// Trigger_Top_Part
module Trigger_Top_Part(
    // Inputs
    C_addr_frame,
    C_enable_cmd,
    C_write_data_frame,
    C_write_read,
    Clock,
    RE,
    Reset_N,
    TRG_Detect_Vector,
    // Outputs
    ALL_FIFO_Write,
    C_busy,
    C_read_data_frame,
    Control_Test_Generator_Enable,
    EMPTY,
    Q,
    TRG_Threshold
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input  [7:0]  C_addr_frame;
input         C_enable_cmd;
input  [15:0] C_write_data_frame;
input         C_write_read;
input         Clock;
input         RE;
input         Reset_N;
input  [7:0]  TRG_Detect_Vector;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output        ALL_FIFO_Write;
output        C_busy;
output [15:0] C_read_data_frame;
output        Control_Test_Generator_Enable;
output        EMPTY;
output [17:0] Q;
output [11:0] TRG_Threshold;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire          ALL_FIFO_Write_net_0;
wire   [7:0]  C_addr_frame;
wire          C_busy_net_0;
wire          C_enable_cmd;
wire   [15:0] C_read_data_frame_net_0;
wire   [15:0] C_write_data_frame;
wire          C_write_read;
wire          Clock;
wire          Control_Test_Generator_Enable_net_0;
wire          COREFIFO_C5_0_AFULL;
wire          EMPTY_net_0;
wire   [17:0] Q_net_0;
wire          RE;
wire          Reset_N;
wire   [7:0]  TRG_Detect_Vector;
wire   [11:0] TRG_Threshold_net_0;
wire          Trigger_Control_0_Control_Abort;
wire          Trigger_Control_0_Control_Enable;
wire   [31:0] Trigger_Control_0_Control_Sample_Per_Event;
wire   [11:0] Trigger_Control_0_Control_Threshold;
wire          Trigger_Main_0_Control_Busy_Out;
wire          Trigger_Main_0_Control_EnableRst;
wire          Trigger_Main_0_Control_Trigger_Out;
wire   [17:0] Trigger_Main_0_FIFO_Event_Data;
wire          C_busy_net_1;
wire          Control_Test_Generator_Enable_net_1;
wire          ALL_FIFO_Write_net_1;
wire          EMPTY_net_1;
wire   [15:0] C_read_data_frame_net_1;
wire   [11:0] TRG_Threshold_net_1;
wire   [17:0] Q_net_1;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign C_busy_net_1                        = C_busy_net_0;
assign C_busy                              = C_busy_net_1;
assign Control_Test_Generator_Enable_net_1 = Control_Test_Generator_Enable_net_0;
assign Control_Test_Generator_Enable       = Control_Test_Generator_Enable_net_1;
assign ALL_FIFO_Write_net_1                = ALL_FIFO_Write_net_0;
assign ALL_FIFO_Write                      = ALL_FIFO_Write_net_1;
assign EMPTY_net_1                         = EMPTY_net_0;
assign EMPTY                               = EMPTY_net_1;
assign C_read_data_frame_net_1             = C_read_data_frame_net_0;
assign C_read_data_frame[15:0]             = C_read_data_frame_net_1;
assign TRG_Threshold_net_1                 = TRG_Threshold_net_0;
assign TRG_Threshold[11:0]                 = TRG_Threshold_net_1;
assign Q_net_1                             = Q_net_0;
assign Q[17:0]                             = Q_net_1;
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------COREFIFO_C5
COREFIFO_C5 COREFIFO_C5_0(
        // Inputs
        .CLK     ( Clock ),
        .RESET_N ( Reset_N ),
        .WE      ( ALL_FIFO_Write_net_0 ),
        .RE      ( RE ),
        .DATA    ( Trigger_Main_0_FIFO_Event_Data ),
        // Outputs
        .FULL    (  ),
        .EMPTY   ( EMPTY_net_0 ),
        .AFULL   ( COREFIFO_C5_0_AFULL ),
        .Q       ( Q_net_0 ),
        .WRCNT   (  ) 
        );

//--------Trigger_Control
Trigger_Control Trigger_Control_0(
        // Inputs
        .Clock                         ( Clock ),
        .Reset_N                       ( Reset_N ),
        .enable_cmd                    ( C_enable_cmd ),
        .write_read                    ( C_write_read ),
        .addr_frame                    ( C_addr_frame ),
        .write_data_frame              ( C_write_data_frame ),
        .Control_EnableRst             ( Trigger_Main_0_Control_EnableRst ),
        .Control_Trigger_Out           ( Trigger_Main_0_Control_Trigger_Out ),
        .Control_Busy_Out              ( Trigger_Main_0_Control_Busy_Out ),
        // Outputs
        .busy                          ( C_busy_net_0 ),
        .read_data_frame               ( C_read_data_frame_net_0 ),
        .Control_Test_Generator_Enable ( Control_Test_Generator_Enable_net_0 ),
        .Control_Enable                ( Trigger_Control_0_Control_Enable ),
        .Control_Abort                 ( Trigger_Control_0_Control_Abort ),
        .Control_Threshold             ( Trigger_Control_0_Control_Threshold ),
        .Control_Sample_Per_Event      ( Trigger_Control_0_Control_Sample_Per_Event ) 
        );

//--------Trigger_Main
Trigger_Main Trigger_Main_0(
        // Inputs
        .Clock                    ( Clock ),
        .Reset_N                  ( Reset_N ),
        .Control_Enable           ( Trigger_Control_0_Control_Enable ),
        .Control_Abort            ( Trigger_Control_0_Control_Abort ),
        .Control_Threshold        ( Trigger_Control_0_Control_Threshold ),
        .Control_Sample_Per_Event ( Trigger_Control_0_Control_Sample_Per_Event ),
        .FIFO_Event_A_Full        ( COREFIFO_C5_0_AFULL ),
        .TRG_Detect_Vector        ( TRG_Detect_Vector ),
        // Outputs
        .Control_EnableRst        ( Trigger_Main_0_Control_EnableRst ),
        .Control_Trigger_Out      ( Trigger_Main_0_Control_Trigger_Out ),
        .Control_Busy_Out         ( Trigger_Main_0_Control_Busy_Out ),
        .Control_AcqStart         (  ),
        .ALL_FIFO_Enable          ( ALL_FIFO_Write_net_0 ),
        .FIFO_Event_Data          ( Trigger_Main_0_FIFO_Event_Data ),
        .TRG_Threshold            ( TRG_Threshold_net_0 ) 
        );


endmodule
