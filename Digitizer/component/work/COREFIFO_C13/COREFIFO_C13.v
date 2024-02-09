//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Fri Feb  9 20:03:33 2024
// Version: 2022.1 2022.1.0.10
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

//////////////////////////////////////////////////////////////////////
// Component Description (Tcl) 
//////////////////////////////////////////////////////////////////////
/*
# Exporting Component Description of COREFIFO_C13 to TCL
# Family: PolarFire
# Part Number: MPF300TS_ES-1FCG1152E
# Create and Configure the core component COREFIFO_C13
create_and_configure_core -core_vlnv {Actel:DirectCore:COREFIFO:3.0.101} -component_name {COREFIFO_C13} -params {\
"AE_STATIC_EN:false"  \
"AEVAL:4"  \
"AF_STATIC_EN:false"  \
"AFVAL:1020"  \
"CTRL_TYPE:2"  \
"DIE_SIZE:15"  \
"ECC:0"  \
"ESTOP:true"  \
"FSTOP:true"  \
"FWFT:false"  \
"NUM_STAGES:2"  \
"OVERFLOW_EN:false"  \
"PIPE:1"  \
"PREFETCH:true"  \
"RAM_OPT:0"  \
"RDCNT_EN:false"  \
"RDEPTH:64"  \
"RE_POLARITY:0"  \
"READ_DVALID:false"  \
"RWIDTH:8"  \
"SYNC:0"  \
"SYNC_RESET:0"  \
"UNDERFLOW_EN:false"  \
"WDEPTH:64"  \
"WE_POLARITY:0"  \
"WRCNT_EN:false"  \
"WRITE_ACK:false"  \
"WWIDTH:8"   }
# Exporting Component Description of COREFIFO_C13 to TCL done
*/

// COREFIFO_C13
module COREFIFO_C13(
    // Inputs
    DATA,
    RCLOCK,
    RE,
    RRESET_N,
    WCLOCK,
    WE,
    WRESET_N,
    // Outputs
    EMPTY,
    FULL,
    Q
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input  [7:0] DATA;
input        RCLOCK;
input        RE;
input        RRESET_N;
input        WCLOCK;
input        WE;
input        WRESET_N;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output       EMPTY;
output       FULL;
output [7:0] Q;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire   [7:0] DATA;
wire         EMPTY_net_0;
wire         FULL_net_0;
wire   [7:0] Q_net_0;
wire         RCLOCK;
wire         RE;
wire         RRESET_N;
wire         WCLOCK;
wire         WE;
wire         WRESET_N;
wire         FULL_net_1;
wire         EMPTY_net_1;
wire   [7:0] Q_net_1;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire         GND_net;
wire   [7:0] MEMRD_const_net_0;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign GND_net           = 1'b0;
assign MEMRD_const_net_0 = 8'h00;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign FULL_net_1  = FULL_net_0;
assign FULL        = FULL_net_1;
assign EMPTY_net_1 = EMPTY_net_0;
assign EMPTY       = EMPTY_net_1;
assign Q_net_1     = Q_net_0;
assign Q[7:0]      = Q_net_1;
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------COREFIFO_C13_COREFIFO_C13_0_COREFIFO   -   Actel:DirectCore:COREFIFO:3.0.101
COREFIFO_C13_COREFIFO_C13_0_COREFIFO #( 
        .AE_STATIC_EN ( 0 ),
        .AEVAL        ( 4 ),
        .AF_STATIC_EN ( 0 ),
        .AFVAL        ( 1020 ),
        .CTRL_TYPE    ( 2 ),
        .DIE_SIZE     ( 15 ),
        .ECC          ( 0 ),
        .ESTOP        ( 1 ),
        .FAMILY       ( 26 ),
        .FSTOP        ( 1 ),
        .FWFT         ( 0 ),
        .NUM_STAGES   ( 2 ),
        .OVERFLOW_EN  ( 0 ),
        .PIPE         ( 1 ),
        .PREFETCH     ( 1 ),
        .RAM_OPT      ( 0 ),
        .RDCNT_EN     ( 0 ),
        .RDEPTH       ( 64 ),
        .RE_POLARITY  ( 0 ),
        .READ_DVALID  ( 0 ),
        .RWIDTH       ( 8 ),
        .SYNC         ( 0 ),
        .SYNC_RESET   ( 0 ),
        .UNDERFLOW_EN ( 0 ),
        .WDEPTH       ( 64 ),
        .WE_POLARITY  ( 0 ),
        .WRCNT_EN     ( 0 ),
        .WRITE_ACK    ( 0 ),
        .WWIDTH       ( 8 ) )
COREFIFO_C13_0(
        // Inputs
        .CLK        ( GND_net ), // tied to 1'b0 from definition
        .WCLOCK     ( WCLOCK ),
        .RCLOCK     ( RCLOCK ),
        .RESET_N    ( GND_net ), // tied to 1'b0 from definition
        .WRESET_N   ( WRESET_N ),
        .RRESET_N   ( RRESET_N ),
        .WE         ( WE ),
        .RE         ( RE ),
        .DATA       ( DATA ),
        .MEMRD      ( MEMRD_const_net_0 ), // tied to 8'h00 from definition
        // Outputs
        .FULL       ( FULL_net_0 ),
        .EMPTY      ( EMPTY_net_0 ),
        .AFULL      (  ),
        .AEMPTY     (  ),
        .OVERFLOW   (  ),
        .UNDERFLOW  (  ),
        .WACK       (  ),
        .DVLD       (  ),
        .MEMWE      (  ),
        .MEMRE      (  ),
        .SB_CORRECT (  ),
        .DB_DETECT  (  ),
        .Q          ( Q_net_0 ),
        .WRCNT      (  ),
        .RDCNT      (  ),
        .MEMWADDR   (  ),
        .MEMRADDR   (  ),
        .MEMWD      (  ) 
        );


endmodule
