# Microsemi Corp.
# Date: 2023-Aug-16 14:52:20
# This file was generated based on the following SDC source files:
#   C:/VHDL_temp/Digitizer/Digitizer_vhdl/Digitizer/constraint/Top_derived_constraints.sdc
#

create_clock -name {Clock_Reset_0/PF_OSC_C0_0/PF_OSC_C0_0/I_OSC_160/CLK} -period 6.25 [ get_pins { Clock_Reset_0/PF_OSC_C0_0/PF_OSC_C0_0/I_OSC_160/CLK } ]
create_clock -name {Data_Block_0/PF_XCVR_ERM_C2_0/I_XCVR/LANE0/RX_CLK_R} -period 4 [ get_pins { Data_Block_0/PF_XCVR_ERM_C2_0/I_XCVR/LANE0/RX_CLK_R } ]
create_clock -name {Data_Block_0/PF_XCVR_ERM_C2_0/I_XCVR/LANE1/RX_CLK_R} -period 4 [ get_pins { Data_Block_0/PF_XCVR_ERM_C2_0/I_XCVR/LANE1/RX_CLK_R } ]
create_clock -name {Data_Block_0/PF_XCVR_ERM_C2_0/I_XCVR/LANE2/RX_CLK_R} -period 4 [ get_pins { Data_Block_0/PF_XCVR_ERM_C2_0/I_XCVR/LANE2/RX_CLK_R } ]
create_clock -name {Data_Block_0/PF_XCVR_ERM_C2_0/I_XCVR/LANE3/RX_CLK_R} -period 4 [ get_pins { Data_Block_0/PF_XCVR_ERM_C2_0/I_XCVR/LANE3/RX_CLK_R } ]
create_clock -name {Data_Block_0/PF_XCVR_ERM_C3_0/I_XCVR/LANE0/RX_CLK_R} -period 4 [ get_pins { Data_Block_0/PF_XCVR_ERM_C3_0/I_XCVR/LANE0/RX_CLK_R } ]
create_clock -name {Data_Block_0/PF_XCVR_ERM_C3_0/I_XCVR/LANE1/RX_CLK_R} -period 4 [ get_pins { Data_Block_0/PF_XCVR_ERM_C3_0/I_XCVR/LANE1/RX_CLK_R } ]
create_generated_clock -name {Clock_Reset_0/PF_CCC_C0_0/PF_CCC_C0_0/pll_inst_0/OUT0} -multiply_by 5 -divide_by 4 -source [ get_pins { Clock_Reset_0/PF_CCC_C0_0/PF_CCC_C0_0/pll_inst_0/REF_CLK_0 } ] -phase 0 [ get_pins { Clock_Reset_0/PF_CCC_C0_0/PF_CCC_C0_0/pll_inst_0/OUT0 } ]
create_generated_clock -name {Clock_Reset_0/PF_CCC_C0_0/PF_CCC_C0_0/pll_inst_0/OUT1} -multiply_by 15 -divide_by 436 -source [ get_pins { Clock_Reset_0/PF_CCC_C0_0/PF_CCC_C0_0/pll_inst_0/REF_CLK_0 } ] -phase 0 [ get_pins { Clock_Reset_0/PF_CCC_C0_0/PF_CCC_C0_0/pll_inst_0/OUT1 } ]
create_generated_clock -name {Clock_Reset_0/PF_CCC_C1_0/PF_CCC_C1_0/pll_inst_0/OUT0} -divide_by 4 -source [ get_pins { Clock_Reset_0/PF_CCC_C1_0/PF_CCC_C1_0/pll_inst_0/REF_CLK_0 } ] -phase 0 [ get_pins { Clock_Reset_0/PF_CCC_C1_0/PF_CCC_C1_0/pll_inst_0/OUT0 } ]
create_generated_clock -name {Clock_Reset_0/PF_CCC_C1_0/PF_CCC_C1_0/pll_inst_0/OUT1} -divide_by 2 -source [ get_pins { Clock_Reset_0/PF_CCC_C1_0/PF_CCC_C1_0/pll_inst_0/REF_CLK_0 } ] -phase 0 [ get_pins { Clock_Reset_0/PF_CCC_C1_0/PF_CCC_C1_0/pll_inst_0/OUT1 } ]
set_false_path -to [ get_cells { UART_Protocol_0/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk*.U_corefifo_async/*/shift_reg* } ]
set_false_path -to [ get_cells { UART_Protocol_1/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk*.U_corefifo_async/*/shift_reg* } ]
set_false_path -to [ get_cells { UART_Protocol_0/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk*.U_corefifo_async/*/shift_reg* } ]
set_false_path -to [ get_cells { UART_Protocol_1/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk*.U_corefifo_async/*/shift_reg* } ]
set_false_path -to [ get_cells { USB_3_Protocol_0/COREFIFO_C7_0/COREFIFO_C7_0/genblk*.U_corefifo_async/*/shift_reg* } ]
set_false_path -to [ get_cells { USB_3_Protocol_0/COREFIFO_C8_0/COREFIFO_C8_0/genblk*.U_corefifo_async/*/shift_reg* } ]
set_clock_uncertainty 0.135 [ get_clocks { Clock_Reset_0/PF_CCC_C0_0/PF_CCC_C0_0/pll_inst_0/OUT0 } ]
set_clock_uncertainty 4.54167 [ get_clocks { Clock_Reset_0/PF_CCC_C0_0/PF_CCC_C0_0/pll_inst_0/OUT1 } ]
set_clock_uncertainty 0.135 [ get_clocks { Clock_Reset_0/PF_CCC_C1_0/PF_CCC_C1_0/pll_inst_0/OUT0 } ]
set_clock_uncertainty 0.135 [ get_clocks { Clock_Reset_0/PF_CCC_C1_0/PF_CCC_C1_0/pll_inst_0/OUT1 } ]
set_clock_uncertainty 0.6 [ get_clocks { Clock_Reset_0/PF_OSC_C0_0/PF_OSC_C0_0/I_OSC_160/CLK } ]
set_clock_uncertainty 8.86948e-05 [ get_clocks { Data_Block_0/PF_XCVR_ERM_C2_0/I_XCVR/LANE0/RX_CLK_R } ]
set_clock_uncertainty 3.60548e-06 [ get_clocks { Data_Block_0/PF_XCVR_ERM_C2_0/I_XCVR/LANE1/RX_CLK_R } ]
set_clock_uncertainty 3.60548e-06 [ get_clocks { Data_Block_0/PF_XCVR_ERM_C2_0/I_XCVR/LANE2/RX_CLK_R } ]
set_clock_uncertainty 3.60548e-06 [ get_clocks { Data_Block_0/PF_XCVR_ERM_C2_0/I_XCVR/LANE3/RX_CLK_R } ]
set_clock_uncertainty 3.60548e-06 [ get_clocks { Data_Block_0/PF_XCVR_ERM_C3_0/I_XCVR/LANE0/RX_CLK_R } ]
set_clock_uncertainty 3.60548e-06 [ get_clocks { Data_Block_0/PF_XCVR_ERM_C3_0/I_XCVR/LANE1/RX_CLK_R } ]
