//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Tue May  9 12:28:17 2023
// Version: 2022.1 2022.1.0.10
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

//////////////////////////////////////////////////////////////////////
// Component Description (Tcl) 
//////////////////////////////////////////////////////////////////////
/*
# Exporting Component Description of PF_DPSRAM_C8_Event_Status to TCL
# Family: PolarFire
# Part Number: MPF300TS_ES-1FCG1152E
# Create and Configure the core component PF_DPSRAM_C8_Event_Status
create_and_configure_core -core_vlnv {Actel:SgCore:PF_DPSRAM:1.1.110} -component_name {PF_DPSRAM_C8_Event_Status} -params {\
"A_BLK_POLARITY:2"  \
"A_BYTE_ENABLE_WIDTH:0"  \
"A_CLK_EDGE:RISE"  \
"A_DEPTH:1024"  \
"A_DOUT_ARST_PN:A_DOUT_ARST_N"  \
"A_DOUT_ARST_POLARITY:2"  \
"A_DOUT_EN_PN:A_DOUT_EN"  \
"A_DOUT_EN_POLARITY:2"  \
"A_DOUT_SRST_PN:A_DOUT_SRST_N"  \
"A_DOUT_SRST_POLARITY:2"  \
"A_PMODE:0"  \
"A_REN_PN:A_REN"  \
"A_REN_POLARITY:2"  \
"A_WIDTH:8"  \
"A_WMODE:0"  \
"ADDRESSA_PN:A_ADDR"  \
"ADDRESSB_PN:B_ADDR"  \
"B_BLK_POLARITY:2"  \
"B_BYTE_ENABLE_WIDTH:0"  \
"B_CLK_EDGE:RISE"  \
"B_DEPTH:1024"  \
"B_DOUT_ARST_PN:B_DOUT_ARST_N"  \
"B_DOUT_ARST_POLARITY:2"  \
"B_DOUT_EN_PN:B_DOUT_EN"  \
"B_DOUT_EN_POLARITY:2"  \
"B_DOUT_SRST_PN:B_DOUT_SRST_N"  \
"B_DOUT_SRST_POLARITY:2"  \
"B_PMODE:0"  \
"B_REN_PN:B_REN"  \
"B_REN_POLARITY:2"  \
"B_WIDTH:8"  \
"B_WMODE:0"  \
"BLKA_PN:A_BLK_EN"  \
"BLKB_PN:B_BLK_EN"  \
"BUSY_FLAG:0"  \
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
"INIT_RAM:T"  \
"LPMTYPE:LPM_RAM"  \
"PTYPE:2"  \
"RWA_PN:A_WEN"  \
"RWB_PN:B_WEN"  \
"SII_LOCK:0"   }
# Exporting Component Description of PF_DPSRAM_C8_Event_Status to TCL done
*/

// PF_DPSRAM_C8_Event_Status
module PF_DPSRAM_C8_Event_Status(
    // Inputs
    A_ADDR,
    A_DIN,
    A_WEN,
    B_ADDR,
    B_DIN,
    B_WEN,
    CLK,
    // Outputs
    A_DOUT,
    B_DOUT
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input  [9:0] A_ADDR;
input  [7:0] A_DIN;
input        A_WEN;
input  [9:0] B_ADDR;
input  [7:0] B_DIN;
input        B_WEN;
input        CLK;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output [7:0] A_DOUT;
output [7:0] B_DOUT;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire   [9:0] A_ADDR;
wire   [7:0] A_DIN;
wire   [7:0] A_DOUT_net_0;
wire         A_WEN;
wire   [9:0] B_ADDR;
wire   [7:0] B_DIN;
wire   [7:0] B_DOUT_net_0;
wire         B_WEN;
wire         CLK;
wire   [7:0] A_DOUT_net_1;
wire   [7:0] B_DOUT_net_1;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire         GND_net;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign GND_net    = 1'b0;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign A_DOUT_net_1 = A_DOUT_net_0;
assign A_DOUT[7:0]  = A_DOUT_net_1;
assign B_DOUT_net_1 = B_DOUT_net_0;
assign B_DOUT[7:0]  = B_DOUT_net_1;
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------PF_DPSRAM_C8_Event_Status_PF_DPSRAM_C8_Event_Status_0_PF_DPSRAM   -   Actel:SgCore:PF_DPSRAM:1.1.110
PF_DPSRAM_C8_Event_Status_PF_DPSRAM_C8_Event_Status_0_PF_DPSRAM PF_DPSRAM_C8_Event_Status_0(
        // Inputs
        .A_WEN  ( A_WEN ),
        .B_WEN  ( B_WEN ),
        .CLK    ( CLK ),
        .A_DIN  ( A_DIN ),
        .A_ADDR ( A_ADDR ),
        .B_DIN  ( B_DIN ),
        .B_ADDR ( B_ADDR ),
        // Outputs
        .A_DOUT ( A_DOUT_net_0 ),
        .B_DOUT ( B_DOUT_net_0 ) 
        );


endmodule
