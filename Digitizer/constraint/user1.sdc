create_clock -name {FTDI_CLK} -period 10 -waveform {0 5 } [ get_ports { FTDI_CLK } ]
