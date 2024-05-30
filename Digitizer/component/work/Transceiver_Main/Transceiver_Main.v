//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Tue May 28 12:19:04 2024
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
    LANE0_RXD_N,
    LANE0_RXD_P,
    LANE1_RXD_N,
    LANE1_RXD_P,
    Logic_Clock,
    Logic_Reset_N,
    REF_Clock,
    REF_Reset_N,
    addr_frame,
    enable_cmd,
    write_data_frame,
    write_read,
    // Outputs
    Data_Valid,
    LANE0_TXD_N,
    LANE0_TXD_P,
    LANE1_TXD_N,
    LANE1_TXD_P,
    Output_Data_0,
    Output_Data_1,
    Output_Data_2,
    Output_Data_3,
    Output_Data_4,
    Output_Data_5,
    Output_Data_6,
    Output_Data_7,
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
input          LANE0_RXD_N;
input          LANE0_RXD_P;
input          LANE1_RXD_N;
input          LANE1_RXD_P;
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
output         Data_Valid;
output         LANE0_TXD_N;
output         LANE0_TXD_P;
output         LANE1_TXD_N;
output         LANE1_TXD_P;
output [11:0]  Output_Data_0;
output [23:12] Output_Data_1;
output [35:24] Output_Data_2;
output [47:36] Output_Data_3;
output [59:48] Output_Data_4;
output [71:60] Output_Data_5;
output [83:72] Output_Data_6;
output [95:84] Output_Data_7;
output         SYNCINB_OUT;
output [127:0] Transceivers_Rx_Data;
output [15:0]  Transceivers_Rx_K;
output         busy;
output [15:0]  read_data_frame;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire   [7:0]     addr_frame;
wire             AND2_0_0_Y;
wire             AND2_0_Y;
wire             busy_net_0;
wire             CTRL_Clock;
wire             CTRL_Clock_40M;
wire             CTRL_Reset_N;
wire   [7:0]     CtrlBus_HandShake_0_PRH_addr_frame;
wire             CtrlBus_HandShake_0_PRH_enable_cmd;
wire   [15:0]    CtrlBus_HandShake_0_PRH_write_data_frame;
wire             CtrlBus_HandShake_0_PRH_write_read;
wire             Data_Valid_net_0;
wire             enable_cmd;
wire             Gen_Enable;
wire             LANE0_RXD_N;
wire             LANE0_RXD_P;
wire             LANE0_TXD_N_net_0;
wire             LANE0_TXD_P_net_0;
wire             LANE1_RXD_N;
wire             LANE1_RXD_P;
wire             LANE1_TXD_N_net_0;
wire             LANE1_TXD_P_net_0;
wire             Logic_Clock;
wire             Logic_Reset_N;
wire   [11:0]    Output_Data_0_net_0;
wire   [11:0]    Output_Data_1_net_0;
wire   [11:0]    Output_Data_2_net_0;
wire   [11:0]    Output_Data_3_net_0;
wire   [11:0]    Output_Data_4_net_0;
wire   [11:0]    Output_Data_5_net_0;
wire   [11:0]    Output_Data_6_net_0;
wire   [11:0]    Output_Data_7_net_0;
wire   [15:0]    read_data_frame_net_0;
wire             REF_Clock;
wire             REF_Reset_N;
wire   [15:0]    SampleTxDeCompose_0_0_Output_Data;
wire   [15:0]    SampleTxDeCompose_0_1_Output_Data;
wire   [15:0]    SampleTxDeCompose_0_2_Output_Data;
wire   [15:0]    SampleTxDeCompose_0_3_Output_Data;
wire   [15:0]    SampleTxDeCompose_0_4_Output_Data;
wire   [15:0]    SampleTxDeCompose_0_5_Output_Data;
wire   [15:0]    SampleTxDeCompose_0_Output_Data;
wire   [15:0]    SampleTxDeCompose_1_Output_Data;
wire             Synchronizer_0_2_Data_Out;
wire             Synchronizer_0_3_Data_Out;
wire             SYNCINB_OUT_net_0;
wire   [11:0]    Test_Generator_for_Lanes_0_Test_Data_0;
wire   [11:0]    Test_Generator_for_Lanes_0_Test_Data_1;
wire   [11:0]    Test_Generator_for_Lanes_0_Test_Data_2;
wire   [11:0]    Test_Generator_for_Lanes_0_Test_Data_3;
wire   [11:0]    Test_Generator_for_Lanes_0_Test_Data_4;
wire   [11:0]    Test_Generator_for_Lanes_0_Test_Data_5;
wire   [11:0]    Test_Generator_for_Lanes_0_Test_Data_6;
wire   [11:0]    Test_Generator_for_Lanes_0_Test_Data_7;
wire             Transceiver_Controller_0_busy;
wire             Transceiver_Controller_0_Lanes_Restart;
wire   [15:0]    Transceiver_Controller_0_read_data_frame;
wire             Transceiver_LanesConnection_0_Input_Data_Read;
wire   [15:0]    Transceiver_LanesConnection_0_Output_Data15to0;
wire   [31:16]   Transceiver_LanesConnection_0_Output_Data31to16;
wire   [47:32]   Transceiver_LanesConnection_0_Output_Data47to32;
wire   [63:48]   Transceiver_LanesConnection_0_Output_Data63to48;
wire   [79:64]   Transceiver_LanesConnection_0_Output_Data79to64;
wire   [95:80]   Transceiver_LanesConnection_0_Output_Data95to80;
wire   [111:96]  Transceiver_LanesConnection_0_Output_Data111to96;
wire   [127:112] Transceiver_LanesConnection_0_Output_Data127to112;
wire   [63:0]    Transceiver_LanesConnection_0_TRNV_CTRL_StatusLanes_Vector;
wire   [127:0]   Transceivers_Rx_Data_net_0;
wire   [15:0]    Transceivers_Rx_K_net_0;
wire   [15:0]    write_data_frame;
wire             write_read;
wire             LANE1_TXD_N_net_1;
wire             LANE0_TXD_P_net_1;
wire             LANE0_TXD_N_net_1;
wire             LANE1_TXD_P_net_1;
wire             Data_Valid_net_1;
wire             busy_net_1;
wire             SYNCINB_OUT_net_1;
wire   [95:84]   Output_Data_7_net_1;
wire   [11:0]    Output_Data_0_net_1;
wire   [23:12]   Output_Data_1_net_1;
wire   [35:24]   Output_Data_2_net_1;
wire   [47:36]   Output_Data_3_net_1;
wire   [59:48]   Output_Data_4_net_1;
wire   [71:60]   Output_Data_5_net_1;
wire   [83:72]   Output_Data_6_net_1;
wire   [15:0]    read_data_frame_net_1;
wire   [127:0]   Transceivers_Rx_Data_net_1;
wire   [15:0]    Transceivers_Rx_K_net_1;
wire   [127:0]   Input_Data_net_0;
wire   [127:0]   Output_Data_net_0;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire   [3:0]     Input_TailBits_const_net_0;
wire   [3:0]     Input_TailBits_const_net_1;
wire   [3:0]     Input_TailBits_const_net_2;
wire   [3:0]     Input_TailBits_const_net_3;
wire   [3:0]     Input_TailBits_const_net_4;
wire   [3:0]     Input_TailBits_const_net_5;
wire   [3:0]     Input_TailBits_const_net_6;
wire   [3:0]     Input_TailBits_const_net_7;
wire             VCC_net;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign Input_TailBits_const_net_0 = 4'h0;
assign Input_TailBits_const_net_1 = 4'h0;
assign Input_TailBits_const_net_2 = 4'h0;
assign Input_TailBits_const_net_3 = 4'h0;
assign Input_TailBits_const_net_4 = 4'h0;
assign Input_TailBits_const_net_5 = 4'h0;
assign Input_TailBits_const_net_6 = 4'h0;
assign Input_TailBits_const_net_7 = 4'h0;
assign VCC_net                    = 1'b1;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign LANE1_TXD_N_net_1           = LANE1_TXD_N_net_0;
assign LANE1_TXD_N                 = LANE1_TXD_N_net_1;
assign LANE0_TXD_P_net_1           = LANE0_TXD_P_net_0;
assign LANE0_TXD_P                 = LANE0_TXD_P_net_1;
assign LANE0_TXD_N_net_1           = LANE0_TXD_N_net_0;
assign LANE0_TXD_N                 = LANE0_TXD_N_net_1;
assign LANE1_TXD_P_net_1           = LANE1_TXD_P_net_0;
assign LANE1_TXD_P                 = LANE1_TXD_P_net_1;
assign Data_Valid_net_1            = Data_Valid_net_0;
assign Data_Valid                  = Data_Valid_net_1;
assign busy_net_1                  = busy_net_0;
assign busy                        = busy_net_1;
assign SYNCINB_OUT_net_1           = SYNCINB_OUT_net_0;
assign SYNCINB_OUT                 = SYNCINB_OUT_net_1;
assign Output_Data_7_net_1         = Output_Data_7_net_0;
assign Output_Data_7[95:84]        = Output_Data_7_net_1;
assign Output_Data_0_net_1         = Output_Data_0_net_0;
assign Output_Data_0[11:0]         = Output_Data_0_net_1;
assign Output_Data_1_net_1         = Output_Data_1_net_0;
assign Output_Data_1[23:12]        = Output_Data_1_net_1;
assign Output_Data_2_net_1         = Output_Data_2_net_0;
assign Output_Data_2[35:24]        = Output_Data_2_net_1;
assign Output_Data_3_net_1         = Output_Data_3_net_0;
assign Output_Data_3[47:36]        = Output_Data_3_net_1;
assign Output_Data_4_net_1         = Output_Data_4_net_0;
assign Output_Data_4[59:48]        = Output_Data_4_net_1;
assign Output_Data_5_net_1         = Output_Data_5_net_0;
assign Output_Data_5[71:60]        = Output_Data_5_net_1;
assign Output_Data_6_net_1         = Output_Data_6_net_0;
assign Output_Data_6[83:72]        = Output_Data_6_net_1;
assign read_data_frame_net_1       = read_data_frame_net_0;
assign read_data_frame[15:0]       = read_data_frame_net_1;
assign Transceivers_Rx_Data_net_1  = Transceivers_Rx_Data_net_0;
assign Transceivers_Rx_Data[127:0] = Transceivers_Rx_Data_net_1;
assign Transceivers_Rx_K_net_1     = Transceivers_Rx_K_net_0;
assign Transceivers_Rx_K[15:0]     = Transceivers_Rx_K_net_1;
//--------------------------------------------------------------------
// Slices assignments
//--------------------------------------------------------------------
assign Transceiver_LanesConnection_0_Output_Data15to0    = Output_Data_net_0[15:0];
assign Transceiver_LanesConnection_0_Output_Data31to16   = Output_Data_net_0[31:16];
assign Transceiver_LanesConnection_0_Output_Data47to32   = Output_Data_net_0[47:32];
assign Transceiver_LanesConnection_0_Output_Data63to48   = Output_Data_net_0[63:48];
assign Transceiver_LanesConnection_0_Output_Data79to64   = Output_Data_net_0[79:64];
assign Transceiver_LanesConnection_0_Output_Data95to80   = Output_Data_net_0[95:80];
assign Transceiver_LanesConnection_0_Output_Data111to96  = Output_Data_net_0[111:96];
assign Transceiver_LanesConnection_0_Output_Data127to112 = Output_Data_net_0[127:112];
//--------------------------------------------------------------------
// Concatenation assignments
//--------------------------------------------------------------------
assign Input_Data_net_0 = { SampleTxDeCompose_0_5_Output_Data , SampleTxDeCompose_0_4_Output_Data , SampleTxDeCompose_0_3_Output_Data , SampleTxDeCompose_0_2_Output_Data , SampleTxDeCompose_0_1_Output_Data , SampleTxDeCompose_0_0_Output_Data , SampleTxDeCompose_1_Output_Data , SampleTxDeCompose_0_Output_Data };
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

