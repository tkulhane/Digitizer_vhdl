//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Wed Jul 26 09:17:17 2023
// Version: 2022.1 2022.1.0.10
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// SPI_LMX
module SPI_LMX(
    // Inputs
    Clock,
    Reset_N,
    addr_frame,
    enable_cmd,
    miso,
    tx_data_frame,
    write_read,
    // Outputs
    busy,
    mosi,
    rx_data_frame,
    sclk,
    ss_n
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input         Clock;
input         Reset_N;
input  [6:0]  addr_frame;
input         enable_cmd;
input         miso;
input  [15:0] tx_data_frame;
input         write_read;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output        busy;
output        mosi;
output [15:0] rx_data_frame;
output        sclk;
output        ss_n;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire   [6:0]  addr_frame;
wire          busy_net_0;
wire          Clock;
wire          enable_cmd;
wire          miso;
wire          mosi_net_0;
wire          Reset_N;
wire   [15:0] rx_data_frame_net_0;
wire          sclk_net_0;
wire          SPI_interface_0_spi_enable;
wire   [23:0] SPI_interface_0_spi_tx;
wire          spi_master_0_busy;
wire   [23:0] spi_master_0_rx;
wire          ss_n_net_0;
wire   [15:0] tx_data_frame;
wire          write_read;
wire          ss_n_net_1;
wire          mosi_net_1;
wire          sclk_net_1;
wire   [15:0] rx_data_frame_net_1;
wire          busy_net_1;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire          GND_net;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign GND_net = 1'b0;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign ss_n_net_1          = ss_n_net_0;
assign ss_n                = ss_n_net_1;
assign mosi_net_1          = mosi_net_0;
assign mosi                = mosi_net_1;
assign sclk_net_1          = sclk_net_0;
assign sclk                = sclk_net_1;
assign rx_data_frame_net_1 = rx_data_frame_net_0;
assign rx_data_frame[15:0] = rx_data_frame_net_1;
assign busy_net_1          = busy_net_0;
assign busy                = busy_net_1;
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------SPI_interface
SPI_interface #( 
        .addr_width ( 7 ),
        .data_width ( 16 ) )
SPI_interface_0(
        // Inputs
        .Clock         ( Clock ),
        .Reset_N       ( Reset_N ),
        .enable_cmd    ( enable_cmd ),
        .write_read    ( write_read ),
        .addr_frame    ( addr_frame ),
        .tx_data_frame ( tx_data_frame ),
        .spi_busy      ( spi_master_0_busy ),
        .spi_rx        ( spi_master_0_rx ),
        // Outputs
        .busy          ( busy_net_0 ),
        .rx_data_frame ( rx_data_frame_net_0 ),
        .spi_enable    ( SPI_interface_0_spi_enable ),
        .spi_tx        ( SPI_interface_0_spi_tx ) 
        );

//--------spi_master
spi_master #( 
        .data_length ( 24 ),
        .divider     ( 5 ) )
spi_master_0(
        // Inputs
        .clk     ( Clock ),
        .reset_n ( Reset_N ),
        .enable  ( SPI_interface_0_spi_enable ),
        .cpol    ( GND_net ),
        .cpha    ( GND_net ),
        .miso    ( miso ),
        .tx      ( SPI_interface_0_spi_tx ),
        // Outputs
        .sclk    ( sclk_net_0 ),
        .ss_n    ( ss_n_net_0 ),
        .mosi    ( mosi_net_0 ),
        .busy    ( spi_master_0_busy ),
        .rx      ( spi_master_0_rx ) 
        );


endmodule
