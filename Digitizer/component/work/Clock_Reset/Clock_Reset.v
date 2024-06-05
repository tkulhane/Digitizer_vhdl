//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Tue Jun  4 11:11:21 2024
// Version: 2022.1 2022.1.0.10
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// Clock_Reset
module Clock_Reset(
    // Inputs
    ClockInput_EXT1,
    ClockInput_EXT2,
    ClockInput_HMC,
    EXT_RST_N,
    OSC_EXT,
    addr_frame,
    enable_cmd,
    write_data_frame,
    write_read,
    // Outputs
    CLK_SRC_40M,
    CLK_SRC_Logic,
    CLK_SRC_Ref,
    HMC_CLK,
    Logic_Clock,
    Logic_Reset_N,
    Main_CLOCK,
    Main_RESET_N,
    Ref_Clock,
    Ref_Reset_N,
    UART_CLOCK,
    UART_RESER_N,
    XCVR_CTRL_Clock_40M,
    busy,
    read_data_frame
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input         ClockInput_EXT1;
input         ClockInput_EXT2;
input         ClockInput_HMC;
input         EXT_RST_N;
input         OSC_EXT;
input  [7:0]  addr_frame;
input         enable_cmd;
input  [15:0] write_data_frame;
input         write_read;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output        CLK_SRC_40M;
output        CLK_SRC_Logic;
output        CLK_SRC_Ref;
output        HMC_CLK;
output        Logic_Clock;
output        Logic_Reset_N;
output        Main_CLOCK;
output        Main_RESET_N;
output        Ref_Clock;
output        Ref_Reset_N;
output        UART_CLOCK;
output        UART_RESER_N;
output        XCVR_CTRL_Clock_40M;
output        busy;
output [15:0] read_data_frame;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire   [7:0]  addr_frame;
wire          busy_net_0;
wire          CLK_SRC_40M_net_0;
wire          CLK_SRC_Logic_net_0;
wire          CLK_SRC_Ref_net_0;
wire          Clock_Controller_0_SwitchEnable_Logic;
wire          Clock_Controller_0_SwitchEnable_Ref;
wire   [2:0]  Clock_Controller_0_SwitchSelect_Logic;
wire   [2:0]  Clock_Controller_0_SwitchSelect_Ref;
wire          Clock_Switch_0_0_PLL_PWR_DOWN;
wire          Clock_Switch_0_PLL_PWR_DOWN;
wire          ClockInput_EXT1;
wire          ClockInput_EXT2;
wire          ClockInput_HMC;
wire          CORERESET_PF_C0_0_PLL_POWERDOWN_B;
wire          enable_cmd;
wire          EXT_RST_N;
wire          HMC_CLK_net_0;
wire          Logic_Clock_net_0;
wire          Logic_Reset_N_net_0;
wire          Main_CLOCK_0;
wire          Main_RESET_N_0;
wire          OSC_EXT;
wire          PF_CCC_C0_0_PLL_LOCK_0;
wire          PF_CCC_C7_0_OUT0_FABCLK_0;
wire          PF_CCC_C7_0_PLL_LOCK_0;
wire          PF_CCC_C8_0_OUT0_FABCLK_0;
wire          PF_CCC_C8_0_PLL_LOCK_0;
wire          PF_CCC_C9_0_OUT0_FABCLK_0;
wire          PF_INIT_MONITOR_C0_0_DEVICE_INIT_DONE;
wire          PF_INIT_MONITOR_C0_0_FABRIC_POR_N;
wire          PF_OSC_C0_0_RCOSC_160MHZ_GL;
wire   [15:0] read_data_frame_net_0;
wire          Ref_Clock_net_0;
wire          Ref_Reset_N_net_0;
wire          UART_CLOCK_net_0;
wire          UART_RESER_N_net_0;
wire   [15:0] write_data_frame;
wire          write_read;
wire          XCVR_CTRL_Clock_40M_net_0;
wire          Main_CLOCK_0_net_0;
wire          Main_RESET_N_0_net_0;
wire          UART_CLOCK_net_1;
wire          UART_RESER_N_net_1;
wire          HMC_CLK_net_1;
wire          XCVR_CTRL_Clock_40M_net_1;
wire          busy_net_1;
wire          Logic_Clock_net_1;
wire          Logic_Reset_N_net_1;
wire          Ref_Clock_net_1;
wire          Ref_Reset_N_net_1;
wire          CLK_SRC_40M_net_1;
wire          CLK_SRC_Logic_net_1;
wire          CLK_SRC_Ref_net_1;
wire   [15:0] read_data_frame_net_1;
wire   [1:0]  PLLs_Lock_net_0;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire          VCC_net;
wire          GND_net;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign VCC_net = 1'b1;
assign GND_net = 1'b0;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign Main_CLOCK_0_net_0        = Main_CLOCK_0;
assign Main_CLOCK                = Main_CLOCK_0_net_0;
assign Main_RESET_N_0_net_0      = Main_RESET_N_0;
assign Main_RESET_N              = Main_RESET_N_0_net_0;
assign UART_CLOCK_net_1          = UART_CLOCK_net_0;
assign UART_CLOCK                = UART_CLOCK_net_1;
assign UART_RESER_N_net_1        = UART_RESER_N_net_0;
assign UART_RESER_N              = UART_RESER_N_net_1;
assign HMC_CLK_net_1             = HMC_CLK_net_0;
assign HMC_CLK                   = HMC_CLK_net_1;
assign XCVR_CTRL_Clock_40M_net_1 = XCVR_CTRL_Clock_40M_net_0;
assign XCVR_CTRL_Clock_40M       = XCVR_CTRL_Clock_40M_net_1;
assign busy_net_1                = busy_net_0;
assign busy                      = busy_net_1;
assign Logic_Clock_net_1         = Logic_Clock_net_0;
assign Logic_Clock               = Logic_Clock_net_1;
assign Logic_Reset_N_net_1       = Logic_Reset_N_net_0;
assign Logic_Reset_N             = Logic_Reset_N_net_1;
assign Ref_Clock_net_1           = Ref_Clock_net_0;
assign Ref_Clock                 = Ref_Clock_net_1;
assign Ref_Reset_N_net_1         = Ref_Reset_N_net_0;
assign Ref_Reset_N               = Ref_Reset_N_net_1;
assign CLK_SRC_40M_net_1         = CLK_SRC_40M_net_0;
assign CLK_SRC_40M               = CLK_SRC_40M_net_1;
assign CLK_SRC_Logic_net_1       = CLK_SRC_Logic_net_0;
assign CLK_SRC_Logic             = CLK_SRC_Logic_net_1;
assign CLK_SRC_Ref_net_1         = CLK_SRC_Ref_net_0;
assign CLK_SRC_Ref               = CLK_SRC_Ref_net_1;
assign read_data_frame_net_1     = read_data_frame_net_0;
assign read_data_frame[15:0]     = read_data_frame_net_1;
//--------------------------------------------------------------------
// Concatenation assignments
//--------------------------------------------------------------------
assign PLLs_Lock_net_0 = { PF_CCC_C8_0_PLL_LOCK_0 , PF_CCC_C7_0_PLL_LOCK_0 };
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------Clock_Controller
Clock_Controller Clock_Controller_0(
        // Inputs
        .Clock              ( Main_CLOCK_0 ),
        .Reset_N            ( Main_RESET_N_0 ),
        .enable_cmd         ( enable_cmd ),
        .write_read         ( write_read ),
        .addr_frame         ( addr_frame ),
        .write_data_frame   ( write_data_frame ),
        .PLLs_Lock          ( PLLs_Lock_net_0 ),
        // Outputs
        .busy               ( busy_net_0 ),
        .read_data_frame    ( read_data_frame_net_0 ),
        .SwitchEnable_Logic ( Clock_Controller_0_SwitchEnable_Logic ),
        .SwitchSelect_Logic ( Clock_Controller_0_SwitchSelect_Logic ),
        .SwitchEnable_Ref   ( Clock_Controller_0_SwitchEnable_Ref ),
        .SwitchSelect_Ref   ( Clock_Controller_0_SwitchSelect_Ref ) 
        );

//--------Clock_Switch
Clock_Switch Clock_Switch_0(
        // Inputs
        .CTRL_Clock     ( Main_CLOCK_0 ),
        .CTRL_Reset_N   ( Main_RESET_N_0 ),
        .ClockInputA    ( CLK_SRC_40M_net_0 ),
        .ClockInputB    ( ClockInput_HMC ),
        .ClockInputC    ( ClockInput_EXT1 ),
        .ClockInputD    ( ClockInput_EXT2 ),
        .ClockInputE    ( PF_CCC_C9_0_OUT0_FABCLK_0 ),
        .SwitchEnable   ( Clock_Controller_0_SwitchEnable_Logic ),
        .SwitchSelect   ( Clock_Controller_0_SwitchSelect_Logic ),
        .PLL_Lock       ( PF_CCC_C7_0_PLL_LOCK_0 ),
        .Clock_From_PLL ( PF_CCC_C7_0_OUT0_FABCLK_0 ),
        // Outputs
        .PLL_PWR_DOWN   ( Clock_Switch_0_PLL_PWR_DOWN ),
        .Clock_To_PLL   ( CLK_SRC_Logic_net_0 ),
        .Clock_OUT      ( Logic_Clock_net_0 ),
        .Reset_N_OUT    ( Logic_Reset_N_net_0 ) 
        );

//--------Clock_Switch
Clock_Switch Clock_Switch_0_0(
        // Inputs
        .CTRL_Clock     ( Main_CLOCK_0 ),
        .CTRL_Reset_N   ( Main_RESET_N_0 ),
        .ClockInputA    ( CLK_SRC_40M_net_0 ),
        .ClockInputB    ( ClockInput_HMC ),
        .ClockInputC    ( ClockInput_EXT1 ),
        .ClockInputD    ( ClockInput_EXT2 ),
        .ClockInputE    ( PF_CCC_C9_0_OUT0_FABCLK_0 ),
        .SwitchEnable   ( Clock_Controller_0_SwitchEnable_Ref ),
        .SwitchSelect   ( Clock_Controller_0_SwitchSelect_Ref ),
        .PLL_Lock       ( PF_CCC_C8_0_PLL_LOCK_0 ),
        .Clock_From_PLL ( PF_CCC_C8_0_OUT0_FABCLK_0 ),
        // Outputs
        .PLL_PWR_DOWN   ( Clock_Switch_0_0_PLL_PWR_DOWN ),
        .Clock_To_PLL   ( CLK_SRC_Ref_net_0 ),
        .Clock_OUT      ( Ref_Clock_net_0 ),
        .Reset_N_OUT    ( Ref_Reset_N_net_0 ) 
        );

//--------CORERESET_PF_C0
CORERESET_PF_C0 CORERESET_PF_C0_0(
        // Inputs
        .CLK                ( Main_CLOCK_0 ),
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
        .FABRIC_RESET_N     ( Main_RESET_N_0 ) 
        );

//--------PF_CCC_C0
PF_CCC_C0 PF_CCC_C0_0(
        // Inputs
        .REF_CLK_0         ( PF_OSC_C0_0_RCOSC_160MHZ_GL ),
        .PLL_POWERDOWN_N_0 ( CORERESET_PF_C0_0_PLL_POWERDOWN_B ),
        // Outputs
        .OUT0_FABCLK_0     ( Main_CLOCK_0 ),
        .OUT1_FABCLK_0     ( UART_CLOCK_net_0 ),
        .PLL_LOCK_0        ( PF_CCC_C0_0_PLL_LOCK_0 ) 
        );

//--------PF_CCC_C3
PF_CCC_C3 PF_CCC_C3_0(
        // Inputs
        .REF_CLK_0         ( PF_OSC_C0_0_RCOSC_160MHZ_GL ),
        .PLL_POWERDOWN_N_0 ( CORERESET_PF_C0_0_PLL_POWERDOWN_B ),
        // Outputs
        .OUT0_FABCLK_0     ( HMC_CLK_net_0 ),
        .PLL_LOCK_0        (  ) 
        );

//--------PF_CCC_C7
PF_CCC_C7 PF_CCC_C7_0(
        // Inputs
        .REF_CLK_0         ( CLK_SRC_Logic_net_0 ),
        .PLL_POWERDOWN_N_0 ( Clock_Switch_0_PLL_PWR_DOWN ),
        // Outputs
        .OUT0_FABCLK_0     ( PF_CCC_C7_0_OUT0_FABCLK_0 ),
        .PLL_LOCK_0        ( PF_CCC_C7_0_PLL_LOCK_0 ) 
        );

//--------PF_CCC_C8
PF_CCC_C8 PF_CCC_C8_0(
        // Inputs
        .REF_CLK_0         ( CLK_SRC_Ref_net_0 ),
        .PLL_POWERDOWN_N_0 ( Clock_Switch_0_0_PLL_PWR_DOWN ),
        // Outputs
        .OUT0_FABCLK_0     ( PF_CCC_C8_0_OUT0_FABCLK_0 ),
        .PLL_LOCK_0        ( PF_CCC_C8_0_PLL_LOCK_0 ) 
        );

//--------PF_CCC_C9
PF_CCC_C9 PF_CCC_C9_0(
        // Inputs
        .REF_CLK_0         ( OSC_EXT ),
        .PLL_POWERDOWN_N_0 ( CORERESET_PF_C0_0_PLL_POWERDOWN_B ),
        // Outputs
        .OUT0_FABCLK_0     ( PF_CCC_C9_0_OUT0_FABCLK_0 ),
        .PLL_LOCK_0        (  ) 
        );

//--------PF_CLK_DIV_C2
PF_CLK_DIV_C2 PF_CLK_DIV_C2_0(
        // Inputs
        .CLK_IN  ( PF_OSC_C0_0_RCOSC_160MHZ_GL ),
        // Outputs
        .CLK_OUT ( XCVR_CTRL_Clock_40M_net_0 ) 
        );

//--------PF_CLK_DIV_C2
PF_CLK_DIV_C2 PF_CLK_DIV_C2_0_0(
        // Inputs
        .CLK_IN  ( PF_OSC_C0_0_RCOSC_160MHZ_GL ),
        // Outputs
        .CLK_OUT ( CLK_SRC_40M_net_0 ) 
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
        .nRST     ( Main_RESET_N_0 ),
        .CLK      ( UART_CLOCK_net_0 ),
        .Data_In  ( VCC_net ),
        // Outputs
        .Data_Out ( UART_RESER_N_net_0 ) 
        );


endmodule
