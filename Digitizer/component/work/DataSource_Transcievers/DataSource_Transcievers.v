//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Fri Dec 22 22:24:30 2023
// Version: 2022.1 2022.1.0.10
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// DataSource_Transcievers
module DataSource_Transcievers(
    // Inputs
    Clock,
    Gen_Enable,
    Reset_N,
    // Outputs
    DataValid,
    Output_Data_0_0,
    Output_Data_0_1,
    Output_Data_1_0,
    Output_Data_1_1,
    Output_Data_2_0,
    Output_Data_2_1,
    Output_Data_3_0,
    Output_Data_3_1
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input         Clock;
input         Gen_Enable;
input         Reset_N;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output        DataValid;
output [11:0] Output_Data_0_0;
output [11:0] Output_Data_0_1;
output [11:0] Output_Data_1_0;
output [11:0] Output_Data_1_1;
output [11:0] Output_Data_2_0;
output [11:0] Output_Data_2_1;
output [11:0] Output_Data_3_0;
output [11:0] Output_Data_3_1;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire          Alignment_Fifo_0_0_Empty_For_NonAll;
wire   [7:0]  Alignment_Fifo_0_0_Read_Data_0;
wire   [7:0]  Alignment_Fifo_0_0_Read_Data_1;
wire   [7:0]  Alignment_Fifo_0_0_Read_Data_2;
wire   [7:0]  Alignment_Fifo_0_0_Read_Data_3;
wire          Alignment_Fifo_0_Empty_For_NonAll;
wire   [7:0]  Alignment_Fifo_0_Read_Data_0;
wire   [7:0]  Alignment_Fifo_0_Read_Data_1;
wire   [7:0]  Alignment_Fifo_0_Read_Data_2;
wire   [7:0]  Alignment_Fifo_0_Read_Data_3;
wire          AND2_0_Y;
wire          Clock;
wire          DataValid_net_0;
wire          Gen_Enable;
wire   [11:0] Output_Data_0_0_net_0;
wire   [11:0] Output_Data_0_1_net_0;
wire   [11:0] Output_Data_1_0_net_0;
wire   [11:0] Output_Data_1_1_net_0;
wire   [11:0] Output_Data_2_0_net_0;
wire   [11:0] Output_Data_2_1_net_0;
wire   [11:0] Output_Data_3_0_net_0;
wire   [11:0] Output_Data_3_1_net_0;
wire          Reset_N;
wire          RxLaneControl_0_0_CTRL_Data_Go;
wire          RxLaneControl_0_0_CTRL_ILAS_Go;
wire          RxLaneControl_0_0_CTRL_Synced;
wire   [7:0]  RxLaneControl_0_0_Output_Data_0;
wire   [7:0]  RxLaneControl_0_0_Output_Data_1;
wire   [7:0]  RxLaneControl_0_0_Output_Data_2;
wire   [7:0]  RxLaneControl_0_0_Output_Data_3;
wire   [3:0]  RxLaneControl_0_0_Output_DataWrite;
wire          RxLaneControl_0_CTRL_Data_Go;
wire          RxLaneControl_0_CTRL_ILAS_Go;
wire          RxLaneControl_0_CTRL_Synced;
wire   [7:0]  RxLaneControl_0_Output_Data_0;
wire   [7:0]  RxLaneControl_0_Output_Data_1;
wire   [7:0]  RxLaneControl_0_Output_Data_2;
wire   [7:0]  RxLaneControl_0_Output_Data_3;
wire   [3:0]  RxLaneControl_0_Output_DataWrite;
wire          RxMainLinkController_0_SYNCINB;
wire   [7:0]  Test_Generator_for_Lanes_0_Test_Data_0;
wire   [7:0]  Test_Generator_for_Lanes_0_Test_Data_1;
wire   [7:0]  Test_Generator_for_Lanes_0_Test_Data_2;
wire   [7:0]  Test_Generator_for_Lanes_0_Test_Data_3;
wire   [7:0]  Test_Generator_for_Lanes_0_Test_Data_4;
wire   [7:0]  Test_Generator_for_Lanes_0_Test_Data_5;
wire   [7:0]  Test_Generator_for_Lanes_0_Test_Data_6;
wire   [7:0]  Test_Generator_for_Lanes_0_Test_Data_7;
wire          TxLaneControl_0_0_Input_MainData_Read;
wire   [7:0]  TxLaneControl_0_0_Output_Data_0;
wire   [7:0]  TxLaneControl_0_0_Output_Data_1;
wire   [7:0]  TxLaneControl_0_0_Output_Data_2;
wire   [7:0]  TxLaneControl_0_0_Output_Data_3;
wire          TxLaneControl_0_0_Output_K_0;
wire          TxLaneControl_0_0_Output_K_1;
wire          TxLaneControl_0_0_Output_K_2;
wire          TxLaneControl_0_0_Output_K_3;
wire          TxLaneControl_0_Input_MainData_Read;
wire   [7:0]  TxLaneControl_0_Output_Data_0;
wire   [7:0]  TxLaneControl_0_Output_Data_1;
wire   [7:0]  TxLaneControl_0_Output_Data_2;
wire   [7:0]  TxLaneControl_0_Output_Data_3;
wire          TxLaneControl_0_Output_K_0;
wire          TxLaneControl_0_Output_K_1;
wire          TxLaneControl_0_Output_K_2;
wire          TxLaneControl_0_Output_K_3;
wire          TxMainLinkController_0_Data_Read;
wire          TxMainLinkController_0_SYNC_OK;
wire   [11:0] Output_Data_3_1_net_1;
wire   [11:0] Output_Data_0_1_net_1;
wire   [11:0] Output_Data_1_1_net_1;
wire   [11:0] Output_Data_2_1_net_1;
wire   [11:0] Output_Data_0_0_net_1;
wire   [11:0] Output_Data_1_0_net_1;
wire   [11:0] Output_Data_2_0_net_1;
wire   [11:0] Output_Data_3_0_net_1;
wire          DataValid_net_1;
wire   [1:0]  LANE_Synced_net_0;
wire   [1:0]  LANE_ILAS_Go_net_0;
wire   [1:0]  LANE_Data_Go_net_0;
wire   [1:0]  LANE_Alignment_Fifo_Empty_net_0;
wire   [1:0]  Lanes_DataGo_net_0;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire          VCC_net;
wire   [3:0]  Read_Data_Enable_const_net_0;
wire   [3:0]  Read_Data_Enable_const_net_1;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign VCC_net                      = 1'b1;
assign Read_Data_Enable_const_net_0 = 4'hF;
assign Read_Data_Enable_const_net_1 = 4'hF;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign Output_Data_3_1_net_1 = Output_Data_3_1_net_0;
assign Output_Data_3_1[11:0] = Output_Data_3_1_net_1;
assign Output_Data_0_1_net_1 = Output_Data_0_1_net_0;
assign Output_Data_0_1[11:0] = Output_Data_0_1_net_1;
assign Output_Data_1_1_net_1 = Output_Data_1_1_net_0;
assign Output_Data_1_1[11:0] = Output_Data_1_1_net_1;
assign Output_Data_2_1_net_1 = Output_Data_2_1_net_0;
assign Output_Data_2_1[11:0] = Output_Data_2_1_net_1;
assign Output_Data_0_0_net_1 = Output_Data_0_0_net_0;
assign Output_Data_0_0[11:0] = Output_Data_0_0_net_1;
assign Output_Data_1_0_net_1 = Output_Data_1_0_net_0;
assign Output_Data_1_0[11:0] = Output_Data_1_0_net_1;
assign Output_Data_2_0_net_1 = Output_Data_2_0_net_0;
assign Output_Data_2_0[11:0] = Output_Data_2_0_net_1;
assign Output_Data_3_0_net_1 = Output_Data_3_0_net_0;
assign Output_Data_3_0[11:0] = Output_Data_3_0_net_1;
assign DataValid_net_1       = DataValid_net_0;
assign DataValid             = DataValid_net_1;
//--------------------------------------------------------------------
// Concatenation assignments
//--------------------------------------------------------------------
assign LANE_Synced_net_0               = { RxLaneControl_0_0_CTRL_Synced , RxLaneControl_0_CTRL_Synced };
assign LANE_ILAS_Go_net_0              = { RxLaneControl_0_0_CTRL_ILAS_Go , RxLaneControl_0_CTRL_ILAS_Go };
assign LANE_Data_Go_net_0              = { RxLaneControl_0_0_CTRL_Data_Go , RxLaneControl_0_CTRL_Data_Go };
assign LANE_Alignment_Fifo_Empty_net_0 = { Alignment_Fifo_0_0_Empty_For_NonAll , Alignment_Fifo_0_Empty_For_NonAll };
assign Lanes_DataGo_net_0              = { TxLaneControl_0_0_Input_MainData_Read , TxLaneControl_0_Input_MainData_Read };
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------Alignment_Fifo
Alignment_Fifo Alignment_Fifo_0(
        // Inputs
        .Clock             ( Clock ),
        .Reset_N           ( Reset_N ),
        .Write_Enable      ( VCC_net ),
        .Write_Data_0      ( RxLaneControl_0_Output_Data_0 ),
        .Write_Data_1      ( RxLaneControl_0_Output_Data_1 ),
        .Write_Data_2      ( RxLaneControl_0_Output_Data_2 ),
        .Write_Data_3      ( RxLaneControl_0_Output_Data_3 ),
        .Write_Data_Enable ( RxLaneControl_0_Output_DataWrite ),
        .Read_Enable       ( DataValid_net_0 ),
        .Read_Data_Enable  ( Read_Data_Enable_const_net_0 ),
        // Outputs
        .Full              (  ),
        .Full_For_All      (  ),
        .Empty             (  ),
        .Empty_For_NonAll  ( Alignment_Fifo_0_Empty_For_NonAll ),
        .Read_Data_0       ( Alignment_Fifo_0_Read_Data_0 ),
        .Read_Data_1       ( Alignment_Fifo_0_Read_Data_1 ),
        .Read_Data_2       ( Alignment_Fifo_0_Read_Data_2 ),
        .Read_Data_3       ( Alignment_Fifo_0_Read_Data_3 ),
        .Read_Data_Empty   (  ) 
        );

//--------Alignment_Fifo
Alignment_Fifo Alignment_Fifo_0_0(
        // Inputs
        .Clock             ( Clock ),
        .Reset_N           ( Reset_N ),
        .Write_Enable      ( VCC_net ),
        .Write_Data_0      ( RxLaneControl_0_0_Output_Data_0 ),
        .Write_Data_1      ( RxLaneControl_0_0_Output_Data_1 ),
        .Write_Data_2      ( RxLaneControl_0_0_Output_Data_2 ),
        .Write_Data_3      ( RxLaneControl_0_0_Output_Data_3 ),
        .Write_Data_Enable ( RxLaneControl_0_0_Output_DataWrite ),
        .Read_Enable       ( DataValid_net_0 ),
        .Read_Data_Enable  ( Read_Data_Enable_const_net_1 ),
        // Outputs
        .Full              (  ),
        .Full_For_All      (  ),
        .Empty             (  ),
        .Empty_For_NonAll  ( Alignment_Fifo_0_0_Empty_For_NonAll ),
        .Read_Data_0       ( Alignment_Fifo_0_0_Read_Data_0 ),
        .Read_Data_1       ( Alignment_Fifo_0_0_Read_Data_1 ),
        .Read_Data_2       ( Alignment_Fifo_0_0_Read_Data_2 ),
        .Read_Data_3       ( Alignment_Fifo_0_0_Read_Data_3 ),
        .Read_Data_Empty   (  ) 
        );

//--------AND2
AND2 AND2_0(
        // Inputs
        .A ( Gen_Enable ),
        .B ( TxMainLinkController_0_Data_Read ),
        // Outputs
        .Y ( AND2_0_Y ) 
        );

//--------LaneOutExtender
LaneOutExtender LaneOutExtender_0(
        // Inputs
        .Input_Data_3  ( Alignment_Fifo_0_Read_Data_3 ),
        .Input_Data_2  ( Alignment_Fifo_0_Read_Data_2 ),
        .Input_Data_1  ( Alignment_Fifo_0_Read_Data_1 ),
        .Input_Data_0  ( Alignment_Fifo_0_Read_Data_0 ),
        // Outputs
        .Output_Data_3 ( Output_Data_3_0_net_0 ),
        .Output_Data_2 ( Output_Data_2_0_net_0 ),
        .Output_Data_1 ( Output_Data_1_0_net_0 ),
        .Output_Data_0 ( Output_Data_0_0_net_0 ) 
        );

//--------LaneOutExtender
LaneOutExtender LaneOutExtender_0_0(
        // Inputs
        .Input_Data_3  ( Alignment_Fifo_0_0_Read_Data_3 ),
        .Input_Data_2  ( Alignment_Fifo_0_0_Read_Data_2 ),
        .Input_Data_1  ( Alignment_Fifo_0_0_Read_Data_1 ),
        .Input_Data_0  ( Alignment_Fifo_0_0_Read_Data_0 ),
        // Outputs
        .Output_Data_3 ( Output_Data_3_1_net_0 ),
        .Output_Data_2 ( Output_Data_2_1_net_0 ),
        .Output_Data_1 ( Output_Data_1_1_net_0 ),
        .Output_Data_0 ( Output_Data_0_1_net_0 ) 
        );

//--------RxLaneControl
RxLaneControl RxLaneControl_0(
        // Inputs
        .Clock            ( Clock ),
        .Reset_N          ( Reset_N ),
        .Input_Data_3     ( TxLaneControl_0_Output_Data_3 ),
        .Input_Data_2     ( TxLaneControl_0_Output_Data_2 ),
        .Input_Data_1     ( TxLaneControl_0_Output_Data_1 ),
        .Input_Data_0     ( TxLaneControl_0_Output_Data_0 ),
        .Input_K_3        ( TxLaneControl_0_Output_K_3 ),
        .Input_K_2        ( TxLaneControl_0_Output_K_2 ),
        .Input_K_1        ( TxLaneControl_0_Output_K_1 ),
        .Input_K_0        ( TxLaneControl_0_Output_K_0 ),
        .CDR_READY        ( VCC_net ),
        .CDR_VAL          ( VCC_net ),
        // Outputs
        .Output_Data_3    ( RxLaneControl_0_Output_Data_3 ),
        .Output_Data_2    ( RxLaneControl_0_Output_Data_2 ),
        .Output_Data_1    ( RxLaneControl_0_Output_Data_1 ),
        .Output_Data_0    ( RxLaneControl_0_Output_Data_0 ),
        .Output_DataWrite ( RxLaneControl_0_Output_DataWrite ),
        .CTRL_Synced      ( RxLaneControl_0_CTRL_Synced ),
        .CTRL_ILAS_Go     ( RxLaneControl_0_CTRL_ILAS_Go ),
        .CTRL_Data_Go     ( RxLaneControl_0_CTRL_Data_Go ),
        .CTRL_Fault_Sync  (  ),
        .CTRL_Fault_ILAS  (  ) 
        );

//--------RxLaneControl
RxLaneControl RxLaneControl_0_0(
        // Inputs
        .Clock            ( Clock ),
        .Reset_N          ( Reset_N ),
        .Input_Data_3     ( TxLaneControl_0_0_Output_Data_3 ),
        .Input_Data_2     ( TxLaneControl_0_0_Output_Data_2 ),
        .Input_Data_1     ( TxLaneControl_0_0_Output_Data_1 ),
        .Input_Data_0     ( TxLaneControl_0_0_Output_Data_0 ),
        .Input_K_3        ( TxLaneControl_0_0_Output_K_3 ),
        .Input_K_2        ( TxLaneControl_0_0_Output_K_2 ),
        .Input_K_1        ( TxLaneControl_0_0_Output_K_1 ),
        .Input_K_0        ( TxLaneControl_0_0_Output_K_0 ),
        .CDR_READY        ( VCC_net ),
        .CDR_VAL          ( VCC_net ),
        // Outputs
        .Output_Data_3    ( RxLaneControl_0_0_Output_Data_3 ),
        .Output_Data_2    ( RxLaneControl_0_0_Output_Data_2 ),
        .Output_Data_1    ( RxLaneControl_0_0_Output_Data_1 ),
        .Output_Data_0    ( RxLaneControl_0_0_Output_Data_0 ),
        .Output_DataWrite ( RxLaneControl_0_0_Output_DataWrite ),
        .CTRL_Synced      ( RxLaneControl_0_0_CTRL_Synced ),
        .CTRL_ILAS_Go     ( RxLaneControl_0_0_CTRL_ILAS_Go ),
        .CTRL_Data_Go     ( RxLaneControl_0_0_CTRL_Data_Go ),
        .CTRL_Fault_Sync  (  ),
        .CTRL_Fault_ILAS  (  ) 
        );

//--------RxMainLinkController
RxMainLinkController RxMainLinkController_0(
        // Inputs
        .Clock                     ( Clock ),
        .Reset_N                   ( Reset_N ),
        .LANE_Synced               ( LANE_Synced_net_0 ),
        .LANE_ILAS_Go              ( LANE_ILAS_Go_net_0 ),
        .LANE_Data_Go              ( LANE_Data_Go_net_0 ),
        .LANE_Alignment_Fifo_Empty ( LANE_Alignment_Fifo_Empty_net_0 ),
        // Outputs
        .SYNCINB                   ( RxMainLinkController_0_SYNCINB ),
        .Alignment_Fifo_Read       ( DataValid_net_0 ) 
        );

//--------Test_Generator_for_Lanes
Test_Generator_for_Lanes Test_Generator_for_Lanes_0(
        // Inputs
        .Clock       ( Clock ),
        .Reset_N     ( Reset_N ),
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

//--------TxLaneControl
TxLaneControl TxLaneControl_0(
        // Inputs
        .Clock               ( Clock ),
        .Reset_N             ( Reset_N ),
        .Input_MainData_3    ( Test_Generator_for_Lanes_0_Test_Data_5 ),
        .Input_MainData_2    ( Test_Generator_for_Lanes_0_Test_Data_4 ),
        .Input_MainData_1    ( Test_Generator_for_Lanes_0_Test_Data_1 ),
        .Input_MainData_0    ( Test_Generator_for_Lanes_0_Test_Data_0 ),
        .SYNC_OK             ( TxMainLinkController_0_SYNC_OK ),
        // Outputs
        .Input_MainData_Read ( TxLaneControl_0_Input_MainData_Read ),
        .Output_Data_3       ( TxLaneControl_0_Output_Data_3 ),
        .Output_Data_2       ( TxLaneControl_0_Output_Data_2 ),
        .Output_Data_1       ( TxLaneControl_0_Output_Data_1 ),
        .Output_Data_0       ( TxLaneControl_0_Output_Data_0 ),
        .Output_K_3          ( TxLaneControl_0_Output_K_3 ),
        .Output_K_2          ( TxLaneControl_0_Output_K_2 ),
        .Output_K_1          ( TxLaneControl_0_Output_K_1 ),
        .Output_K_0          ( TxLaneControl_0_Output_K_0 ) 
        );

//--------TxLaneControl
TxLaneControl TxLaneControl_0_0(
        // Inputs
        .Clock               ( Clock ),
        .Reset_N             ( Reset_N ),
        .Input_MainData_3    ( Test_Generator_for_Lanes_0_Test_Data_7 ),
        .Input_MainData_2    ( Test_Generator_for_Lanes_0_Test_Data_6 ),
        .Input_MainData_1    ( Test_Generator_for_Lanes_0_Test_Data_3 ),
        .Input_MainData_0    ( Test_Generator_for_Lanes_0_Test_Data_2 ),
        .SYNC_OK             ( TxMainLinkController_0_SYNC_OK ),
        // Outputs
        .Input_MainData_Read ( TxLaneControl_0_0_Input_MainData_Read ),
        .Output_Data_3       ( TxLaneControl_0_0_Output_Data_3 ),
        .Output_Data_2       ( TxLaneControl_0_0_Output_Data_2 ),
        .Output_Data_1       ( TxLaneControl_0_0_Output_Data_1 ),
        .Output_Data_0       ( TxLaneControl_0_0_Output_Data_0 ),
        .Output_K_3          ( TxLaneControl_0_0_Output_K_3 ),
        .Output_K_2          ( TxLaneControl_0_0_Output_K_2 ),
        .Output_K_1          ( TxLaneControl_0_0_Output_K_1 ),
        .Output_K_0          ( TxLaneControl_0_0_Output_K_0 ) 
        );

//--------TxMainLinkController
TxMainLinkController TxMainLinkController_0(
        // Inputs
        .Clock        ( Clock ),
        .Reset_N      ( Reset_N ),
        .SYNCINB      ( RxMainLinkController_0_SYNCINB ),
        .Lanes_DataGo ( Lanes_DataGo_net_0 ),
        // Outputs
        .SYNC_OK      ( TxMainLinkController_0_SYNC_OK ),
        .Data_Read    ( TxMainLinkController_0_Data_Read ) 
        );


endmodule
