# Microsemi Corp.
# Date: 2024-May-15 12:02:06
# This file was generated based on the following SDC source files:
#   C:/VHDL_temp/Digitizer/Digitizer_vhdl/Digitizer/component/work/PF_CCC_C0/PF_CCC_C0_0/PF_CCC_C0_PF_CCC_C0_0_PF_CCC.sdc
#   C:/VHDL_temp/Digitizer/Digitizer_vhdl/Digitizer/component/work/PF_CCC_C3/PF_CCC_C3_0/PF_CCC_C3_PF_CCC_C3_0_PF_CCC.sdc
#   C:/VHDL_temp/Digitizer/Digitizer_vhdl/Digitizer/component/work/PF_CCC_C7/PF_CCC_C7_0/PF_CCC_C7_PF_CCC_C7_0_PF_CCC.sdc
#   C:/VHDL_temp/Digitizer/Digitizer_vhdl/Digitizer/component/work/PF_CCC_C8/PF_CCC_C8_0/PF_CCC_C8_PF_CCC_C8_0_PF_CCC.sdc
#   C:/VHDL_temp/Digitizer/Digitizer_vhdl/Digitizer/component/work/PF_CLK_DIV_C2/PF_CLK_DIV_C2_0/PF_CLK_DIV_C2_PF_CLK_DIV_C2_0_PF_CLK_DIV.sdc
#   C:/VHDL_temp/Digitizer/Digitizer_vhdl/Digitizer/component/work/PF_CLK_DIV_C3/PF_CLK_DIV_C3_0/PF_CLK_DIV_C3_PF_CLK_DIV_C3_0_PF_CLK_DIV.sdc
#   C:/VHDL_temp/Digitizer/Digitizer_vhdl/Digitizer/component/work/COREFIFO_C1/COREFIFO_C1_0/COREFIFO_C1_COREFIFO_C1_0_COREFIFO.sdc
#   C:/VHDL_temp/Digitizer/Digitizer_vhdl/Digitizer/component/work/COREFIFO_C3/COREFIFO_C3_0/COREFIFO_C3_COREFIFO_C3_0_COREFIFO.sdc
#   C:/VHDL_temp/Digitizer/Digitizer_vhdl/Digitizer/component/work/COREFIFO_C0/COREFIFO_C0_0/COREFIFO_C0_COREFIFO_C0_0_COREFIFO.sdc
#   C:/VHDL_temp/Digitizer/Digitizer_vhdl/Digitizer/component/work/COREFIFO_C6/COREFIFO_C6_0/COREFIFO_C6_COREFIFO_C6_0_COREFIFO.sdc
#   C:/VHDL_temp/Digitizer/Digitizer_vhdl/Digitizer/component/work/COREFIFO_C7/COREFIFO_C7_0/COREFIFO_C7_COREFIFO_C7_0_COREFIFO.sdc
#   C:/VHDL_temp/Digitizer/Digitizer_vhdl/Digitizer/component/work/COREFIFO_C8/COREFIFO_C8_0/COREFIFO_C8_COREFIFO_C8_0_COREFIFO.sdc
#   C:/VHDL_temp/Digitizer/Digitizer_vhdl/Digitizer/component/work/COREFIFO_C11/COREFIFO_C11_0/COREFIFO_C11_COREFIFO_C11_0_COREFIFO.sdc
#   C:/VHDL_temp/Digitizer/Digitizer_vhdl/Digitizer/component/work/COREFIFO_C10/COREFIFO_C10_0/COREFIFO_C10_COREFIFO_C10_0_COREFIFO.sdc
#   C:/VHDL_temp/Digitizer/Digitizer_vhdl/Digitizer/component/work/COREFIFO_C4/COREFIFO_C4_0/COREFIFO_C4_COREFIFO_C4_0_COREFIFO.sdc
#   C:/VHDL_temp/Digitizer/Digitizer_vhdl/Digitizer/component/work/COREFIFO_C5/COREFIFO_C5_0/COREFIFO_C5_COREFIFO_C5_0_COREFIFO.sdc
#   C:/VHDL_temp/Digitizer/Digitizer_vhdl/Digitizer/component/work/COREFIFO_C12/COREFIFO_C12_0/COREFIFO_C12_COREFIFO_C12_0_COREFIFO.sdc
#   C:/VHDL_temp/Digitizer/Digitizer_vhdl/Digitizer/component/work/COREFIFO_C13/COREFIFO_C13_0/COREFIFO_C13_COREFIFO_C13_0_COREFIFO.sdc
#   C:/VHDL_temp/Digitizer/Digitizer_vhdl/Digitizer/component/work/PF_TX_PLL_C1/PF_TX_PLL_C1_0/PF_TX_PLL_C1_PF_TX_PLL_C1_0_PF_TX_PLL.sdc
#   C:/VHDL_temp/Digitizer/Digitizer_vhdl/Digitizer/component/work/PF_XCVR_ERM_C8/I_XCVR/PF_XCVR_ERM_C8_I_XCVR_PF_XCVR.sdc
#   C:/Microsemi/Libero_SoC_v2022.1/Designer/data/aPA5M/cores/constraints/osc_rc160mhz.sdc
#

