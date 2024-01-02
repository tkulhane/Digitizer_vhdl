set_component PF_CCC_C4_PF_CCC_C4_0_PF_CCC
# Microsemi Corp.
# Date: 2023-Dec-27 21:29:38
#

# Base clock for PLL #0
create_clock -period 6.25 [ get_pins { pll_inst_0/REF_CLK_0 } ]
create_generated_clock -divide_by 4 -source [ get_pins { pll_inst_0/REF_CLK_0 } ] -phase 0 [ get_pins { pll_inst_0/OUT0 } ]
