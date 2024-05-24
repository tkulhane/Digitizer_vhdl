//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Fri May 24 09:45:44 2024
// Version: 2022.1 2022.1.0.10
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// EXT_Signals
module EXT_Signals(
    // Inputs
    Clock,
    EXT_OutputsVectorSignals,
    Reset_N,
    addr_frame,
    enable_cmd,
    write_data_frame,
    write_read,
    // Outputs
    EXT_InputsVectorSignals,
    busy,
    read_data_frame,
    // Inouts
    EIO_PAD_0,
    EIO_PAD_1,
    EIO_PAD_2,
    EIO_PAD_3,
    EIO_PAD_4,
    EIO_PAD_5,
    EIO_PAD_6,
    EIO_PAD_7,
    EIO_PAD_8,
    EIO_PAD_9
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input         Clock;
input  [31:0] EXT_OutputsVectorSignals;
input         Reset_N;
input  [7:0]  addr_frame;
input         enable_cmd;
input  [15:0] write_data_frame;
input         write_read;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output [31:0] EXT_InputsVectorSignals;
output        busy;
output [15:0] read_data_frame;
//--------------------------------------------------------------------
// Inout
//--------------------------------------------------------------------
inout         EIO_PAD_0;
inout         EIO_PAD_1;
inout         EIO_PAD_2;
inout         EIO_PAD_3;
inout         EIO_PAD_4;
inout         EIO_PAD_5;
inout         EIO_PAD_6;
inout         EIO_PAD_7;
inout         EIO_PAD_8;
inout         EIO_PAD_9;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire   [7:0]   addr_frame;
wire           busy_net_0;
wire           Clock;
wire           EIO_PAD_0;
wire           EIO_PAD_1;
wire           EIO_PAD_2;
wire           EIO_PAD_3;
wire           EIO_PAD_4;
wire           EIO_PAD_5;
wire           EIO_PAD_6;
wire           EIO_PAD_7;
wire           EIO_PAD_8;
wire           EIO_PAD_9;
wire           enable_cmd;
wire   [31:0]  EXT_InputsVectorSignals_net_0;
wire   [31:0]  EXT_OutputsVectorSignals;
wire   [9:0]   EXT_Signals_Controller_0_EXT_OutputEnable;
wire   [255:0] EXT_Signals_Controller_0_EXT_SelectInput;
wire   [79:0]  EXT_Signals_Controller_0_EXT_SelectOutput;
wire   [0:0]   EXT_Signals_OutputSwitch_0_IO_Block_D0to0;
wire   [1:1]   EXT_Signals_OutputSwitch_0_IO_Block_D1to1;
wire   [2:2]   EXT_Signals_OutputSwitch_0_IO_Block_D2to2;
wire   [3:3]   EXT_Signals_OutputSwitch_0_IO_Block_D3to3;
wire   [4:4]   EXT_Signals_OutputSwitch_0_IO_Block_D4to4;
wire   [5:5]   EXT_Signals_OutputSwitch_0_IO_Block_D5to5;
wire   [6:6]   EXT_Signals_OutputSwitch_0_IO_Block_D6to6;
wire   [7:7]   EXT_Signals_OutputSwitch_0_IO_Block_D7to7;
wire   [8:8]   EXT_Signals_OutputSwitch_0_IO_Block_D8to8;
wire   [9:9]   EXT_Signals_OutputSwitch_0_IO_Block_D9to9;
wire   [0:0]   EXT_Signals_OutputSwitch_0_IO_Block_E0to0;
wire   [1:1]   EXT_Signals_OutputSwitch_0_IO_Block_E1to1;
wire   [2:2]   EXT_Signals_OutputSwitch_0_IO_Block_E2to2;
wire   [3:3]   EXT_Signals_OutputSwitch_0_IO_Block_E3to3;
wire   [4:4]   EXT_Signals_OutputSwitch_0_IO_Block_E4to4;
wire   [5:5]   EXT_Signals_OutputSwitch_0_IO_Block_E5to5;
wire   [6:6]   EXT_Signals_OutputSwitch_0_IO_Block_E6to6;
wire   [7:7]   EXT_Signals_OutputSwitch_0_IO_Block_E7to7;
wire   [8:8]   EXT_Signals_OutputSwitch_0_IO_Block_E8to8;
wire   [9:9]   EXT_Signals_OutputSwitch_0_IO_Block_E9to9;
wire           PF_IO_C0_0_0_Y;
wire           PF_IO_C0_0_1_Y;
wire           PF_IO_C0_0_2_Y;
wire           PF_IO_C0_0_3_Y;
wire           PF_IO_C0_0_4_Y;
wire           PF_IO_C0_0_5_Y;
wire           PF_IO_C0_0_6_Y;
wire           PF_IO_C0_0_7_Y;
wire           PF_IO_C0_0_8_Y;
wire           PF_IO_C0_0_Y;
wire   [15:0]  read_data_frame_net_0;
wire           Reset_N;
wire   [15:0]  write_data_frame;
wire           write_read;
wire           busy_net_1;
wire   [15:0]  read_data_frame_net_1;
wire   [31:0]  EXT_InputsVectorSignals_net_1;
wire   [9:0]   IO_Block_Y_net_0;
wire   [9:0]   IO_Block_D_net_0;
wire   [9:0]   IO_Block_E_net_0;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign busy_net_1                    = busy_net_0;
assign busy                          = busy_net_1;
assign read_data_frame_net_1         = read_data_frame_net_0;
assign read_data_frame[15:0]         = read_data_frame_net_1;
assign EXT_InputsVectorSignals_net_1 = EXT_InputsVectorSignals_net_0;
assign EXT_InputsVectorSignals[31:0] = EXT_InputsVectorSignals_net_1;
//--------------------------------------------------------------------
// Slices assignments
//--------------------------------------------------------------------
assign EXT_Signals_OutputSwitch_0_IO_Block_D0to0[0] = IO_Block_D_net_0[0:0];
assign EXT_Signals_OutputSwitch_0_IO_Block_D1to1[1] = IO_Block_D_net_0[1:1];
assign EXT_Signals_OutputSwitch_0_IO_Block_D2to2[2] = IO_Block_D_net_0[2:2];
assign EXT_Signals_OutputSwitch_0_IO_Block_D3to3[3] = IO_Block_D_net_0[3:3];
assign EXT_Signals_OutputSwitch_0_IO_Block_D4to4[4] = IO_Block_D_net_0[4:4];
assign EXT_Signals_OutputSwitch_0_IO_Block_D5to5[5] = IO_Block_D_net_0[5:5];
assign EXT_Signals_OutputSwitch_0_IO_Block_D6to6[6] = IO_Block_D_net_0[6:6];
assign EXT_Signals_OutputSwitch_0_IO_Block_D7to7[7] = IO_Block_D_net_0[7:7];
assign EXT_Signals_OutputSwitch_0_IO_Block_D8to8[8] = IO_Block_D_net_0[8:8];
assign EXT_Signals_OutputSwitch_0_IO_Block_D9to9[9] = IO_Block_D_net_0[9:9];
assign EXT_Signals_OutputSwitch_0_IO_Block_E0to0[0] = IO_Block_E_net_0[0:0];
assign EXT_Signals_OutputSwitch_0_IO_Block_E1to1[1] = IO_Block_E_net_0[1:1];
assign EXT_Signals_OutputSwitch_0_IO_Block_E2to2[2] = IO_Block_E_net_0[2:2];
assign EXT_Signals_OutputSwitch_0_IO_Block_E3to3[3] = IO_Block_E_net_0[3:3];
assign EXT_Signals_OutputSwitch_0_IO_Block_E4to4[4] = IO_Block_E_net_0[4:4];
assign EXT_Signals_OutputSwitch_0_IO_Block_E5to5[5] = IO_Block_E_net_0[5:5];
assign EXT_Signals_OutputSwitch_0_IO_Block_E6to6[6] = IO_Block_E_net_0[6:6];
assign EXT_Signals_OutputSwitch_0_IO_Block_E7to7[7] = IO_Block_E_net_0[7:7];
assign EXT_Signals_OutputSwitch_0_IO_Block_E8to8[8] = IO_Block_E_net_0[8:8];
assign EXT_Signals_OutputSwitch_0_IO_Block_E9to9[9] = IO_Block_E_net_0[9:9];
//--------------------------------------------------------------------
// Concatenation assignments
//--------------------------------------------------------------------
assign IO_Block_Y_net_0 = { PF_IO_C0_0_Y , PF_IO_C0_0_0_Y , PF_IO_C0_0_1_Y , PF_IO_C0_0_2_Y , PF_IO_C0_0_3_Y , PF_IO_C0_0_4_Y , PF_IO_C0_0_5_Y , PF_IO_C0_0_6_Y , PF_IO_C0_0_7_Y , PF_IO_C0_0_8_Y };
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------EXT_Signals_Controller
EXT_Signals_Controller EXT_Signals_Controller_0(
        // Inputs
        .Clock            ( Clock ),
        .Reset_N          ( Reset_N ),
        .enable_cmd       ( enable_cmd ),
        .write_read       ( write_read ),
        .addr_frame       ( addr_frame ),
        .write_data_frame ( write_data_frame ),
        // Outputs
        .busy             ( busy_net_0 ),
        .read_data_frame  ( read_data_frame_net_0 ),
        .EXT_OutputEnable ( EXT_Signals_Controller_0_EXT_OutputEnable ),
        .EXT_SelectOutput ( EXT_Signals_Controller_0_EXT_SelectOutput ),
        .EXT_SelectInput  ( EXT_Signals_Controller_0_EXT_SelectInput ) 
        );

//--------EXT_Signals_InputSwitch
EXT_Signals_InputSwitch EXT_Signals_InputSwitch_0(
        // Inputs
        .EXT_Select        ( EXT_Signals_Controller_0_EXT_SelectInput ),
        .IO_Block_Y        ( IO_Block_Y_net_0 ),
        // Outputs
        .EXT_VectorSignals ( EXT_InputsVectorSignals_net_0 ) 
        );

//--------EXT_Signals_OutputSwitch
EXT_Signals_OutputSwitch EXT_Signals_OutputSwitch_0(
        // Inputs
        .EXT_Select        ( EXT_Signals_Controller_0_EXT_SelectOutput ),
        .EXT_OutputEnable  ( EXT_Signals_Controller_0_EXT_OutputEnable ),
        .EXT_VectorSignals ( EXT_OutputsVectorSignals ),
        // Outputs
        .IO_Block_D        ( IO_Block_D_net_0 ),
        .IO_Block_E        ( IO_Block_E_net_0 ) 
        );

//--------PF_IO_C0
PF_IO_C0 PF_IO_C0_0(
        // Inputs
        .D   ( EXT_Signals_OutputSwitch_0_IO_Block_D9to9 ),
        .E   ( EXT_Signals_OutputSwitch_0_IO_Block_E9to9 ),
        // Outputs
        .Y   ( PF_IO_C0_0_Y ),
        // Inouts
        .PAD ( EIO_PAD_9 ) 
        );

//--------PF_IO_C0
PF_IO_C0 PF_IO_C0_0_0(
        // Inputs
        .D   ( EXT_Signals_OutputSwitch_0_IO_Block_D8to8 ),
        .E   ( EXT_Signals_OutputSwitch_0_IO_Block_E8to8 ),
        // Outputs
        .Y   ( PF_IO_C0_0_0_Y ),
        // Inouts
        .PAD ( EIO_PAD_8 ) 
        );

//--------PF_IO_C0
PF_IO_C0 PF_IO_C0_0_1(
        // Inputs
        .D   ( EXT_Signals_OutputSwitch_0_IO_Block_D7to7 ),
        .E   ( EXT_Signals_OutputSwitch_0_IO_Block_E7to7 ),
        // Outputs
        .Y   ( PF_IO_C0_0_1_Y ),
        // Inouts
        .PAD ( EIO_PAD_7 ) 
        );

//--------PF_IO_C0
PF_IO_C0 PF_IO_C0_0_2(
        // Inputs
        .D   ( EXT_Signals_OutputSwitch_0_IO_Block_D6to6 ),
        .E   ( EXT_Signals_OutputSwitch_0_IO_Block_E6to6 ),
        // Outputs
        .Y   ( PF_IO_C0_0_2_Y ),
        // Inouts
        .PAD ( EIO_PAD_6 ) 
        );

//--------PF_IO_C0
PF_IO_C0 PF_IO_C0_0_3(
        // Inputs
        .D   ( EXT_Signals_OutputSwitch_0_IO_Block_D5to5 ),
        .E   ( EXT_Signals_OutputSwitch_0_IO_Block_E5to5 ),
        // Outputs
        .Y   ( PF_IO_C0_0_3_Y ),
        // Inouts
        .PAD ( EIO_PAD_5 ) 
        );

//--------PF_IO_C0
PF_IO_C0 PF_IO_C0_0_4(
        // Inputs
        .D   ( EXT_Signals_OutputSwitch_0_IO_Block_D4to4 ),
        .E   ( EXT_Signals_OutputSwitch_0_IO_Block_E4to4 ),
        // Outputs
        .Y   ( PF_IO_C0_0_4_Y ),
        // Inouts
        .PAD ( EIO_PAD_4 ) 
        );

//--------PF_IO_C0
PF_IO_C0 PF_IO_C0_0_5(
        // Inputs
        .D   ( EXT_Signals_OutputSwitch_0_IO_Block_D3to3 ),
        .E   ( EXT_Signals_OutputSwitch_0_IO_Block_E3to3 ),
        // Outputs
        .Y   ( PF_IO_C0_0_5_Y ),
        // Inouts
        .PAD ( EIO_PAD_3 ) 
        );

//--------PF_IO_C0
PF_IO_C0 PF_IO_C0_0_6(
        // Inputs
        .D   ( EXT_Signals_OutputSwitch_0_IO_Block_D2to2 ),
        .E   ( EXT_Signals_OutputSwitch_0_IO_Block_E2to2 ),
        // Outputs
        .Y   ( PF_IO_C0_0_6_Y ),
        // Inouts
        .PAD ( EIO_PAD_2 ) 
        );

//--------PF_IO_C0
PF_IO_C0 PF_IO_C0_0_7(
        // Inputs
        .D   ( EXT_Signals_OutputSwitch_0_IO_Block_D1to1 ),
        .E   ( EXT_Signals_OutputSwitch_0_IO_Block_E1to1 ),
        // Outputs
        .Y   ( PF_IO_C0_0_7_Y ),
        // Inouts
        .PAD ( EIO_PAD_1 ) 
        );

//--------PF_IO_C0
PF_IO_C0 PF_IO_C0_0_8(
        // Inputs
        .D   ( EXT_Signals_OutputSwitch_0_IO_Block_D0to0 ),
        .E   ( EXT_Signals_OutputSwitch_0_IO_Block_E0to0 ),
        // Outputs
        .Y   ( PF_IO_C0_0_8_Y ),
        // Inouts
        .PAD ( EIO_PAD_0 ) 
        );


endmodule
