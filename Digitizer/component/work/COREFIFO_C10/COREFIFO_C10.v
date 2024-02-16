//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Wed Feb 14 14:27:42 2024
// Version: 2022.1 2022.1.0.10
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

//////////////////////////////////////////////////////////////////////
// Component Description (Tcl) 
//////////////////////////////////////////////////////////////////////
/*
# Exporting Component Description of COREFIFO_C10 to TCL
# Family: PolarFire
# Part Number: MPF300TS_ES-1FCG1152E
# Create and Configure the core component COREFIFO_C10
create_and_configure_core -core_vlnv {Actel:DirectCore:COREFIFO:3.0.101} -component_name {COREFIFO_C10} -params {\
"AE_STATIC_EN:false"  \
"AEVAL:4"  \
"AF_STATIC_EN:true"  \
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
"PREFETCH:false"  \
"RAM_OPT:0"  \
"RDCNT_EN:false"  \
"RDEPTH:1024"  \
"RE_POLARITY:0"  \
"READ_DVALID:false"  \
"RWIDTH:32"  \
"SYNC:0"  \
"SYNC_RESET:0"  \
"UNDERFLOW_EN:false"  \
"WDEPTH:1024"  \
"WE_POLARITY:0"  \
"WRCNT_EN:false"  \
"WRITE_ACK:false"  \
"WWIDTH:32"   }
# Exporting Component Description of COREFIFO_C10 to TCL done
*/

// COREFIFO_C10
module COREFIFO_C10(
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
    Q
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input  [31:0] DATA;
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
output [31:0] Q;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire          AFULL_net_0;
wire   [31:0] DATA;
wire          EMPTY_net_0;
wire          FULL_net_0;
wire   [31:0] Q_net_0;
wire          RCLOCK;
wire          RE;
wire          RRESET_N;
wire          WCLOCK;
wire          WE;
wire          WRESET_N;
wire          FULL_net_1;
wire          EMPTY_net_1;
wire          AFULL_net_1;
wire   [31:0] Q_net_1;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire          GND_net;
wire   [31:0] MEMRD_const_net_0;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign GND_net           = 1'b0;
assign MEMRD_const_net_0 = 32'h00000000;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign FULL_net_1  = FULL_net_0;
assign FULL        = FULL_net_1;
assign EMPTY_net_1 = EMPTY_net_0;
assign EMPTY       = EMPTY_net_1;
assign AFULL_net_1 = AFULL_net_0;
assign AFULL       = AFULL_net_1;
assign Q_net_1     = Q_net_0;
assign Q[31:0]     = Q_net_1;
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------COREFIFO_C10_COREFIFO_C10_0_COREFIFO   -   Actel:DirectCore:COREFIFO:3.0.101
COREFIFO_C10_COREFIFO_C10_0_COREFIFO #( 
        .AE_STATIC_EN ( 0 ),
        .AEVAL        ( 4 ),
        .AF_STATIC_EN ( 1 ),
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
        .PREFETCH     ( 0 ),
        .RAM_OPT      ( 0 ),
        .RDCNT_EN     ( 0 ),
        .RDEPTH       ( 1024 ),
        .RE_POLARITY  ( 0 ),
        .READ_DVALID  ( 0 ),
        .RWIDTH       ( 32 ),
        .SYNC         ( 0 ),
        .SYNC_RESET   ( 0 ),
        .UNDERFLOW_EN ( 0 ),
        .WDEPTH       ( 1024 ),
        .WE_POLARITY  ( 0 ),
        .WRCNT_EN     ( 0 ),
        .WRITE_ACK    ( 0 ),
        .WWIDTH       ( 32 ) )
COREFIFO_C10_0(
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
        .MEMRD      ( MEMRD_const_net_0 ), // tied to 32'h00000000 from definition
        // Outputs
        .FULL       ( FULL_net_0 ),
        .EMPTY      ( EMPTY_net_0 ),
        .AFULL      ( AFULL_net_0 ),
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
