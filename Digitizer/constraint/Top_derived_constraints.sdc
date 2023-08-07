# Microsemi Corp.
# Date: 2023-Aug-07 12:59:44
# This file was generated based on the following SDC source files:
#   C:/VHDL_temp/Digitizer/Digitizer_vhdl/Digitizer/component/work/PF_CCC_C0/PF_CCC_C0_0/PF_CCC_C0_PF_CCC_C0_0_PF_CCC.sdc
#   C:/VHDL_temp/Digitizer/Digitizer_vhdl/Digitizer/component/work/COREFIFO_C1/COREFIFO_C1_0/COREFIFO_C1_COREFIFO_C1_0_COREFIFO.sdc
#   C:/VHDL_temp/Digitizer/Digitizer_vhdl/Digitizer/component/work/COREFIFO_C3/COREFIFO_C3_0/COREFIFO_C3_COREFIFO_C3_0_COREFIFO.sdc
#   C:/VHDL_temp/Digitizer/Digitizer_vhdl/Digitizer/component/work/COREFIFO_C4/COREFIFO_C4_0/COREFIFO_C4_COREFIFO_C4_0_COREFIFO.sdc
#   C:/VHDL_temp/Digitizer/Digitizer_vhdl/Digitizer/component/work/COREFIFO_C5/COREFIFO_C5_0/COREFIFO_C5_COREFIFO_C5_0_COREFIFO.sdc
#   C:/VHDL_temp/Digitizer/Digitizer_vhdl/Digitizer/component/work/COREFIFO_C0/COREFIFO_C0_0/COREFIFO_C0_COREFIFO_C0_0_COREFIFO.sdc
#   C:/VHDL_temp/Digitizer/Digitizer_vhdl/Digitizer/component/work/COREFIFO_C6/COREFIFO_C6_0/COREFIFO_C6_COREFIFO_C6_0_COREFIFO.sdc
#   C:/VHDL_temp/Digitizer/Digitizer_vhdl/Digitizer/component/work/COREFIFO_C7/COREFIFO_C7_0/COREFIFO_C7_COREFIFO_C7_0_COREFIFO.sdc
#   C:/VHDL_temp/Digitizer/Digitizer_vhdl/Digitizer/component/work/COREFIFO_C8/COREFIFO_C8_0/COREFIFO_C8_COREFIFO_C8_0_COREFIFO.sdc
#   C:/Microsemi/Libero_SoC_v2022.1/Designer/data/aPA5M/cores/constraints/osc_rc160mhz.sdc
#

create_clock -name {Clock_Reset_0/PF_OSC_C0_0/PF_OSC_C0_0/I_OSC_160/CLK} -period 6.25 [ get_pins { Clock_Reset_0/PF_OSC_C0_0/PF_OSC_C0_0/I_OSC_160/CLK } ]
create_generated_clock -name {Clock_Reset_0/PF_CCC_C0_0/PF_CCC_C0_0/pll_inst_0/OUT0} -divide_by 16 -source [ get_pins { Clock_Reset_0/PF_CCC_C0_0/PF_CCC_C0_0/pll_inst_0/REF_CLK_0 } ] -phase 0 [ get_pins { Clock_Reset_0/PF_CCC_C0_0/PF_CCC_C0_0/pll_inst_0/OUT0 } ]
create_generated_clock -name {Clock_Reset_0/PF_CCC_C0_0/PF_CCC_C0_0/pll_inst_0/OUT1} -multiply_by 11 -divide_by 320 -source [ get_pins { Clock_Reset_0/PF_CCC_C0_0/PF_CCC_C0_0/pll_inst_0/REF_CLK_0 } ] -phase 0 [ get_pins { Clock_Reset_0/PF_CCC_C0_0/PF_CCC_C0_0/pll_inst_0/OUT1 } ]
set_false_path -to [ get_cells { UART_Protocol_0/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk*.U_corefifo_async/*/shift_reg* } ]
set_false_path -to [ get_cells { UART_Protocol_1/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk*.U_corefifo_async/*/shift_reg* } ]
set_false_path -to [ get_cells { UART_Protocol_0/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk*.U_corefifo_async/*/shift_reg* } ]
set_false_path -to [ get_cells { UART_Protocol_1/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk*.U_corefifo_async/*/shift_reg* } ]
set_false_path -to [ get_cells { USB_3_Protocol_0/COREFIFO_C7_0/COREFIFO_C7_0/genblk*.U_corefifo_async/*/shift_reg* } ]
set_false_path -to [ get_cells { USB_3_Protocol_0/COREFIFO_C8_0/COREFIFO_C8_0/genblk*.U_corefifo_async/*/shift_reg* } ]
