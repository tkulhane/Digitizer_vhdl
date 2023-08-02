# Written by Synplify Pro version map202109act, Build 055R. Synopsys Run ID: sid1690988302 
# Top Level Design Parameters 

# Clocks 
create_clock -period 6.250 -waveform {0.000 3.125} -name {Clock_Reset_0/PF_OSC_C0_0/PF_OSC_C0_0/I_OSC_160/CLK} [get_pins {Clock_Reset_0/PF_OSC_C0_0/PF_OSC_C0_0/I_OSC_160/CLK}] 
create_clock -period 10.000 -waveform {0.000 5.000} -name {Top|FTDI_CLK} [get_ports {FTDI_CLK}] 
create_clock -period 10.000 -waveform {0.000 5.000} -name {Synchronizer_1|Chain_inferred_clock[1]} [get_pins {USB_3_Protocol_0/Synchronizer_0/Chain[1]/Q}] 
create_clock -period 10.000 -waveform {0.000 5.000} -name {PF_CCC_C0_PF_CCC_C0_0_PF_CCC|pll_inst_0_clkint_4_inferred_clock} [get_pins {Clock_Reset_0/PF_CCC_C0_0/PF_CCC_C0_0/pll_inst_0/OUT1}] 

# Virtual Clocks 

# Generated Clocks 
create_generated_clock -name {Clock_Reset_0/PF_CCC_C0_0/PF_CCC_C0_0/pll_inst_0/OUT0} -divide_by {16} -source [get_pins {Clock_Reset_0/PF_CCC_C0_0/PF_CCC_C0_0/pll_inst_0/REF_CLK_0}]  [get_pins {Clock_Reset_0/PF_CCC_C0_0/PF_CCC_C0_0/pll_inst_0/OUT0}] 

# Paths Between Clocks 

# Multicycle Constraints 

# Point-to-point Delay Constraints 

