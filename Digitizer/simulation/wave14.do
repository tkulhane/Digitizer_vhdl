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
add wave -noupdate /tb_data_block/Input_Data_0_00
add wave -noupdate /tb_data_block/Input_Data_3_00
add wave -noupdate /tb_data_block/Input_Data_2_00
add wave -noupdate /tb_data_block/Input_Data_1_00
add wave -noupdate /tb_data_block/Input_Data_0_01
add wave -noupdate /tb_data_block/Input_Data_3_01
add wave -noupdate /tb_data_block/Input_Data_2_01
add wave -noupdate /tb_data_block/Input_Data_1_01
add wave -noupdate /tb_data_block/Data_Block_0/FIFOs_Reader_0/Event_RAM_W_Address
add wave -noupdate /tb_data_block/Data_Block_0/FIFOs_Reader_0/Sample_RAM_W_Address
add wave -noupdate /tb_data_block/Data_Block_0/FIFOs_Reader_0/Sample_RAM_W_Block_Address
add wave -noupdate /tb_data_block/Data_Block_0/FIFOs_Reader_0/Event_RAM_W_Data_Start_ADDR
add wave -noupdate /tb_data_block/Data_Block_0/FIFOs_Reader_0/Event_RAM_W_Data_Number
add wave -noupdate -radix decimal /tb_data_block/Data_Block_0/FIFOs_Reader_0/Event_RAM_W_Data_Size
add wave -noupdate /tb_data_block/Data_Block_0/FIFOs_Reader_0/Event_RAM_W_Data_Status
add wave -noupdate /tb_data_block/Data_Block_0/FIFOs_Reader_0/Event_FIFO_R_Data
add wave -noupdate /tb_data_block/Data_Block_0/FIFOs_Reader_0/state_reg
add wave -noupdate /tb_data_block/Data_Block_0/FIFOs_Reader_0/Block_0_Sample_FIFO_R_Enable
add wave -noupdate /tb_data_block/Data_Block_0/FIFOs_Reader_0/Block_1_Sample_FIFO_R_Enable
add wave -noupdate /tb_data_block/Data_Block_0/FIFOs_Reader_0/BlockFifo_ReadEnable
add wave -noupdate /tb_data_block/Data_Block_0/FIFOs_Reader_0/BlockF_Counter
add wave -noupdate /tb_data_block/Data_Block_0/FIFOs_Reader_0/BlockF_CounterReset
add wave -noupdate /tb_data_block/Data_Block_0/FIFOs_Reader_0/BlockF_CounterEnable
add wave -noupdate /tb_data_block/Data_Block_0/FIFOs_Reader_0/BlockF_CounterModulo
add wave -noupdate /tb_data_block/Data_Block_0/DataRamManage_0/CountOfSampleWord_Write
add wave -noupdate /tb_data_block/Data_Block_0/DataRamManage_0/CountOfEventWord_Write
add wave -noupdate /tb_data_block/Data_Block_0/DataRamManage_0/CountOfSampleWord_Read
add wave -noupdate /tb_data_block/Data_Block_0/DataRamManage_0/CountOfEventWord_Read
add wave -noupdate /tb_data_block/Data_Block_0/DataRamManage_0/EnableOfWrite
add wave -noupdate -radix decimal /tb_data_block/Data_Block_0/DataRamManage_0/CountOfSampleWord
add wave -noupdate -radix decimal /tb_data_block/Data_Block_0/DataRamManage_0/CountOfSampleWord_xWrite
add wave -noupdate -radix decimal /tb_data_block/Data_Block_0/DataRamManage_0/CountOfSampleWord_xRead
add wave -noupdate /tb_data_block/Data_Block_0/DataRamManage_0/CountOfEventWord
add wave -noupdate /tb_data_block/Data_Block_0/Communication_Builder_0/state_reg
add wave -noupdate /tb_data_block/Data_Block_0/Communication_Builder_0/Sample_RAM_R_Address
add wave -noupdate /tb_data_block/Data_Block_0/FIFOs_Reader_0/Sample_RAM_W_Data
add wave -noupdate /tb_data_block/Data_Block_0/FIFOs_Reader_0/Block_0_Data
add wave -noupdate /tb_data_block/Data_Block_0/FIFOs_Reader_0/Block_1_Data
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {38575000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 418
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
WaveRestoreZoom {17413812 ps} {63560393 ps}
