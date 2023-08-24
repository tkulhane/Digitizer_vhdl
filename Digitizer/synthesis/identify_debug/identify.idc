device jtagport builtin
iice new {FTDI} -type regular
iice controller -iice {FTDI} none
iice sampler -iice {FTDI} -compression 1
iice sampler -iice {FTDI} -depth 512
iice clock -iice {FTDI} -edge positive {/USB_3_Protocol_0/ft601_fifo_interface_0/ftdi_clk}
signals add -iice {FTDI} -silent -sample {/USB_3_Protocol_0/ft601_fifo_interface_0/ftdi_data}
signals add -iice {FTDI} -silent -sample -trigger {/USB_3_Protocol_0/ft601_fifo_interface_0/rtl_ft601_fifo_interface/actual_state}

iice new {IICE} -type regular
iice controller -iice {IICE} none
iice sampler -iice {IICE} -compression 1
iice sampler -iice {IICE} -depth 512
iice clock -iice {IICE} -edge positive {/USB_3_Protocol_0/ft601_fifo_interface_0/ftdi_clk}
signals add -iice {IICE} -silent -sample {/USB_3_Protocol_0/ft601_fifo_interface_0/rtl_ft601_fifo_interface/actual_state}
signals add -iice {IICE} -silent -sample -trigger {/USB_3_Protocol_0/ft601_fifo_interface_0/rtl_ft601_fifo_interface/data_buf_b}\
{/USB_3_Protocol_0/ft601_fifo_interface_0/ch_af_rden}\
{/USB_3_Protocol_0/ft601_fifo_interface_0/ch_af_empty}\
{/USB_3_Protocol_0/ft601_fifo_interface_0/ch_af_data}\
{/USB_3_Protocol_0/ft601_fifo_interface_0/ch_fa_wren}\
{/USB_3_Protocol_0/ft601_fifo_interface_0/ch_fa_almost_full}\
{/USB_3_Protocol_0/ft601_fifo_interface_0/ch_fa_data}\
{/USB_3_Protocol_0/ft601_fifo_interface_0/ftdi_be}\
{/USB_3_Protocol_0/ft601_fifo_interface_0/ftdi_nwr}\
{/USB_3_Protocol_0/ft601_fifo_interface_0/ftdi_ntxe}\
{/USB_3_Protocol_0/ft601_fifo_interface_0/rtl_ft601_fifo_interface/data_buf}\
{/USB_3_Protocol_0/ft601_fifo_interface_0/ftdi_data}\
{/USB_3_Protocol_0/ft601_fifo_interface_0/nreset}\
{/USB_3_Protocol_0/ft601_fifo_interface_0/ftdi_nrd}\
{/USB_3_Protocol_0/ft601_fifo_interface_0/ftdi_nrxf}\
{/USB_3_Protocol_0/ft601_fifo_interface_0/ftdi_noe}

