//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Wed Jun  5 15:13:47 2024
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
    EXT_TriggerInput,
    RE,
    Reset_N,
    TRG_Detect_Vector,
    // Outputs
    ACQ_RunOut,
    ALL_FIFO_Write,
    C_busy,
    C_read_data_frame,
    Control_Abort_Out,
    Control_Busy_Out,
    Control_Enable_Out,
    Control_Mux_DataTest_Sel,
    Control_Test_Generator_Enable,
    Control_Trigger_Out,
    EMPTY,
    Fifo_NotFree_Out,
    Q,
    SelfTrigger_Out,
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
input         EXT_TriggerInput;
input         RE;
input         Reset_N;
input  [7:0]  TRG_Detect_Vector;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output        ACQ_RunOut;
output        ALL_FIFO_Write;
output        C_busy;
output [15:0] C_read_data_frame;
output        Control_Abort_Out;
output        Control_Busy_Out;
output        Control_Enable_Out;
output        Control_Mux_DataTest_Sel;
output        Control_Test_Generator_Enable;
output        Control_Trigger_Out;
output        EMPTY;
output        Fifo_NotFree_Out;
output [17:0] Q;
output        SelfTrigger_Out;
output [11:0] TRG_Threshold;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire          ACQ_RunOut_net_0;
wire          ALL_FIFO_Write_net_0;
wire   [7:0]  C_addr_frame;
wire          C_busy_net_0;
wire          C_enable_cmd;
wire   [15:0] C_read_data_frame_net_0;
wire   [15:0] C_write_data_frame;
wire          C_write_read;
wire          Clock;
wire          Control_Abort_Out_net_0;
wire          Control_Busy_Out_net_0;
wire          Control_Enable_Out_net_0;
wire          Control_Mux_DataTest_Sel_net_0;
wire          Control_Test_Generator_Enable_net_0;
wire          Control_Trigger_Out_net_0;
wire          COREFIFO_C5_0_AFULL;
wire   [14:0] COREFIFO_C5_0_WRCNT;
wire          EMPTY_net_0;
wire          EXT_TriggerInput;
wire          Fifo_NotFree_Out_net_0;
wire   [17:0] Q_net_0;
wire          RE;
wire          Reset_N;
wire          SelfTrigger_Out_net_0;
wire   [7:0]  TRG_Detect_Vector;
wire   [11:0] TRG_Threshold_net_0;
wire   [13:0] Trigger_Control_0_Control_EventNum;
wire   [31:0] Trigger_Control_0_Control_Sample_Per_Event;
wire   [11:0] Trigger_Control_0_Control_Threshold;
wire   [3:0]  Trigger_Control_0_Control_TriggerSelect;
wire   [17:0] Trigger_Main_0_FIFO_Event_Data;
wire          C_busy_net_1;
wire          Control_Test_Generator_Enable_net_1;
wire          ALL_FIFO_Write_net_1;
wire          EMPTY_net_1;
wire          ACQ_RunOut_net_1;
wire          Control_Trigger_Out_net_1;
wire          Control_Busy_Out_net_1;
wire          Control_Enable_Out_net_1;
wire          Fifo_NotFree_Out_net_1;
wire          Control_Abort_Out_net_1;
wire          SelfTrigger_Out_net_1;
wire   [15:0] C_read_data_frame_net_1;
wire   [11:0] TRG_Threshold_net_1;
wire   [17:0] Q_net_1;
wire          Control_Mux_DataTest_Sel_net_1;
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
assign ACQ_RunOut_net_1                    = ACQ_RunOut_net_0;
assign ACQ_RunOut                          = ACQ_RunOut_net_1;
assign Control_Trigger_Out_net_1           = Control_Trigger_Out_net_0;
assign Control_Trigger_Out                 = Control_Trigger_Out_net_1;
assign Control_Busy_Out_net_1              = Control_Busy_Out_net_0;
assign Control_Busy_Out                    = Control_Busy_Out_net_1;
assign Control_Enable_Out_net_1            = Control_Enable_Out_net_0;
assign Control_Enable_Out                  = Control_Enable_Out_net_1;
assign Fifo_NotFree_Out_net_1              = Fifo_NotFree_Out_net_0;
assign Fifo_NotFree_Out                    = Fifo_NotFree_Out_net_1;
assign Control_Abort_Out_net_1             = Control_Abort_Out_net_0;
assign Control_Abort_Out                   = Control_Abort_Out_net_1;
assign SelfTrigger_Out_net_1               = SelfTrigger_Out_net_0;
assign SelfTrigger_Out                     = SelfTrigger_Out_net_1;
assign C_read_data_frame_net_1             = C_read_data_frame_net_0;
assign C_read_data_frame[15:0]             = C_read_data_frame_net_1;
assign TRG_Threshold_net_1                 = TRG_Threshold_net_0;
assign TRG_Threshold[11:0]                 = TRG_Threshold_net_1;
assign Q_net_1                             = Q_net_0;
assign Q[17:0]                             = Q_net_1;
assign Control_Mux_DataTest_Sel_net_1      = Control_Mux_DataTest_Sel_net_0;
assign Control_Mux_DataTest_Sel            = Control_Mux_DataTest_Sel_net_1;
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
        .WRCNT   ( COREFIFO_C5_0_WRCNT ) 
        );

