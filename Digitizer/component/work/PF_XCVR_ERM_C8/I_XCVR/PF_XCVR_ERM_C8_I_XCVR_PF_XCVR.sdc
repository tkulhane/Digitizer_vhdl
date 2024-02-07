set_component PF_XCVR_ERM_C8_I_XCVR_PF_XCVR
# Microsemi Corp.
# Date: 2024-Feb-07 15:39:05
#

create_clock -period 6.4 [ get_pins { LANE0/RX_REF_CLK } ]
create_clock -period 6.66667 [ get_pins { LANE0/TX_CLK_R } ]
create_clock -period 6.66667 [ get_pins { LANE0/RX_CLK_R } ]
