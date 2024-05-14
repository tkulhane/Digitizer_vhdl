set_component PF_CCC_C8_PF_CCC_C8_0_PF_CCC
# Microsemi Corp.
# Date: 2024-May-14 14:17:26
#

# Base clock for PLL #0
create_clock -period 25 [ get_pins { pll_inst_0/REF_CLK_0 } ]
create_generated_clock -multiply_by 25 -divide_by 8 -source [ get_pins { pll_inst_0/REF_CLK_0 } ] -phase 0 [ get_pins { pll_inst_0/OUT0 } ]