# False Path Constraints 
set_false_path -to [get_cells {UART_Protocol_0/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[5] UART_Protocol_0/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[4] UART_Protocol_0/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[3] UART_Protocol_0/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[2] UART_Protocol_0/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[1] UART_Protocol_0/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[0] UART_Protocol_0/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[10] UART_Protocol_0/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[9] UART_Protocol_0/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[8] UART_Protocol_0/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[7] UART_Protocol_0/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[6] UART_Protocol_0/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[10] UART_Protocol_0/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[9] UART_Protocol_0/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[8] UART_Protocol_0/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[7] UART_Protocol_0/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[6] UART_Protocol_0/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[5] UART_Protocol_0/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[4] UART_Protocol_0/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[3] UART_Protocol_0/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[2] UART_Protocol_0/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[1] UART_Protocol_0/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[0]}] 
set_false_path -to [get_cells {UART_Protocol_0/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[6] UART_Protocol_0/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[5] UART_Protocol_0/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[4] UART_Protocol_0/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[3] UART_Protocol_0/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[2] UART_Protocol_0/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[1] UART_Protocol_0/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[0] UART_Protocol_0/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[10] UART_Protocol_0/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[9] UART_Protocol_0/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[8] UART_Protocol_0/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[7] UART_Protocol_0/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[10] UART_Protocol_0/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[9] UART_Protocol_0/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[8] UART_Protocol_0/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[7] UART_Protocol_0/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[6] UART_Protocol_0/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[5] UART_Protocol_0/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[4] UART_Protocol_0/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[3] UART_Protocol_0/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[2] UART_Protocol_0/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[1] UART_Protocol_0/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[0]}] 
set_false_path -to [get_cells {UART_Protocol_1/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[5] UART_Protocol_1/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[4] UART_Protocol_1/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[3] UART_Protocol_1/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[2] UART_Protocol_1/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[1] UART_Protocol_1/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[0] UART_Protocol_1/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[10] UART_Protocol_1/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[9] UART_Protocol_1/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[8] UART_Protocol_1/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[7] UART_Protocol_1/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[6] UART_Protocol_1/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[10] UART_Protocol_1/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[9] UART_Protocol_1/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[8] UART_Protocol_1/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[7] UART_Protocol_1/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[6] UART_Protocol_1/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[5] UART_Protocol_1/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[4] UART_Protocol_1/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[3] UART_Protocol_1/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[2] UART_Protocol_1/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[1] UART_Protocol_1/COREFIFO_C0_inst_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[0]}] 
set_false_path -to [get_cells {UART_Protocol_1/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[6] UART_Protocol_1/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[5] UART_Protocol_1/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[4] UART_Protocol_1/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[3] UART_Protocol_1/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[2] UART_Protocol_1/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[1] UART_Protocol_1/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[0] UART_Protocol_1/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[10] UART_Protocol_1/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[9] UART_Protocol_1/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[8] UART_Protocol_1/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[7] UART_Protocol_1/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[10] UART_Protocol_1/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[9] UART_Protocol_1/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[8] UART_Protocol_1/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[7] UART_Protocol_1/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[6] UART_Protocol_1/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[5] UART_Protocol_1/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[4] UART_Protocol_1/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[3] UART_Protocol_1/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[2] UART_Protocol_1/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[1] UART_Protocol_1/COREFIFO_C0_0_0/COREFIFO_C0_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync_fwft/shift_reg[0]}] 
set_false_path -to [get_cells {USB_3_Protocol_0/COREFIFO_C7_0/COREFIFO_C7_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[7] USB_3_Protocol_0/COREFIFO_C7_0/COREFIFO_C7_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[6] USB_3_Protocol_0/COREFIFO_C7_0/COREFIFO_C7_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[5] USB_3_Protocol_0/COREFIFO_C7_0/COREFIFO_C7_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[4] USB_3_Protocol_0/COREFIFO_C7_0/COREFIFO_C7_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[3] USB_3_Protocol_0/COREFIFO_C7_0/COREFIFO_C7_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[2] USB_3_Protocol_0/COREFIFO_C7_0/COREFIFO_C7_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[1] USB_3_Protocol_0/COREFIFO_C7_0/COREFIFO_C7_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[0] USB_3_Protocol_0/COREFIFO_C7_0/COREFIFO_C7_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[10] USB_3_Protocol_0/COREFIFO_C7_0/COREFIFO_C7_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[9] USB_3_Protocol_0/COREFIFO_C7_0/COREFIFO_C7_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[8] USB_3_Protocol_0/COREFIFO_C7_0/COREFIFO_C7_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync/shift_reg[0] USB_3_Protocol_0/COREFIFO_C7_0/COREFIFO_C7_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync/shift_reg[10] USB_3_Protocol_0/COREFIFO_C7_0/COREFIFO_C7_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync/shift_reg[9] USB_3_Protocol_0/COREFIFO_C7_0/COREFIFO_C7_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync/shift_reg[8] USB_3_Protocol_0/COREFIFO_C7_0/COREFIFO_C7_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync/shift_reg[7] USB_3_Protocol_0/COREFIFO_C7_0/COREFIFO_C7_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync/shift_reg[6] USB_3_Protocol_0/COREFIFO_C7_0/COREFIFO_C7_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync/shift_reg[5] USB_3_Protocol_0/COREFIFO_C7_0/COREFIFO_C7_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync/shift_reg[4] USB_3_Protocol_0/COREFIFO_C7_0/COREFIFO_C7_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync/shift_reg[3] USB_3_Protocol_0/COREFIFO_C7_0/COREFIFO_C7_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync/shift_reg[2] USB_3_Protocol_0/COREFIFO_C7_0/COREFIFO_C7_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync/shift_reg[1]}] 
set_false_path -to [get_cells {USB_3_Protocol_0/COREFIFO_C8_0/COREFIFO_C8_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[10] USB_3_Protocol_0/COREFIFO_C8_0/COREFIFO_C8_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[9] USB_3_Protocol_0/COREFIFO_C8_0/COREFIFO_C8_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[8] USB_3_Protocol_0/COREFIFO_C8_0/COREFIFO_C8_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[7] USB_3_Protocol_0/COREFIFO_C8_0/COREFIFO_C8_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[6] USB_3_Protocol_0/COREFIFO_C8_0/COREFIFO_C8_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[5] USB_3_Protocol_0/COREFIFO_C8_0/COREFIFO_C8_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[4] USB_3_Protocol_0/COREFIFO_C8_0/COREFIFO_C8_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[3] USB_3_Protocol_0/COREFIFO_C8_0/COREFIFO_C8_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[2] USB_3_Protocol_0/COREFIFO_C8_0/COREFIFO_C8_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[1] USB_3_Protocol_0/COREFIFO_C8_0/COREFIFO_C8_0/genblk16.U_corefifo_async/Wr_corefifo_NstagesSync/shift_reg[0] USB_3_Protocol_0/COREFIFO_C8_0/COREFIFO_C8_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync/shift_reg[7] USB_3_Protocol_0/COREFIFO_C8_0/COREFIFO_C8_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync/shift_reg[6] USB_3_Protocol_0/COREFIFO_C8_0/COREFIFO_C8_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync/shift_reg[5] USB_3_Protocol_0/COREFIFO_C8_0/COREFIFO_C8_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync/shift_reg[4] USB_3_Protocol_0/COREFIFO_C8_0/COREFIFO_C8_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync/shift_reg[3] USB_3_Protocol_0/COREFIFO_C8_0/COREFIFO_C8_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync/shift_reg[2] USB_3_Protocol_0/COREFIFO_C8_0/COREFIFO_C8_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync/shift_reg[1] USB_3_Protocol_0/COREFIFO_C8_0/COREFIFO_C8_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync/shift_reg[0] USB_3_Protocol_0/COREFIFO_C8_0/COREFIFO_C8_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync/shift_reg[10] USB_3_Protocol_0/COREFIFO_C8_0/COREFIFO_C8_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync/shift_reg[9] USB_3_Protocol_0/COREFIFO_C8_0/COREFIFO_C8_0/genblk16.U_corefifo_async/Rd_corefifo_NstagesSync/shift_reg[8]}] 

# Output Load Constraints 

# Driving Cell Constraints 

# Input Delay Constraints 

# Output Delay Constraints 

# Wire Loads 

# Other Constraints 

# syn_hier Attributes 

# set_case Attributes 

# Clock Delay Constraints 
set_clock_groups -asynchronous -group [get_clocks {Top|FTDI_CLK}]
set_clock_groups -asynchronous -group [get_clocks {Synchronizer_1|Chain_inferred_clock[1]}]
set_clock_groups -asynchronous -group [get_clocks {PF_CCC_C0_PF_CCC_C0_0_PF_CCC|pll_inst_0_clkint_4_inferred_clock}]

# syn_mode Attributes 

# Cells 

# Port DRC Rules 

# Input Transition Constraints 

# Unused constraints (intentionally commented out) 


# Non-forward-annotatable constraints (intentionally commented out) 

# Block Path constraints 

