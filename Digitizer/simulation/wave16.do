onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_clockreset/SYSCLK
add wave -noupdate /tb_clockreset/NSYSRESET
add wave -noupdate /tb_clockreset/CTRL_enable_cmd
add wave -noupdate /tb_clockreset/CTRL_write_read
add wave -noupdate /tb_clockreset/CTRL_busy
add wave -noupdate /tb_clockreset/CTRL_addr_frame
add wave -noupdate /tb_clockreset/CTRL_write_data_frame
add wave -noupdate /tb_clockreset/CTRL_read_data_frame
add wave -noupdate /tb_clockreset/EXT_RST_N
add wave -noupdate /tb_clockreset/ClockInput_ExtHMC
add wave -noupdate /tb_clockreset/ClockInput_Ext1
add wave -noupdate /tb_clockreset/ClockInput_Ext2
add wave -noupdate /tb_clockreset/Main_CLOCK
add wave -noupdate /tb_clockreset/Main_RESET_N
add wave -noupdate /tb_clockreset/UART_CLOCK
add wave -noupdate /tb_clockreset/UART_RESER_N
add wave -noupdate /tb_clockreset/HMC_CLK
add wave -noupdate /tb_clockreset/XCVR_CTRL_Clock_40M
add wave -noupdate /tb_clockreset/Clock_LogicData
add wave -noupdate /tb_clockreset/Reset_N_LogicData
add wave -noupdate /tb_clockreset/Reset_N_XcvrRef
add wave -noupdate /tb_clockreset/Clock_XcvrRef
add wave -noupdate /tb_clockreset/Clock_Reset_0/Clock_Controller_0/state_reg
add wave -noupdate /tb_clockreset/Clock_Reset_0/Clock_Controller_0/write_signal
add wave -noupdate /tb_clockreset/Clock_Reset_0/Clock_Controller_0/read_signal
add wave -noupdate /tb_clockreset/Clock_Reset_0/Clock_Controller_0/REG_SwitchSelect_Logic
add wave -noupdate /tb_clockreset/Clock_Reset_0/Clock_Controller_0/REG_SwitchSelect_Ref
add wave -noupdate /tb_clockreset/Clock_Reset_0/Clock_Switch_0/state_reg
add wave -noupdate -radix unsigned /tb_clockreset/Clock_Reset_0/Clock_Switch_0/fsm_timer
add wave -noupdate /tb_clockreset/Clock_Reset_0/Clock_Switch_0/SwitchEnable
add wave -noupdate /tb_clockreset/Clock_Reset_0/Clock_Switch_0/SwitchSelect
add wave -noupdate /tb_clockreset/Clock_Reset_0/Clock_Switch_0/MuxEnable
add wave -noupdate /tb_clockreset/Clock_Reset_0/Clock_Switch_0/MUX_select_Register
add wave -noupdate /tb_clockreset/Clock_Reset_0/Clock_Switch_0/PLL_Lock
add wave -noupdate /tb_clockreset/Clock_Reset_0/Clock_Switch_0/FSM_Reset_N
add wave -noupdate /tb_clockreset/Clock_Reset_0/Clock_Switch_0/FSM_PLL_PWR_DOWN
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {6075594 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 422
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
WaveRestoreZoom {0 ps} {820328624 ps}
