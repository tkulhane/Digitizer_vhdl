onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_ext_signals/SYSCLK
add wave -noupdate /tb_ext_signals/NSYSRESET
add wave -noupdate /tb_ext_signals/EIO_PAD_9
add wave -noupdate /tb_ext_signals/EIO_PAD_8
add wave -noupdate /tb_ext_signals/EIO_PAD_7
add wave -noupdate /tb_ext_signals/EIO_PAD_6
add wave -noupdate /tb_ext_signals/EIO_PAD_5
add wave -noupdate /tb_ext_signals/EIO_PAD_4
add wave -noupdate /tb_ext_signals/EIO_PAD_3
add wave -noupdate /tb_ext_signals/EIO_PAD_2
add wave -noupdate /tb_ext_signals/EIO_PAD_1
add wave -noupdate /tb_ext_signals/EIO_PAD_0
add wave -noupdate /tb_ext_signals/CTRL_enable_cmd
add wave -noupdate /tb_ext_signals/CTRL_write_read
add wave -noupdate /tb_ext_signals/CTRL_busy
add wave -noupdate /tb_ext_signals/CTRL_addr_frame
add wave -noupdate /tb_ext_signals/CTRL_write_data_frame
add wave -noupdate /tb_ext_signals/CTRL_read_data_frame
add wave -noupdate /tb_ext_signals/EXT_OutputsVectorSignals
add wave -noupdate /tb_ext_signals/EXT_InputsVectorSignals
add wave -noupdate /tb_ext_signals/EXT_Signals_0/EXT_Signals_Controller_0/CMD_EXT_SIGNALS_ADDR_BASE_INPUTS_SEL
add wave -noupdate /tb_ext_signals/EXT_Signals_0/EXT_Signals_Controller_0/CMD_EXT_SIGNALS_ADDR_BASE_OUTPUTS_SEL
add wave -noupdate /tb_ext_signals/EXT_Signals_0/EXT_Signals_Controller_0/CMD_EXT_SIGNALS_ADDR_BASE_OUTPUTS_ENABLE
add wave -noupdate -radix decimal -childformat {{/tb_ext_signals/EXT_Signals_0/EXT_Signals_OutputSwitch_0/EXT_Select_array(0) -radix decimal} {/tb_ext_signals/EXT_Signals_0/EXT_Signals_OutputSwitch_0/EXT_Select_array(1) -radix decimal} {/tb_ext_signals/EXT_Signals_0/EXT_Signals_OutputSwitch_0/EXT_Select_array(2) -radix decimal} {/tb_ext_signals/EXT_Signals_0/EXT_Signals_OutputSwitch_0/EXT_Select_array(3) -radix decimal} {/tb_ext_signals/EXT_Signals_0/EXT_Signals_OutputSwitch_0/EXT_Select_array(4) -radix decimal} {/tb_ext_signals/EXT_Signals_0/EXT_Signals_OutputSwitch_0/EXT_Select_array(5) -radix decimal} {/tb_ext_signals/EXT_Signals_0/EXT_Signals_OutputSwitch_0/EXT_Select_array(6) -radix decimal} {/tb_ext_signals/EXT_Signals_0/EXT_Signals_OutputSwitch_0/EXT_Select_array(7) -radix decimal} {/tb_ext_signals/EXT_Signals_0/EXT_Signals_OutputSwitch_0/EXT_Select_array(8) -radix decimal} {/tb_ext_signals/EXT_Signals_0/EXT_Signals_OutputSwitch_0/EXT_Select_array(9) -radix decimal}} -expand -subitemconfig {/tb_ext_signals/EXT_Signals_0/EXT_Signals_OutputSwitch_0/EXT_Select_array(0) {-radix decimal} /tb_ext_signals/EXT_Signals_0/EXT_Signals_OutputSwitch_0/EXT_Select_array(1) {-radix decimal} /tb_ext_signals/EXT_Signals_0/EXT_Signals_OutputSwitch_0/EXT_Select_array(2) {-radix decimal} /tb_ext_signals/EXT_Signals_0/EXT_Signals_OutputSwitch_0/EXT_Select_array(3) {-radix decimal} /tb_ext_signals/EXT_Signals_0/EXT_Signals_OutputSwitch_0/EXT_Select_array(4) {-radix decimal} /tb_ext_signals/EXT_Signals_0/EXT_Signals_OutputSwitch_0/EXT_Select_array(5) {-radix decimal} /tb_ext_signals/EXT_Signals_0/EXT_Signals_OutputSwitch_0/EXT_Select_array(6) {-radix decimal} /tb_ext_signals/EXT_Signals_0/EXT_Signals_OutputSwitch_0/EXT_Select_array(7) {-radix decimal} /tb_ext_signals/EXT_Signals_0/EXT_Signals_OutputSwitch_0/EXT_Select_array(8) {-radix decimal} /tb_ext_signals/EXT_Signals_0/EXT_Signals_OutputSwitch_0/EXT_Select_array(9) {-radix decimal}} /tb_ext_signals/EXT_Signals_0/EXT_Signals_OutputSwitch_0/EXT_Select_array
add wave -noupdate /tb_ext_signals/EXT_Signals_0/EXT_Signals_OutputSwitch_0/IO_Block_D
add wave -noupdate -expand /tb_ext_signals/EXT_Signals_0/EXT_Signals_OutputSwitch_0/IO_Block_E
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {4155724 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 246
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
WaveRestoreZoom {0 ps} {27394972 ps}
