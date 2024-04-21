set_component PF_XCVR_ERM_C9_I_XCVR_PF_XCVR
# Microsemi Corp.
# Date: 2024-Apr-09 16:59:47
#

create_clock -period 8 [ get_pins { LANE0/REF_CLK_P } ]
create_clock -period 8 [ get_pins { LANE0/TX_CLK_R } ]
create_clock -period 8 [ get_pins { LANE0/RX_CLK_R } ]
