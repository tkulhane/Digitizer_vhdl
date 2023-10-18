set_component PF_CCC_C3_PF_CCC_C3_0_PF_CCC
# Microsemi Corp.
# Date: 2023-Oct-09 10:21:04
#

# Base clock for PLL #0
create_clock -period 6.25 [ get_pins { pll_inst_0/REF_CLK_0 } ]
create_generated_clock -multiply_by 96 -divide_by 125 -source [ get_pins { pll_inst_0/REF_CLK_0 } ] -phase 0 [ get_pins { pll_inst_0/OUT0 } ]