//--------EventFifoFreeLogic
EventFifoFreeLogic #( 
        .g_FifoDepth          ( 16384 ),
        .g_FifoRemainingWidth ( 15 ) )
EventFifoFreeLogic_0(
        // Inputs
        .Clock          ( Clock ),
        .Reset_N        ( Reset_N ),
        .SamplePerEvent ( Trigger_Control_0_Control_Sample_Per_Event ),
        .Fifo_CountWord ( COREFIFO_C5_0_WRCNT ),
        // Outputs
        .NotFree        ( Fifo_NotFree_Out_net_0 ) 
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
        .FIFO_Event_A_Full             ( COREFIFO_C5_0_AFULL ),
        .FIFO_SampleEventComparator    ( Fifo_NotFree_Out_net_0 ),
        .Control_Trigger_Out           ( Control_Trigger_Out_net_0 ),
        .Control_Busy_Out              ( Control_Busy_Out_net_0 ),
        // Outputs
        .busy                          ( C_busy_net_0 ),
        .read_data_frame               ( C_read_data_frame_net_0 ),
        .Control_EventNum              ( Trigger_Control_0_Control_EventNum ),
        .Control_Test_Generator_Enable ( Control_Test_Generator_Enable_net_0 ),
        .Control_Mux_DataTest_Sel      ( Control_Mux_DataTest_Sel_net_0 ),
        .Control_Enable                ( Control_Enable_Out_net_0 ),
        .Control_Abort                 ( Control_Abort_Out_net_0 ),
        .Control_Threshold             ( Trigger_Control_0_Control_Threshold ),
        .Control_Sample_Per_Event      ( Trigger_Control_0_Control_Sample_Per_Event ),
        .Control_TriggerSelect         ( Trigger_Control_0_Control_TriggerSelect ) 
        );

//--------Trigger_Main
Trigger_Main Trigger_Main_0(
        // Inputs
        .Clock                    ( Clock ),
        .Reset_N                  ( Reset_N ),
        .EXT_TriggerInput         ( EXT_TriggerInput ),
        .Control_Enable           ( Control_Enable_Out_net_0 ),
        .Control_Abort            ( Control_Abort_Out_net_0 ),
        .Control_EventNum         ( Trigger_Control_0_Control_EventNum ),
        .Control_Threshold        ( Trigger_Control_0_Control_Threshold ),
        .Control_Sample_Per_Event ( Trigger_Control_0_Control_Sample_Per_Event ),
        .Control_TriggerSelect    ( Trigger_Control_0_Control_TriggerSelect ),
        .TRG_Detect_Vector        ( TRG_Detect_Vector ),
        // Outputs
        .Control_Trigger_Out      ( Control_Trigger_Out_net_0 ),
        .Control_Busy_Out         ( Control_Busy_Out_net_0 ),
        .Control_AcqStart         (  ),
        .ALL_FIFO_Enable          ( ALL_FIFO_Write_net_0 ),
        .ACQ_RunOut               ( ACQ_RunOut_net_0 ),
        .SelfTrigger_Out          ( SelfTrigger_Out_net_0 ),
        .FIFO_Event_Data          ( Trigger_Main_0_FIFO_Event_Data ),
        .TRG_Threshold            ( TRG_Threshold_net_0 ) 
        );


endmodule
