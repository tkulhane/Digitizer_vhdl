set_component PF_XCVR_ERM_C8_I_XCVR_PF_XCVR
# Microsemi Corp.
# Date: 2024-May-29 15:12:00
#

create_clock -period 12.5 [ get_pins { LANE0/RX_REF_CLK } ]
create_clock -period 8 [ get_pins { LANE0/TX_CLK_R } ]
create_clock -period 8 [ get_pins { LANE0/RX_CLK_R } ]
