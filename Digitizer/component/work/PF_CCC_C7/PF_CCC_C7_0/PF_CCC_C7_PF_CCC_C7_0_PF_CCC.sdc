set_component PF_CCC_C7_PF_CCC_C7_0_PF_CCC
# Microsemi Corp.
# Date: 2024-Jun-04 14:33:20
#

# Base clock for PLL #0
create_clock -period 25 [ get_pins { pll_inst_0/REF_CLK_0 } ]
create_generated_clock -multiply_by 35 -divide_by 16 -source [ get_pins { pll_inst_0/REF_CLK_0 } ] -phase 0 [ get_pins { pll_inst_0/OUT0 } ]
