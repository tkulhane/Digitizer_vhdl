set_component PF_TX_PLL_C0_PF_TX_PLL_C0_0_PF_TX_PLL
# Microsemi Corp.
# Date: 2023-Aug-28 20:43:20
#

create_clock -period 6.4 [ get_pins { txpll_isnt_0/REF_CLK_P } ]
create_clock -period 8 [ get_pins { txpll_isnt_0/DIV_CLK } ]
