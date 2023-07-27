set_component PF_XCVR_ERM_C0_I_XCVR_PF_XCVR
# Microsemi Corp.
# Date: 2023-Jul-24 11:40:43
#

create_clock -period 12.5 [ get_pins { LANE0/REF_CLK_P } ]
create_clock -period 8 [ get_pins { LANE0/RX_CLK_R } ]
