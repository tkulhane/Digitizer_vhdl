set_component PF_XCVR_ERM_C8_I_XCVR_PF_XCVR
# Microsemi Corp.
# Date: 2024-Jun-04 13:21:05
#

create_clock -period 8 [ get_pins { LANE0/RX_REF_CLK } ]
create_clock -period 11.4286 [ get_pins { LANE0/TX_CLK_R } ]
create_clock -period 11.4286 [ get_pins { LANE0/RX_CLK_R } ]
