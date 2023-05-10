//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Tue May  9 23:25:06 2023
// Version: 2022.1 2022.1.0.10
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// Data_Block
module Data_Block(
    // Inputs
    C_addr_frame,
    C_enable_cmd,
    C_write_data_frame,
    C_write_read,
    Clock,
    Reset_N,
    // Outputs
    C_busy,
    C_read_data_frame,
    Y
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input  [7:0]  C_addr_frame;
input         C_enable_cmd;
input  [15:0] C_write_data_frame;
input         C_write_read;
input         Clock;
input         Reset_N;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output        C_busy;
output [15:0] C_read_data_frame;
output        Y;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire   [7:0]  C_addr_frame;
wire          C_busy_net_0;
wire          C_enable_cmd;
wire   [15:0] C_read_data_frame_net_0;
wire   [15:0] C_write_data_frame;
wire          C_write_read;
wire          Clock;
wire   [7:0]  Event_Info_RAM_Block_0_A_DOUT_Event_Status;
wire          FIFOs_Reader_0_Block_0_Sample_FIFO_R_Enable;
wire          FIFOs_Reader_0_Block_1_Sample_FIFO_R_Enable;
wire          FIFOs_Reader_0_Event_FIFO_R_Enable;
wire   [9:0]  FIFOs_Reader_0_Event_RAM_W_Address;
wire   [19:0] FIFOs_Reader_0_Event_RAM_W_Data_Number;
wire   [19:0] FIFOs_Reader_0_Event_RAM_W_Data_Size;
wire   [19:0] FIFOs_Reader_0_Event_RAM_W_Data_Start_ADDR;
wire   [7:0]  FIFOs_Reader_0_Event_RAM_W_Data_Status;
wire          FIFOs_Reader_0_Event_RAM_W_Enable_Number;
wire          FIFOs_Reader_0_Event_RAM_W_Enable_Size;
wire          FIFOs_Reader_0_Event_RAM_W_Enable_Start_ADDR;
wire          FIFOs_Reader_0_Event_RAM_W_Enable_Status;
wire   [15:0] FIFOs_Reader_0_Sample_RAM_W_Address;
wire   [3:0]  FIFOs_Reader_0_Sample_RAM_W_Block_Address;
wire   [63:0] FIFOs_Reader_0_Sample_RAM_W_Data;
wire          FIFOs_Reader_0_Sample_RAM_W_Enable;
wire   [15:0] Input_Data_Part_0_Q_0;
wire   [15:0] Input_Data_Part_0_Q_1;
wire   [15:0] Input_Data_Part_0_Q_2;
wire   [15:0] Input_Data_Part_0_Q_3;
wire   [7:0]  Input_Data_Part_0_TRG_Detect_Vector;
wire   [15:0] Input_Data_Part_1_Q_0;
wire   [15:0] Input_Data_Part_1_Q_1;
wire   [15:0] Input_Data_Part_1_Q_2;
wire   [15:0] Input_Data_Part_1_Q_3;
wire          Reset_N;
wire   [11:0] Test_Generator_0_Test_Data_0;
wire   [11:0] Test_Generator_0_Test_Data_1;
wire   [11:0] Test_Generator_0_Test_Data_2;
wire   [11:0] Test_Generator_0_Test_Data_3;
wire   [11:0] Test_Generator_0_Test_Data_4;
wire   [11:0] Test_Generator_0_Test_Data_5;
wire   [11:0] Test_Generator_0_Test_Data_6;
wire   [11:0] Test_Generator_0_Test_Data_7;
wire          Trigger_Top_Part_0_ALL_FIFO_Enable;
wire          Trigger_Top_Part_0_Control_Test_Generator_Enable;
wire          Trigger_Top_Part_0_EMPTY;
wire   [17:0] Trigger_Top_Part_0_Q;
wire   [7:0]  Trigger_Top_Part_0_TRG_Enable_Vector;
wire          Trigger_Top_Part_0_TRG_First_Is_First;
wire          Trigger_Top_Part_0_TRG_Last_Is_Last;
wire   [11:0] Trigger_Top_Part_0_TRG_Threshold;
wire          C_busy_net_1;
wire   [15:0] C_read_data_frame_net_1;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire          GND_net;
wire   [9:0]  B_ADDR_const_net_0;
wire   [7:0]  B_DIN_Event_Status_const_net_0;
wire   [2:0]  Order_Of_TRG_Unit_0_const_net_0;
wire   [2:0]  Order_Of_TRG_Unit_1_const_net_0;
wire   [2:0]  Order_Of_TRG_Unit_3_const_net_0;
wire   [2:0]  Order_Of_TRG_Unit_2_const_net_0;
wire   [2:0]  Order_Of_TRG_Unit_0_const_net_1;
wire   [2:0]  Order_Of_TRG_Unit_1_const_net_1;
wire   [2:0]  Order_Of_TRG_Unit_3_const_net_1;
wire   [2:0]  Order_Of_TRG_Unit_2_const_net_1;
wire   [15:0] B_ADDR_const_net_1;
wire   [3:0]  B_Block_Address_vector_const_net_0;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign GND_net                            = 1'b0;
assign B_ADDR_const_net_0                 = 10'h000;
assign B_DIN_Event_Status_const_net_0     = 8'h00;
assign Order_Of_TRG_Unit_0_const_net_0    = 3'h0;
assign Order_Of_TRG_Unit_1_const_net_0    = 3'h1;
assign Order_Of_TRG_Unit_3_const_net_0    = 3'h3;
assign Order_Of_TRG_Unit_2_const_net_0    = 3'h2;
assign Order_Of_TRG_Unit_0_const_net_1    = 3'h4;
assign Order_Of_TRG_Unit_1_const_net_1    = 3'h5;
assign Order_Of_TRG_Unit_3_const_net_1    = 3'h7;
assign Order_Of_TRG_Unit_2_const_net_1    = 3'h6;
assign B_ADDR_const_net_1                 = 16'h0000;
assign B_Block_Address_vector_const_net_0 = 4'h0;
//--------------------------------------------------------------------
// TieOff assignments
//--------------------------------------------------------------------
assign Y                       = 1'b0;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign C_busy_net_1            = C_busy_net_0;
assign C_busy                  = C_busy_net_1;
assign C_read_data_frame_net_1 = C_read_data_frame_net_0;
assign C_read_data_frame[15:0] = C_read_data_frame_net_1;
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------Event_Info_RAM_Block
Event_Info_RAM_Block Event_Info_RAM_Block_0(
        // Inputs
        .A_WEN_Event_Start_ADDR  ( FIFOs_Reader_0_Event_RAM_W_Enable_Start_ADDR ),
        .A_WEN_Event_Number      ( FIFOs_Reader_0_Event_RAM_W_Enable_Number ),
        .A_WEN_Event_Size        ( FIFOs_Reader_0_Event_RAM_W_Enable_Size ),
        .A_WEN_Event_Status      ( FIFOs_Reader_0_Event_RAM_W_Enable_Status ),
        .B_WEN_Event_Status      ( GND_net ),
        .CLK                     ( Clock ),
        .A_ADDR                  ( FIFOs_Reader_0_Event_RAM_W_Address ),
        .B_ADDR                  ( B_ADDR_const_net_0 ),
        .A_DIN_Event_Start_ADDR  ( FIFOs_Reader_0_Event_RAM_W_Data_Start_ADDR ),
        .A_DIN_Event_Number      ( FIFOs_Reader_0_Event_RAM_W_Data_Number ),
        .A_DIN_Event_Size        ( FIFOs_Reader_0_Event_RAM_W_Data_Size ),
        .A_DIN_Event_Status      ( FIFOs_Reader_0_Event_RAM_W_Data_Status ),
        .B_DIN_Event_Status      ( B_DIN_Event_Status_const_net_0 ),
        // Outputs
        .A_DOUT_Event_Status     ( Event_Info_RAM_Block_0_A_DOUT_Event_Status ),
        .B_DOUT_Event_Status     (  ),
        .B_DOUT_Event_Start_ADDR (  ),
        .B_DOUT_Event_Number     (  ),
        .B_DOUT_Event_Size       (  ) 
        );

//--------FIFOs_Reader
FIFOs_Reader FIFOs_Reader_0(
        // Inputs
        .Clock                         ( Clock ),
        .Reset_N                       ( Reset_N ),
        .Event_FIFO_Empty              ( Trigger_Top_Part_0_EMPTY ),
        .Event_FIFO_R_Data             ( Trigger_Top_Part_0_Q ),
        .Block_0_Sample_FIFO_0_R_Data  ( Input_Data_Part_0_Q_0 ),
        .Block_0_Sample_FIFO_1_R_Data  ( Input_Data_Part_0_Q_1 ),
        .Block_0_Sample_FIFO_2_R_Data  ( Input_Data_Part_0_Q_2 ),
        .Block_0_Sample_FIFO_3_R_Data  ( Input_Data_Part_0_Q_3 ),
        .Block_1_Sample_FIFO_0_R_Data  ( Input_Data_Part_1_Q_0 ),
        .Block_1_Sample_FIFO_1_R_Data  ( Input_Data_Part_1_Q_1 ),
        .Block_1_Sample_FIFO_2_R_Data  ( Input_Data_Part_1_Q_2 ),
        .Block_1_Sample_FIFO_3_R_Data  ( Input_Data_Part_1_Q_3 ),
        .Event_RAM_R_Data_Status       ( Event_Info_RAM_Block_0_A_DOUT_Event_Status ),
        // Outputs
        .Event_FIFO_R_Enable           ( FIFOs_Reader_0_Event_FIFO_R_Enable ),
        .Block_0_Sample_FIFO_R_Enable  ( FIFOs_Reader_0_Block_0_Sample_FIFO_R_Enable ),
        .Block_1_Sample_FIFO_R_Enable  ( FIFOs_Reader_0_Block_1_Sample_FIFO_R_Enable ),
        .Event_RAM_W_Enable_Start_ADDR ( FIFOs_Reader_0_Event_RAM_W_Enable_Start_ADDR ),
        .Event_RAM_W_Enable_Number     ( FIFOs_Reader_0_Event_RAM_W_Enable_Number ),
        .Event_RAM_W_Enable_Size       ( FIFOs_Reader_0_Event_RAM_W_Enable_Size ),
        .Event_RAM_W_Enable_Status     ( FIFOs_Reader_0_Event_RAM_W_Enable_Status ),
        .Sample_RAM_W_Enable           ( FIFOs_Reader_0_Sample_RAM_W_Enable ),
        .Diag_Valid                    (  ),
        .Event_RAM_W_Address           ( FIFOs_Reader_0_Event_RAM_W_Address ),
        .Event_RAM_W_Data_Start_ADDR   ( FIFOs_Reader_0_Event_RAM_W_Data_Start_ADDR ),
        .Event_RAM_W_Data_Number       ( FIFOs_Reader_0_Event_RAM_W_Data_Number ),
        .Event_RAM_W_Data_Size         ( FIFOs_Reader_0_Event_RAM_W_Data_Size ),
        .Event_RAM_W_Data_Status       ( FIFOs_Reader_0_Event_RAM_W_Data_Status ),
        .Sample_RAM_W_Address          ( FIFOs_Reader_0_Sample_RAM_W_Address ),
        .Sample_RAM_W_Block_Address    ( FIFOs_Reader_0_Sample_RAM_W_Block_Address ),
        .Sample_RAM_W_Data             ( FIFOs_Reader_0_Sample_RAM_W_Data ) 
        );

//--------Input_Data_Part
Input_Data_Part Input_Data_Part_0(
        // Inputs
        .Clock               ( Clock ),
        .Reset_N             ( Reset_N ),
        .Fifo_WE             ( Trigger_Top_Part_0_ALL_FIFO_Enable ),
        .TRG_First_Is_First  ( Trigger_Top_Part_0_TRG_First_Is_First ),
        .TRG_Last_Is_Last    ( Trigger_Top_Part_0_TRG_Last_Is_Last ),
        .RE                  ( FIFOs_Reader_0_Block_0_Sample_FIFO_R_Enable ),
        .Input_Data_0        ( Test_Generator_0_Test_Data_0 ),
        .Input_Data_1        ( Test_Generator_0_Test_Data_1 ),
        .Input_Data_2        ( Test_Generator_0_Test_Data_2 ),
        .Input_Data_3        ( Test_Generator_0_Test_Data_3 ),
        .TRG_Threshold       ( Trigger_Top_Part_0_TRG_Threshold ),
        .TRG_Enable_Vector   ( Trigger_Top_Part_0_TRG_Enable_Vector ),
        .Order_Of_TRG_Unit_0 ( Order_Of_TRG_Unit_0_const_net_0 ),
        .Order_Of_TRG_Unit_1 ( Order_Of_TRG_Unit_1_const_net_0 ),
        .Order_Of_TRG_Unit_3 ( Order_Of_TRG_Unit_3_const_net_0 ),
        .Order_Of_TRG_Unit_2 ( Order_Of_TRG_Unit_2_const_net_0 ),
        // Outputs
        .Q_0                 ( Input_Data_Part_0_Q_0 ),
        .Q_1                 ( Input_Data_Part_0_Q_1 ),
        .Q_2                 ( Input_Data_Part_0_Q_2 ),
        .Q_3                 ( Input_Data_Part_0_Q_3 ),
        // Inouts
        .TRG_Detect_Vector   ( Input_Data_Part_0_TRG_Detect_Vector ) 
        );

//--------Input_Data_Part
Input_Data_Part Input_Data_Part_1(
        // Inputs
        .Clock               ( Clock ),
        .Reset_N             ( Reset_N ),
        .Fifo_WE             ( Trigger_Top_Part_0_ALL_FIFO_Enable ),
        .TRG_First_Is_First  ( Trigger_Top_Part_0_TRG_First_Is_First ),
        .TRG_Last_Is_Last    ( Trigger_Top_Part_0_TRG_Last_Is_Last ),
        .RE                  ( FIFOs_Reader_0_Block_1_Sample_FIFO_R_Enable ),
        .Input_Data_0        ( Test_Generator_0_Test_Data_4 ),
        .Input_Data_1        ( Test_Generator_0_Test_Data_5 ),
        .Input_Data_2        ( Test_Generator_0_Test_Data_6 ),
        .Input_Data_3        ( Test_Generator_0_Test_Data_7 ),
        .TRG_Threshold       ( Trigger_Top_Part_0_TRG_Threshold ),
        .TRG_Enable_Vector   ( Trigger_Top_Part_0_TRG_Enable_Vector ),
        .Order_Of_TRG_Unit_0 ( Order_Of_TRG_Unit_0_const_net_1 ),
        .Order_Of_TRG_Unit_1 ( Order_Of_TRG_Unit_1_const_net_1 ),
        .Order_Of_TRG_Unit_3 ( Order_Of_TRG_Unit_3_const_net_1 ),
        .Order_Of_TRG_Unit_2 ( Order_Of_TRG_Unit_2_const_net_1 ),
        // Outputs
        .Q_0                 ( Input_Data_Part_1_Q_0 ),
        .Q_1                 ( Input_Data_Part_1_Q_1 ),
        .Q_2                 ( Input_Data_Part_1_Q_2 ),
        .Q_3                 ( Input_Data_Part_1_Q_3 ),
        // Inouts
        .TRG_Detect_Vector   ( Input_Data_Part_0_TRG_Detect_Vector ) 
        );

//--------Sample_RAM_Block
Sample_RAM_Block Sample_RAM_Block_0(
        // Inputs
        .CLK                    ( Clock ),
        .A_WEN                  ( FIFOs_Reader_0_Sample_RAM_W_Enable ),
        .A_DIN                  ( FIFOs_Reader_0_Sample_RAM_W_Data ),
        .A_ADDR                 ( FIFOs_Reader_0_Sample_RAM_W_Address ),
        .A_Block_Address_vector ( FIFOs_Reader_0_Sample_RAM_W_Block_Address ),
        .B_ADDR                 ( B_ADDR_const_net_1 ),
        .B_Block_Address_vector ( B_Block_Address_vector_const_net_0 ),
        // Outputs
        .B_Output_Data          (  ) 
        );

//--------Test_Generator
Test_Generator Test_Generator_0(
        // Inputs
        .Clock       ( Clock ),
        .Reset_N     ( Reset_N ),
        .Test_Enable ( Trigger_Top_Part_0_Control_Test_Generator_Enable ),
        // Outputs
        .Test_Data_0 ( Test_Generator_0_Test_Data_0 ),
        .Test_Data_1 ( Test_Generator_0_Test_Data_1 ),
        .Test_Data_2 ( Test_Generator_0_Test_Data_2 ),
        .Test_Data_3 ( Test_Generator_0_Test_Data_3 ),
        .Test_Data_4 ( Test_Generator_0_Test_Data_4 ),
        .Test_Data_5 ( Test_Generator_0_Test_Data_5 ),
        .Test_Data_6 ( Test_Generator_0_Test_Data_6 ),
        .Test_Data_7 ( Test_Generator_0_Test_Data_7 ) 
        );

//--------Trigger_Top_Part
Trigger_Top_Part Trigger_Top_Part_0(
        // Inputs
        .Clock                         ( Clock ),
        .Reset_N                       ( Reset_N ),
        .C_enable_cmd                  ( C_enable_cmd ),
        .C_write_read                  ( C_write_read ),
        .RE                            ( FIFOs_Reader_0_Event_FIFO_R_Enable ),
        .C_addr_frame                  ( C_addr_frame ),
        .C_write_data_frame            ( C_write_data_frame ),
        .TRG_Detect_Vector             ( Input_Data_Part_0_TRG_Detect_Vector ),
        // Outputs
        .C_busy                        ( C_busy_net_0 ),
        .Control_Test_Generator_Enable ( Trigger_Top_Part_0_Control_Test_Generator_Enable ),
        .ALL_FIFO_Enable               ( Trigger_Top_Part_0_ALL_FIFO_Enable ),
        .TRG_First_Is_First            ( Trigger_Top_Part_0_TRG_First_Is_First ),
        .TRG_Last_Is_Last              ( Trigger_Top_Part_0_TRG_Last_Is_Last ),
        .EMPTY                         ( Trigger_Top_Part_0_EMPTY ),
        .C_read_data_frame             ( C_read_data_frame_net_0 ),
        .TRG_Threshold                 ( Trigger_Top_Part_0_TRG_Threshold ),
        .TRG_Enable_Vector             ( Trigger_Top_Part_0_TRG_Enable_Vector ),
        .Q                             ( Trigger_Top_Part_0_Q ) 
        );


endmodule
