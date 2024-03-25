onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_transceiver_main/SYSCLK
add wave -noupdate /tb_transceiver_main/NSYSRESET
add wave -noupdate /tb_transceiver_main/REF_Clock
add wave -noupdate /tb_transceiver_main/CTRL_CLock_40M
add wave -noupdate /tb_transceiver_main/Gen_Enable
add wave -noupdate /tb_transceiver_main/Output_Data_0
add wave -noupdate /tb_transceiver_main/Output_Data_1
add wave -noupdate /tb_transceiver_main/Output_Data_2
add wave -noupdate /tb_transceiver_main/Output_Data_3
add wave -noupdate /tb_transceiver_main/Output_Data_4
add wave -noupdate /tb_transceiver_main/Output_Data_5
add wave -noupdate /tb_transceiver_main/Output_Data_6
add wave -noupdate /tb_transceiver_main/Output_Data_7
add wave -noupdate /tb_transceiver_main/LANE0_P
add wave -noupdate /tb_transceiver_main/LANE0_N
add wave -noupdate /tb_transceiver_main/LANE1_P
add wave -noupdate /tb_transceiver_main/LANE1_N
add wave -noupdate /tb_transceiver_main/CTRL_enable_cmd
add wave -noupdate /tb_transceiver_main/CTRL_write_read
add wave -noupdate /tb_transceiver_main/CTRL_busy
add wave -noupdate /tb_transceiver_main/CTRL_addr_frame
add wave -noupdate /tb_transceiver_main/CTRL_write_data_frame
add wave -noupdate /tb_transceiver_main/CTRL_read_data_frame
add wave -noupdate /tb_transceiver_main/Transceiver_Main_0/Transceiver_LanesConnection_0/SYNCINB
add wave -noupdate /tb_transceiver_main/Transceiver_Main_0/Transceiver_LanesConnection_0/inst_RxMainLinkController/state_reg
add wave -noupdate /tb_transceiver_main/Transceiver_Main_0/Transceiver_LanesConnection_0/inst_RxMainLinkController/TRNV_CTRL_Restart
add wave -noupdate /tb_transceiver_main/Transceiver_Main_0/Transceiver_LanesConnection_0/inst_RxMainLinkController/LANE_CLR_Fault
add wave -noupdate /tb_transceiver_main/Transceiver_Main_0/Transceiver_LanesConnection_0/inst_Transciever_OneLane_0/RxLaneControl_0/state_reg
add wave -noupdate /tb_transceiver_main/Transceiver_Main_0/Transceiver_LanesConnection_0/inst_Transciever_OneLane_1/RxLaneControl_0/state_reg
add wave -noupdate /tb_transceiver_main/AnalyzInCirc_Top_0/Fifo_Write_Enable
add wave -noupdate /tb_transceiver_main/AnalyzInCirc_Top_0/inst_AnalyzInCirc_Controler/Run
add wave -noupdate /tb_transceiver_main/AnalyzInCirc_Top_0/inst_AnalyzInCirc_Controler/Internal_Enable_Reset
add wave -noupdate /tb_transceiver_main/AnalyzInCirc_Top_0/inst_AnalyzInCirc_Controler/REG_TRG_Start
add wave -noupdate /tb_transceiver_main/ANALYZ_write_read
add wave -noupdate /tb_transceiver_main/ANALYZ_write_data_frame
add wave -noupdate /tb_transceiver_main/ANALYZ_Start_Triggers
add wave -noupdate /tb_transceiver_main/ANALYZ_read_data_frame
add wave -noupdate /tb_transceiver_main/ANALYZ_enable_cmd
add wave -noupdate /tb_transceiver_main/ANALYZ_busy
add wave -noupdate /tb_transceiver_main/ANALYZ_addr_frame
add wave -noupdate /tb_transceiver_main/Transceiver_Main_0/Transceiver_LanesConnection_0/inst_Transciever_OneLane_0/PF_XCVR_ERM_C8_0_LANE0_TX_CLK_STABLE
add wave -noupdate /tb_transceiver_main/Transceiver_Main_0/Transceiver_LanesConnection_0/inst_Transciever_OneLane_0/Synchronizer_0_Data_Out
add wave -noupdate /tb_transceiver_main/Transceiver_Main_0/Transceiver_LanesConnection_0/inst_Transciever_OneLane_0/Synchronizer_0_2_Data_Out
add wave -noupdate /tb_transceiver_main/Transceiver_Main_0/Transceiver_LanesConnection_0/inst_Transciever_OneLane_0/PF_XCVR_ERM_C8_0_LANE0_RX_DATA
add wave -noupdate /tb_transceiver_main/Transceiver_Main_0/Transceiver_LanesConnection_0/inst_Transciever_OneLane_0/PF_XCVR_ERM_C8_0_LANE0_8B10B_RX_K
add wave -noupdate /tb_transceiver_main/Transceiver_Main_0/Transceiver_LanesConnection_0/inst_Transciever_OneLane_0/PF_XCVR_ERM_C8_0_LANE0_RX_VAL
add wave -noupdate /tb_transceiver_main/Transceiver_Main_0/Transceiver_LanesConnection_0/inst_Transciever_OneLane_0/PF_XCVR_ERM_C8_0_LANE0_RX_READY
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {28186217 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 201
configure wave -valuecolwidth 100
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
WaveRestoreZoom {0 ps} {358317280 ps}