//--------SampleCompose
SampleCompose SampleCompose_0(
        // Inputs
        .Clock           ( Logic_Clock ),
        .Reset_N         ( Synchronizer_0_3_Data_Out ),
        .Input_Data      ( Transceiver_LanesConnection_0_Output_Data15to0 ),
        // Outputs
        .Output_Data     ( Output_Data_0_net_0 ),
        .Output_TailBits (  ) 
        );

//--------SampleCompose
SampleCompose SampleCompose_0_0(
        // Inputs
        .Clock           ( Logic_Clock ),
        .Reset_N         ( Synchronizer_0_3_Data_Out ),
        .Input_Data      ( Transceiver_LanesConnection_0_Output_Data31to16 ),
        // Outputs
        .Output_Data     ( Output_Data_1_net_0 ),
        .Output_TailBits (  ) 
        );

//--------SampleCompose
SampleCompose SampleCompose_0_1(
        // Inputs
        .Clock           ( Logic_Clock ),
        .Reset_N         ( Synchronizer_0_3_Data_Out ),
        .Input_Data      ( Transceiver_LanesConnection_0_Output_Data47to32 ),
        // Outputs
        .Output_Data     ( Output_Data_2_net_0 ),
        .Output_TailBits (  ) 
        );

//--------SampleCompose
SampleCompose SampleCompose_0_2(
        // Inputs
        .Clock           ( Logic_Clock ),
        .Reset_N         ( Synchronizer_0_3_Data_Out ),
        .Input_Data      ( Transceiver_LanesConnection_0_Output_Data63to48 ),
        // Outputs
        .Output_Data     ( Output_Data_3_net_0 ),
        .Output_TailBits (  ) 
        );

