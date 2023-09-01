set_component PF_XCVR_ERM_C5_I_XCVR_PF_XCVR
# Microsemi Corp.
# Date: 2023-Aug-28 20:50:50
#

create_clock -period 6.4 [ get_pins { LANE0/REF_CLK_P } ]
create_clock -period 8 [ get_pins { LANE0/TX_CLK_R } ]
create_clock -period 8 [ get_pins { LANE0/RX_CLK_R } ]
create_clock -period 6.4 [ get_pins { LANE1/REF_CLK_P } ]
create_clock -period 8 [ get_pins { LANE1/TX_CLK_R } ]
create_clock -period 8 [ get_pins { LANE1/RX_CLK_R } ]
