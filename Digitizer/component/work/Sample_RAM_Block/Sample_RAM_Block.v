//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Mon May 15 21:46:34 2023
// Version: 2022.1 2022.1.0.10
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// Sample_RAM_Block
module Sample_RAM_Block(
    // Inputs
    A_ADDR,
    A_Block_Address_vector,
    A_DIN,
    A_WEN,
    B_ADDR,
    B_Block_Address_vector,
    CLK,
    // Outputs
    B_Output_Data
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input  [15:0] A_ADDR;
input  [3:0]  A_Block_Address_vector;
input  [63:0] A_DIN;
input         A_WEN;
input  [15:0] B_ADDR;
input  [3:0]  B_Block_Address_vector;
input         CLK;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output [63:0] B_Output_Data;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire   [15:0]  A_ADDR;
wire   [3:0]   A_Block_Address_vector;
wire   [63:0]  A_DIN;
wire           A_WEN;
wire   [15:0]  B_ADDR;
wire   [3:0]   B_Block_Address_vector;
wire   [63:0]  B_Output_Data_net_0;
wire           CLK;
wire   [63:0]  PF_DPSRAM_C5_0_0_B_DOUT;
wire   [63:0]  PF_DPSRAM_C5_0_1_B_DOUT;
wire   [63:0]  PF_DPSRAM_C5_0_B_DOUT;
wire   [0:0]   Sample_RAM_Block_Decoder_0_Output_vector0to0;
wire   [1:1]   Sample_RAM_Block_Decoder_0_Output_vector1to1;
wire   [2:2]   Sample_RAM_Block_Decoder_0_Output_vector2to2;
wire   [63:0]  B_Output_Data_net_1;
wire   [10:10] Output_vector_slice_0;
wire   [11:11] Output_vector_slice_1;
wire   [12:12] Output_vector_slice_2;
wire   [13:13] Output_vector_slice_3;
wire   [14:14] Output_vector_slice_4;
wire   [15:15] Output_vector_slice_5;
wire   [3:3]   Output_vector_slice_6;
wire   [4:4]   Output_vector_slice_7;
wire   [5:5]   Output_vector_slice_8;
wire   [6:6]   Output_vector_slice_9;
wire   [7:7]   Output_vector_slice_10;
wire   [8:8]   Output_vector_slice_11;
wire   [9:9]   Output_vector_slice_12;
wire   [15:0]  Output_vector_net_0;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire           GND_net;
wire           VCC_net;
wire   [63:0]  B_DIN_const_net_0;
wire   [63:0]  B_DIN_const_net_1;
wire   [63:0]  B_DIN_const_net_2;
wire   [63:0]  Input_Data_3_const_net_0;
wire   [63:0]  Input_Data_4_const_net_0;
wire   [63:0]  Input_Data_5_const_net_0;
wire   [63:0]  Input_Data_6_const_net_0;
wire   [63:0]  Input_Data_7_const_net_0;
wire   [63:0]  Input_Data_8_const_net_0;
wire   [63:0]  Input_Data_9_const_net_0;
wire   [63:0]  Input_Data_10_const_net_0;
wire   [63:0]  Input_Data_11_const_net_0;
wire   [63:0]  Input_Data_12_const_net_0;
wire   [63:0]  Input_Data_13_const_net_0;
wire   [63:0]  Input_Data_14_const_net_0;
wire   [63:0]  Input_Data_15_const_net_0;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign GND_net                   = 1'b0;
assign VCC_net                   = 1'b1;
assign B_DIN_const_net_0         = 64'h0000000000000000;
assign B_DIN_const_net_1         = 64'h0000000000000000;
assign B_DIN_const_net_2         = 64'h0000000000000000;
assign Input_Data_3_const_net_0  = 64'h0000000000000000;
assign Input_Data_4_const_net_0  = 64'h0000000000000000;
assign Input_Data_5_const_net_0  = 64'h0000000000000000;
assign Input_Data_6_const_net_0  = 64'h0000000000000000;
assign Input_Data_7_const_net_0  = 64'h0000000000000000;
assign Input_Data_8_const_net_0  = 64'h0000000000000000;
assign Input_Data_9_const_net_0  = 64'h0000000000000000;
assign Input_Data_10_const_net_0 = 64'h0000000000000000;
assign Input_Data_11_const_net_0 = 64'h0000000000000000;
assign Input_Data_12_const_net_0 = 64'h0000000000000000;
assign Input_Data_13_const_net_0 = 64'h0000000000000000;
assign Input_Data_14_const_net_0 = 64'h0000000000000000;
assign Input_Data_15_const_net_0 = 64'h0000000000000000;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign B_Output_Data_net_1 = B_Output_Data_net_0;
assign B_Output_Data[63:0] = B_Output_Data_net_1;
//--------------------------------------------------------------------
// Slices assignments
//--------------------------------------------------------------------
assign Sample_RAM_Block_Decoder_0_Output_vector0to0[0] = Output_vector_net_0[0:0];
assign Sample_RAM_Block_Decoder_0_Output_vector1to1[1] = Output_vector_net_0[1:1];
assign Sample_RAM_Block_Decoder_0_Output_vector2to2[2] = Output_vector_net_0[2:2];
assign Output_vector_slice_0[10]                       = Output_vector_net_0[10:10];
assign Output_vector_slice_1[11]                       = Output_vector_net_0[11:11];
assign Output_vector_slice_2[12]                       = Output_vector_net_0[12:12];
assign Output_vector_slice_3[13]                       = Output_vector_net_0[13:13];
assign Output_vector_slice_4[14]                       = Output_vector_net_0[14:14];
assign Output_vector_slice_5[15]                       = Output_vector_net_0[15:15];
assign Output_vector_slice_6[3]                        = Output_vector_net_0[3:3];
assign Output_vector_slice_7[4]                        = Output_vector_net_0[4:4];
assign Output_vector_slice_8[5]                        = Output_vector_net_0[5:5];
assign Output_vector_slice_9[6]                        = Output_vector_net_0[6:6];
assign Output_vector_slice_10[7]                       = Output_vector_net_0[7:7];
assign Output_vector_slice_11[8]                       = Output_vector_net_0[8:8];
assign Output_vector_slice_12[9]                       = Output_vector_net_0[9:9];
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------PF_DPSRAM_C5
PF_DPSRAM_C5 PF_DPSRAM_C5_0(
        // Inputs
        .A_WEN    ( A_WEN ),
        .A_BLK_EN ( Sample_RAM_Block_Decoder_0_Output_vector0to0 ),
        .B_WEN    ( GND_net ),
        .B_BLK_EN ( VCC_net ),
        .CLK      ( CLK ),
        .A_DIN    ( A_DIN ),
        .A_ADDR   ( A_ADDR ),
        .B_DIN    ( B_DIN_const_net_0 ),
        .B_ADDR   ( B_ADDR ),
        // Outputs
        .A_DOUT   (  ),
        .B_DOUT   ( PF_DPSRAM_C5_0_B_DOUT ) 
        );

//--------PF_DPSRAM_C5
PF_DPSRAM_C5 PF_DPSRAM_C5_0_0(
        // Inputs
        .A_WEN    ( A_WEN ),
        .A_BLK_EN ( Sample_RAM_Block_Decoder_0_Output_vector1to1 ),
        .B_WEN    ( GND_net ),
        .B_BLK_EN ( VCC_net ),
        .CLK      ( CLK ),
        .A_DIN    ( A_DIN ),
        .A_ADDR   ( A_ADDR ),
        .B_DIN    ( B_DIN_const_net_1 ),
        .B_ADDR   ( B_ADDR ),
        // Outputs
        .A_DOUT   (  ),
        .B_DOUT   ( PF_DPSRAM_C5_0_0_B_DOUT ) 
        );

//--------PF_DPSRAM_C5
PF_DPSRAM_C5 PF_DPSRAM_C5_0_1(
        // Inputs
        .A_WEN    ( A_WEN ),
        .A_BLK_EN ( Sample_RAM_Block_Decoder_0_Output_vector2to2 ),
        .B_WEN    ( GND_net ),
        .B_BLK_EN ( VCC_net ),
        .CLK      ( CLK ),
        .A_DIN    ( A_DIN ),
        .A_ADDR   ( A_ADDR ),
        .B_DIN    ( B_DIN_const_net_2 ),
        .B_ADDR   ( B_ADDR ),
        // Outputs
        .A_DOUT   (  ),
        .B_DOUT   ( PF_DPSRAM_C5_0_1_B_DOUT ) 
        );

//--------Sample_RAM_Block_Decoder
Sample_RAM_Block_Decoder Sample_RAM_Block_Decoder_0(
        // Inputs
        .Input_vector  ( A_Block_Address_vector ),
        // Outputs
        .Output_vector ( Output_vector_net_0 ) 
        );

//--------Sample_RAM_Block_MUX
Sample_RAM_Block_MUX Sample_RAM_Block_MUX_0(
        // Inputs
        .Address       ( B_Block_Address_vector ),
        .Input_Data_0  ( PF_DPSRAM_C5_0_B_DOUT ),
        .Input_Data_1  ( PF_DPSRAM_C5_0_0_B_DOUT ),
        .Input_Data_2  ( PF_DPSRAM_C5_0_1_B_DOUT ),
        .Input_Data_3  ( Input_Data_3_const_net_0 ),
        .Input_Data_4  ( Input_Data_4_const_net_0 ),
        .Input_Data_5  ( Input_Data_5_const_net_0 ),
        .Input_Data_6  ( Input_Data_6_const_net_0 ),
        .Input_Data_7  ( Input_Data_7_const_net_0 ),
        .Input_Data_8  ( Input_Data_8_const_net_0 ),
        .Input_Data_9  ( Input_Data_9_const_net_0 ),
        .Input_Data_10 ( Input_Data_10_const_net_0 ),
        .Input_Data_11 ( Input_Data_11_const_net_0 ),
        .Input_Data_12 ( Input_Data_12_const_net_0 ),
        .Input_Data_13 ( Input_Data_13_const_net_0 ),
        .Input_Data_14 ( Input_Data_14_const_net_0 ),
        .Input_Data_15 ( Input_Data_15_const_net_0 ),
        // Outputs
        .Output_Data   ( B_Output_Data_net_0 ) 
        );


endmodule
