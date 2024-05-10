//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Fri May  3 08:36:50 2024
// Version: 2022.1 2022.1.0.10
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

//////////////////////////////////////////////////////////////////////
// Component Description (Tcl) 
//////////////////////////////////////////////////////////////////////
/*
# Exporting Component Description of PF_IO_C0 to TCL
# Family: PolarFire
# Part Number: MPF300TS_ES-1FCG1152E
# Create and Configure the core component PF_IO_C0
create_and_configure_core -core_vlnv {Actel:SgCore:PF_IO:2.0.104} -component_name {PF_IO_C0} -params {\
"DIFFERENTIAL:false"  \
"DIRECTION:0"  \
"DYN_DELAY_LINE_EN:false"  \
"INPUT_MODE:0"  \
"LVDS_FAILSAFE_EN:false"  \
"OUTPUT_ENABLE_MODE:0"  \
"OUTPUT_MODE:0"   }
# Exporting Component Description of PF_IO_C0 to TCL done
*/

// PF_IO_C0
module PF_IO_C0(
    // Inputs
    D,
    E,
    // Outputs
    Y,
    // Inouts
    PAD
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input  D;
input  E;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output Y;
//--------------------------------------------------------------------
// Inout
//--------------------------------------------------------------------
inout  PAD;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire   D;
wire   E;
wire   PAD;
wire   Y_net_0;
wire   Y_net_1;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire   GND_net;
wire   VCC_net;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign GND_net = 1'b0;
assign VCC_net = 1'b1;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign Y_net_1 = Y_net_0;
assign Y       = Y_net_1;
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------PF_IO   -   Actel:SgCore:PF_IO:2.0.104
PF_IO #( 
        .DIFFERENTIAL       ( 0 ),
        .DIRECTION          ( 0 ),
        .DYN_DELAY_LINE_EN  ( 0 ),
        .INPUT_MODE         ( 0 ),
        .OUTPUT_ENABLE_MODE ( 0 ),
        .OUTPUT_MODE        ( 0 ) )
PF_IO_C0_0(
        // Inputs
        .DELAY_LINE_MOVE         ( GND_net ), // tied to 1'b0 from definition
        .DELAY_LINE_DIRECTION    ( GND_net ), // tied to 1'b0 from definition
        .DELAY_LINE_LOAD         ( VCC_net ), // tied to 1'b1 from definition
        .RX_CLK                  ( GND_net ), // tied to 1'b0 from definition
        .TX_CLK                  ( GND_net ), // tied to 1'b0 from definition
        .ODT_EN                  ( VCC_net ), // tied to 1'b1 from definition
        .INFF_SL                 ( GND_net ), // tied to 1'b0 from definition
        .INFF_EN                 ( GND_net ), // tied to 1'b0 from definition
        .OUTFF_SL                ( GND_net ), // tied to 1'b0 from definition
        .OUTFF_EN                ( GND_net ), // tied to 1'b0 from definition
        .AL_N                    ( GND_net ), // tied to 1'b0 from definition
        .PADI                    ( GND_net ), // tied to 1'b0 from definition
        .PADIP                   ( GND_net ), // tied to 1'b0 from definition
        .PADIN                   ( GND_net ), // tied to 1'b0 from definition
        .D                       ( D ),
        .DF                      ( GND_net ), // tied to 1'b0 from definition
        .DR                      ( GND_net ), // tied to 1'b0 from definition
        .E                       ( E ),
        // Outputs
        .DELAY_LINE_OUT_OF_RANGE (  ),
        .PADO                    (  ),
        .PADOP                   (  ),
        .PADON                   (  ),
        .QF                      (  ),
        .QR                      (  ),
        .Q                       (  ),
        .Y                       ( Y_net_0 ),
        // Inouts
        .PAD                     ( PAD ),
        .PADP                    ( GND_net ), // tied to 1'b0 from definition
        .PADN                    ( GND_net )  // tied to 1'b0 from definition
        );


endmodule
