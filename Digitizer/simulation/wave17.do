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
add wave -noupdate /tb_ext_signals/EXT_Signals_0/EXT_Signals_InputSwitch_0/EXT_Select_array
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {7266658 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 266
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
WaveRestoreZoom {63228 ps} {40952063 ps}
