//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Mon Jul 24 20:59:03 2023
// Version: 2022.1 2022.1.0.10
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// Clock_Reset
module Clock_Reset(
    // Inputs
    EXT_RST_N,
    // Outputs
    Main_CLOCK,
    Main_RESET_N,
    UART_CLOCK,
    UART_RESER_N
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input  EXT_RST_N;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output Main_CLOCK;
output Main_RESET_N;
output UART_CLOCK;
output UART_RESER_N;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire   CORERESET_PF_C0_0_PLL_POWERDOWN_B;
wire   EXT_RST_N;
wire   Main_CLOCK_net_0;
wire   Main_RESET_N_net_0;
wire   PF_CCC_C0_0_PLL_LOCK_0;
wire   PF_INIT_MONITOR_C0_0_DEVICE_INIT_DONE;
wire   PF_INIT_MONITOR_C0_0_FABRIC_POR_N;
wire   PF_OSC_C0_0_RCOSC_160MHZ_GL;
wire   UART_CLOCK_net_0;
wire   UART_RESER_N_net_0;
wire   Main_CLOCK_net_1;
wire   Main_RESET_N_net_1;
wire   UART_CLOCK_net_1;
wire   UART_RESER_N_net_1;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire   VCC_net;
wire   GND_net;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign VCC_net = 1'b1;
assign GND_net = 1'b0;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign Main_CLOCK_net_1   = Main_CLOCK_net_0;
assign Main_CLOCK         = Main_CLOCK_net_1;
assign Main_RESET_N_net_1 = Main_RESET_N_net_0;
assign Main_RESET_N       = Main_RESET_N_net_1;
assign UART_CLOCK_net_1   = UART_CLOCK_net_0;
assign UART_CLOCK         = UART_CLOCK_net_1;
assign UART_RESER_N_net_1 = UART_RESER_N_net_0;
assign UART_RESER_N       = UART_RESER_N_net_1;
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------CORERESET_PF_C0
CORERESET_PF_C0 CORERESET_PF_C0_0(
        // Inputs
        .CLK                ( Main_CLOCK_net_0 ),
        .EXT_RST_N          ( EXT_RST_N ),
        .BANK_x_VDDI_STATUS ( VCC_net ),
        .BANK_y_VDDI_STATUS ( VCC_net ),
        .PLL_LOCK           ( PF_CCC_C0_0_PLL_LOCK_0 ),
        .SS_BUSY            ( GND_net ),
        .INIT_DONE          ( PF_INIT_MONITOR_C0_0_DEVICE_INIT_DONE ),
        .FF_US_RESTORE      ( GND_net ),
        .FPGA_POR_N         ( PF_INIT_MONITOR_C0_0_FABRIC_POR_N ),
        // Outputs
        .PLL_POWERDOWN_B    ( CORERESET_PF_C0_0_PLL_POWERDOWN_B ),
        .FABRIC_RESET_N     ( Main_RESET_N_net_0 ) 
        );

//--------PF_CCC_C0
PF_CCC_C0 PF_CCC_C0_0(
        // Inputs
        .REF_CLK_0         ( PF_OSC_C0_0_RCOSC_160MHZ_GL ),
        .PLL_POWERDOWN_N_0 ( CORERESET_PF_C0_0_PLL_POWERDOWN_B ),
        // Outputs
        .OUT0_FABCLK_0     ( Main_CLOCK_net_0 ),
        .OUT1_FABCLK_0     ( UART_CLOCK_net_0 ),
        .PLL_LOCK_0        ( PF_CCC_C0_0_PLL_LOCK_0 ) 
        );

//--------PF_INIT_MONITOR_C0
PF_INIT_MONITOR_C0 PF_INIT_MONITOR_C0_0(
        // Outputs
        .FABRIC_POR_N               ( PF_INIT_MONITOR_C0_0_FABRIC_POR_N ),
        .PCIE_INIT_DONE             (  ),
        .USRAM_INIT_DONE            (  ),
        .SRAM_INIT_DONE             (  ),
        .DEVICE_INIT_DONE           ( PF_INIT_MONITOR_C0_0_DEVICE_INIT_DONE ),
        .XCVR_INIT_DONE             (  ),
        .USRAM_INIT_FROM_SNVM_DONE  (  ),
        .USRAM_INIT_FROM_UPROM_DONE (  ),
        .USRAM_INIT_FROM_SPI_DONE   (  ),
        .SRAM_INIT_FROM_SNVM_DONE   (  ),
        .SRAM_INIT_FROM_UPROM_DONE  (  ),
        .SRAM_INIT_FROM_SPI_DONE    (  ),
        .AUTOCALIB_DONE             (  ) 
        );

//--------PF_OSC_C0
PF_OSC_C0 PF_OSC_C0_0(
        // Outputs
        .RCOSC_160MHZ_GL ( PF_OSC_C0_0_RCOSC_160MHZ_GL ) 
        );

//--------Synchronizer
Synchronizer Synchronizer_0(
        // Inputs
        .nRST     ( Main_RESET_N_net_0 ),
        .CLK      ( UART_CLOCK_net_0 ),
        .Data_In  ( VCC_net ),
        // Outputs
        .Data_Out ( UART_RESER_N_net_0 ) 
        );


endmodule
