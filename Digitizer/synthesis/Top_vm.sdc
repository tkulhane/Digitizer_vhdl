# Written by Synplify Pro version map202109act, Build 055R. Synopsys Run ID: sid1703597687 
# Top Level Design Parameters 

# Clocks 
create_clock -period 10.000 -waveform {0.000 5.000} -name {FTDI_CLK} [get_ports {FTDI_CLK}] 
create_clock -period 6.250 -waveform {0.000 3.125} -name {Clock_Reset_0/PF_OSC_C0_0/PF_OSC_C0_0/I_OSC_160/CLK} [get_pins {Clock_Reset_0/PF_OSC_C0_0/PF_OSC_C0_0/I_OSC_160/CLK}] 
create_clock -period 10.000 -waveform {0.000 5.000} -name {PF_CCC_C0_PF_CCC_C0_0_PF_CCC|pll_inst_0_clkint_0_inferred_clock} [get_pins {Clock_Reset_0/PF_CCC_C0_0/PF_CCC_C0_0/pll_inst_0/OUT0}] 
create_clock -period 10.000 -waveform {0.000 5.000} -name {PF_CCC_C0_PF_CCC_C0_0_PF_CCC|pll_inst_0_clkint_4_inferred_clock} [get_pins {Clock_Reset_0/PF_CCC_C0_0/PF_CCC_C0_0/pll_inst_0/OUT1}] 
create_clock -period 10.000 -waveform {0.000 5.000} -name {Top|N_4_inferred_clock} [get_pins {INBUF_DIFF_0_0/Y}] 

# Virtual Clocks 

# Generated Clocks 

# Paths Between Clocks 

# Multicycle Constraints 

# Point-to-point Delay Constraints 

