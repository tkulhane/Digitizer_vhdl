//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Thu May  4 16:07:13 2023
// Version: 2022.1 2022.1.0.10
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

//////////////////////////////////////////////////////////////////////
// Component Description (Tcl) 
//////////////////////////////////////////////////////////////////////
/*
# Exporting Component Description of COREFIFO_C5 to TCL
# Family: PolarFire
# Part Number: MPF300TS_ES-1FCG1152E
# Create and Configure the core component COREFIFO_C5
create_and_configure_core -core_vlnv {Actel:DirectCore:COREFIFO:3.0.101} -component_name {COREFIFO_C5} -params {\
"AE_STATIC_EN:false"  \
"AEVAL:4"  \
"AF_STATIC_EN:true"  \
"AFVAL:65534"  \
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
"RDEPTH:65536"  \
"RE_POLARITY:0"  \
"READ_DVALID:false"  \
"RWIDTH:18"  \
"SYNC:1"  \
"SYNC_RESET:0"  \
"UNDERFLOW_EN:false"  \
"WDEPTH:65536"  \
"WE_POLARITY:0"  \
"WRCNT_EN:false"  \
"WRITE_ACK:false"  \
"WWIDTH:18"   }
# Exporting Component Description of COREFIFO_C5 to TCL done
*/

// COREFIFO_C5
module COREFIFO_C5(
    // Inputs
    CLK,
    DATA,
    RE,
    RESET_N,
    WE,
    // Outputs
    AFULL,
    EMPTY,
    FULL,
    Q
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input         CLK;
input  [17:0] DATA;
input         RE;
input         RESET_N;
input         WE;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output        AFULL;
output        EMPTY;
output        FULL;
output [17:0] Q;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire          AFULL_net_0;
wire          CLK;
wire   [17:0] DATA;
wire          EMPTY_net_0;
wire          FULL_net_0;
wire   [17:0] Q_net_0;
wire          RE;
wire          RESET_N;
wire          WE;
wire          FULL_net_1;
wire          EMPTY_net_1;
wire          AFULL_net_1;
wire   [17:0] Q_net_1;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire          GND_net;
wire   [17:0] MEMRD_const_net_0;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign GND_net           = 1'b0;
assign MEMRD_const_net_0 = 18'h00000;
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
assign Q[17:0]     = Q_net_1;
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------COREFIFO_C5_COREFIFO_C5_0_COREFIFO   -   Actel:DirectCore:COREFIFO:3.0.101
COREFIFO_C5_COREFIFO_C5_0_COREFIFO #( 
        .AE_STATIC_EN ( 0 ),
        .AEVAL        ( 4 ),
        .AF_STATIC_EN ( 1 ),
        .AFVAL        ( 65534 ),
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
        .RDEPTH       ( 65536 ),
        .RE_POLARITY  ( 0 ),
        .READ_DVALID  ( 0 ),
        .RWIDTH       ( 18 ),
        .SYNC         ( 1 ),
        .SYNC_RESET   ( 0 ),
        .UNDERFLOW_EN ( 0 ),
        .WDEPTH       ( 65536 ),
        .WE_POLARITY  ( 0 ),
        .WRCNT_EN     ( 0 ),
        .WRITE_ACK    ( 0 ),
        .WWIDTH       ( 18 ) )
COREFIFO_C5_0(
        // Inputs
        .CLK        ( CLK ),
        .WCLOCK     ( GND_net ), // tied to 1'b0 from definition
        .RCLOCK     ( GND_net ), // tied to 1'b0 from definition
        .RESET_N    ( RESET_N ),
        .WRESET_N   ( GND_net ), // tied to 1'b0 from definition
        .RRESET_N   ( GND_net ), // tied to 1'b0 from definition
        .WE         ( WE ),
        .RE         ( RE ),
        .DATA       ( DATA ),
        .MEMRD      ( MEMRD_const_net_0 ), // tied to 18'h00000 from definition
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