//--------SampleCompose
SampleCompose SampleCompose_0_3(
        // Inputs
        .Clock           ( Logic_Clock ),
        .Reset_N         ( Synchronizer_0_3_Data_Out ),
        .Input_Data      ( Transceiver_LanesConnection_0_Output_Data79to64 ),
        // Outputs
        .Output_Data     ( Output_Data_4_net_0 ),
        .Output_TailBits (  ) 
        );

//--------SampleCompose
SampleCompose SampleCompose_0_4(
        // Inputs
        .Clock           ( Logic_Clock ),
        .Reset_N         ( Synchronizer_0_3_Data_Out ),
        .Input_Data      ( Transceiver_LanesConnection_0_Output_Data95to80 ),
        // Outputs
        .Output_Data     ( Output_Data_5_net_0 ),
        .Output_TailBits (  ) 
        );

//--------SampleCompose
SampleCompose SampleCompose_0_5(
        // Inputs
        .Clock           ( Logic_Clock ),
        .Reset_N         ( Synchronizer_0_3_Data_Out ),
        .Input_Data      ( Transceiver_LanesConnection_0_Output_Data111to96 ),
        // Outputs
        .Output_Data     ( Output_Data_6_net_0 ),
        .Output_TailBits (  ) 
        );

//--------SampleCompose
SampleCompose SampleCompose_0_6(
        // Inputs
        .Clock           ( Logic_Clock ),
        .Reset_N         ( Synchronizer_0_3_Data_Out ),
        .Input_Data      ( Transceiver_LanesConnection_0_Output_Data127to112 ),
        // Outputs
        .Output_Data     ( Output_Data_7_net_0 ),
        .Output_TailBits (  ) 
        );

