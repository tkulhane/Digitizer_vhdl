set_component PF_CCC_C2_PF_CCC_C2_0_PF_CCC
# Microsemi Corp.
# Date: 2023-Aug-28 10:52:33
#

# Base clock for PLL #0
create_clock -period 6.25 [ get_pins { pll_inst_0/REF_CLK_0 } ]
create_generated_clock -multiply_by 125 -divide_by 128 -source [ get_pins { pll_inst_0/REF_CLK_0 } ] -phase 0 [ get_pins { pll_inst_0/OUT0 } ]