create_clock -name {Clock_Reset_0/PF_OSC_C0_0/PF_OSC_C0_0/I_OSC_160/CLK} -period 6.25 [ get_pins { Clock_Reset_0/PF_OSC_C0_0/PF_OSC_C0_0/I_OSC_160/CLK } ]
create_clock -name {Transceiver_Main_0/Transceiver_LanesConnection_0/inst_Transciever_OneLane_0/PF_XCVR_ERM_C8_0/I_XCVR/LANE0/TX_CLK_R} -period 8 [ get_pins { Transceiver_Main_0/Transceiver_LanesConnection_0/inst_Transciever_OneLane_0/PF_XCVR_ERM_C8_0/I_XCVR/LANE0/TX_CLK_R } ]
create_clock -name {Transceiver_Main_0/Transceiver_LanesConnection_0/inst_Transciever_OneLane_0/PF_XCVR_ERM_C8_0/I_XCVR/LANE0/RX_CLK_R} -period 8 [ get_pins { Transceiver_Main_0/Transceiver_LanesConnection_0/inst_Transciever_OneLane_0/PF_XCVR_ERM_C8_0/I_XCVR/LANE0/RX_CLK_R } ]
create_clock -name {Transceiver_Main_0/Transceiver_LanesConnection_0/inst_Transciever_OneLane_1/PF_XCVR_ERM_C8_0/I_XCVR/LANE0/TX_CLK_R} -period 8 [ get_pins { Transceiver_Main_0/Transceiver_LanesConnection_0/inst_Transciever_OneLane_1/PF_XCVR_ERM_C8_0/I_XCVR/LANE0/TX_CLK_R } ]
create_clock -name {Transceiver_Main_0/Transceiver_LanesConnection_0/inst_Transciever_OneLane_1/PF_XCVR_ERM_C8_0/I_XCVR/LANE0/RX_CLK_R} -period 8 [ get_pins { Transceiver_Main_0/Transceiver_LanesConnection_0/inst_Transciever_OneLane_1/PF_XCVR_ERM_C8_0/I_XCVR/LANE0/RX_CLK_R } ]
create_generated_clock -name {Clock_Reset_0/PF_CCC_C0_0/PF_CCC_C0_0/pll_inst_0/OUT0} -multiply_by 25 -divide_by 32 -source [ get_pins { Clock_Reset_0/PF_CCC_C0_0/PF_CCC_C0_0/pll_inst_0/REF_CLK_0 } ] -phase 0 [ get_pins { Clock_Reset_0/PF_CCC_C0_0/PF_CCC_C0_0/pll_inst_0/OUT0 } ]
create_generated_clock -name {Clock_Reset_0/PF_CCC_C0_0/PF_CCC_C0_0/pll_inst_0/OUT1} -multiply_by 125 -divide_by 3616 -source [ get_pins { Clock_Reset_0/PF_CCC_C0_0/PF_CCC_C0_0/pll_inst_0/REF_CLK_0 } ] -phase 0 [ get_pins { Clock_Reset_0/PF_CCC_C0_0/PF_CCC_C0_0/pll_inst_0/OUT1 } ]
create_generated_clock -name {Clock_Reset_0/PF_CCC_C3_0/PF_CCC_C3_0/pll_inst_0/OUT0} -multiply_by 5 -divide_by 8 -source [ get_pins { Clock_Reset_0/PF_CCC_C3_0/PF_CCC_C3_0/pll_inst_0/REF_CLK_0 } ] -phase 0 [ get_pins { Clock_Reset_0/PF_CCC_C3_0/PF_CCC_C3_0/pll_inst_0/OUT0 } ]
create_generated_clock -name {Clock_Reset_0/PF_CCC_C7_0/PF_CCC_C7_0/pll_inst_0/OUT0} -multiply_by 25 -divide_by 8 -source [ get_pins { Clock_Reset_0/PF_CCC_C7_0/PF_CCC_C7_0/pll_inst_0/REF_CLK_0 } ] -phase 0 [ get_pins { Clock_Reset_0/PF_CCC_C7_0/PF_CCC_C7_0/pll_inst_0/OUT0 } ]
create_generated_clock -name {Clock_Reset_0/PF_CCC_C8_0/PF_CCC_C8_0/pll_inst_0/OUT0} -multiply_by 25 -divide_by 8 -source [ get_pins { Clock_Reset_0/PF_CCC_C8_0/PF_CCC_C8_0/pll_inst_0/REF_CLK_0 } ] -phase 0 [ get_pins { Clock_Reset_0/PF_CCC_C8_0/PF_CCC_C8_0/pll_inst_0/OUT0 } ]
create_generated_clock -name {Clock_Reset_0/PF_CLK_DIV_C2_0/PF_CLK_DIV_C2_0/I_CD/Y_DIV} -divide_by 4 -source [ get_pins { Clock_Reset_0/PF_CLK_DIV_C2_0/PF_CLK_DIV_C2_0/I_CD/A } ] [ get_pins { Clock_Reset_0/PF_CLK_DIV_C2_0/PF_CLK_DIV_C2_0/I_CD/Y_DIV } ]
create_generated_clock -name {Clock_Reset_0/PF_CLK_DIV_C3_0/PF_CLK_DIV_C3_0/I_CD/Y_DIV} -divide_by 4 -source [ get_pins { Clock_Reset_0/PF_CLK_DIV_C3_0/PF_CLK_DIV_C3_0/I_CD/A } ] [ get_pins { Clock_Reset_0/PF_CLK_DIV_C3_0/PF_CLK_DIV_C3_0/I_CD/Y_DIV } ]
set_false_path -to [ get_cells { Communication_0/UART_Protocol_0/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk*.U_corefifo_async/*/shift_reg* } ]
set_false_path -to [ get_cells { Communication_0/UART_Protocol_1/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk*.U_corefifo_async/*/shift_reg* } ]
set_false_path -to [ get_cells { Communication_0/UART_Protocol_0/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk*.U_corefifo_async/*/shift_reg* } ]
set_false_path -to [ get_cells { Communication_0/UART_Protocol_1/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk*.U_corefifo_async/*/shift_reg* } ]
set_false_path -to [ get_cells { Communication_0/USB_3_Protocol_0/COREFIFO_C7_0/COREFIFO_C7_0/genblk*.U_corefifo_async/*/shift_reg* } ]
set_false_path -to [ get_cells { Communication_0/USB_3_Protocol_0/COREFIFO_C8_0/COREFIFO_C8_0/genblk*.U_corefifo_async/*/shift_reg* } ]
set_false_path -to [ get_cells { Data_Block_0/COREFIFO_C10_0/COREFIFO_C10_0/genblk*.U_corefifo_async/*/shift_reg* } ]
set_false_path -to [ get_cells { Transceiver_Main_0/Transceiver_LanesConnection_0/inst_Transciever_OneLane_0/COREFIFO_C12_0/COREFIFO_C12_0/genblk*.U_corefifo_async/*/shift_reg* } ]
set_false_path -to [ get_cells { Transceiver_Main_0/Transceiver_LanesConnection_0/inst_Transciever_OneLane_1/COREFIFO_C12_0/COREFIFO_C12_0/genblk*.U_corefifo_async/*/shift_reg* } ]
set_false_path -to [ get_cells { Transceiver_Main_0/Transceiver_LanesConnection_0/inst_Transciever_OneLane_0/COREFIFO_C12_0_1/COREFIFO_C12_0/genblk*.U_corefifo_async/*/shift_reg* } ]
set_false_path -to [ get_cells { Transceiver_Main_0/Transceiver_LanesConnection_0/inst_Transciever_OneLane_1/COREFIFO_C12_0_1/COREFIFO_C12_0/genblk*.U_corefifo_async/*/shift_reg* } ]
set_false_path -to [ get_cells { Transceiver_Main_0/Transceiver_LanesConnection_0/inst_Transciever_OneLane_0/COREFIFO_C13_0/COREFIFO_C13_0/genblk*.U_corefifo_async/*/shift_reg* } ]
set_false_path -to [ get_cells { Transceiver_Main_0/Transceiver_LanesConnection_0/inst_Transciever_OneLane_1/COREFIFO_C13_0/COREFIFO_C13_0/genblk*.U_corefifo_async/*/shift_reg* } ]
set_false_path -to [ get_cells { Transceiver_Main_0/Transceiver_LanesConnection_0/inst_Transciever_OneLane_0/COREFIFO_C13_0_0/COREFIFO_C13_0/genblk*.U_corefifo_async/*/shift_reg* } ]
set_false_path -to [ get_cells { Transceiver_Main_0/Transceiver_LanesConnection_0/inst_Transciever_OneLane_1/COREFIFO_C13_0_0/COREFIFO_C13_0/genblk*.U_corefifo_async/*/shift_reg* } ]
