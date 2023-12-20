set_component PF_XCVR_ERM_C7_I_XCVR_PF_XCVR
# Microsemi Corp.
# Date: 2023-Dec-19 13:54:03
#

create_clock -period 12.5 [ get_pins { LANE0/REF_CLK_P } ]
create_clock -period 4 [ get_pins { LANE0/TX_CLK_R } ]
create_clock -period 4 [ get_pins { LANE0/RX_CLK_R } ]
