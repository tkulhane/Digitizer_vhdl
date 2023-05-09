//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Wed Mar 22 20:16:09 2023
// Version: 2022.1 2022.1.0.10
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

//////////////////////////////////////////////////////////////////////
// Component Description (Tcl) 
//////////////////////////////////////////////////////////////////////
/*
# Exporting Component Description of PF_DPSRAM_C0 to TCL
# Family: PolarFire
# Part Number: MPF300TS_ES-1FCG1152E
# Create and Configure the core component PF_DPSRAM_C0
create_and_configure_core -core_vlnv {Actel:SgCore:PF_DPSRAM:1.1.110} -component_name {PF_DPSRAM_C0} -params {\
"A_BLK_POLARITY:2"  \
"A_BYTE_ENABLE_WIDTH:2"  \
"A_CLK_EDGE:RISE"  \
"A_DEPTH:256"  \
"A_DOUT_ARST_PN:A_DOUT_ARST_N"  \
"A_DOUT_ARST_POLARITY:2"  \
"A_DOUT_EN_PN:A_DOUT_EN"  \
"A_DOUT_EN_POLARITY:2"  \
"A_DOUT_SRST_PN:A_DOUT_SRST_N"  \
"A_DOUT_SRST_POLARITY:2"  \
"A_PMODE:0"  \
"A_REN_PN:A_REN"  \
"A_REN_POLARITY:2"  \
"A_WIDTH:160"  \
"A_WMODE:0"  \
"ADDRESSA_PN:A_ADDR"  \
"ADDRESSB_PN:B_ADDR"  \
"B_BLK_POLARITY:2"  \
"B_BYTE_ENABLE_WIDTH:2"  \
"B_CLK_EDGE:RISE"  \
"B_DEPTH:256"  \
"B_DOUT_ARST_PN:B_DOUT_ARST_N"  \
"B_DOUT_ARST_POLARITY:2"  \
"B_DOUT_EN_PN:B_DOUT_EN"  \
"B_DOUT_EN_POLARITY:2"  \
"B_DOUT_SRST_PN:B_DOUT_SRST_N"  \
"B_DOUT_SRST_POLARITY:2"  \
"B_PMODE:0"  \
"B_REN_PN:B_REN"  \
"B_REN_POLARITY:2"  \
"B_WIDTH:160"  \
"B_WMODE:0"  \
"BLKA_PN:A_BLK_EN"  \
"BLKB_PN:B_BLK_EN"  \
"BUSY_FLAG:1"  \
"BYTEENABLES:0"  \
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
# Exporting Component Description of PF_DPSRAM_C0 to TCL done
*/

// PF_DPSRAM_C0
module PF_DPSRAM_C0(
    // Inputs
    A_ADDR,
    A_DIN,
    A_WEN,
    B_ADDR,
    B_DIN,
    B_WEN,
    CLK,
    // Outputs
    ACCESS_BUSY,
    A_DOUT,
    B_DOUT
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input  [7:0]   A_ADDR;
input  [159:0] A_DIN;
input          A_WEN;
input  [7:0]   B_ADDR;
input  [159:0] B_DIN;
input          B_WEN;
input          CLK;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output         ACCESS_BUSY;
output [159:0] A_DOUT;
output [159:0] B_DOUT;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire   [7:0]   A_ADDR;
wire   [159:0] A_DIN;
wire   [159:0] A_DOUT_net_0;
wire           A_WEN;
wire           ACCESS_BUSY_net_0;
wire   [7:0]   B_ADDR;
wire   [159:0] B_DIN;
wire   [159:0] B_DOUT_net_0;
wire           B_WEN;
wire           CLK;
wire   [159:0] A_DOUT_net_1;
wire   [159:0] B_DOUT_net_1;
wire           ACCESS_BUSY_net_1;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire   [1:0]   A_WBYTE_EN_const_net_0;
wire   [1:0]   B_WBYTE_EN_const_net_0;
wire           GND_net;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign A_WBYTE_EN_const_net_0 = 2'h0;
assign B_WBYTE_EN_const_net_0 = 2'h0;
assign GND_net                = 1'b0;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign A_DOUT_net_1      = A_DOUT_net_0;
assign A_DOUT[159:0]     = A_DOUT_net_1;
assign B_DOUT_net_1      = B_DOUT_net_0;
assign B_DOUT[159:0]     = B_DOUT_net_1;
assign ACCESS_BUSY_net_1 = ACCESS_BUSY_net_0;
assign ACCESS_BUSY       = ACCESS_BUSY_net_1;
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------PF_DPSRAM_C0_PF_DPSRAM_C0_0_PF_DPSRAM   -   Actel:SgCore:PF_DPSRAM:1.1.110
PF_DPSRAM_C0_PF_DPSRAM_C0_0_PF_DPSRAM PF_DPSRAM_C0_0(
        // Inputs
        .A_DIN       ( A_DIN ),
        .A_ADDR      ( A_ADDR ),
        .B_DIN       ( B_DIN ),
        .B_ADDR      ( B_ADDR ),
        .A_WEN       ( A_WEN ),
        .B_WEN       ( B_WEN ),
        .CLK         ( CLK ),
        // Outputs
        .A_DOUT      ( A_DOUT_net_0 ),
        .B_DOUT      ( B_DOUT_net_0 ),
        .ACCESS_BUSY ( ACCESS_BUSY_net_0 ) 
        );


endmodule
