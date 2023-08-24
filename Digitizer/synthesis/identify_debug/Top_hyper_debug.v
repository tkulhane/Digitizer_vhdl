// available hyper connections - for debug and ip models
// timestamp: 1692819071


`ifndef SYN_HYPER_CONNECT
`define SYN_HYPER_CONNECT 1
module syn_hyper_connect(out) /* synthesis syn_black_box=1 syn_noprune=1 */;
parameter w = 1;
parameter tag = "xxx";
parameter dflt = 0;
parameter mustconnect = 1'b1;
output [w-1:0] out;
endmodule
`endif

module Top_hyper_debug(dummy);
input dummy; /* avoid compiler error for no ports */

wire ident_ihs_IICE_master_clock_0;
syn_hyper_connect ident_ihs_IICE_master_clock_connect_0(ident_ihs_IICE_master_clock_0);
defparam ident_ihs_IICE_master_clock_connect_0.tag = "ident_coreinst.FTDI_INST.ident_ihs_IICE_master_clock";

wire ident_ihs_IICE_master_clock_1;
syn_hyper_connect ident_ihs_IICE_master_clock_connect_1(ident_ihs_IICE_master_clock_1);
defparam ident_ihs_IICE_master_clock_connect_1.tag = "ident_coreinst.IICE_INST.ident_ihs_IICE_master_clock";


wire Identify_FTDI_trigger_ext_0;
syn_hyper_connect Identify_FTDI_trigger_ext_connect_0(Identify_FTDI_trigger_ext_0);
defparam Identify_FTDI_trigger_ext_connect_0.tag = "ident_coreinst.FTDI_INST.Identify_FTDI_trigger_ext";


wire identify_sampler_ready_0;
syn_hyper_connect identify_sampler_ready_connect_0(identify_sampler_ready_0);
defparam identify_sampler_ready_connect_0.tag = "ident_coreinst.FTDI_INST.b3_SoW.identify_sampler_ready";

wire identify_sampler_ready_1;
syn_hyper_connect identify_sampler_ready_connect_1(identify_sampler_ready_1);
defparam identify_sampler_ready_connect_1.tag = "ident_coreinst.IICE_INST.b3_SoW.identify_sampler_ready";


wire Identify_IICE_trigger_ext_0;
syn_hyper_connect Identify_IICE_trigger_ext_connect_0(Identify_IICE_trigger_ext_0);
defparam Identify_IICE_trigger_ext_connect_0.tag = "ident_coreinst.IICE_INST.Identify_IICE_trigger_ext";


wire [7:0] ujtag_wrapper_uireg_0;
syn_hyper_connect ujtag_wrapper_uireg_connect_0(ujtag_wrapper_uireg_0);
defparam ujtag_wrapper_uireg_connect_0.w = 8;
defparam ujtag_wrapper_uireg_connect_0.tag = "ident_coreinst.comm_block_INST.jtagi.ujtag_wrapper_uireg";


wire ujtag_wrapper_urstb_0;
syn_hyper_connect ujtag_wrapper_urstb_connect_0(ujtag_wrapper_urstb_0);
defparam ujtag_wrapper_urstb_connect_0.tag = "ident_coreinst.comm_block_INST.jtagi.ujtag_wrapper_urstb";


wire ujtag_wrapper_udrupd_0;
syn_hyper_connect ujtag_wrapper_udrupd_connect_0(ujtag_wrapper_udrupd_0);
defparam ujtag_wrapper_udrupd_connect_0.tag = "ident_coreinst.comm_block_INST.jtagi.ujtag_wrapper_udrupd";


wire ujtag_wrapper_udrck_0;
syn_hyper_connect ujtag_wrapper_udrck_connect_0(ujtag_wrapper_udrck_0);
defparam ujtag_wrapper_udrck_connect_0.tag = "ident_coreinst.comm_block_INST.jtagi.ujtag_wrapper_udrck";


wire ujtag_wrapper_udrcap_0;
syn_hyper_connect ujtag_wrapper_udrcap_connect_0(ujtag_wrapper_udrcap_0);
defparam ujtag_wrapper_udrcap_connect_0.tag = "ident_coreinst.comm_block_INST.jtagi.ujtag_wrapper_udrcap";


wire ujtag_wrapper_udrsh_0;
syn_hyper_connect ujtag_wrapper_udrsh_connect_0(ujtag_wrapper_udrsh_0);
defparam ujtag_wrapper_udrsh_connect_0.tag = "ident_coreinst.comm_block_INST.jtagi.ujtag_wrapper_udrsh";


wire ujtag_wrapper_utdi_0;
syn_hyper_connect ujtag_wrapper_utdi_connect_0(ujtag_wrapper_utdi_0);
defparam ujtag_wrapper_utdi_connect_0.tag = "ident_coreinst.comm_block_INST.jtagi.ujtag_wrapper_utdi";


wire [31:0] ident_ihs_ch_af_data_0;
syn_hyper_connect ident_ihs_ch_af_data_connect_0(ident_ihs_ch_af_data_0);
defparam ident_ihs_ch_af_data_connect_0.w = 32;
defparam ident_ihs_ch_af_data_connect_0.tag = "USB_3_Protocol_0.ft601_fifo_interface_0.ident_ihs_ch_af_data";


wire ident_ihs_ch_af_empty_0;
syn_hyper_connect ident_ihs_ch_af_empty_connect_0(ident_ihs_ch_af_empty_0);
defparam ident_ihs_ch_af_empty_connect_0.tag = "USB_3_Protocol_0.ft601_fifo_interface_0.ident_ihs_ch_af_empty";


wire ident_ihs_ch_af_rden_0;
syn_hyper_connect ident_ihs_ch_af_rden_connect_0(ident_ihs_ch_af_rden_0);
defparam ident_ihs_ch_af_rden_connect_0.tag = "USB_3_Protocol_0.ft601_fifo_interface_0.ident_ihs_ch_af_rden";


wire ident_ihs_ch_fa_almost_full_0;
syn_hyper_connect ident_ihs_ch_fa_almost_full_connect_0(ident_ihs_ch_fa_almost_full_0);
defparam ident_ihs_ch_fa_almost_full_connect_0.tag = "USB_3_Protocol_0.ft601_fifo_interface_0.ident_ihs_ch_fa_almost_full";


wire [31:0] ident_ihs_ch_fa_data_0;
syn_hyper_connect ident_ihs_ch_fa_data_connect_0(ident_ihs_ch_fa_data_0);
defparam ident_ihs_ch_fa_data_connect_0.w = 32;
defparam ident_ihs_ch_fa_data_connect_0.tag = "USB_3_Protocol_0.ft601_fifo_interface_0.ident_ihs_ch_fa_data";


wire ident_ihs_ch_fa_wren_0;
syn_hyper_connect ident_ihs_ch_fa_wren_connect_0(ident_ihs_ch_fa_wren_0);
defparam ident_ihs_ch_fa_wren_connect_0.tag = "USB_3_Protocol_0.ft601_fifo_interface_0.ident_ihs_ch_fa_wren";


wire [3:0] ident_ihs_ftdi_be_0;
syn_hyper_connect ident_ihs_ftdi_be_connect_0(ident_ihs_ftdi_be_0);
defparam ident_ihs_ftdi_be_connect_0.w = 4;
defparam ident_ihs_ftdi_be_connect_0.tag = "USB_3_Protocol_0.ft601_fifo_interface_0.ident_ihs_ftdi_be";


wire ident_ihs_ftdi_clk_0;
syn_hyper_connect ident_ihs_ftdi_clk_connect_0(ident_ihs_ftdi_clk_0);
defparam ident_ihs_ftdi_clk_connect_0.tag = "USB_3_Protocol_0.ft601_fifo_interface_0.ident_ihs_ftdi_clk";


wire [31:0] ident_ihs_ftdi_data_0;
syn_hyper_connect ident_ihs_ftdi_data_connect_0(ident_ihs_ftdi_data_0);
defparam ident_ihs_ftdi_data_connect_0.w = 32;
defparam ident_ihs_ftdi_data_connect_0.tag = "USB_3_Protocol_0.ft601_fifo_interface_0.ident_ihs_ftdi_data";


wire ident_ihs_ftdi_noe_0;
syn_hyper_connect ident_ihs_ftdi_noe_connect_0(ident_ihs_ftdi_noe_0);
defparam ident_ihs_ftdi_noe_connect_0.tag = "USB_3_Protocol_0.ft601_fifo_interface_0.ident_ihs_ftdi_noe";


wire ident_ihs_ftdi_nrd_0;
syn_hyper_connect ident_ihs_ftdi_nrd_connect_0(ident_ihs_ftdi_nrd_0);
defparam ident_ihs_ftdi_nrd_connect_0.tag = "USB_3_Protocol_0.ft601_fifo_interface_0.ident_ihs_ftdi_nrd";


wire ident_ihs_ftdi_nrxf_0;
syn_hyper_connect ident_ihs_ftdi_nrxf_connect_0(ident_ihs_ftdi_nrxf_0);
defparam ident_ihs_ftdi_nrxf_connect_0.tag = "USB_3_Protocol_0.ft601_fifo_interface_0.ident_ihs_ftdi_nrxf";


wire ident_ihs_ftdi_ntxe_0;
syn_hyper_connect ident_ihs_ftdi_ntxe_connect_0(ident_ihs_ftdi_ntxe_0);
defparam ident_ihs_ftdi_ntxe_connect_0.tag = "USB_3_Protocol_0.ft601_fifo_interface_0.ident_ihs_ftdi_ntxe";


wire ident_ihs_ftdi_nwr_0;
syn_hyper_connect ident_ihs_ftdi_nwr_connect_0(ident_ihs_ftdi_nwr_0);
defparam ident_ihs_ftdi_nwr_connect_0.tag = "USB_3_Protocol_0.ft601_fifo_interface_0.ident_ihs_ftdi_nwr";


wire [11:0] ident_ihs_actual_state_0;
syn_hyper_connect ident_ihs_actual_state_connect_0(ident_ihs_actual_state_0);
defparam ident_ihs_actual_state_connect_0.w = 12;
defparam ident_ihs_actual_state_connect_0.tag = "USB_3_Protocol_0.ft601_fifo_interface_0.ident_ihs_actual_state";


wire [31:0] ident_ihs_data_buf_0;
syn_hyper_connect ident_ihs_data_buf_connect_0(ident_ihs_data_buf_0);
defparam ident_ihs_data_buf_connect_0.w = 32;
defparam ident_ihs_data_buf_connect_0.tag = "USB_3_Protocol_0.ft601_fifo_interface_0.ident_ihs_data_buf";


wire [31:0] ident_ihs_data_buf_b_0;
syn_hyper_connect ident_ihs_data_buf_b_connect_0(ident_ihs_data_buf_b_0);
defparam ident_ihs_data_buf_b_connect_0.w = 32;
defparam ident_ihs_data_buf_b_connect_0.tag = "USB_3_Protocol_0.ft601_fifo_interface_0.ident_ihs_data_buf_b";


wire ident_ihs_nreset_0;
syn_hyper_connect ident_ihs_nreset_connect_0(ident_ihs_nreset_0);
defparam ident_ihs_nreset_connect_0.tag = "USB_3_Protocol_0.ft601_fifo_interface_0.ident_ihs_nreset";

endmodule
