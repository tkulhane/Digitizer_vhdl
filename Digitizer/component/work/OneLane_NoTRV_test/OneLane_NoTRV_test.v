//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Thu Jan  4 20:00:59 2024
// Version: 2022.1 2022.1.0.10
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// OneLane_NoTRV_test
module OneLane_NoTRV_test(
    // Inputs
    Input_MainData_0,
    Input_MainData_1,
    Input_MainData_2,
    Input_MainData_3,
    Logic_Clock,
    Logic_Reser_N,
    Read_Enable,
    SYNC_OK,
    // Outputs
    CTRL_Data_Go,
    CTRL_ILAS_Go,
    CTRL_Synced,
    Empty_For_NonAll,
    Input_MainData_Read,
    Output_Data_0,
    Output_Data_1
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input  [7:0]  Input_MainData_0;
input  [7:0]  Input_MainData_1;
input  [7:0]  Input_MainData_2;
input  [7:0]  Input_MainData_3;
input         Logic_Clock;
input         Logic_Reser_N;
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
output [11:0] Output_Data_0;
output [11:0] Output_Data_1;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire   [7:0]  Alignment_Fifo_0_Read_Data_0;
wire   [7:0]  Alignment_Fifo_0_Read_Data_1;
wire   [7:0]  Alignment_Fifo_0_Read_Data_2;
wire   [7:0]  Alignment_Fifo_0_Read_Data_3;
wire          CTRL_Data_Go_net_0;
wire          CTRL_ILAS_Go_net_0;
wire          CTRL_Synced_net_0;
wire          Empty_For_NonAll_net_0;
wire   [7:0]  Input_MainData_0;
wire   [7:0]  Input_MainData_1;
wire   [7:0]  Input_MainData_2;
wire   [7:0]  Input_MainData_3;
wire          Input_MainData_Read_net_0;
wire          Logic_Clock;
wire          Logic_Reser_N;
wire   [11:0] Output_Data_0_net_0;
wire   [11:0] Output_Data_1_net_0;
wire          Read_Enable;
wire   [7:0]  RxLaneControl_0_Output_Data_0;
wire   [7:0]  RxLaneControl_0_Output_Data_1;
wire   [7:0]  RxLaneControl_0_Output_Data_2;
wire   [7:0]  RxLaneControl_0_Output_Data_3;
wire   [3:0]  RxLaneControl_0_Output_DataWrite;
wire          SYNC_OK;
wire   [7:0]  TxLaneControl_0_Output_Data_0;
wire   [7:0]  TxLaneControl_0_Output_Data_1;
wire   [7:0]  TxLaneControl_0_Output_Data_2;
wire   [7:0]  TxLaneControl_0_Output_Data_3;
wire          TxLaneControl_0_Output_K_0;
wire          TxLaneControl_0_Output_K_1;
wire          TxLaneControl_0_Output_K_2;
wire          TxLaneControl_0_Output_K_3;
wire          Input_MainData_Read_net_1;
wire          Empty_For_NonAll_net_1;
wire          CTRL_Data_Go_net_1;
wire          CTRL_Synced_net_1;
wire          CTRL_ILAS_Go_net_1;
wire   [11:0] Output_Data_1_net_1;
wire   [11:0] Output_Data_0_net_1;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire          VCC_net;
wire   [3:0]  Read_Data_Enable_const_net_0;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign VCC_net                      = 1'b1;
assign Read_Data_Enable_const_net_0 = 4'hF;
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
assign Output_Data_1_net_1       = Output_Data_1_net_0;
assign Output_Data_1[11:0]       = Output_Data_1_net_1;
assign Output_Data_0_net_1       = Output_Data_0_net_0;
assign Output_Data_0[11:0]       = Output_Data_0_net_1;
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

//--------RxLaneControl
RxLaneControl RxLaneControl_0(
        // Inputs
        .Clock            ( Logic_Clock ),
        .Reset_N          ( Logic_Reser_N ),
        .Input_K_3        ( TxLaneControl_0_Output_K_3 ),
        .Input_K_2        ( TxLaneControl_0_Output_K_2 ),
        .Input_K_1        ( TxLaneControl_0_Output_K_1 ),
        .Input_K_0        ( TxLaneControl_0_Output_K_0 ),
        .CDR_READY        ( VCC_net ),
        .CDR_VAL          ( VCC_net ),
        .Input_Data_3     ( TxLaneControl_0_Output_Data_3 ),
        .Input_Data_2     ( TxLaneControl_0_Output_Data_2 ),
        .Input_Data_1     ( TxLaneControl_0_Output_Data_1 ),
        .Input_Data_0     ( TxLaneControl_0_Output_Data_0 ),
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

//--------SampleCompose
SampleCompose SampleCompose_0(
        // Inputs
        .Clock           ( Logic_Clock ),
        .Reset_N         ( Logic_Reser_N ),
        .Input_Data_1    ( Alignment_Fifo_0_Read_Data_1 ),
        .Input_Data_0    ( Alignment_Fifo_0_Read_Data_0 ),
        // Outputs
        .Output_Data     ( Output_Data_0_net_0 ),
        .Output_TailBits (  ) 
        );

//--------SampleCompose
SampleCompose SampleCompose_0_0(
        // Inputs
        .Clock           ( Logic_Clock ),
        .Reset_N         ( Logic_Reser_N ),
        .Input_Data_1    ( Alignment_Fifo_0_Read_Data_3 ),
        .Input_Data_0    ( Alignment_Fifo_0_Read_Data_2 ),
        // Outputs
        .Output_Data     ( Output_Data_1_net_0 ),
        .Output_TailBits (  ) 
        );

//--------TxLaneControl
TxLaneControl TxLaneControl_0(
        // Inputs
        .Clock               ( Logic_Clock ),
        .Reset_N             ( Logic_Reser_N ),
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
