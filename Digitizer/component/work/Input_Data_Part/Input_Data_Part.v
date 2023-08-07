//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Mon Aug  7 10:00:54 2023
// Version: 2022.1 2022.1.0.10
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// Input_Data_Part
module Input_Data_Part(
    // Inputs
    Clock,
    Fifo_WE,
    Input_Data_0,
    Input_Data_1,
    Input_Data_2,
    Input_Data_3,
    Order_Of_TRG_Unit_0,
    Order_Of_TRG_Unit_1,
    Order_Of_TRG_Unit_2,
    Order_Of_TRG_Unit_3,
    RE,
    RESET_N_Fifo,
    Reset_N_Trigger,
    TRG_Enable_Vector,
    TRG_First_Is_First,
    TRG_Last_Is_Last,
    TRG_Threshold,
    // Outputs
    Q_0,
    Q_1,
    Q_2,
    Q_3,
    // Inouts
    TRG_Detect_Vector
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input         Clock;
input         Fifo_WE;
input  [11:0] Input_Data_0;
input  [11:0] Input_Data_1;
input  [11:0] Input_Data_2;
input  [11:0] Input_Data_3;
input  [2:0]  Order_Of_TRG_Unit_0;
input  [2:0]  Order_Of_TRG_Unit_1;
input  [2:0]  Order_Of_TRG_Unit_2;
input  [2:0]  Order_Of_TRG_Unit_3;
input         RE;
input         RESET_N_Fifo;
input         Reset_N_Trigger;
input  [7:0]  TRG_Enable_Vector;
input         TRG_First_Is_First;
input         TRG_Last_Is_Last;
input  [11:0] TRG_Threshold;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output [15:0] Q_0;
output [15:0] Q_1;
output [15:0] Q_2;
output [15:0] Q_3;
//--------------------------------------------------------------------
// Inout
//--------------------------------------------------------------------
inout  [7:0]  TRG_Detect_Vector;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire          Clock;
wire          Fifo_WE;
wire   [11:0] Input_Data_0;
wire   [11:0] Input_Data_1;
wire   [11:0] Input_Data_2;
wire   [11:0] Input_Data_3;
wire   [2:0]  Order_Of_TRG_Unit_0;
wire   [2:0]  Order_Of_TRG_Unit_1;
wire   [2:0]  Order_Of_TRG_Unit_2;
wire   [2:0]  Order_Of_TRG_Unit_3;
wire   [15:0] Q_0_net_0;
wire   [15:0] Q_1_net_0;
wire   [15:0] Q_2_net_0;
wire   [15:0] Q_3_net_0;
wire          RE;
wire          RESET_N_Fifo;
wire          Reset_N_Trigger;
wire   [7:0]  TRG_Detect_Vector;
wire   [7:0]  TRG_Enable_Vector;
wire          TRG_First_Is_First;
wire          TRG_Last_Is_Last;
wire   [11:0] TRG_Threshold;
wire   [15:0] Trigger_Unit_0_Output_Data;
wire   [15:0] Trigger_Unit_1_Output_Data;
wire   [15:0] Trigger_Unit_2_Output_Data;
wire   [15:0] Trigger_Unit_3_Output_Data;
wire   [15:0] Q_0_net_1;
wire   [15:0] Q_1_net_1;
wire   [15:0] Q_2_net_1;
wire   [15:0] Q_3_net_1;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign Q_0_net_1 = Q_0_net_0;
assign Q_0[15:0] = Q_0_net_1;
assign Q_1_net_1 = Q_1_net_0;
assign Q_1[15:0] = Q_1_net_1;
assign Q_2_net_1 = Q_2_net_0;
assign Q_2[15:0] = Q_2_net_1;
assign Q_3_net_1 = Q_3_net_0;
assign Q_3[15:0] = Q_3_net_1;
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------COREFIFO_C4
COREFIFO_C4 COREFIFO_C4_0(
        // Inputs
        .CLK     ( Clock ),
        .RESET_N ( RESET_N_Fifo ),
        .WE      ( Fifo_WE ),
        .RE      ( RE ),
        .DATA    ( Trigger_Unit_0_Output_Data ),
        // Outputs
        .FULL    (  ),
        .EMPTY   (  ),
        .AFULL   (  ),
        .Q       ( Q_0_net_0 ) 
        );

//--------COREFIFO_C4
COREFIFO_C4 COREFIFO_C4_0_0(
        // Inputs
        .CLK     ( Clock ),
        .RESET_N ( RESET_N_Fifo ),
        .WE      ( Fifo_WE ),
        .RE      ( RE ),
        .DATA    ( Trigger_Unit_1_Output_Data ),
        // Outputs
        .FULL    (  ),
        .EMPTY   (  ),
        .AFULL   (  ),
        .Q       ( Q_1_net_0 ) 
        );

//--------COREFIFO_C4
COREFIFO_C4 COREFIFO_C4_0_1(
        // Inputs
        .CLK     ( Clock ),
        .RESET_N ( RESET_N_Fifo ),
        .WE      ( Fifo_WE ),
        .RE      ( RE ),
        .DATA    ( Trigger_Unit_2_Output_Data ),
        // Outputs
        .FULL    (  ),
        .EMPTY   (  ),
        .AFULL   (  ),
        .Q       ( Q_2_net_0 ) 
        );

//--------COREFIFO_C4
COREFIFO_C4 COREFIFO_C4_0_2(
        // Inputs
        .CLK     ( Clock ),
        .RESET_N ( RESET_N_Fifo ),
        .WE      ( Fifo_WE ),
        .RE      ( RE ),
        .DATA    ( Trigger_Unit_3_Output_Data ),
        // Outputs
        .FULL    (  ),
        .EMPTY   (  ),
        .AFULL   (  ),
        .Q       ( Q_3_net_0 ) 
        );

//--------Trigger_Unit
Trigger_Unit #( 
        .g_Data_Length         ( 12 ),
        .g_Num_Of_TRG_Units    ( 8 ),
        .g_Order_Vector_Length ( 3 ) )
