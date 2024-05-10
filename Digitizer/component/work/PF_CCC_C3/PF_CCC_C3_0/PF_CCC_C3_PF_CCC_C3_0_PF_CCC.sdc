set_component PF_CCC_C3_PF_CCC_C3_0_PF_CCC
# Microsemi Corp.
# Date: 2024-May-10 15:20:24
#

# Base clock for PLL #0
create_clock -period 6.25 [ get_pins { pll_inst_0/REF_CLK_0 } ]
create_generated_clock -multiply_by 5 -divide_by 8 -source [ get_pins { pll_inst_0/REF_CLK_0 } ] -phase 0 [ get_pins { pll_inst_0/OUT0 } ]
