set_component PF_XCVR_ERM_C6_I_XCVR_PF_XCVR
# Microsemi Corp.
# Date: 2023-Dec-11 17:19:56
#

create_clock -period 12.5 [ get_pins { LANE0/REF_CLK_P } ]
create_clock -period 4 [ get_pins { LANE0/TX_CLK_R } ]
create_clock -period 4 [ get_pins { LANE0/RX_CLK_R } ]
