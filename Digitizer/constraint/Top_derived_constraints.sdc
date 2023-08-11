# Microsemi Corp.
# Date: 2023-Aug-09 21:37:58
# This file was generated based on the following SDC source files:
#   C:/VHDL_temp/Digitizer/Digitizer_vhdl/Digitizer/component/work/PF_CCC_C0/PF_CCC_C0_0/PF_CCC_C0_PF_CCC_C0_0_PF_CCC.sdc
#   C:/VHDL_temp/Digitizer/Digitizer_vhdl/Digitizer/component/work/PF_CCC_C1/PF_CCC_C1_0/PF_CCC_C1_PF_CCC_C1_0_PF_CCC.sdc
#   C:/VHDL_temp/Digitizer/Digitizer_vhdl/Digitizer/component/work/COREFIFO_C1/COREFIFO_C1_0/COREFIFO_C1_COREFIFO_C1_0_COREFIFO.sdc
#   C:/VHDL_temp/Digitizer/Digitizer_vhdl/Digitizer/component/work/COREFIFO_C3/COREFIFO_C3_0/COREFIFO_C3_COREFIFO_C3_0_COREFIFO.sdc
#   C:/VHDL_temp/Digitizer/Digitizer_vhdl/Digitizer/component/work/COREFIFO_C9/COREFIFO_C9_0/COREFIFO_C9_COREFIFO_C9_0_COREFIFO.sdc
#   C:/VHDL_temp/Digitizer/Digitizer_vhdl/Digitizer/component/work/COREFIFO_C4/COREFIFO_C4_0/COREFIFO_C4_COREFIFO_C4_0_COREFIFO.sdc
#   C:/VHDL_temp/Digitizer/Digitizer_vhdl/Digitizer/component/work/PF_XCVR_ERM_C2/I_XCVR/PF_XCVR_ERM_C2_I_XCVR_PF_XCVR.sdc
#   C:/VHDL_temp/Digitizer/Digitizer_vhdl/Digitizer/component/work/PF_XCVR_ERM_C3/I_XCVR/PF_XCVR_ERM_C3_I_XCVR_PF_XCVR.sdc
#   C:/VHDL_temp/Digitizer/Digitizer_vhdl/Digitizer/component/work/COREFIFO_C5/COREFIFO_C5_0/COREFIFO_C5_COREFIFO_C5_0_COREFIFO.sdc
#   C:/VHDL_temp/Digitizer/Digitizer_vhdl/Digitizer/component/work/COREFIFO_C0/COREFIFO_C0_0/COREFIFO_C0_COREFIFO_C0_0_COREFIFO.sdc
#   C:/VHDL_temp/Digitizer/Digitizer_vhdl/Digitizer/component/work/COREFIFO_C6/COREFIFO_C6_0/COREFIFO_C6_COREFIFO_C6_0_COREFIFO.sdc
#   C:/VHDL_temp/Digitizer/Digitizer_vhdl/Digitizer/component/work/COREFIFO_C7/COREFIFO_C7_0/COREFIFO_C7_COREFIFO_C7_0_COREFIFO.sdc
#   C:/VHDL_temp/Digitizer/Digitizer_vhdl/Digitizer/component/work/COREFIFO_C8/COREFIFO_C8_0/COREFIFO_C8_COREFIFO_C8_0_COREFIFO.sdc
#   C:/Microsemi/Libero_SoC_v2022.1/Designer/data/aPA5M/cores/constraints/osc_rc160mhz.sdc
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
