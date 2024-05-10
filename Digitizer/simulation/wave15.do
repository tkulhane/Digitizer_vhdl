onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_data_block/SYSCLK
add wave -noupdate /tb_data_block/NSYSRESET
add wave -noupdate /tb_data_block/CTRL_enable_cmd
add wave -noupdate /tb_data_block/CTRL_write_read
add wave -noupdate /tb_data_block/CTRL_busy
add wave -noupdate /tb_data_block/CTRL_addr_frame
add wave -noupdate /tb_data_block/CTRL_write_data_frame
add wave -noupdate /tb_data_block/CTRL_read_data_frame
add wave -noupdate /tb_data_block/Data_Block_0/CtrlBus_HandShake_0/PRH_busy
add wave -noupdate /tb_data_block/Data_Block_0/CtrlBus_HandShake_0/PRH_enable_cmd
add wave -noupdate /tb_data_block/Data_Block_0/CtrlBus_HandShake_0/PRH_write_read
add wave -noupdate /tb_data_block/Data_Block_0/CtrlBus_HandShake_0/PRH_addr_frame
add wave -noupdate /tb_data_block/Data_Block_0/CtrlBus_HandShake_0/PRH_write_data_frame
add wave -noupdate /tb_data_block/Data_Block_0/CtrlBus_HandShake_0/PRH_read_data_frame
add wave -noupdate /tb_data_block/Data_Block_0/CtrlBus_HandShake_0/state_reg
add wave -noupdate /tb_data_block/Data_Block_0/CtrlBus_HandShake_0/Enable_StoreDataW
add wave -noupdate /tb_data_block/Data_Block_0/CtrlBus_HandShake_0/Enable_StoreDataR
add wave -noupdate /tb_data_block/Data_Block_0/CtrlBus_HandShake_0/PRH_busy_sync
add wave -noupdate /tb_data_block/Data_Block_0/CtrlBus_HandShake_0/PRH_enable_cmd_fsm
add wave -noupdate /tb_data_block/Communication_Read
add wave -noupdate /tb_data_block/Communication_Builder_RUN
add wave -noupdate /tb_data_block/Communication_Empty
add wave -noupdate /tb_data_block/Communication_Data_Frame
add wave -noupdate /tb_data_block/Communication_Data_Req
add wave -noupdate /tb_data_block/Control_Fifo_Data
add wave -noupdate /tb_data_block/Control_Fifo_Empty
add wave -noupdate /tb_data_block/Control_Fifo_RE
add wave -noupdate /tb_data_block/TX_Fifo_Full
add wave -noupdate /tb_data_block/TX_Fifo_WE
add wave -noupdate /tb_data_block/TX_Fifo_Data
add wave -noupdate /tb_data_block/Data_Valid
add wave -noupdate /tb_data_block/data_for_store
add wave -noupdate /tb_data_block/Input_Data_0_00
add wave -noupdate /tb_data_block/Input_Data_3_00
add wave -noupdate /tb_data_block/Input_Data_2_00
add wave -noupdate /tb_data_block/Input_Data_1_00
add wave -noupdate /tb_data_block/Input_Data_0_01
add wave -noupdate /tb_data_block/Input_Data_3_01
add wave -noupdate /tb_data_block/Input_Data_2_01
add wave -noupdate /tb_data_block/Input_Data_1_01
add wave -noupdate /tb_data_block/state_reg
add wave -noupdate /tb_data_block/next_state
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {255223 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 411
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
WaveRestoreZoom {187639 ps} {468345 ps}
