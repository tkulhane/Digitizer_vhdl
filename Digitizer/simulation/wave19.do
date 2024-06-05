onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_transceiver_main/SYSCLK
add wave -noupdate /tb_transceiver_main/NSYSRESET
add wave -noupdate /tb_transceiver_main/REF_Clock
add wave -noupdate /tb_transceiver_main/CTRL_CLock_40M
add wave -noupdate /tb_transceiver_main/REF_Reset_N
add wave -noupdate /tb_transceiver_main/Gen_Enable
add wave -noupdate /tb_transceiver_main/SYNCINB
add wave -noupdate /tb_transceiver_main/AlignmentFifo_Read_Out
add wave -noupdate /tb_transceiver_main/LANE_RXD_N
add wave -noupdate /tb_transceiver_main/LANE_RXD_P
add wave -noupdate /tb_transceiver_main/LANE_TXD_N
add wave -noupdate /tb_transceiver_main/LANE_TXD_P
add wave -noupdate /tb_transceiver_main/Output_Data
add wave -noupdate /tb_transceiver_main/CTRL_enable_cmd
add wave -noupdate /tb_transceiver_main/CTRL_write_read
add wave -noupdate /tb_transceiver_main/CTRL_busy
add wave -noupdate /tb_transceiver_main/CTRL_addr_frame
add wave -noupdate /tb_transceiver_main/CTRL_write_data_frame
add wave -noupdate /tb_transceiver_main/CTRL_read_data_frame
add wave -noupdate /tb_transceiver_main/Transceiver_Rx_Data_xxx
add wave -noupdate /tb_transceiver_main/Transceiver_Rx_K_xxx
add wave -noupdate /tb_transceiver_main/AlignmentFifo_Rx_Data_xxx
add wave -noupdate /tb_transceiver_main/Transceiver_Main_0/Transceiver_LanesConnection_0/LanesConn_GEN(0)/inst_Transciever_OneLane_1/TxLaneControl_0_Output_Data
add wave -noupdate /tb_transceiver_main/Transceiver_Main_0/Transceiver_LanesConnection_0/LanesConn_GEN(0)/inst_Transciever_OneLane_1/TxLaneControl_0_Output_K
add wave -noupdate /tb_transceiver_main/Transceiver_Main_0/Transceiver_LanesConnection_0/LanesConn_GEN(0)/inst_Transciever_OneLane_1/PF_XCVR_ERM_C8_0_LANE0_8B10B_RX_K
add wave -noupdate /tb_transceiver_main/Transceiver_Main_0/Transceiver_LanesConnection_0/LanesConn_GEN(0)/inst_Transciever_OneLane_1/PF_XCVR_ERM_C8_0_LANE0_RX_DATA
add wave -noupdate /tb_transceiver_main/Transceiver_Main_0/Transceiver_LanesConnection_0/LanesConn_GEN(0)/inst_Transciever_OneLane_1/PF_XCVR_ERM_C8_0_LANE0_RX_CLK_R
add wave -noupdate /tb_transceiver_main/Transceiver_Main_0/Transceiver_LanesConnection_0/LanesConn_GEN(0)/inst_Transciever_OneLane_1/PF_XCVR_ERM_C8_0_LANE0_RX_READY
add wave -noupdate /tb_transceiver_main/Transceiver_Main_0/Transceiver_LanesConnection_0/LanesConn_GEN(0)/inst_Transciever_OneLane_1/PF_XCVR_ERM_C8_0_LANE0_RX_VAL
add wave -noupdate /tb_transceiver_main/Transceiver_Main_0/Transceiver_LanesConnection_0/InputData_Array
add wave -noupdate /tb_transceiver_main/Transceiver_Main_0/Transceiver_LanesConnection_0/TestDataSamples_Array
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {134017375 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 212
configure wave -valuecolwidth 155
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {15583389 ps} {362661326 ps}
