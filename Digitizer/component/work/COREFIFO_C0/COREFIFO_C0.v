//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Wed May 17 11:27:24 2023
// Version: 2022.1 2022.1.0.10
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

//////////////////////////////////////////////////////////////////////
// Component Description (Tcl) 
//////////////////////////////////////////////////////////////////////
/*
# Exporting Component Description of COREFIFO_C0 to TCL
# Family: PolarFire
# Part Number: MPF300TS_ES-1FCG1152E
# Create and Configure the core component COREFIFO_C0
create_and_configure_core -core_vlnv {Actel:DirectCore:COREFIFO:3.0.101} -component_name {COREFIFO_C0} -params {\
"AE_STATIC_EN:false"  \
"AEVAL:4"  \
"AF_STATIC_EN:true"  \
"AFVAL:1010"  \
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
"RDEPTH:1024"  \
"RE_POLARITY:0"  \
"READ_DVALID:false"  \
"RWIDTH:40"  \
"SYNC:0"  \
"SYNC_RESET:0"  \
"UNDERFLOW_EN:false"  \
"WDEPTH:1024"  \
"WE_POLARITY:0"  \
"WRCNT_EN:false"  \
"WRITE_ACK:true"  \
"WWIDTH:40"   }
# Exporting Component Description of COREFIFO_C0 to TCL done
*/

// COREFIFO_C0
module COREFIFO_C0(
    // Inputs
    DATA,
    RCLOCK,
    RE,
    RRESET_N,
    WCLOCK,
    WE,
    WRESET_N,
    // Outputs
    AFULL,
    EMPTY,
    FULL,
    Q,
    WACK
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input  [39:0] DATA;
input         RCLOCK;
input         RE;
input         RRESET_N;
input         WCLOCK;
input         WE;
input         WRESET_N;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output        AFULL;
output        EMPTY;
output        FULL;
output [39:0] Q;
output        WACK;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire          AFULL_net_0;
wire   [39:0] DATA;
wire          EMPTY_net_0;
wire          FULL_net_0;
wire   [39:0] Q_net_0;
wire          RCLOCK;
wire          RE;
wire          RRESET_N;
wire          WACK_net_0;
wire          WCLOCK;
wire          WE;
wire          WRESET_N;
wire          FULL_net_1;
wire          EMPTY_net_1;
wire          AFULL_net_1;
wire          WACK_net_1;
wire   [39:0] Q_net_1;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire          GND_net;
wire   [39:0] MEMRD_const_net_0;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign GND_net           = 1'b0;
assign MEMRD_const_net_0 = 40'h0000000000;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign FULL_net_1  = FULL_net_0;
assign FULL        = FULL_net_1;
assign EMPTY_net_1 = EMPTY_net_0;
assign EMPTY       = EMPTY_net_1;
assign AFULL_net_1 = AFULL_net_0;
assign AFULL       = AFULL_net_1;
assign WACK_net_1  = WACK_net_0;
assign WACK        = WACK_net_1;
assign Q_net_1     = Q_net_0;
assign Q[39:0]     = Q_net_1;
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------COREFIFO_C0_COREFIFO_C0_0_COREFIFO   -   Actel:DirectCore:COREFIFO:3.0.101
COREFIFO_C0_COREFIFO_C0_0_COREFIFO #( 
        .AE_STATIC_EN ( 0 ),
        .AEVAL        ( 4 ),
        .AF_STATIC_EN ( 1 ),
        .AFVAL        ( 1010 ),
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
        .RDEPTH       ( 1024 ),
        .RE_POLARITY  ( 0 ),
        .READ_DVALID  ( 0 ),
        .RWIDTH       ( 40 ),
        .SYNC         ( 0 ),
        .SYNC_RESET   ( 0 ),
        .UNDERFLOW_EN ( 0 ),
        .WDEPTH       ( 1024 ),
        .WE_POLARITY  ( 0 ),
        .WRCNT_EN     ( 0 ),
        .WRITE_ACK    ( 1 ),
        .WWIDTH       ( 40 ) )
COREFIFO_C0_0(
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
        .MEMRD      ( MEMRD_const_net_0 ), // tied to 40'h0000000000 from definition
        // Outputs
        .FULL       ( FULL_net_0 ),
        .EMPTY      ( EMPTY_net_0 ),
        .AFULL      ( AFULL_net_0 ),
        .AEMPTY     (  ),
        .OVERFLOW   (  ),
        .UNDERFLOW  (  ),
        .WACK       ( WACK_net_0 ),
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
