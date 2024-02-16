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
add wave -noupdate /tb_data_block/Data_Block_0/Communication_Builder_0/wait_next_state_store
add wave -noupdate /tb_data_block/Data_Block_0/Communication_Builder_0/wait_next_state
add wave -noupdate /tb_data_block/Data_Block_0/Communication_Builder_0/state_reg
add wave -noupdate /tb_data_block/Data_Block_0/Communication_Builder_0/Sample_Buffer_Store
add wave -noupdate /tb_data_block/Data_Block_0/Communication_Builder_0/Read_Sample_3
add wave -noupdate /tb_data_block/Data_Block_0/Communication_Builder_0/Read_Sample_2
add wave -noupdate /tb_data_block/Data_Block_0/Communication_Builder_0/Read_Sample_1
add wave -noupdate /tb_data_block/Data_Block_0/Communication_Builder_0/Read_Sample_0
add wave -noupdate /tb_data_block/Data_Block_0/Communication_Builder_0/Sample_RAM_R_Address
add wave -noupdate /tb_data_block/Data_Block_0/Communication_Builder_0/Event_RAM_R_Data_Status
add wave -noupdate /tb_data_block/Data_Block_0/Communication_Builder_0/Event_RAM_R_Data_Start_ADDR
add wave -noupdate /tb_data_block/Data_Block_0/Communication_Builder_0/Event_RAM_R_Data_Size
add wave -noupdate /tb_data_block/Data_Block_0/Communication_Builder_0/Event_RAM_ADDR_GEN_Enable
add wave -noupdate /tb_data_block/Data_Block_0/Trigger_Top_Part_0/Trigger_Main_0/TRG_Threshold
add wave -noupdate /tb_data_block/Data_Block_0/Trigger_Top_Part_0/Trigger_Main_0/Trigger_Edge_Valid
add wave -noupdate /tb_data_block/Data_Block_0/Trigger_Top_Part_0/Trigger_Main_0/state_reg
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {108029784 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 484
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
WaveRestoreZoom {0 ps} {309546880 ps}
