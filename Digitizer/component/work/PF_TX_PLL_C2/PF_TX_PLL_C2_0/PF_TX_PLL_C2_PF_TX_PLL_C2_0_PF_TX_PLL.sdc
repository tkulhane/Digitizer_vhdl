set_component PF_TX_PLL_C2_PF_TX_PLL_C2_0_PF_TX_PLL
# Microsemi Corp.
# Date: 2024-Jun-05 17:37:57
#

create_clock -period 8 [ get_pins { txpll_isnt_0/FAB_REF_CLK } ]
create_clock -period 8 [ get_pins { txpll_isnt_0/DIV_CLK } ]
