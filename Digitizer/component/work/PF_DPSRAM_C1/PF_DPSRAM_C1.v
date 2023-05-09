//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Wed Apr 12 13:18:22 2023
// Version: 2022.1 2022.1.0.10
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

//////////////////////////////////////////////////////////////////////
// Component Description (Tcl) 
//////////////////////////////////////////////////////////////////////
/*
# Exporting Component Description of PF_DPSRAM_C1 to TCL
# Family: PolarFire
# Part Number: MPF300TS_ES-1FCG1152E
# Create and Configure the core component PF_DPSRAM_C1
create_and_configure_core -core_vlnv {Actel:SgCore:PF_DPSRAM:1.1.110} -component_name {PF_DPSRAM_C1} -params {\
"A_BLK_POLARITY:2"  \
"A_BYTE_ENABLE_WIDTH:64"  \
"A_CLK_EDGE:RISE"  \
"A_DEPTH:65536"  \
"A_DOUT_ARST_PN:A_DOUT_ARST_N"  \
"A_DOUT_ARST_POLARITY:2"  \
"A_DOUT_EN_PN:A_DOUT_EN"  \
"A_DOUT_EN_POLARITY:2"  \
"A_DOUT_SRST_PN:A_DOUT_SRST_N"  \
"A_DOUT_SRST_POLARITY:2"  \
"A_PMODE:0"  \
"A_REN_PN:A_REN"  \
"A_REN_POLARITY:2"  \
"A_WIDTH:64"  \
"A_WMODE:0"  \
"ADDRESSA_PN:A_ADDR"  \
"ADDRESSB_PN:B_ADDR"  \
"B_BLK_POLARITY:2"  \
"B_BYTE_ENABLE_WIDTH:64"  \
"B_CLK_EDGE:RISE"  \
"B_DEPTH:65536"  \
"B_DOUT_ARST_PN:B_DOUT_ARST_N"  \
"B_DOUT_ARST_POLARITY:2"  \
"B_DOUT_EN_PN:B_DOUT_EN"  \
"B_DOUT_EN_POLARITY:2"  \
"B_DOUT_SRST_PN:B_DOUT_SRST_N"  \
"B_DOUT_SRST_POLARITY:2"  \
"B_PMODE:0"  \
"B_REN_PN:B_REN"  \
"B_REN_POLARITY:2"  \
"B_WIDTH:64"  \
"B_WMODE:0"  \
"BLKA_PN:A_BLK_EN"  \
"BLKB_PN:B_BLK_EN"  \
"BUSY_FLAG:0"  \
"BYTEENABLES:1"  \
"CASCADE:0"  \
"CLK_EDGE:RISE"  \
"CLKA_PN:A_CLK"  \
"CLKB_PN:B_CLK"  \
"CLKS:1"  \
"CLOCK_PN:CLK"  \
"DATAA_IN_PN:A_DIN"  \
"DATAA_OUT_PN:A_DOUT"  \
"DATAB_IN_PN:B_DIN"  \
"DATAB_OUT_PN:B_DOUT"  \
"ECC:0"  \
"IMPORT_FILE:"  \
"INIT_RAM:F"  \
"LPMTYPE:LPM_RAM"  \
"PTYPE:2"  \
"RWA_PN:A_WEN"  \
"RWB_PN:B_WEN"  \
"SII_LOCK:0"   }
# Exporting Component Description of PF_DPSRAM_C1 to TCL done
*/

// PF_DPSRAM_C1
module PF_DPSRAM_C1(
    // Inputs
    A_ADDR,
    A_DIN,
    A_WBYTE_EN,
    A_WEN,
    B_ADDR,
    B_DIN,
    B_WBYTE_EN,
    B_WEN,
    CLK,
    // Outputs
    A_DOUT,
    B_DOUT
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input  [15:0] A_ADDR;
input  [63:0] A_DIN;
input  [63:0] A_WBYTE_EN;
input         A_WEN;
input  [15:0] B_ADDR;
input  [63:0] B_DIN;
input  [63:0] B_WBYTE_EN;
input         B_WEN;
input         CLK;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output [63:0] A_DOUT;
output [63:0] B_DOUT;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire   [15:0] A_ADDR;
wire   [63:0] A_DIN;
wire   [63:0] A_DOUT_net_0;
wire   [63:0] A_WBYTE_EN;
wire          A_WEN;
wire   [15:0] B_ADDR;
wire   [63:0] B_DIN;
wire   [63:0] B_DOUT_net_0;
wire   [63:0] B_WBYTE_EN;
wire          B_WEN;
wire          CLK;
wire   [63:0] A_DOUT_net_1;
wire   [63:0] B_DOUT_net_1;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire          GND_net;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign GND_net = 1'b0;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign A_DOUT_net_1 = A_DOUT_net_0;
assign A_DOUT[63:0] = A_DOUT_net_1;
assign B_DOUT_net_1 = B_DOUT_net_0;
assign B_DOUT[63:0] = B_DOUT_net_1;
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------PF_DPSRAM_C1_PF_DPSRAM_C1_0_PF_DPSRAM   -   Actel:SgCore:PF_DPSRAM:1.1.110
PF_DPSRAM_C1_PF_DPSRAM_C1_0_PF_DPSRAM PF_DPSRAM_C1_0(
        // Inputs
        .A_DIN      ( A_DIN ),
        .A_ADDR     ( A_ADDR ),
        .B_DIN      ( B_DIN ),
        .B_ADDR     ( B_ADDR ),
        .A_WBYTE_EN ( A_WBYTE_EN ),
        .B_WBYTE_EN ( B_WBYTE_EN ),
        .A_WEN      ( A_WEN ),
        .B_WEN      ( B_WEN ),
        .CLK        ( CLK ),
        // Outputs
        .A_DOUT     ( A_DOUT_net_0 ),
        .B_DOUT     ( B_DOUT_net_0 ) 
        );


endmodule
