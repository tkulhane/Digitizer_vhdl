//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Mon Nov  6 21:05:22 2023
// Version: 2022.1 2022.1.0.10
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// Communication
module Communication(
    // Inputs
    ANW_DATA,
    ANW_WE,
    CMD_RE,
    DafaFifo_Data,
    DataFifo_Empty,
    FTDI_CLK,
    FTDI_nRXF,
    FTDI_nTXE,
    Logic_Clock,
    Logic_RESET_N,
    RX_0,
    RX_1,
    UART_Clock,
    UART_RESET_N,
    addr_frame,
    comm_number,
    enable_cmd,
    write_data_frame,
    write_read,
    // Outputs
    ANW_FULL,
    Builder_Enable,
    CMD_EMPTY,
    CMD_Q,
    DataFifo_RD,
    FTDI_GPIO_0,
    FTDI_GPIO_1,
    FTDI_nOE,
    FTDI_nRD,
    FTDI_nWR,
    SIWU_N,
    TX_0,
    TX_1,
    busy,
    read_data_frame,
    // Inouts
    FTDI_BE,
    FTDI_DATA
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input  [39:0] ANW_DATA;
input         ANW_WE;
input         CMD_RE;
input  [31:0] DafaFifo_Data;
input         DataFifo_Empty;
input         FTDI_CLK;
input         FTDI_nRXF;
input         FTDI_nTXE;
input         Logic_Clock;
input         Logic_RESET_N;
input         RX_0;
input         RX_1;
input         UART_Clock;
input         UART_RESET_N;
input  [7:0]  addr_frame;
input  [3:0]  comm_number;
input         enable_cmd;
input  [15:0] write_data_frame;
input         write_read;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output        ANW_FULL;
output        Builder_Enable;
output        CMD_EMPTY;
output [39:0] CMD_Q;
output        DataFifo_RD;
output        FTDI_GPIO_0;
output        FTDI_GPIO_1;
output        FTDI_nOE;
output        FTDI_nRD;
output        FTDI_nWR;
output        SIWU_N;
output        TX_0;
output        TX_1;
output        busy;
output [15:0] read_data_frame;
//--------------------------------------------------------------------
// Inout
//--------------------------------------------------------------------
inout  [3:0]  FTDI_BE;
inout  [31:0] FTDI_DATA;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire   [7:0]  addr_frame;
wire   [39:0] ANW_DATA;
wire          ANW_FULL_net_0;
wire          ANW_WE;
wire          Builder_Enable_net_0;
wire          busy_net_0;
wire          CMD_EMPTY_net_0;
wire   [39:0] CMD_Q_net_0;
wire          CMD_RE;
wire   [3:0]  comm_number;
wire          Communication_ANW_MUX_0_ANW_Fifo_Read_Enable;
wire   [39:0] Communication_ANW_MUX_0_DEST_1_Fifo_Write_Data;
wire          Communication_ANW_MUX_0_DEST_1_Fifo_Write_Enable;
wire   [39:0] Communication_ANW_MUX_0_DEST_2_Fifo_Write_Data;
wire          Communication_ANW_MUX_0_DEST_2_Fifo_Write_Enable;
wire   [39:0] Communication_ANW_MUX_0_DEST_3_Fifo_Write_Data;
wire          Communication_ANW_MUX_0_DEST_3_Fifo_Write_Enable;
wire   [39:0] Communication_CMD_MUX_0_CMD_Fifo_Write_Data;
wire          Communication_CMD_MUX_0_CMD_Fifo_Write_Enable;
wire          Communication_CMD_MUX_0_SRC_1_Fifo_Read_Enable;
wire          Communication_CMD_MUX_0_SRC_2_Fifo_Read_Enable;
wire          Communication_CMD_MUX_0_SRC_3_Fifo_Read_Enable;
wire   [31:0] Communication_Switch_0_DEST_1_Fifo_Data;
wire          Communication_Switch_0_DEST_1_Fifo_Empty;
wire   [31:0] Communication_Switch_0_DEST_2_Fifo_Data;
wire          Communication_Switch_0_DEST_2_Fifo_Empty;
wire   [31:0] Communication_Switch_0_DEST_3_Fifo_Data;
wire          Communication_Switch_0_DEST_3_Fifo_Empty;
wire          COREFIFO_C1_0_FULL;
wire          COREFIFO_C3_0_EMPTY;
wire   [39:0] COREFIFO_C3_0_Q;
wire   [31:0] DafaFifo_Data;
wire          DataFifo_Empty;
wire          DataFifo_RD_net_0;
wire          enable_cmd;
wire   [3:0]  FTDI_BE;
wire          FTDI_CLK;
wire   [31:0] FTDI_DATA;
wire          FTDI_GPIO_0_net_0;
wire          FTDI_GPIO_1_net_0;
wire          FTDI_nOE_net_0;
wire          FTDI_nRD_net_0;
wire          FTDI_nRXF;
wire          FTDI_nTXE;
wire          FTDI_nWR_net_0;
wire          Logic_Clock;
wire          Logic_RESET_N;
wire   [15:0] read_data_frame_net_0;
wire          RX_0;
wire          RX_1;
wire          SIWU_N_net_0;
wire          TX_0_net_0;
wire          TX_1_net_0;
wire          UART_Clock;
wire          UART_Protocol_0_MD_Fifo_RE;
wire   [39:0] UART_Protocol_0_RX_Fifo_Data;
wire          UART_Protocol_0_RX_FIFO_EMPTY;
wire          UART_Protocol_0_TX_FIFO_FULL;
wire          UART_Protocol_1_MD_Fifo_RE;
wire   [39:0] UART_Protocol_1_RX_Fifo_Data;
wire          UART_Protocol_1_RX_FIFO_EMPTY;
wire          UART_Protocol_1_TX_FIFO_FULL;
wire          UART_RESET_N;
wire          USB_3_Protocol_0_MD_Fifo_RE;
wire   [39:0] USB_3_Protocol_0_RX_FIFO_Data;
wire          USB_3_Protocol_0_RX_FIFO_EMPTY;
wire          USB_3_Protocol_0_TX_FULL;
wire   [15:0] write_data_frame;
wire          write_read;
wire   [15:0] read_data_frame_net_1;
wire          busy_net_1;
wire          DataFifo_RD_net_1;
wire          Builder_Enable_net_1;
wire          CMD_EMPTY_net_1;
wire   [39:0] CMD_Q_net_1;
wire          ANW_FULL_net_1;
wire          TX_0_net_1;
wire          TX_1_net_1;
wire          SIWU_N_net_1;
wire          FTDI_nWR_net_1;
wire          FTDI_nRD_net_1;
wire          FTDI_nOE_net_1;
wire          FTDI_GPIO_0_net_1;
wire          FTDI_GPIO_1_net_1;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire   [3:0]  Number_Communication_const_net_0;
wire   [3:0]  Number_Communication_const_net_1;
wire   [3:0]  Communication_Number_const_net_0;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign Number_Communication_const_net_0 = 4'h1;
assign Number_Communication_const_net_1 = 4'h2;
assign Communication_Number_const_net_0 = 4'h3;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign read_data_frame_net_1 = read_data_frame_net_0;
assign read_data_frame[15:0] = read_data_frame_net_1;
assign busy_net_1            = busy_net_0;
assign busy                  = busy_net_1;
assign DataFifo_RD_net_1     = DataFifo_RD_net_0;
assign DataFifo_RD           = DataFifo_RD_net_1;
assign Builder_Enable_net_1  = Builder_Enable_net_0;
assign Builder_Enable        = Builder_Enable_net_1;
assign CMD_EMPTY_net_1       = CMD_EMPTY_net_0;
assign CMD_EMPTY             = CMD_EMPTY_net_1;
assign CMD_Q_net_1           = CMD_Q_net_0;
assign CMD_Q[39:0]           = CMD_Q_net_1;
assign ANW_FULL_net_1        = ANW_FULL_net_0;
assign ANW_FULL              = ANW_FULL_net_1;
assign TX_0_net_1            = TX_0_net_0;
assign TX_0                  = TX_0_net_1;
assign TX_1_net_1            = TX_1_net_0;
assign TX_1                  = TX_1_net_1;
assign SIWU_N_net_1          = SIWU_N_net_0;
assign SIWU_N                = SIWU_N_net_1;
assign FTDI_nWR_net_1        = FTDI_nWR_net_0;
assign FTDI_nWR              = FTDI_nWR_net_1;
assign FTDI_nRD_net_1        = FTDI_nRD_net_0;
assign FTDI_nRD              = FTDI_nRD_net_1;
assign FTDI_nOE_net_1        = FTDI_nOE_net_0;
assign FTDI_nOE              = FTDI_nOE_net_1;
assign FTDI_GPIO_0_net_1     = FTDI_GPIO_0_net_0;
assign FTDI_GPIO_0           = FTDI_GPIO_0_net_1;
assign FTDI_GPIO_1_net_1     = FTDI_GPIO_1_net_0;
assign FTDI_GPIO_1           = FTDI_GPIO_1_net_1;
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------Communication_ANW_MUX
Communication_ANW_MUX Communication_ANW_MUX_0(
        // Inputs
        .Clock                    ( Logic_Clock ),
        .Reset_N                  ( Logic_RESET_N ),
        .DEST_1_Fifo_Full         ( UART_Protocol_0_TX_FIFO_FULL ),
        .DEST_2_Fifo_Full         ( UART_Protocol_1_TX_FIFO_FULL ),
        .DEST_3_Fifo_Full         ( USB_3_Protocol_0_TX_FULL ),
        .ANW_Fifo_Empty           ( COREFIFO_C3_0_EMPTY ),
        .ANW_Fifo_Read_Data       ( COREFIFO_C3_0_Q ),
        // Outputs
        .DEST_1_Fifo_Write_Enable ( Communication_ANW_MUX_0_DEST_1_Fifo_Write_Enable ),
        .DEST_2_Fifo_Write_Enable ( Communication_ANW_MUX_0_DEST_2_Fifo_Write_Enable ),
        .DEST_3_Fifo_Write_Enable ( Communication_ANW_MUX_0_DEST_3_Fifo_Write_Enable ),
        .ANW_Fifo_Read_Enable     ( Communication_ANW_MUX_0_ANW_Fifo_Read_Enable ),
        .Diag_Valid               (  ),
        .DEST_1_Fifo_Write_Data   ( Communication_ANW_MUX_0_DEST_1_Fifo_Write_Data ),
        .DEST_2_Fifo_Write_Data   ( Communication_ANW_MUX_0_DEST_2_Fifo_Write_Data ),
        .DEST_3_Fifo_Write_Data   ( Communication_ANW_MUX_0_DEST_3_Fifo_Write_Data ) 
        );

//--------Communication_CMD_MUX
Communication_CMD_MUX Communication_CMD_MUX_0(
        // Inputs
        .Clock                  ( Logic_Clock ),
        .Reset_N                ( Logic_RESET_N ),
        .SRC_1_Fifo_Empty       ( UART_Protocol_0_RX_FIFO_EMPTY ),
        .SRC_2_Fifo_Empty       ( UART_Protocol_1_RX_FIFO_EMPTY ),
        .SRC_3_Fifo_Empty       ( USB_3_Protocol_0_RX_FIFO_EMPTY ),
        .CMD_Fifo_Full          ( COREFIFO_C1_0_FULL ),
        .SRC_1_Fifo_Read_Data   ( UART_Protocol_0_RX_Fifo_Data ),
        .SRC_2_Fifo_Read_Data   ( UART_Protocol_1_RX_Fifo_Data ),
        .SRC_3_Fifo_Read_Data   ( USB_3_Protocol_0_RX_FIFO_Data ),
        // Outputs
        .SRC_1_Fifo_Read_Enable ( Communication_CMD_MUX_0_SRC_1_Fifo_Read_Enable ),
        .SRC_2_Fifo_Read_Enable ( Communication_CMD_MUX_0_SRC_2_Fifo_Read_Enable ),
        .SRC_3_Fifo_Read_Enable ( Communication_CMD_MUX_0_SRC_3_Fifo_Read_Enable ),
        .CMD_Fifo_Write_Enable  ( Communication_CMD_MUX_0_CMD_Fifo_Write_Enable ),
        .Diag_Valid             (  ),
        .CMD_Fifo_Write_Data    ( Communication_CMD_MUX_0_CMD_Fifo_Write_Data ) 
        );

//--------Communication_Switch
Communication_Switch Communication_Switch_0(
        // Inputs
        .Clock             ( Logic_Clock ),
        .Reset_N           ( Logic_RESET_N ),
        .enable_cmd        ( enable_cmd ),
        .write_read        ( write_read ),
        .DataFifo_Empty    ( DataFifo_Empty ),
        .DEST_1_Fifo_Read  ( UART_Protocol_0_MD_Fifo_RE ),
        .DEST_2_Fifo_Read  ( UART_Protocol_1_MD_Fifo_RE ),
        .DEST_3_Fifo_Read  ( USB_3_Protocol_0_MD_Fifo_RE ),
        .addr_frame        ( addr_frame ),
        .write_data_frame  ( write_data_frame ),
        .comm_number       ( comm_number ),
        .DafaFifo_Data     ( DafaFifo_Data ),
        // Outputs
        .busy              ( busy_net_0 ),
        .Builder_Enable    ( Builder_Enable_net_0 ),
        .DataFifo_RD       ( DataFifo_RD_net_0 ),
        .DEST_1_Fifo_Empty ( Communication_Switch_0_DEST_1_Fifo_Empty ),
        .DEST_2_Fifo_Empty ( Communication_Switch_0_DEST_2_Fifo_Empty ),
        .DEST_3_Fifo_Empty ( Communication_Switch_0_DEST_3_Fifo_Empty ),
        .read_data_frame   ( read_data_frame_net_0 ),
        .DEST_1_Fifo_Data  ( Communication_Switch_0_DEST_1_Fifo_Data ),
        .DEST_2_Fifo_Data  ( Communication_Switch_0_DEST_2_Fifo_Data ),
        .DEST_3_Fifo_Data  ( Communication_Switch_0_DEST_3_Fifo_Data ) 
        );

//--------COREFIFO_C1
COREFIFO_C1 COREFIFO_C1_0(
        // Inputs
        .CLK     ( Logic_Clock ),
        .RESET_N ( Logic_RESET_N ),
        .WE      ( Communication_CMD_MUX_0_CMD_Fifo_Write_Enable ),
        .RE      ( CMD_RE ),
        .DATA    ( Communication_CMD_MUX_0_CMD_Fifo_Write_Data ),
        // Outputs
        .FULL    ( COREFIFO_C1_0_FULL ),
        .EMPTY   ( CMD_EMPTY_net_0 ),
        .Q       ( CMD_Q_net_0 ) 
        );

//--------COREFIFO_C3
COREFIFO_C3 COREFIFO_C3_0(
        // Inputs
        .CLK     ( Logic_Clock ),
        .RESET_N ( Logic_RESET_N ),
        .WE      ( ANW_WE ),
        .RE      ( Communication_ANW_MUX_0_ANW_Fifo_Read_Enable ),
        .DATA    ( ANW_DATA ),
        // Outputs
        .FULL    ( ANW_FULL_net_0 ),
        .EMPTY   ( COREFIFO_C3_0_EMPTY ),
        .Q       ( COREFIFO_C3_0_Q ) 
        );

//--------UART_Protocol
UART_Protocol UART_Protocol_0(
        // Inputs
        .RX                   ( RX_0 ),
        .UART_Clock           ( UART_Clock ),
        .UART_RESET_N         ( UART_RESET_N ),
        .Logic_Clock          ( Logic_Clock ),
        .Logic_RESET_N        ( Logic_RESET_N ),
        .RX_FIFO_RE           ( Communication_CMD_MUX_0_SRC_1_Fifo_Read_Enable ),
        .TX_FIFO_WE           ( Communication_ANW_MUX_0_DEST_1_Fifo_Write_Enable ),
        .MD_Fifo_Empty        ( Communication_Switch_0_DEST_1_Fifo_Empty ),
        .TX_Fifo_Data         ( Communication_ANW_MUX_0_DEST_1_Fifo_Write_Data ),
        .Number_Communication ( Number_Communication_const_net_0 ),
        .MD_Fifo_Data         ( Communication_Switch_0_DEST_1_Fifo_Data ),
        // Outputs
        .TX                   ( TX_0_net_0 ),
        .Diag_Valid_LED       (  ),
        .RX_FIFO_EMPTY        ( UART_Protocol_0_RX_FIFO_EMPTY ),
        .TX_FIFO_FULL         ( UART_Protocol_0_TX_FIFO_FULL ),
        .MD_Fifo_RE           ( UART_Protocol_0_MD_Fifo_RE ),
        .RX_Fifo_Data         ( UART_Protocol_0_RX_Fifo_Data ) 
        );

//--------UART_Protocol
UART_Protocol UART_Protocol_1(
        // Inputs
        .RX                   ( RX_1 ),
        .UART_Clock           ( UART_Clock ),
        .UART_RESET_N         ( UART_RESET_N ),
        .Logic_Clock          ( Logic_Clock ),
        .Logic_RESET_N        ( Logic_RESET_N ),
        .RX_FIFO_RE           ( Communication_CMD_MUX_0_SRC_2_Fifo_Read_Enable ),
        .TX_FIFO_WE           ( Communication_ANW_MUX_0_DEST_2_Fifo_Write_Enable ),
        .MD_Fifo_Empty        ( Communication_Switch_0_DEST_2_Fifo_Empty ),
        .TX_Fifo_Data         ( Communication_ANW_MUX_0_DEST_2_Fifo_Write_Data ),
        .Number_Communication ( Number_Communication_const_net_1 ),
        .MD_Fifo_Data         ( Communication_Switch_0_DEST_2_Fifo_Data ),
        // Outputs
        .TX                   ( TX_1_net_0 ),
        .Diag_Valid_LED       (  ),
        .RX_FIFO_EMPTY        ( UART_Protocol_1_RX_FIFO_EMPTY ),
        .TX_FIFO_FULL         ( UART_Protocol_1_TX_FIFO_FULL ),
        .MD_Fifo_RE           ( UART_Protocol_1_MD_Fifo_RE ),
        .RX_Fifo_Data         ( UART_Protocol_1_RX_Fifo_Data ) 
        );

//--------USB_3_Protocol
USB_3_Protocol USB_3_Protocol_0(
        // Inputs
        .FTDI_CLK             ( FTDI_CLK ),
        .FTDI_nRXF            ( FTDI_nRXF ),
        .FTDI_nTXE            ( FTDI_nTXE ),
        .Main_CLK             ( Logic_Clock ),
        .Main_RESET_N         ( Logic_RESET_N ),
        .RX_FIFO_RE           ( Communication_CMD_MUX_0_SRC_3_Fifo_Read_Enable ),
        .TX_FIFO_WE           ( Communication_ANW_MUX_0_DEST_3_Fifo_Write_Enable ),
        .MD_Fifo_Empty        ( Communication_Switch_0_DEST_3_Fifo_Empty ),
        .TX_FIFO_Data         ( Communication_ANW_MUX_0_DEST_3_Fifo_Write_Data ),
        .Communication_Number ( Communication_Number_const_net_0 ),
        .MD_Fifo_Data         ( Communication_Switch_0_DEST_3_Fifo_Data ),
        // Outputs
        .FTDI_nWR             ( FTDI_nWR_net_0 ),
        .FTDI_nOE             ( FTDI_nOE_net_0 ),
        .FTDI_nRD             ( FTDI_nRD_net_0 ),
        .FTDI_RESET_N         (  ),
        .FTDI_GPIO_0          ( FTDI_GPIO_0_net_0 ),
        .FTDI_GPIO_1          ( FTDI_GPIO_1_net_0 ),
        .RX_FIFO_EMPTY        ( USB_3_Protocol_0_RX_FIFO_EMPTY ),
        .TX_FULL              ( USB_3_Protocol_0_TX_FULL ),
        .SIWU_N               ( SIWU_N_net_0 ),
        .DBG_FIFO_WR          (  ),
        .DBG_FIFO_RD          (  ),
        .DBG_EMPTY            (  ),
        .MD_Fifo_RE           ( USB_3_Protocol_0_MD_Fifo_RE ),
        .DBG_FIFO_AFULL       (  ),
        .RX_FIFO_Data         ( USB_3_Protocol_0_RX_FIFO_Data ),
        // Inouts
        .FTDI_DATA            ( FTDI_DATA ),
        .FTDI_BE              ( FTDI_BE ) 
        );


endmodule
