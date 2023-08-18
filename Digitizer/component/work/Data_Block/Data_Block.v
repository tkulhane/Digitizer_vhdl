//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Wed Aug 16 20:21:10 2023
// Version: 2022.1 2022.1.0.10
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// Data_Block
module Data_Block(
    // Inputs
    CTRL_ARST_N,
    CTRL_CLK,
    C_addr_frame,
    C_enable_cmd,
    C_write_data_frame,
    C_write_read,
    Clock,
    Communication_DATA_Ack,
    Communication_Data_Full,
    Fifo_RESET_N,
    LANE0_RXD_N,
    LANE0_RXD_P,
    LANE1_RXD_N,
    LANE1_RXD_P,
    LANE2_RXD_N,
    LANE2_RXD_P,
    LANE3_RXD_N,
    LANE3_RXD_P,
    LANE4_RXD_N,
    LANE4_RXD_P,
    LANE5_RXD_N,
    LANE5_RXD_P,
    REF_Clock,
    REF_Reset_N,
    Reset_N,
    // Outputs
    C_busy,
    C_read_data_frame,
    Communication_Data_Enable,
    Communication_Data_Frame,
    Communication_Data_Req,
    Diag_0,
    Diag_1,
    Diag_2,
    Diag_3,
    LANE0_RX_VAL
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input         CTRL_ARST_N;
input         CTRL_CLK;
input  [7:0]  C_addr_frame;
input         C_enable_cmd;
input  [15:0] C_write_data_frame;
input         C_write_read;
input         Clock;
input         Communication_DATA_Ack;
input         Communication_Data_Full;
input         Fifo_RESET_N;
input         LANE0_RXD_N;
input         LANE0_RXD_P;
input         LANE1_RXD_N;
input         LANE1_RXD_P;
input         LANE2_RXD_N;
input         LANE2_RXD_P;
input         LANE3_RXD_N;
input         LANE3_RXD_P;
input         LANE4_RXD_N;
input         LANE4_RXD_P;
input         LANE5_RXD_N;
input         LANE5_RXD_P;
input         REF_Clock;
input         REF_Reset_N;
input         Reset_N;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output        C_busy;
output [15:0] C_read_data_frame;
output        Communication_Data_Enable;
output [31:0] Communication_Data_Frame;
output        Communication_Data_Req;
output        Diag_0;
output        Diag_1;
output        Diag_2;
output        Diag_3;
output        LANE0_RX_VAL;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire           AND4_0_Y;
wire   [7:0]   C_addr_frame;
wire           C_busy_net_0;
wire           C_enable_cmd;
wire   [15:0]  C_read_data_frame_net_0;
wire   [15:0]  C_write_data_frame;
wire           C_write_read;
wire           Clock;
wire   [9:0]   Communication_Builder_0_Event_RAM_R_Address;
wire   [7:0]   Communication_Builder_0_Event_RAM_W_Data_Status;
wire           Communication_Builder_0_Event_RAM_W_Enable_Status;
wire   [15:0]  Communication_Builder_0_Sample_RAM_R_Address;
wire   [3:0]   Communication_Builder_0_Sample_RAM_R_Block_Address;
wire           Communication_DATA_Ack;
wire           Communication_Data_Enable_net_0;
wire   [31:0]  Communication_Data_Frame_net_0;
wire           Communication_Data_Full;
wire           Communication_Data_Req_net_0;
wire           CTRL_ARST_N;
wire           CTRL_CLK;
wire           Diag_0_net_0;
wire           Diag_1_net_0;
wire           Diag_2_net_0;
wire           Diag_3_net_0;
wire   [7:0]   Event_Info_RAM_Block_0_A_DOUT_Event_Status;
wire   [19:0]  Event_Info_RAM_Block_0_B_DOUT_Event_Number;
wire   [19:0]  Event_Info_RAM_Block_0_B_DOUT_Event_Size;
wire   [19:0]  Event_Info_RAM_Block_0_B_DOUT_Event_Start_ADDR;
wire   [7:0]   Event_Info_RAM_Block_0_B_DOUT_Event_Status;
wire           Fifo_RESET_N;
wire           FIFOs_Reader_0_Block_0_Sample_FIFO_R_Enable;
wire           FIFOs_Reader_0_Block_1_Sample_FIFO_R_Enable;
wire           FIFOs_Reader_0_Event_FIFO_R_Enable;
wire   [9:0]   FIFOs_Reader_0_Event_RAM_W_Address;
wire   [19:0]  FIFOs_Reader_0_Event_RAM_W_Data_Number;
wire   [19:0]  FIFOs_Reader_0_Event_RAM_W_Data_Size;
wire   [19:0]  FIFOs_Reader_0_Event_RAM_W_Data_Start_ADDR;
wire   [7:0]   FIFOs_Reader_0_Event_RAM_W_Data_Status;
wire           FIFOs_Reader_0_Event_RAM_W_Enable_Number;
wire           FIFOs_Reader_0_Event_RAM_W_Enable_Size;
wire           FIFOs_Reader_0_Event_RAM_W_Enable_Start_ADDR;
wire           FIFOs_Reader_0_Event_RAM_W_Enable_Status;
wire   [15:0]  FIFOs_Reader_0_Sample_RAM_W_Address;
wire   [3:0]   FIFOs_Reader_0_Sample_RAM_W_Block_Address;
wire   [63:0]  FIFOs_Reader_0_Sample_RAM_W_Data;
wire           FIFOs_Reader_0_Sample_RAM_W_Enable;
wire   [15:0]  Input_Data_Part_0_Q_0;
wire   [15:0]  Input_Data_Part_0_Q_1;
wire   [15:0]  Input_Data_Part_0_Q_2;
wire   [15:0]  Input_Data_Part_0_Q_3;
wire   [7:0]   Input_Data_Part_0_TRG_Detect_Vector;
wire   [15:0]  Input_Data_Part_1_Q_0;
wire   [15:0]  Input_Data_Part_1_Q_1;
wire   [15:0]  Input_Data_Part_1_Q_2;
wire   [15:0]  Input_Data_Part_1_Q_3;
wire           LANE0_RX_VAL_net_0;
wire           LANE0_RXD_N;
wire           LANE0_RXD_P;
wire           LANE1_RXD_N;
wire           LANE1_RXD_P;
wire           LANE2_RXD_N;
wire           LANE2_RXD_P;
wire           LANE3_RXD_N;
wire           LANE3_RXD_P;
wire           LANE4_RXD_N;
wire           LANE4_RXD_P;
wire           LANE5_RXD_N;
wire           LANE5_RXD_P;
wire           PF_XCVR_ERM_C2_0_LANE0_RX_CLK_R;
wire   [31:0]  PF_XCVR_ERM_C2_0_LANE0_RX_DATA;
wire           PF_XCVR_ERM_C2_0_LANE0_RX_VAL;
wire           PF_XCVR_ERM_C2_0_LANE1_RX_CLK_R;
wire   [31:0]  PF_XCVR_ERM_C2_0_LANE1_RX_DATA;
wire           PF_XCVR_ERM_C2_0_LANE1_RX_VAL;
wire           PF_XCVR_ERM_C2_0_LANE2_RX_CLK_R;
wire   [31:0]  PF_XCVR_ERM_C2_0_LANE2_RX_DATA;
wire           PF_XCVR_ERM_C2_0_LANE2_RX_VAL;
wire           PF_XCVR_ERM_C2_0_LANE3_RX_CLK_R_0;
wire   [31:0]  PF_XCVR_ERM_C2_0_LANE3_RX_DATA;
wire           PF_XCVR_ERM_C2_0_LANE3_RX_VAL;
wire   [31:0]  PF_XCVR_ERM_C3_0_LANE0_RX_DATA;
wire           PF_XCVR_ERM_C3_0_LANE0_RX_VAL;
wire   [31:0]  PF_XCVR_ERM_C3_0_LANE1_RX_DATA;
wire           PF_XCVR_ERM_C3_0_LANE1_RX_VAL;
wire           REF_Clock;
wire           REF_Reset_N;
wire           Reset_N;
wire   [63:0]  Sample_RAM_Block_0_B_Output_Data;
wire   [11:0]  Test_Generator_0_Test_Data_0;
wire   [11:0]  Test_Generator_0_Test_Data_1;
wire   [11:0]  Test_Generator_0_Test_Data_2;
wire   [11:0]  Test_Generator_0_Test_Data_3;
wire   [11:0]  Test_Generator_0_Test_Data_4;
wire   [11:0]  Test_Generator_0_Test_Data_5;
wire   [11:0]  Test_Generator_0_Test_Data_6;
wire   [11:0]  Test_Generator_0_Test_Data_7;
wire           Trigger_Top_Part_0_ALL_FIFO_Enable;
wire           Trigger_Top_Part_0_Control_Test_Generator_Enable;
wire           Trigger_Top_Part_0_EMPTY;
wire   [17:0]  Trigger_Top_Part_0_Q;
wire   [7:0]   Trigger_Top_Part_0_TRG_Enable_Vector;
wire           Trigger_Top_Part_0_TRG_First_Is_First;
wire           Trigger_Top_Part_0_TRG_Last_Is_Last;
wire   [11:0]  Trigger_Top_Part_0_TRG_Threshold;
wire           C_busy_net_1;
wire           Communication_Data_Enable_net_1;
wire           Communication_Data_Req_net_1;
wire           Diag_0_net_1;
wire           Diag_1_net_1;
wire           Diag_2_net_1;
wire           Diag_3_net_1;
wire           LANE0_RX_VAL_net_1;
wire   [15:0]  C_read_data_frame_net_1;
wire   [31:0]  Communication_Data_Frame_net_1;
wire   [11:0]  Q_slice_0;
wire   [15:12] Q_slice_1;
wire   [27:16] Q_slice_2;
wire   [31:28] Q_slice_3;
wire   [11:0]  Q_slice_4;
wire   [15:12] Q_slice_5;
wire   [27:16] Q_slice_6;
wire   [31:28] Q_slice_7;
wire   [11:0]  Q_slice_8;
wire   [15:12] Q_slice_9;
wire   [27:16] Q_slice_10;
wire   [31:28] Q_slice_11;
wire   [11:0]  Q_slice_12;
wire   [15:12] Q_slice_13;
wire   [27:16] Q_slice_14;
wire   [31:28] Q_slice_15;
wire   [11:0]  Q_slice_16;
wire   [15:12] Q_slice_17;
wire   [27:16] Q_slice_18;
wire   [31:28] Q_slice_19;
wire   [11:0]  Q_slice_20;
wire   [15:12] Q_slice_21;
wire   [27:16] Q_slice_22;
wire   [31:28] Q_slice_23;
wire   [31:0]  Q_net_0;
wire   [31:0]  Q_net_1;
wire   [31:0]  Q_net_2;
wire   [31:0]  Q_net_3;
wire   [31:0]  Q_net_4;
wire   [31:0]  Q_net_5;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire           VCC_net;
wire   [2:0]   Order_Of_TRG_Unit_0_const_net_0;
wire   [2:0]   Order_Of_TRG_Unit_1_const_net_0;
wire   [2:0]   Order_Of_TRG_Unit_3_const_net_0;
wire   [2:0]   Order_Of_TRG_Unit_2_const_net_0;
wire   [2:0]   Order_Of_TRG_Unit_0_const_net_1;
wire   [2:0]   Order_Of_TRG_Unit_1_const_net_1;
wire   [2:0]   Order_Of_TRG_Unit_3_const_net_1;
wire   [2:0]   Order_Of_TRG_Unit_2_const_net_1;
wire           GND_net;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign VCC_net                         = 1'b1;
assign Order_Of_TRG_Unit_0_const_net_0 = 3'h0;
assign Order_Of_TRG_Unit_1_const_net_0 = 3'h1;
assign Order_Of_TRG_Unit_3_const_net_0 = 3'h3;
assign Order_Of_TRG_Unit_2_const_net_0 = 3'h2;
assign Order_Of_TRG_Unit_0_const_net_1 = 3'h4;
assign Order_Of_TRG_Unit_1_const_net_1 = 3'h5;
assign Order_Of_TRG_Unit_3_const_net_1 = 3'h7;
assign Order_Of_TRG_Unit_2_const_net_1 = 3'h6;
assign GND_net                         = 1'b0;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign C_busy_net_1                    = C_busy_net_0;
assign C_busy                          = C_busy_net_1;
assign Communication_Data_Enable_net_1 = Communication_Data_Enable_net_0;
assign Communication_Data_Enable       = Communication_Data_Enable_net_1;
assign Communication_Data_Req_net_1    = Communication_Data_Req_net_0;
assign Communication_Data_Req          = Communication_Data_Req_net_1;
assign Diag_0_net_1                    = Diag_0_net_0;
assign Diag_0                          = Diag_0_net_1;
assign Diag_1_net_1                    = Diag_1_net_0;
assign Diag_1                          = Diag_1_net_1;
assign Diag_2_net_1                    = Diag_2_net_0;
assign Diag_2                          = Diag_2_net_1;
assign Diag_3_net_1                    = Diag_3_net_0;
assign Diag_3                          = Diag_3_net_1;
assign LANE0_RX_VAL_net_1              = LANE0_RX_VAL_net_0;
assign LANE0_RX_VAL                    = LANE0_RX_VAL_net_1;
assign C_read_data_frame_net_1         = C_read_data_frame_net_0;
assign C_read_data_frame[15:0]         = C_read_data_frame_net_1;
assign Communication_Data_Frame_net_1  = Communication_Data_Frame_net_0;
assign Communication_Data_Frame[31:0]  = Communication_Data_Frame_net_1;
//--------------------------------------------------------------------
// Slices assignments
//--------------------------------------------------------------------
assign Q_slice_0  = Q_net_0[11:0];
assign Q_slice_1  = Q_net_0[15:12];
assign Q_slice_2  = Q_net_0[27:16];
assign Q_slice_3  = Q_net_0[31:28];
assign Q_slice_4  = Q_net_1[11:0];
assign Q_slice_5  = Q_net_1[15:12];
assign Q_slice_6  = Q_net_1[27:16];
assign Q_slice_7  = Q_net_1[31:28];
assign Q_slice_8  = Q_net_2[11:0];
assign Q_slice_9  = Q_net_2[15:12];
assign Q_slice_10 = Q_net_2[27:16];
assign Q_slice_11 = Q_net_2[31:28];
assign Q_slice_12 = Q_net_3[11:0];
assign Q_slice_13 = Q_net_3[15:12];
assign Q_slice_14 = Q_net_3[27:16];
assign Q_slice_15 = Q_net_3[31:28];
assign Q_slice_16 = Q_net_4[11:0];
assign Q_slice_17 = Q_net_4[15:12];
assign Q_slice_18 = Q_net_4[27:16];
assign Q_slice_19 = Q_net_4[31:28];
assign Q_slice_20 = Q_net_5[11:0];
assign Q_slice_21 = Q_net_5[15:12];
assign Q_slice_22 = Q_net_5[27:16];
assign Q_slice_23 = Q_net_5[31:28];
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------AND4
AND4 AND4_0(
        // Inputs
        .A ( PF_XCVR_ERM_C2_0_LANE0_RX_VAL ),
        .B ( PF_XCVR_ERM_C2_0_LANE1_RX_VAL ),
        .C ( PF_XCVR_ERM_C2_0_LANE2_RX_VAL ),
        .D ( PF_XCVR_ERM_C2_0_LANE3_RX_VAL ),
        // Outputs
        .Y ( AND4_0_Y ) 
        );

//--------AND4
AND4 AND4_0_0(
        // Inputs
        .A ( PF_XCVR_ERM_C3_0_LANE0_RX_VAL ),
        .B ( PF_XCVR_ERM_C3_0_LANE1_RX_VAL ),
        .C ( AND4_0_Y ),
        .D ( VCC_net ),
        // Outputs
        .Y ( LANE0_RX_VAL_net_0 ) 
        );

//--------Communication_Builder
Communication_Builder Communication_Builder_0(
        // Inputs
        .Clock                       ( Clock ),
        .Reset_N                     ( Reset_N ),
        .Communication_Data_Full     ( Communication_Data_Full ),
        .Communication_DATA_Ack      ( Communication_DATA_Ack ),
        .Event_RAM_R_Data_Start_ADDR ( Event_Info_RAM_Block_0_B_DOUT_Event_Start_ADDR ),
        .Event_RAM_R_Data_Number     ( Event_Info_RAM_Block_0_B_DOUT_Event_Number ),
        .Event_RAM_R_Data_Size       ( Event_Info_RAM_Block_0_B_DOUT_Event_Size ),
        .Event_RAM_R_Data_Status     ( Event_Info_RAM_Block_0_B_DOUT_Event_Status ),
        .Sample_RAM_R_Data           ( Sample_RAM_Block_0_B_Output_Data ),
        // Outputs
        .Event_RAM_W_Enable_Status   ( Communication_Builder_0_Event_RAM_W_Enable_Status ),
        .Communication_Data_Enable   ( Communication_Data_Enable_net_0 ),
        .Communication_Data_Req      ( Communication_Data_Req_net_0 ),
        .Diag_0                      ( Diag_0_net_0 ),
        .Diag_1                      ( Diag_1_net_0 ),
        .Diag_2                      ( Diag_2_net_0 ),
        .Diag_3                      ( Diag_3_net_0 ),
        .Event_RAM_R_Address         ( Communication_Builder_0_Event_RAM_R_Address ),
        .Event_RAM_W_Data_Status     ( Communication_Builder_0_Event_RAM_W_Data_Status ),
        .Sample_RAM_R_Address        ( Communication_Builder_0_Sample_RAM_R_Address ),
        .Sample_RAM_R_Block_Address  ( Communication_Builder_0_Sample_RAM_R_Block_Address ),
        .Communication_Data_Frame    ( Communication_Data_Frame_net_0 ) 
        );

//--------COREFIFO_C9
COREFIFO_C9 COREFIFO_C9_0(
        // Inputs
        .WCLOCK   ( PF_XCVR_ERM_C2_0_LANE0_RX_CLK_R ),
        .RCLOCK   ( Clock ),
        .WRESET_N ( CTRL_ARST_N ),
        .RRESET_N ( Reset_N ),
        .WE       ( LANE0_RX_VAL_net_0 ),
        .RE       ( VCC_net ),
        .DATA     ( PF_XCVR_ERM_C2_0_LANE0_RX_DATA ),
        // Outputs
        .FULL     (  ),
        .EMPTY    (  ),
        .Q        ( Q_net_0 ) 
        );

//--------COREFIFO_C9
COREFIFO_C9 COREFIFO_C9_0_0(
        // Inputs
        .WCLOCK   ( PF_XCVR_ERM_C2_0_LANE1_RX_CLK_R ),
        .RCLOCK   ( Clock ),
        .WRESET_N ( CTRL_ARST_N ),
        .RRESET_N ( Reset_N ),
        .WE       ( LANE0_RX_VAL_net_0 ),
        .RE       ( VCC_net ),
        .DATA     ( PF_XCVR_ERM_C2_0_LANE1_RX_DATA ),
        // Outputs
        .FULL     (  ),
        .EMPTY    (  ),
        .Q        ( Q_net_1 ) 
        );

//--------COREFIFO_C9
COREFIFO_C9 COREFIFO_C9_0_1(
        // Inputs
        .WCLOCK   ( PF_XCVR_ERM_C2_0_LANE2_RX_CLK_R ),
        .RCLOCK   ( Clock ),
        .WRESET_N ( CTRL_ARST_N ),
        .RRESET_N ( Reset_N ),
        .WE       ( LANE0_RX_VAL_net_0 ),
        .RE       ( VCC_net ),
        .DATA     ( PF_XCVR_ERM_C2_0_LANE2_RX_DATA ),
        // Outputs
        .FULL     (  ),
        .EMPTY    (  ),
        .Q        ( Q_net_2 ) 
        );

//--------COREFIFO_C9
COREFIFO_C9 COREFIFO_C9_0_2(
        // Inputs
        .WCLOCK   ( PF_XCVR_ERM_C2_0_LANE3_RX_CLK_R_0 ),
        .RCLOCK   ( Clock ),
        .WRESET_N ( CTRL_ARST_N ),
        .RRESET_N ( Reset_N ),
        .WE       ( LANE0_RX_VAL_net_0 ),
        .RE       ( VCC_net ),
        .DATA     ( PF_XCVR_ERM_C2_0_LANE3_RX_DATA ),
        // Outputs
        .FULL     (  ),
        .EMPTY    (  ),
        .Q        ( Q_net_3 ) 
        );

//--------COREFIFO_C9
COREFIFO_C9 COREFIFO_C9_0_2_0(
        // Inputs
        .WCLOCK   ( PF_XCVR_ERM_C2_0_LANE3_RX_CLK_R_0 ),
        .RCLOCK   ( Clock ),
        .WRESET_N ( CTRL_ARST_N ),
        .RRESET_N ( Reset_N ),
        .WE       ( LANE0_RX_VAL_net_0 ),
        .RE       ( VCC_net ),
        .DATA     ( PF_XCVR_ERM_C3_0_LANE0_RX_DATA ),
        // Outputs
        .FULL     (  ),
        .EMPTY    (  ),
        .Q        ( Q_net_4 ) 
        );

//--------COREFIFO_C9
COREFIFO_C9 COREFIFO_C9_0_2_1(
        // Inputs
        .WCLOCK   ( PF_XCVR_ERM_C2_0_LANE3_RX_CLK_R_0 ),
        .RCLOCK   ( Clock ),
        .WRESET_N ( CTRL_ARST_N ),
        .RRESET_N ( Reset_N ),
        .WE       ( LANE0_RX_VAL_net_0 ),
        .RE       ( VCC_net ),
        .DATA     ( PF_XCVR_ERM_C3_0_LANE1_RX_DATA ),
        // Outputs
        .FULL     (  ),
        .EMPTY    (  ),
        .Q        ( Q_net_5 ) 
        );

//--------Event_Info_RAM_Block
Event_Info_RAM_Block Event_Info_RAM_Block_0(
        // Inputs
        .A_WEN_Event_Start_ADDR  ( FIFOs_Reader_0_Event_RAM_W_Enable_Start_ADDR ),
        .A_WEN_Event_Number      ( FIFOs_Reader_0_Event_RAM_W_Enable_Number ),
        .A_WEN_Event_Size        ( FIFOs_Reader_0_Event_RAM_W_Enable_Size ),
        .A_WEN_Event_Status      ( FIFOs_Reader_0_Event_RAM_W_Enable_Status ),
        .B_WEN_Event_Status      ( Communication_Builder_0_Event_RAM_W_Enable_Status ),
        .CLK                     ( Clock ),
        .A_ADDR                  ( FIFOs_Reader_0_Event_RAM_W_Address ),
        .B_ADDR                  ( Communication_Builder_0_Event_RAM_R_Address ),
        .A_DIN_Event_Start_ADDR  ( FIFOs_Reader_0_Event_RAM_W_Data_Start_ADDR ),
        .A_DIN_Event_Number      ( FIFOs_Reader_0_Event_RAM_W_Data_Number ),
        .A_DIN_Event_Size        ( FIFOs_Reader_0_Event_RAM_W_Data_Size ),
        .A_DIN_Event_Status      ( FIFOs_Reader_0_Event_RAM_W_Data_Status ),
        .B_DIN_Event_Status      ( Communication_Builder_0_Event_RAM_W_Data_Status ),
        // Outputs
        .A_DOUT_Event_Status     ( Event_Info_RAM_Block_0_A_DOUT_Event_Status ),
        .B_DOUT_Event_Status     ( Event_Info_RAM_Block_0_B_DOUT_Event_Status ),
        .B_DOUT_Event_Start_ADDR ( Event_Info_RAM_Block_0_B_DOUT_Event_Start_ADDR ),
        .B_DOUT_Event_Number     ( Event_Info_RAM_Block_0_B_DOUT_Event_Number ),
        .B_DOUT_Event_Size       ( Event_Info_RAM_Block_0_B_DOUT_Event_Size ) 
        );

//--------FIFOs_Reader
FIFOs_Reader FIFOs_Reader_0(
        // Inputs
        .Clock                         ( Clock ),
        .Reset_N                       ( Reset_N ),
        .Event_FIFO_Empty              ( Trigger_Top_Part_0_EMPTY ),
        .Event_FIFO_R_Data             ( Trigger_Top_Part_0_Q ),
        .Block_0_Sample_FIFO_0_R_Data  ( Input_Data_Part_0_Q_0 ),
        .Block_0_Sample_FIFO_1_R_Data  ( Input_Data_Part_0_Q_1 ),
        .Block_0_Sample_FIFO_2_R_Data  ( Input_Data_Part_0_Q_2 ),
        .Block_0_Sample_FIFO_3_R_Data  ( Input_Data_Part_0_Q_3 ),
        .Block_1_Sample_FIFO_0_R_Data  ( Input_Data_Part_1_Q_0 ),
        .Block_1_Sample_FIFO_1_R_Data  ( Input_Data_Part_1_Q_1 ),
        .Block_1_Sample_FIFO_2_R_Data  ( Input_Data_Part_1_Q_2 ),
        .Block_1_Sample_FIFO_3_R_Data  ( Input_Data_Part_1_Q_3 ),
        .Event_RAM_R_Data_Status       ( Event_Info_RAM_Block_0_A_DOUT_Event_Status ),
        // Outputs
        .Event_FIFO_R_Enable           ( FIFOs_Reader_0_Event_FIFO_R_Enable ),
        .Block_0_Sample_FIFO_R_Enable  ( FIFOs_Reader_0_Block_0_Sample_FIFO_R_Enable ),
        .Block_1_Sample_FIFO_R_Enable  ( FIFOs_Reader_0_Block_1_Sample_FIFO_R_Enable ),
        .Event_RAM_W_Enable_Start_ADDR ( FIFOs_Reader_0_Event_RAM_W_Enable_Start_ADDR ),
        .Event_RAM_W_Enable_Number     ( FIFOs_Reader_0_Event_RAM_W_Enable_Number ),
        .Event_RAM_W_Enable_Size       ( FIFOs_Reader_0_Event_RAM_W_Enable_Size ),
        .Event_RAM_W_Enable_Status     ( FIFOs_Reader_0_Event_RAM_W_Enable_Status ),
        .Sample_RAM_W_Enable           ( FIFOs_Reader_0_Sample_RAM_W_Enable ),
        .Diag_Valid                    (  ),
        .Event_RAM_W_Address           ( FIFOs_Reader_0_Event_RAM_W_Address ),
        .Event_RAM_W_Data_Start_ADDR   ( FIFOs_Reader_0_Event_RAM_W_Data_Start_ADDR ),
        .Event_RAM_W_Data_Number       ( FIFOs_Reader_0_Event_RAM_W_Data_Number ),
        .Event_RAM_W_Data_Size         ( FIFOs_Reader_0_Event_RAM_W_Data_Size ),
        .Event_RAM_W_Data_Status       ( FIFOs_Reader_0_Event_RAM_W_Data_Status ),
        .Sample_RAM_W_Address          ( FIFOs_Reader_0_Sample_RAM_W_Address ),
        .Sample_RAM_W_Block_Address    ( FIFOs_Reader_0_Sample_RAM_W_Block_Address ),
        .Sample_RAM_W_Data             ( FIFOs_Reader_0_Sample_RAM_W_Data ) 
        );

//--------Input_Data_Part
Input_Data_Part Input_Data_Part_0(
        // Inputs
        .Clock               ( Clock ),
        .Reset_N_Trigger     ( Reset_N ),
        .Fifo_WE             ( Trigger_Top_Part_0_ALL_FIFO_Enable ),
        .TRG_First_Is_First  ( Trigger_Top_Part_0_TRG_First_Is_First ),
        .TRG_Last_Is_Last    ( Trigger_Top_Part_0_TRG_Last_Is_Last ),
        .RE                  ( FIFOs_Reader_0_Block_0_Sample_FIFO_R_Enable ),
        .RESET_N_Fifo        ( Fifo_RESET_N ),
        .Input_Data_0        ( Test_Generator_0_Test_Data_0 ),
        .Input_Data_1        ( Test_Generator_0_Test_Data_1 ),
        .Input_Data_2        ( Test_Generator_0_Test_Data_2 ),
        .Input_Data_3        ( Test_Generator_0_Test_Data_3 ),
        .TRG_Threshold       ( Trigger_Top_Part_0_TRG_Threshold ),
        .TRG_Enable_Vector   ( Trigger_Top_Part_0_TRG_Enable_Vector ),
        .Order_Of_TRG_Unit_0 ( Order_Of_TRG_Unit_0_const_net_0 ),
        .Order_Of_TRG_Unit_1 ( Order_Of_TRG_Unit_1_const_net_0 ),
        .Order_Of_TRG_Unit_3 ( Order_Of_TRG_Unit_3_const_net_0 ),
        .Order_Of_TRG_Unit_2 ( Order_Of_TRG_Unit_2_const_net_0 ),
        // Outputs
        .Q_0                 ( Input_Data_Part_0_Q_0 ),
        .Q_1                 ( Input_Data_Part_0_Q_1 ),
        .Q_2                 ( Input_Data_Part_0_Q_2 ),
        .Q_3                 ( Input_Data_Part_0_Q_3 ),
        // Inouts
        .TRG_Detect_Vector   ( Input_Data_Part_0_TRG_Detect_Vector ) 
        );

//--------Input_Data_Part
Input_Data_Part Input_Data_Part_1(
        // Inputs
        .Clock               ( Clock ),
        .Reset_N_Trigger     ( Reset_N ),
        .Fifo_WE             ( Trigger_Top_Part_0_ALL_FIFO_Enable ),
        .TRG_First_Is_First  ( Trigger_Top_Part_0_TRG_First_Is_First ),
        .TRG_Last_Is_Last    ( Trigger_Top_Part_0_TRG_Last_Is_Last ),
        .RE                  ( FIFOs_Reader_0_Block_1_Sample_FIFO_R_Enable ),
        .RESET_N_Fifo        ( Fifo_RESET_N ),
        .Input_Data_0        ( Test_Generator_0_Test_Data_4 ),
        .Input_Data_1        ( Test_Generator_0_Test_Data_5 ),
        .Input_Data_2        ( Test_Generator_0_Test_Data_6 ),
        .Input_Data_3        ( Test_Generator_0_Test_Data_7 ),
        .TRG_Threshold       ( Trigger_Top_Part_0_TRG_Threshold ),
        .TRG_Enable_Vector   ( Trigger_Top_Part_0_TRG_Enable_Vector ),
        .Order_Of_TRG_Unit_0 ( Order_Of_TRG_Unit_0_const_net_1 ),
        .Order_Of_TRG_Unit_1 ( Order_Of_TRG_Unit_1_const_net_1 ),
        .Order_Of_TRG_Unit_3 ( Order_Of_TRG_Unit_3_const_net_1 ),
        .Order_Of_TRG_Unit_2 ( Order_Of_TRG_Unit_2_const_net_1 ),
        // Outputs
        .Q_0                 ( Input_Data_Part_1_Q_0 ),
        .Q_1                 ( Input_Data_Part_1_Q_1 ),
        .Q_2                 ( Input_Data_Part_1_Q_2 ),
        .Q_3                 ( Input_Data_Part_1_Q_3 ),
        // Inouts
        .TRG_Detect_Vector   ( Input_Data_Part_0_TRG_Detect_Vector ) 
        );

//--------PF_XCVR_ERM_C2
PF_XCVR_ERM_C2 PF_XCVR_ERM_C2_0(
        // Inputs
        .LANE0_RXD_P              ( LANE0_RXD_P ),
        .LANE0_RXD_N              ( LANE0_RXD_N ),
        .LANE1_RXD_P              ( LANE1_RXD_P ),
        .LANE1_RXD_N              ( LANE1_RXD_N ),
        .LANE2_RXD_P              ( LANE2_RXD_P ),
        .LANE2_RXD_N              ( LANE2_RXD_N ),
        .LANE3_RXD_P              ( LANE3_RXD_P ),
        .LANE3_RXD_N              ( LANE3_RXD_N ),
        .LANE0_CDR_REF_CLK_FAB    ( REF_Clock ),
        .LANE0_PCS_ARST_N         ( REF_Reset_N ),
        .LANE0_PMA_ARST_N         ( REF_Reset_N ),
        .LANE1_CDR_REF_CLK_FAB    ( REF_Clock ),
        .LANE1_PCS_ARST_N         ( REF_Reset_N ),
        .LANE1_PMA_ARST_N         ( REF_Reset_N ),
        .LANE2_CDR_REF_CLK_FAB    ( REF_Clock ),
        .LANE2_PCS_ARST_N         ( REF_Reset_N ),
        .LANE2_PMA_ARST_N         ( REF_Reset_N ),
        .LANE3_CDR_REF_CLK_FAB    ( REF_Clock ),
        .LANE3_PCS_ARST_N         ( REF_Reset_N ),
        .LANE3_PMA_ARST_N         ( REF_Reset_N ),
        .CTRL_CLK                 ( CTRL_CLK ),
        .CTRL_ARST_N              ( CTRL_ARST_N ),
        .LANE0_LOS                ( GND_net ),
        .LANE0_CLK_REF            ( REF_Clock ),
        .LANE1_LOS                ( GND_net ),
        .LANE1_CLK_REF            ( REF_Clock ),
        .LANE2_LOS                ( GND_net ),
        .LANE2_CLK_REF            ( REF_Clock ),
        .LANE3_LOS                ( GND_net ),
        .LANE3_CLK_REF            ( REF_Clock ),
        // Outputs
        .LANE0_RX_CLK_R           ( PF_XCVR_ERM_C2_0_LANE0_RX_CLK_R ),
        .LANE0_RX_READY_CDR       (  ),
        .LANE0_RX_VAL_CDR         (  ),
        .LANE0_RX_IDLE            (  ),
        .LANE1_RX_CLK_R           ( PF_XCVR_ERM_C2_0_LANE1_RX_CLK_R ),
        .LANE1_RX_READY_CDR       (  ),
        .LANE1_RX_VAL_CDR         (  ),
        .LANE1_RX_IDLE            (  ),
        .LANE2_RX_CLK_R           ( PF_XCVR_ERM_C2_0_LANE2_RX_CLK_R ),
        .LANE2_RX_READY_CDR       (  ),
        .LANE2_RX_VAL_CDR         (  ),
        .LANE2_RX_IDLE            (  ),
        .LANE3_RX_CLK_R           ( PF_XCVR_ERM_C2_0_LANE3_RX_CLK_R_0 ),
        .LANE3_RX_READY_CDR       (  ),
        .LANE3_RX_VAL_CDR         (  ),
        .LANE3_RX_IDLE            (  ),
        .LANE0_RX_READY           (  ),
        .LANE0_RX_VAL             ( PF_XCVR_ERM_C2_0_LANE0_RX_VAL ),
        .LANE1_RX_READY           (  ),
        .LANE1_RX_VAL             ( PF_XCVR_ERM_C2_0_LANE1_RX_VAL ),
        .LANE2_RX_READY           (  ),
        .LANE2_RX_VAL             ( PF_XCVR_ERM_C2_0_LANE2_RX_VAL ),
        .LANE3_RX_READY           (  ),
        .LANE3_RX_VAL             ( PF_XCVR_ERM_C2_0_LANE3_RX_VAL ),
        .LANE0_RX_DATA            ( PF_XCVR_ERM_C2_0_LANE0_RX_DATA ),
        .LANE0_RX_CODE_VIOLATION  (  ),
        .LANE0_RX_DISPARITY_ERROR (  ),
        .LANE0_8B10B_RX_K         (  ),
        .LANE1_RX_DATA            ( PF_XCVR_ERM_C2_0_LANE1_RX_DATA ),
        .LANE1_RX_CODE_VIOLATION  (  ),
        .LANE1_RX_DISPARITY_ERROR (  ),
        .LANE1_8B10B_RX_K         (  ),
        .LANE2_RX_DATA            ( PF_XCVR_ERM_C2_0_LANE2_RX_DATA ),
        .LANE2_RX_CODE_VIOLATION  (  ),
        .LANE2_RX_DISPARITY_ERROR (  ),
        .LANE2_8B10B_RX_K         (  ),
        .LANE3_RX_DATA            ( PF_XCVR_ERM_C2_0_LANE3_RX_DATA ),
        .LANE3_RX_CODE_VIOLATION  (  ),
        .LANE3_RX_DISPARITY_ERROR (  ),
        .LANE3_8B10B_RX_K         (  ) 
        );

//--------PF_XCVR_ERM_C3
PF_XCVR_ERM_C3 PF_XCVR_ERM_C3_0(
        // Inputs
        .LANE0_RXD_P              ( LANE4_RXD_P ),
        .LANE0_RXD_N              ( LANE4_RXD_N ),
        .LANE1_RXD_P              ( LANE5_RXD_P ),
        .LANE1_RXD_N              ( LANE5_RXD_N ),
        .LANE0_CDR_REF_CLK_FAB    ( REF_Clock ),
        .LANE0_PCS_ARST_N         ( REF_Reset_N ),
        .LANE0_PMA_ARST_N         ( REF_Reset_N ),
        .LANE1_CDR_REF_CLK_FAB    ( REF_Clock ),
        .LANE1_PCS_ARST_N         ( REF_Reset_N ),
        .LANE1_PMA_ARST_N         ( REF_Reset_N ),
        .CTRL_CLK                 ( CTRL_CLK ),
        .CTRL_ARST_N              ( CTRL_ARST_N ),
        .LANE0_LOS                ( GND_net ),
        .LANE0_CLK_REF            ( REF_Clock ),
        .LANE1_LOS                ( GND_net ),
        .LANE1_CLK_REF            ( REF_Clock ),
        // Outputs
        .LANE0_RX_CLK_R           (  ),
        .LANE0_RX_READY_CDR       (  ),
        .LANE0_RX_VAL_CDR         (  ),
        .LANE0_RX_IDLE            (  ),
        .LANE1_RX_CLK_R           (  ),
        .LANE1_RX_READY_CDR       (  ),
        .LANE1_RX_VAL_CDR         (  ),
        .LANE1_RX_IDLE            (  ),
        .LANE0_RX_READY           (  ),
        .LANE0_RX_VAL             ( PF_XCVR_ERM_C3_0_LANE0_RX_VAL ),
        .LANE1_RX_READY           (  ),
        .LANE1_RX_VAL             ( PF_XCVR_ERM_C3_0_LANE1_RX_VAL ),
        .LANE0_RX_DATA            ( PF_XCVR_ERM_C3_0_LANE0_RX_DATA ),
        .LANE0_RX_CODE_VIOLATION  (  ),
        .LANE0_RX_DISPARITY_ERROR (  ),
        .LANE0_8B10B_RX_K         (  ),
        .LANE1_RX_DATA            ( PF_XCVR_ERM_C3_0_LANE1_RX_DATA ),
        .LANE1_RX_CODE_VIOLATION  (  ),
        .LANE1_RX_DISPARITY_ERROR (  ),
        .LANE1_8B10B_RX_K         (  ) 
        );

//--------Sample_RAM_Block
Sample_RAM_Block Sample_RAM_Block_0(
        // Inputs
        .CLK                    ( Clock ),
        .A_WEN                  ( FIFOs_Reader_0_Sample_RAM_W_Enable ),
        .A_DIN                  ( FIFOs_Reader_0_Sample_RAM_W_Data ),
        .A_ADDR                 ( FIFOs_Reader_0_Sample_RAM_W_Address ),
        .A_Block_Address_vector ( FIFOs_Reader_0_Sample_RAM_W_Block_Address ),
        .B_ADDR                 ( Communication_Builder_0_Sample_RAM_R_Address ),
        .B_Block_Address_vector ( Communication_Builder_0_Sample_RAM_R_Block_Address ),
        // Outputs
        .B_Output_Data          ( Sample_RAM_Block_0_B_Output_Data ) 
        );

//--------Test_Generator
Test_Generator Test_Generator_0(
        // Inputs
        .Clock       ( Clock ),
        .Reset_N     ( Reset_N ),
        .Test_Enable ( Trigger_Top_Part_0_Control_Test_Generator_Enable ),
        // Outputs
        .Test_Data_0 ( Test_Generator_0_Test_Data_0 ),
        .Test_Data_1 ( Test_Generator_0_Test_Data_1 ),
        .Test_Data_2 ( Test_Generator_0_Test_Data_2 ),
        .Test_Data_3 ( Test_Generator_0_Test_Data_3 ),
        .Test_Data_4 ( Test_Generator_0_Test_Data_4 ),
        .Test_Data_5 ( Test_Generator_0_Test_Data_5 ),
        .Test_Data_6 ( Test_Generator_0_Test_Data_6 ),
        .Test_Data_7 ( Test_Generator_0_Test_Data_7 ) 
        );

//--------Trigger_Top_Part
Trigger_Top_Part Trigger_Top_Part_0(
        // Inputs
        .Clock                         ( Clock ),
        .Reset_N                       ( Reset_N ),
        .C_enable_cmd                  ( C_enable_cmd ),
        .C_write_read                  ( C_write_read ),
        .RE                            ( FIFOs_Reader_0_Event_FIFO_R_Enable ),
        .C_addr_frame                  ( C_addr_frame ),
        .C_write_data_frame            ( C_write_data_frame ),
        .TRG_Detect_Vector             ( Input_Data_Part_0_TRG_Detect_Vector ),
        // Outputs
        .C_busy                        ( C_busy_net_0 ),
        .Control_Test_Generator_Enable ( Trigger_Top_Part_0_Control_Test_Generator_Enable ),
        .ALL_FIFO_Enable               ( Trigger_Top_Part_0_ALL_FIFO_Enable ),
        .TRG_First_Is_First            ( Trigger_Top_Part_0_TRG_First_Is_First ),
        .TRG_Last_Is_Last              ( Trigger_Top_Part_0_TRG_Last_Is_Last ),
        .EMPTY                         ( Trigger_Top_Part_0_EMPTY ),
        .C_read_data_frame             ( C_read_data_frame_net_0 ),
        .TRG_Threshold                 ( Trigger_Top_Part_0_TRG_Threshold ),
        .TRG_Enable_Vector             ( Trigger_Top_Part_0_TRG_Enable_Vector ),
        .Q                             ( Trigger_Top_Part_0_Q ) 
        );


endmodule