Trigger_Unit_0(
        // Inputs
        .Clock              ( Clock ),
        .Reset_N            ( Reset_N_Trigger ),
        .TRG_First_Is_First ( TRG_First_Is_First ),
        .TRG_Last_Is_Last   ( TRG_Last_Is_Last ),
        .Order_Of_TRG_Unit  ( Order_Of_TRG_Unit_0 ),
        .Input_Data         ( Input_Data_0 ),
        .TRG_Threshold      ( TRG_Threshold ),
        .TRG_Enable_Vector  ( TRG_Enable_Vector ),
        // Outputs
        .Output_Data        ( Trigger_Unit_0_Output_Data ),
        // Inouts
        .TRG_Detect_Vector  ( TRG_Detect_Vector ) 
        );

//--------Trigger_Unit
Trigger_Unit #( 
        .g_Data_Length         ( 12 ),
        .g_Num_Of_TRG_Units    ( 8 ),
        .g_Order_Vector_Length ( 3 ) )
Trigger_Unit_1(
        // Inputs
        .Clock              ( Clock ),
        .Reset_N            ( Reset_N_Trigger ),
        .TRG_First_Is_First ( TRG_First_Is_First ),
        .TRG_Last_Is_Last   ( TRG_Last_Is_Last ),
        .Order_Of_TRG_Unit  ( Order_Of_TRG_Unit_1 ),
        .Input_Data         ( Input_Data_1 ),
        .TRG_Threshold      ( TRG_Threshold ),
        .TRG_Enable_Vector  ( TRG_Enable_Vector ),
        // Outputs
        .Output_Data        ( Trigger_Unit_1_Output_Data ),
        // Inouts
        .TRG_Detect_Vector  ( TRG_Detect_Vector ) 
        );

//--------Trigger_Unit
Trigger_Unit #( 
        .g_Data_Length         ( 12 ),
        .g_Num_Of_TRG_Units    ( 8 ),
        .g_Order_Vector_Length ( 3 ) )
Trigger_Unit_2(
        // Inputs
        .Clock              ( Clock ),
        .Reset_N            ( Reset_N_Trigger ),
        .TRG_First_Is_First ( TRG_First_Is_First ),
        .TRG_Last_Is_Last   ( TRG_Last_Is_Last ),
        .Order_Of_TRG_Unit  ( Order_Of_TRG_Unit_2 ),
        .Input_Data         ( Input_Data_2 ),
        .TRG_Threshold      ( TRG_Threshold ),
        .TRG_Enable_Vector  ( TRG_Enable_Vector ),
        // Outputs
        .Output_Data        ( Trigger_Unit_2_Output_Data ),
        // Inouts
        .TRG_Detect_Vector  ( TRG_Detect_Vector ) 
        );

//--------Trigger_Unit
Trigger_Unit #( 
        .g_Data_Length         ( 12 ),
        .g_Num_Of_TRG_Units    ( 8 ),
        .g_Order_Vector_Length ( 3 ) )
Trigger_Unit_3(
        // Inputs
        .Clock              ( Clock ),
        .Reset_N            ( Reset_N_Trigger ),
        .TRG_First_Is_First ( TRG_First_Is_First ),
        .TRG_Last_Is_Last   ( TRG_Last_Is_Last ),
        .Order_Of_TRG_Unit  ( Order_Of_TRG_Unit_3 ),
        .Input_Data         ( Input_Data_3 ),
        .TRG_Threshold      ( TRG_Threshold ),
        .TRG_Enable_Vector  ( TRG_Enable_Vector ),
        // Outputs
        .Output_Data        ( Trigger_Unit_3_Output_Data ),
        // Inouts
        .TRG_Detect_Vector  ( TRG_Detect_Vector ) 
        );


endmodule
