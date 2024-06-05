set_component PF_CCC_C9_PF_CCC_C9_0_PF_CCC
# Microsemi Corp.
# Date: 2024-Jun-04 11:56:00
#

# Base clock for PLL #0
create_clock -period 6.4 [ get_pins { pll_inst_0/REF_CLK_0 } ]
create_generated_clock -multiply_by 619 -divide_by 2418 -source [ get_pins { pll_inst_0/REF_CLK_0 } ] -phase 0 [ get_pins { pll_inst_0/OUT0 } ]
