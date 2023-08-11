set_component PF_XCVR_ERM_C1_I_XCVR_PF_XCVR
# Microsemi Corp.
# Date: 2023-Aug-07 14:16:23
#

create_clock -period 10 [ get_pins { LANE0/REF_CLK_P } ]
create_clock -period 8 [ get_pins { LANE0/RX_CLK_R } ]
