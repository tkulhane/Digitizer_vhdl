set_component PF_TX_PLL_C1_PF_TX_PLL_C1_0_PF_TX_PLL
# Microsemi Corp.
# Date: 2024-Feb-07 15:39:40
#

create_clock -period 6.4 [ get_pins { txpll_isnt_0/FAB_REF_CLK } ]
create_clock -period 8 [ get_pins { txpll_isnt_0/DIV_CLK } ]