# False Path Constraints 
set_false_path -to [get_cells {Data_Block_0/COREFIFO_C10_0/COREFIFO_C10_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[5] Data_Block_0/COREFIFO_C10_0/COREFIFO_C10_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[4] Data_Block_0/COREFIFO_C10_0/COREFIFO_C10_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[3] Data_Block_0/COREFIFO_C10_0/COREFIFO_C10_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[2] Data_Block_0/COREFIFO_C10_0/COREFIFO_C10_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[1] Data_Block_0/COREFIFO_C10_0/COREFIFO_C10_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[0] Data_Block_0/COREFIFO_C10_0/COREFIFO_C10_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[13] Data_Block_0/COREFIFO_C10_0/COREFIFO_C10_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[12] Data_Block_0/COREFIFO_C10_0/COREFIFO_C10_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[11] Data_Block_0/COREFIFO_C10_0/COREFIFO_C10_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[10] Data_Block_0/COREFIFO_C10_0/COREFIFO_C10_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[9] Data_Block_0/COREFIFO_C10_0/COREFIFO_C10_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[8] Data_Block_0/COREFIFO_C10_0/COREFIFO_C10_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[7] Data_Block_0/COREFIFO_C10_0/COREFIFO_C10_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[6] Data_Block_0/COREFIFO_C10_0/COREFIFO_C10_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync/shift_reg[7] Data_Block_0/COREFIFO_C10_0/COREFIFO_C10_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync/shift_reg[6] Data_Block_0/COREFIFO_C10_0/COREFIFO_C10_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync/shift_reg[5] Data_Block_0/COREFIFO_C10_0/COREFIFO_C10_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync/shift_reg[4] Data_Block_0/COREFIFO_C10_0/COREFIFO_C10_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync/shift_reg[3] Data_Block_0/COREFIFO_C10_0/COREFIFO_C10_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync/shift_reg[2] Data_Block_0/COREFIFO_C10_0/COREFIFO_C10_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync/shift_reg[1] Data_Block_0/COREFIFO_C10_0/COREFIFO_C10_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync/shift_reg[0] Data_Block_0/COREFIFO_C10_0/COREFIFO_C10_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync/shift_reg[13] Data_Block_0/COREFIFO_C10_0/COREFIFO_C10_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync/shift_reg[12] Data_Block_0/COREFIFO_C10_0/COREFIFO_C10_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync/shift_reg[11] Data_Block_0/COREFIFO_C10_0/COREFIFO_C10_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync/shift_reg[10] Data_Block_0/COREFIFO_C10_0/COREFIFO_C10_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync/shift_reg[9] Data_Block_0/COREFIFO_C10_0/COREFIFO_C10_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync/shift_reg[8]}] 
set_false_path -to [get_cells {Communication_0/UART_Protocol_1/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[5] Communication_0/UART_Protocol_1/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[4] Communication_0/UART_Protocol_1/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[3] Communication_0/UART_Protocol_1/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[2] Communication_0/UART_Protocol_1/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[1] Communication_0/UART_Protocol_1/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[0] Communication_0/UART_Protocol_1/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[10] Communication_0/UART_Protocol_1/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[9] Communication_0/UART_Protocol_1/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[8] Communication_0/UART_Protocol_1/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[7] Communication_0/UART_Protocol_1/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[6] Communication_0/UART_Protocol_1/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[10] Communication_0/UART_Protocol_1/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[9] Communication_0/UART_Protocol_1/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[8] Communication_0/UART_Protocol_1/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[7] Communication_0/UART_Protocol_1/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[6] Communication_0/UART_Protocol_1/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[5] Communication_0/UART_Protocol_1/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[4] Communication_0/UART_Protocol_1/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[3] Communication_0/UART_Protocol_1/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[2] Communication_0/UART_Protocol_1/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[1] Communication_0/UART_Protocol_1/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[0]}] 
set_false_path -to [get_cells {Communication_0/UART_Protocol_1/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[9] Communication_0/UART_Protocol_1/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[8] Communication_0/UART_Protocol_1/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[7] Communication_0/UART_Protocol_1/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[6] Communication_0/UART_Protocol_1/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[5] Communication_0/UART_Protocol_1/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[4] Communication_0/UART_Protocol_1/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[3] Communication_0/UART_Protocol_1/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[2] Communication_0/UART_Protocol_1/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[1] Communication_0/UART_Protocol_1/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[0] Communication_0/UART_Protocol_1/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[10] Communication_0/UART_Protocol_1/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[2] Communication_0/UART_Protocol_1/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[1] Communication_0/UART_Protocol_1/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[0] Communication_0/UART_Protocol_1/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[10] Communication_0/UART_Protocol_1/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[9] Communication_0/UART_Protocol_1/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[8] Communication_0/UART_Protocol_1/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[7] Communication_0/UART_Protocol_1/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[6] Communication_0/UART_Protocol_1/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[5] Communication_0/UART_Protocol_1/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[4] Communication_0/UART_Protocol_1/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[3]}] 
set_false_path -to [get_cells {Communication_0/UART_Protocol_0/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[5] Communication_0/UART_Protocol_0/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[4] Communication_0/UART_Protocol_0/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[3] Communication_0/UART_Protocol_0/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[2] Communication_0/UART_Protocol_0/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[1] Communication_0/UART_Protocol_0/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[0] Communication_0/UART_Protocol_0/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[10] Communication_0/UART_Protocol_0/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[9] Communication_0/UART_Protocol_0/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[8] Communication_0/UART_Protocol_0/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[7] Communication_0/UART_Protocol_0/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[6] Communication_0/UART_Protocol_0/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[10] Communication_0/UART_Protocol_0/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[9] Communication_0/UART_Protocol_0/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[8] Communication_0/UART_Protocol_0/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[7] Communication_0/UART_Protocol_0/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[6] Communication_0/UART_Protocol_0/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[5] Communication_0/UART_Protocol_0/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[4] Communication_0/UART_Protocol_0/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[3] Communication_0/UART_Protocol_0/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[2] Communication_0/UART_Protocol_0/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[1] Communication_0/UART_Protocol_0/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[0]}] 
set_false_path -to [get_cells {Communication_0/UART_Protocol_0/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[9] Communication_0/UART_Protocol_0/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[8] Communication_0/UART_Protocol_0/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[7] Communication_0/UART_Protocol_0/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[6] Communication_0/UART_Protocol_0/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[5] Communication_0/UART_Protocol_0/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[4] Communication_0/UART_Protocol_0/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[3] Communication_0/UART_Protocol_0/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[2] Communication_0/UART_Protocol_0/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[1] Communication_0/UART_Protocol_0/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[0] Communication_0/UART_Protocol_0/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[10] Communication_0/UART_Protocol_0/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[2] Communication_0/UART_Protocol_0/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[1] Communication_0/UART_Protocol_0/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[0] Communication_0/UART_Protocol_0/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[10] Communication_0/UART_Protocol_0/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[9] Communication_0/UART_Protocol_0/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[8] Communication_0/UART_Protocol_0/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[7] Communication_0/UART_Protocol_0/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[6] Communication_0/UART_Protocol_0/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[5] Communication_0/UART_Protocol_0/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[4] Communication_0/UART_Protocol_0/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[3]}] 
set_false_path -to [get_cells {Communication_0/USB_3_Protocol_0/COREFIFO_C8_0/COREFIFO_C8_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[4] Communication_0/USB_3_Protocol_0/COREFIFO_C8_0/COREFIFO_C8_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[3] Communication_0/USB_3_Protocol_0/COREFIFO_C8_0/COREFIFO_C8_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[2] Communication_0/USB_3_Protocol_0/COREFIFO_C8_0/COREFIFO_C8_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[1] Communication_0/USB_3_Protocol_0/COREFIFO_C8_0/COREFIFO_C8_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[0] Communication_0/USB_3_Protocol_0/COREFIFO_C8_0/COREFIFO_C8_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[13] Communication_0/USB_3_Protocol_0/COREFIFO_C8_0/COREFIFO_C8_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[12] Communication_0/USB_3_Protocol_0/COREFIFO_C8_0/COREFIFO_C8_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[11] Communication_0/USB_3_Protocol_0/COREFIFO_C8_0/COREFIFO_C8_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[10] Communication_0/USB_3_Protocol_0/COREFIFO_C8_0/COREFIFO_C8_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[9] Communication_0/USB_3_Protocol_0/COREFIFO_C8_0/COREFIFO_C8_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[8] Communication_0/USB_3_Protocol_0/COREFIFO_C8_0/COREFIFO_C8_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[7] Communication_0/USB_3_Protocol_0/COREFIFO_C8_0/COREFIFO_C8_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[6] Communication_0/USB_3_Protocol_0/COREFIFO_C8_0/COREFIFO_C8_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[5] Communication_0/USB_3_Protocol_0/COREFIFO_C8_0/COREFIFO_C8_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync/shift_reg[6] Communication_0/USB_3_Protocol_0/COREFIFO_C8_0/COREFIFO_C8_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync/shift_reg[5] Communication_0/USB_3_Protocol_0/COREFIFO_C8_0/COREFIFO_C8_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync/shift_reg[4] Communication_0/USB_3_Protocol_0/COREFIFO_C8_0/COREFIFO_C8_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync/shift_reg[3] Communication_0/USB_3_Protocol_0/COREFIFO_C8_0/COREFIFO_C8_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync/shift_reg[2] Communication_0/USB_3_Protocol_0/COREFIFO_C8_0/COREFIFO_C8_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync/shift_reg[1] Communication_0/USB_3_Protocol_0/COREFIFO_C8_0/COREFIFO_C8_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync/shift_reg[0] Communication_0/USB_3_Protocol_0/COREFIFO_C8_0/COREFIFO_C8_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync/shift_reg[13] Communication_0/USB_3_Protocol_0/COREFIFO_C8_0/COREFIFO_C8_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync/shift_reg[12] Communication_0/USB_3_Protocol_0/COREFIFO_C8_0/COREFIFO_C8_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync/shift_reg[11] Communication_0/USB_3_Protocol_0/COREFIFO_C8_0/COREFIFO_C8_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync/shift_reg[10] Communication_0/USB_3_Protocol_0/COREFIFO_C8_0/COREFIFO_C8_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync/shift_reg[9] Communication_0/USB_3_Protocol_0/COREFIFO_C8_0/COREFIFO_C8_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync/shift_reg[8] Communication_0/USB_3_Protocol_0/COREFIFO_C8_0/COREFIFO_C8_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync/shift_reg[7]}] 
set_false_path -to [get_cells {Communication_0/USB_3_Protocol_0/COREFIFO_C7_0/COREFIFO_C7_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[3] Communication_0/USB_3_Protocol_0/COREFIFO_C7_0/COREFIFO_C7_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[2] Communication_0/USB_3_Protocol_0/COREFIFO_C7_0/COREFIFO_C7_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[1] Communication_0/USB_3_Protocol_0/COREFIFO_C7_0/COREFIFO_C7_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[0] Communication_0/USB_3_Protocol_0/COREFIFO_C7_0/COREFIFO_C7_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[10] Communication_0/USB_3_Protocol_0/COREFIFO_C7_0/COREFIFO_C7_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[9] Communication_0/USB_3_Protocol_0/COREFIFO_C7_0/COREFIFO_C7_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[8] Communication_0/USB_3_Protocol_0/COREFIFO_C7_0/COREFIFO_C7_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[7] Communication_0/USB_3_Protocol_0/COREFIFO_C7_0/COREFIFO_C7_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[6] Communication_0/USB_3_Protocol_0/COREFIFO_C7_0/COREFIFO_C7_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[5] Communication_0/USB_3_Protocol_0/COREFIFO_C7_0/COREFIFO_C7_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[4] Communication_0/USB_3_Protocol_0/COREFIFO_C7_0/COREFIFO_C7_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[10] Communication_0/USB_3_Protocol_0/COREFIFO_C7_0/COREFIFO_C7_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[9] Communication_0/USB_3_Protocol_0/COREFIFO_C7_0/COREFIFO_C7_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[8] Communication_0/USB_3_Protocol_0/COREFIFO_C7_0/COREFIFO_C7_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[7] Communication_0/USB_3_Protocol_0/COREFIFO_C7_0/COREFIFO_C7_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[6] Communication_0/USB_3_Protocol_0/COREFIFO_C7_0/COREFIFO_C7_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[5] Communication_0/USB_3_Protocol_0/COREFIFO_C7_0/COREFIFO_C7_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[4] Communication_0/USB_3_Protocol_0/COREFIFO_C7_0/COREFIFO_C7_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[3] Communication_0/USB_3_Protocol_0/COREFIFO_C7_0/COREFIFO_C7_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[2] Communication_0/USB_3_Protocol_0/COREFIFO_C7_0/COREFIFO_C7_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[1] Communication_0/USB_3_Protocol_0/COREFIFO_C7_0/COREFIFO_C7_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[0]}] 

# Output Load Constraints 

# Driving Cell Constraints 

# Input Delay Constraints 

# Output Delay Constraints 

# Wire Loads 

# Other Constraints 

# syn_hier Attributes 

# set_case Attributes 

# Clock Delay Constraints 
set_clock_groups -asynchronous -group [get_clocks {PF_CCC_C0_PF_CCC_C0_0_PF_CCC|pll_inst_0_clkint_0_inferred_clock}]
set_clock_groups -asynchronous -group [get_clocks {PF_CCC_C0_PF_CCC_C0_0_PF_CCC|pll_inst_0_clkint_4_inferred_clock}]
set_clock_groups -asynchronous -group [get_clocks {Top|N_4_inferred_clock}]

# syn_mode Attributes 

# Cells 

# Port DRC Rules 

# Input Transition Constraints 

# Unused constraints (intentionally commented out) 


# Non-forward-annotatable constraints (intentionally commented out) 

# Block Path constraints 

