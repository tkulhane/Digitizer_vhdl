//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Fri Feb  9 20:02:47 2024
// Version: 2022.1 2022.1.0.10
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

//////////////////////////////////////////////////////////////////////
// Component Description (Tcl) 
//////////////////////////////////////////////////////////////////////
/*
# Exporting Component Description of COREFIFO_C12 to TCL
# Family: PolarFire
# Part Number: MPF300TS_ES-1FCG1152E
# Create and Configure the core component COREFIFO_C12
create_and_configure_core -core_vlnv {Actel:DirectCore:COREFIFO:3.0.101} -component_name {COREFIFO_C12} -params {\
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
"RWIDTH:64"  \
"SYNC:0"  \
"SYNC_RESET:0"  \
"UNDERFLOW_EN:false"  \
"WDEPTH:64"  \
"WE_POLARITY:0"  \
"WRCNT_EN:false"  \
"WRITE_ACK:false"  \
"WWIDTH:64"   }
# Exporting Component Description of COREFIFO_C12 to TCL done
*/

// COREFIFO_C12
module COREFIFO_C12(
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
input  [63:0] DATA;
input         RCLOCK;
input         RE;
input         RRESET_N;
input         WCLOCK;
input         WE;
input         WRESET_N;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output        EMPTY;
output        FULL;
output [63:0] Q;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire   [63:0] DATA;
wire          EMPTY_net_0;
wire          FULL_net_0;
wire   [63:0] Q_net_0;
wire          RCLOCK;
wire          RE;
wire          RRESET_N;
wire          WCLOCK;
wire          WE;
wire          WRESET_N;
wire          FULL_net_1;
wire          EMPTY_net_1;
wire   [63:0] Q_net_1;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire          GND_net;
wire   [63:0] MEMRD_const_net_0;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign GND_net           = 1'b0;
assign MEMRD_const_net_0 = 64'h0000000000000000;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign FULL_net_1  = FULL_net_0;
assign FULL        = FULL_net_1;
assign EMPTY_net_1 = EMPTY_net_0;
assign EMPTY       = EMPTY_net_1;
assign Q_net_1     = Q_net_0;
assign Q[63:0]     = Q_net_1;
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------COREFIFO_C12_COREFIFO_C12_0_COREFIFO   -   Actel:DirectCore:COREFIFO:3.0.101
COREFIFO_C12_COREFIFO_C12_0_COREFIFO #( 
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
        .RWIDTH       ( 64 ),
        .SYNC         ( 0 ),
        .SYNC_RESET   ( 0 ),
        .UNDERFLOW_EN ( 0 ),
        .WDEPTH       ( 64 ),
        .WE_POLARITY  ( 0 ),
        .WRCNT_EN     ( 0 ),
        .WRITE_ACK    ( 0 ),
        .WWIDTH       ( 64 ) )
COREFIFO_C12_0(
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
        .MEMRD      ( MEMRD_const_net_0 ), // tied to 64'h0000000000000000 from definition
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
