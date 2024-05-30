set_component PF_CCC_C8_PF_CCC_C8_0_PF_CCC
# Microsemi Corp.
# Date: 2024-May-30 13:19:28
#

# Base clock for PLL #0
create_clock -period 25 [ get_pins { pll_inst_0/REF_CLK_0 } ]
create_generated_clock -multiply_by 125 -divide_by 32 -source [ get_pins { pll_inst_0/REF_CLK_0 } ] -phase 0 [ get_pins { pll_inst_0/OUT0 } ]