//--------SampleTxDeCompose
SampleTxDeCompose SampleTxDeCompose_0(
        // Inputs
        .Input_Data_0   ( Test_Generator_for_Lanes_0_Test_Data_0 ),
        .Input_TailBits ( Input_TailBits_const_net_0 ),
        // Outputs
        .Output_Data    ( SampleTxDeCompose_0_Output_Data ) 
        );

//--------SampleTxDeCompose
SampleTxDeCompose SampleTxDeCompose_0_0(
        // Inputs
        .Input_Data_0   ( Test_Generator_for_Lanes_0_Test_Data_2 ),
        .Input_TailBits ( Input_TailBits_const_net_1 ),
        // Outputs
        .Output_Data    ( SampleTxDeCompose_0_0_Output_Data ) 
        );

//--------SampleTxDeCompose
SampleTxDeCompose SampleTxDeCompose_0_1(
        // Inputs
        .Input_Data_0   ( Test_Generator_for_Lanes_0_Test_Data_3 ),
        .Input_TailBits ( Input_TailBits_const_net_2 ),
        // Outputs
        .Output_Data    ( SampleTxDeCompose_0_1_Output_Data ) 
        );

//--------SampleTxDeCompose
SampleTxDeCompose SampleTxDeCompose_0_2(
        // Inputs
        .Input_Data_0   ( Test_Generator_for_Lanes_0_Test_Data_4 ),
        .Input_TailBits ( Input_TailBits_const_net_3 ),
        // Outputs
        .Output_Data    ( SampleTxDeCompose_0_2_Output_Data ) 
        );

