set_component PF_XCVR_ERM_C2_I_XCVR_PF_XCVR
# Microsemi Corp.
# Date: 2023-Aug-09 16:32:29
#

create_clock -period 12.5 [ get_pins { LANE0/RX_REF_CLK } ]
create_clock -period 4 [ get_pins { LANE0/RX_CLK_R } ]
create_clock -period 12.5 [ get_pins { LANE1/RX_REF_CLK } ]
create_clock -period 4 [ get_pins { LANE1/RX_CLK_R } ]
create_clock -period 12.5 [ get_pins { LANE2/RX_REF_CLK } ]
create_clock -period 4 [ get_pins { LANE2/RX_CLK_R } ]
create_clock -period 12.5 [ get_pins { LANE3/RX_REF_CLK } ]
create_clock -period 4 [ get_pins { LANE3/RX_CLK_R } ]
