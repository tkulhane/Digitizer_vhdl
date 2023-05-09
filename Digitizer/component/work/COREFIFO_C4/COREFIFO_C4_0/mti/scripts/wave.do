onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /testbench/uut_fifo/RESET_N
add wave -noupdate /testbench/uut_fifo/WCLOCK
add wave -noupdate /testbench/uut_fifo/WE
add wave -noupdate /testbench/uut_fifo/DATA
add wave -noupdate /testbench/uut_fifo/FULL
add wave -noupdate /testbench/uut_fifo/AFULL
add wave -noupdate /testbench/uut_fifo/WACK
add wave -noupdate /testbench/uut_fifo/OVERFLOW
add wave -noupdate /testbench/uut_fifo/RCLOCK
add wave -noupdate /testbench/uut_fifo/RE
add wave -noupdate /testbench/uut_fifo/Q
add wave -noupdate /testbench/uut_fifo/DVLD
add wave -noupdate /testbench/uut_fifo/EMPTY
add wave -noupdate /testbench/uut_fifo/AEMPTY
add wave -noupdate /testbench/uut_fifo/RDCNT
add wave -noupdate /testbench/uut_fifo/UNDERFLOW
add wave -noupdate /testbench/uut_fifo/MEMWE
add wave -noupdate /testbench/uut_fifo/MEMWD
add wave -noupdate /testbench/uut_fifo/MEMWADDR
add wave -noupdate /testbench/uut_fifo/MEMRE
add wave -noupdate /testbench/uut_fifo/MEMRD
add wave -noupdate /testbench/uut_fifo/MEMRADDR
add wave -noupdate /testbench/reset
add wave -noupdate /testbench/wclk
add wave -noupdate /testbench/we
add wave -noupdate /testbench/wdata
add wave -noupdate /testbench/full
add wave -noupdate /testbench/afull
add wave -noupdate /testbench/overflow
add wave -noupdate /testbench/wrcount
add wave -noupdate /testbench/rclk
add wave -noupdate /testbench/re
add wave -noupdate /testbench/rdata
add wave -noupdate /testbench/empty
add wave -noupdate /testbench/aempty
add wave -noupdate /testbench/dvld
add wave -noupdate /testbench/rdcount
add wave -noupdate /testbench/clk
add wave -noupdate /testbench/err_cnt
add wave -noupdate /testbench/ext_waddr
add wave -noupdate /testbench/ext_raddr
add wave -noupdate /testbench/ext_data
add wave -noupdate /testbench/ext_rd
add wave -noupdate /testbench/ext_we
add wave -noupdate /testbench/ext_re
add wave -noupdate /testbench/int_waddr
add wave -noupdate /testbench/int_raddr
add wave -noupdate /testbench/int_data
add wave -noupdate /testbench/int_rd
add wave -noupdate /testbench/int_we
add wave -noupdate /testbench/int_re
add wave -noupdate /testbench/monitor/wack_r
add wave -noupdate /testbench/monitor/tb_wcnt
add wave -noupdate /testbench/monitor/tb_wack
add wave -noupdate /testbench/monitor/tb_underflow
add wave -noupdate /testbench/monitor/tb_rcnt
add wave -noupdate /testbench/monitor/tb_overflow
add wave -noupdate /testbench/monitor/tb_empty
add wave -noupdate /testbench/monitor/tb_dvld
add wave -noupdate /testbench/monitor/tb_full
add wave -noupdate /testbench/monitor/tb_afull
add wave -noupdate /testbench/monitor/tb_aempty
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {32473187607 fs} 0}
quietly wave cursor active 1
configure wave -namecolwidth 524
configure wave -valuecolwidth 60
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
configure wave -timelineunits fs
update
WaveRestoreZoom {30291784830 fs} {35134349071 fs}