//--------SampleTxDeCompose
SampleTxDeCompose SampleTxDeCompose_0_3(
        // Inputs
        .Input_Data_0   ( Test_Generator_for_Lanes_0_Test_Data_5 ),
        .Input_TailBits ( Input_TailBits_const_net_4 ),
        // Outputs
        .Output_Data    ( SampleTxDeCompose_0_3_Output_Data ) 
        );

//--------SampleTxDeCompose
SampleTxDeCompose SampleTxDeCompose_0_4(
        // Inputs
        .Input_Data_0   ( Test_Generator_for_Lanes_0_Test_Data_6 ),
        .Input_TailBits ( Input_TailBits_const_net_5 ),
        // Outputs
        .Output_Data    ( SampleTxDeCompose_0_4_Output_Data ) 
        );

//--------SampleTxDeCompose
SampleTxDeCompose SampleTxDeCompose_0_5(
        // Inputs
        .Input_Data_0   ( Test_Generator_for_Lanes_0_Test_Data_7 ),
        .Input_TailBits ( Input_TailBits_const_net_6 ),
        // Outputs
        .Output_Data    ( SampleTxDeCompose_0_5_Output_Data ) 
        );

//--------SampleTxDeCompose
SampleTxDeCompose SampleTxDeCompose_1(
        // Inputs
        .Input_Data_0   ( Test_Generator_for_Lanes_0_Test_Data_1 ),
        .Input_TailBits ( Input_TailBits_const_net_7 ),
        // Outputs
        .Output_Data    ( SampleTxDeCompose_1_Output_Data ) 
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
        .Clock       ( Logic_Clock ),
        .Reset_N     ( Synchronizer_0_3_Data_Out ),
        .Test_Enable ( AND2_0_0_Y ),
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

//--------Transceiver_Controller
Transceiver_Controller #( 
        .g_NumberOfLanes ( 2 ) )
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
        .Logic_Clock                  ( Logic_Clock ),
        .Logic_Reset_N                ( Synchronizer_0_3_Data_Out ),
        .CTRL_Clock                   ( CTRL_Clock_40M ),
        .CTRL_Reset_N                 ( Synchronizer_0_2_Data_Out ),
        .REF_Clock                    ( REF_Clock ),
        .LANE_CLK_REF                 ( Logic_Clock ),
        .LANE0_RXD_P                  ( LANE0_RXD_P ),
        .LANE0_RXD_N                  ( LANE0_RXD_N ),
        .LANE1_RXD_P                  ( LANE1_RXD_P ),
        .LANE1_RXD_N                  ( LANE1_RXD_N ),
        .TRNV_CTRL_RESTART            ( Transceiver_Controller_0_Lanes_Restart ),
        .Input_Data                   ( Input_Data_net_0 ),
        // Outputs
        .LANE0_TXD_P                  ( LANE0_TXD_P_net_0 ),
        .LANE0_TXD_N                  ( LANE0_TXD_N_net_0 ),
        .LANE1_TXD_P                  ( LANE1_TXD_P_net_0 ),
        .LANE1_TXD_N                  ( LANE1_TXD_N_net_0 ),
        .Input_Data_Read              ( Transceiver_LanesConnection_0_Input_Data_Read ),
        .Data_Valid                   ( Data_Valid_net_0 ),
        .SYNCINB_OUT                  ( SYNCINB_OUT_net_0 ),
        .Output_Data                  ( Output_Data_net_0 ),
        .TRNV_CTRL_StatusLanes_Vector ( Transceiver_LanesConnection_0_TRNV_CTRL_StatusLanes_Vector ),
        .Transceivers_Rx_Data         ( Transceivers_Rx_Data_net_0 ),
        .Transceivers_Rx_K            ( Transceivers_Rx_K_net_0 ) 
        );


endmodule
