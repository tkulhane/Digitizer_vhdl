set_component PF_CCC_C0_PF_CCC_C0_0_PF_CCC
# Microsemi Corp.
# Date: 2023-May-16 14:47:16
#

# Base clock for PLL #0
create_clock -period 6.25 [ get_pins { pll_inst_0/REF_CLK_0 } ]
create_generated_clock -divide_by 16 -source [ get_pins { pll_inst_0/REF_CLK_0 } ] -phase 0 [ get_pins { pll_inst_0/OUT0 } ]
create_generated_clock -multiply_by 11 -divide_by 320 -source [ get_pins { pll_inst_0/REF_CLK_0 } ] -phase 0 [ get_pins { pll_inst_0/OUT1 } ]
