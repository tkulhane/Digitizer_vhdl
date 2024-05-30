//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Thu May 30 16:10:25 2024
// Version: 2022.1 2022.1.0.10
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// Data_Block
module Data_Block(
    // Inputs
    CTRL_Clock,
    CTRL_Reset_N,
    C_addr_frame,
    C_enable_cmd,
    C_write_data_frame,
    C_write_read,
    Clock,
    Communication_Builder_RUN,
    Communication_Read,
    EXT_TriggerInput,
    Fifo_RESET_N,
    Input_Data_0_00,
    Input_Data_0_01,
    Input_Data_1_00,
    Input_Data_1_01,
    Input_Data_2_00,
    Input_Data_2_01,
    Input_Data_3_00,
    Input_Data_3_01,
    Reset_N,
    // Outputs
    ACQ_RunOut,
    C_busy,
    C_read_data_frame,
    Communication_Data_Frame,
    Communication_Data_Req,
    Communication_Empty,
    Control_Abort_Out,
    Control_Busy_Out,
    Control_Enable_Out,
    Control_Test_Generator_Enable,
    Control_Trigger_Out,
    Diag_0,
    Diag_1,
    Diag_2,
    Diag_3,
    Fifo_NotFree_Out,
    SelfTrigger_Out
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input         CTRL_Clock;
input         CTRL_Reset_N;
input  [7:0]  C_addr_frame;
input         C_enable_cmd;
input  [15:0] C_write_data_frame;
input         C_write_read;
input         Clock;
input         Communication_Builder_RUN;
input         Communication_Read;
input         EXT_TriggerInput;
input         Fifo_RESET_N;
input  [11:0] Input_Data_0_00;
input  [11:0] Input_Data_0_01;
input  [11:0] Input_Data_1_00;
input  [11:0] Input_Data_1_01;
input  [11:0] Input_Data_2_00;
input  [11:0] Input_Data_2_01;
input  [11:0] Input_Data_3_00;
input  [11:0] Input_Data_3_01;
input         Reset_N;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output        ACQ_RunOut;
output        C_busy;
output [15:0] C_read_data_frame;
output [31:0] Communication_Data_Frame;
output        Communication_Data_Req;
output        Communication_Empty;
output        Control_Abort_Out;
output        Control_Busy_Out;
output        Control_Enable_Out;
output        Control_Test_Generator_Enable;
output        Control_Trigger_Out;
output        Diag_0;
output        Diag_1;
output        Diag_2;
output        Diag_3;
output        Fifo_NotFree_Out;
output        SelfTrigger_Out;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire          ACQ_RunOut_net_0;
wire   [7:0]  C_addr_frame;
wire          C_busy_net_0;
wire          C_enable_cmd;
wire   [15:0] C_read_data_frame_net_0;
wire   [15:0] C_write_data_frame;
wire          C_write_read;
wire          Clock;
wire   [31:0] Communication_Builder_0_Communication_Data_Frame;
wire          Communication_Builder_0_CountOfEventWord_Read;
wire          Communication_Builder_0_CountOfSampleWord_Read;
wire   [9:0]  Communication_Builder_0_Event_RAM_R_Address;
wire   [7:0]  Communication_Builder_0_Event_RAM_W_Data_Status;
wire          Communication_Builder_0_Event_RAM_W_Enable_Status;
wire   [15:0] Communication_Builder_0_Sample_RAM_R_Address;
wire   [3:0]  Communication_Builder_0_Sample_RAM_R_Block_Address;
wire          Communication_Builder_RUN;
wire   [31:0] Communication_Data_Frame_net_0;
wire          Communication_Data_Req_net_0;
wire          Communication_Empty_net_0;
wire          Communication_Read;
wire          Control_Abort_Out_net_0;
wire          Control_Busy_Out_net_0;
wire          Control_Enable_Out_net_0;
wire          Control_Test_Generator_Enable_net_0;
wire          Control_Trigger_Out_net_0;
wire          CTRL_Clock;
wire          CTRL_Reset_N;
wire   [7:0]  CtrlBus_HandShake_0_PRH_addr_frame;
wire          CtrlBus_HandShake_0_PRH_enable_cmd;
wire   [15:0] CtrlBus_HandShake_0_PRH_write_data_frame;
wire          CtrlBus_HandShake_0_PRH_write_read;
wire          DataRamManage_0_EnableOfWrite;
wire          Diag_0_net_0;
wire          Diag_1_net_0;
wire          Diag_1_0;
wire   [7:0]  Event_Info_RAM_Block_0_A_DOUT_Event_Status;
wire   [19:0] Event_Info_RAM_Block_0_B_DOUT_Event_Number;
wire   [19:0] Event_Info_RAM_Block_0_B_DOUT_Event_Size;
wire   [19:0] Event_Info_RAM_Block_0_B_DOUT_Event_Start_ADDR;
wire   [7:0]  Event_Info_RAM_Block_0_B_DOUT_Event_Status;
wire          EXT_TriggerInput;
wire          Fifo_NotFree_Out_net_0;
wire          Fifo_RESET_N;
wire          FIFOs_Reader_0_Block_0_Sample_FIFO_R_Enable;
wire          FIFOs_Reader_0_Block_1_Sample_FIFO_R_Enable;
wire          FIFOs_Reader_0_CountOfEventWord_Write;
wire          FIFOs_Reader_0_CountOfSampleWord_Write;
wire   [9:0]  FIFOs_Reader_0_Event_RAM_W_Address;
wire   [19:0] FIFOs_Reader_0_Event_RAM_W_Data_Number;
wire   [19:0] FIFOs_Reader_0_Event_RAM_W_Data_Size;
wire   [19:0] FIFOs_Reader_0_Event_RAM_W_Data_Start_ADDR;
wire   [7:0]  FIFOs_Reader_0_Event_RAM_W_Data_Status;
wire          FIFOs_Reader_0_Event_RAM_W_Enable_Number;
wire          FIFOs_Reader_0_Event_RAM_W_Enable_Size;
wire          FIFOs_Reader_0_Event_RAM_W_Enable_Start_ADDR;
wire          FIFOs_Reader_0_Event_RAM_W_Enable_Status;
wire   [15:0] FIFOs_Reader_0_Sample_RAM_W_Address;
wire   [3:0]  FIFOs_Reader_0_Sample_RAM_W_Block_Address;
wire   [63:0] FIFOs_Reader_0_Sample_RAM_W_Data;
wire          FIFOs_Reader_0_Sample_RAM_W_Enable;
wire   [11:0] Input_Data_0_00;
wire   [11:0] Input_Data_0_01;
wire   [11:0] Input_Data_1_00;
wire   [11:0] Input_Data_1_01;
wire   [11:0] Input_Data_2_00;
wire   [11:0] Input_Data_2_01;
wire   [11:0] Input_Data_3_00;
wire   [11:0] Input_Data_3_01;
wire   [15:0] Input_Data_Part_0_Q_0;
wire   [15:0] Input_Data_Part_0_Q_1;
wire   [15:0] Input_Data_Part_0_Q_2;
wire   [15:0] Input_Data_Part_0_Q_3;
wire   [7:0]  Input_Data_Part_0_TRG_Detect_Vector;
wire   [15:0] Input_Data_Part_1_Q_0;
wire   [15:0] Input_Data_Part_1_Q_1;
wire   [15:0] Input_Data_Part_1_Q_2;
wire   [15:0] Input_Data_Part_1_Q_3;
wire          Reset_N;
wire   [63:0] Sample_RAM_Block_0_B_Output_Data;
wire          SelfTrigger_Out_net_0;
wire          Trigger_Top_Part_0_ALL_FIFO_Write;
wire          Trigger_Top_Part_0_C_busy;
wire   [15:0] Trigger_Top_Part_0_C_read_data_frame;
wire          Trigger_Top_Part_0_EMPTY;
wire   [17:0] Trigger_Top_Part_0_Q;
wire   [11:0] Trigger_Top_Part_0_TRG_Threshold;
wire          C_busy_net_1;
wire          Communication_Empty_net_1;
wire          Diag_0_net_1;
wire          Diag_1_0_net_0;
wire          Communication_Data_Req_net_1;
wire          Control_Test_Generator_Enable_net_1;
wire          ACQ_RunOut_net_1;
wire          Control_Trigger_Out_net_1;
wire          Control_Busy_Out_net_1;
wire          Control_Enable_Out_net_1;
wire          Fifo_NotFree_Out_net_1;
wire          Control_Abort_Out_net_1;
wire          SelfTrigger_Out_net_1;
wire   [15:0] C_read_data_frame_net_1;
wire   [31:0] Communication_Data_Frame_net_1;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire          GND_net;
wire   [2:0]  Order_Of_TRG_Unit_0_const_net_0;
wire   [2:0]  Order_Of_TRG_Unit_1_const_net_0;
wire   [2:0]  Order_Of_TRG_Unit_3_const_net_0;
wire   [2:0]  Order_Of_TRG_Unit_2_const_net_0;
wire   [2:0]  Order_Of_TRG_Unit_0_const_net_1;
wire   [2:0]  Order_Of_TRG_Unit_1_const_net_1;
wire   [2:0]  Order_Of_TRG_Unit_3_const_net_1;
wire   [2:0]  Order_Of_TRG_Unit_2_const_net_1;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign GND_net                         = 1'b0;
assign Order_Of_TRG_Unit_0_const_net_0 = 3'h0;
assign Order_Of_TRG_Unit_1_const_net_0 = 3'h1;
assign Order_Of_TRG_Unit_3_const_net_0 = 3'h3;
assign Order_Of_TRG_Unit_2_const_net_0 = 3'h2;
assign Order_Of_TRG_Unit_0_const_net_1 = 3'h4;
assign Order_Of_TRG_Unit_1_const_net_1 = 3'h5;
assign Order_Of_TRG_Unit_3_const_net_1 = 3'h7;
assign Order_Of_TRG_Unit_2_const_net_1 = 3'h6;
//--------------------------------------------------------------------
// TieOff assignments
//--------------------------------------------------------------------
assign Diag_2                              = 1'b0;
assign Diag_3                              = 1'b0;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign C_busy_net_1                        = C_busy_net_0;
assign C_busy                              = C_busy_net_1;
assign Communication_Empty_net_1           = Communication_Empty_net_0;
assign Communication_Empty                 = Communication_Empty_net_1;
assign Diag_0_net_1                        = Diag_0_net_0;
assign Diag_0                              = Diag_0_net_1;
assign Diag_1_0_net_0                      = Diag_1_0;
assign Diag_1                              = Diag_1_0_net_0;
assign Communication_Data_Req_net_1        = Communication_Data_Req_net_0;
assign Communication_Data_Req              = Communication_Data_Req_net_1;
assign Control_Test_Generator_Enable_net_1 = Control_Test_Generator_Enable_net_0;
assign Control_Test_Generator_Enable       = Control_Test_Generator_Enable_net_1;
assign ACQ_RunOut_net_1                    = ACQ_RunOut_net_0;
assign ACQ_RunOut                          = ACQ_RunOut_net_1;
assign Control_Trigger_Out_net_1           = Control_Trigger_Out_net_0;
assign Control_Trigger_Out                 = Control_Trigger_Out_net_1;
assign Control_Busy_Out_net_1              = Control_Busy_Out_net_0;
assign Control_Busy_Out                    = Control_Busy_Out_net_1;
assign Control_Enable_Out_net_1            = Control_Enable_Out_net_0;
assign Control_Enable_Out                  = Control_Enable_Out_net_1;
assign Fifo_NotFree_Out_net_1              = Fifo_NotFree_Out_net_0;
assign Fifo_NotFree_Out                    = Fifo_NotFree_Out_net_1;
assign Control_Abort_Out_net_1             = Control_Abort_Out_net_0;
assign Control_Abort_Out                   = Control_Abort_Out_net_1;
assign SelfTrigger_Out_net_1               = SelfTrigger_Out_net_0;
assign SelfTrigger_Out                     = SelfTrigger_Out_net_1;
assign C_read_data_frame_net_1             = C_read_data_frame_net_0;
assign C_read_data_frame[15:0]             = C_read_data_frame_net_1;
assign Communication_Data_Frame_net_1      = Communication_Data_Frame_net_0;
assign Communication_Data_Frame[31:0]      = Communication_Data_Frame_net_1;
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------Communication_Builder
Communication_Builder Communication_Builder_0(
        // Inputs
        .Clock                       ( Clock ),
        .Reset_N                     ( Reset_N ),
        .Communication_Data_Full     ( Diag_1_net_0 ),
        .Communication_DATA_Ack      ( Communication_Builder_RUN ),
        .Event_RAM_R_Data_Start_ADDR ( Event_Info_RAM_Block_0_B_DOUT_Event_Start_ADDR ),
        .Event_RAM_R_Data_Number     ( Event_Info_RAM_Block_0_B_DOUT_Event_Number ),
        .Event_RAM_R_Data_Size       ( Event_Info_RAM_Block_0_B_DOUT_Event_Size ),
        .Event_RAM_R_Data_Status     ( Event_Info_RAM_Block_0_B_DOUT_Event_Status ),
        .Sample_RAM_R_Data           ( Sample_RAM_Block_0_B_Output_Data ),
        // Outputs
        .Event_RAM_W_Enable_Status   ( Communication_Builder_0_Event_RAM_W_Enable_Status ),
        .Communication_Data_Enable   ( Diag_0_net_0 ),
        .Communication_Data_Req      ( Communication_Data_Req_net_0 ),
        .CountOfSampleWord_Read      ( Communication_Builder_0_CountOfSampleWord_Read ),
        .CountOfEventWord_Read       ( Communication_Builder_0_CountOfEventWord_Read ),
        .Diag_0                      (  ),
        .Diag_1                      (  ),
        .Diag_2                      (  ),
        .Diag_3                      (  ),
        .Event_RAM_R_Address         ( Communication_Builder_0_Event_RAM_R_Address ),
        .Event_RAM_W_Data_Status     ( Communication_Builder_0_Event_RAM_W_Data_Status ),
        .Sample_RAM_R_Address        ( Communication_Builder_0_Sample_RAM_R_Address ),
        .Sample_RAM_R_Block_Address  ( Communication_Builder_0_Sample_RAM_R_Block_Address ),
        .Communication_Data_Frame    ( Communication_Builder_0_Communication_Data_Frame ) 
        );

//--------COREFIFO_C10
COREFIFO_C10 COREFIFO_C10_0(
        // Inputs
        .WCLOCK   ( Clock ),
        .RCLOCK   ( CTRL_Clock ),
        .WRESET_N ( Reset_N ),
        .RRESET_N ( CTRL_Reset_N ),
        .WE       ( Diag_0_net_0 ),
        .RE       ( Communication_Read ),
        .DATA     ( Communication_Builder_0_Communication_Data_Frame ),
        // Outputs
        .FULL     (  ),
        .EMPTY    ( Communication_Empty_net_0 ),
        .AFULL    ( Diag_1_net_0 ),
        .Q        ( Communication_Data_Frame_net_0 ) 
        );

//--------CtrlBus_HandShake
CtrlBus_HandShake #( 
        .g_WidthADDR ( 8 ),
        .g_WidthDATA ( 16 ) )
CtrlBus_HandShake_0(
        // Inputs
        .CTRL_Clock            ( CTRL_Clock ),
        .CTRL_Reset_N          ( CTRL_Reset_N ),
        .PRH_Clock             ( Clock ),
        .PRH_Reset_N           ( Fifo_RESET_N ),
        .CTRL_enable_cmd       ( C_enable_cmd ),
        .CTRL_write_read       ( C_write_read ),
        .PRH_busy              ( Trigger_Top_Part_0_C_busy ),
        .PRH_In_Reset          ( Fifo_RESET_N ),
        .CTRL_addr_frame       ( C_addr_frame ),
        .CTRL_write_data_frame ( C_write_data_frame ),
        .PRH_read_data_frame   ( Trigger_Top_Part_0_C_read_data_frame ),
        // Outputs
        .CTRL_busy             ( C_busy_net_0 ),
        .PRH_enable_cmd        ( CtrlBus_HandShake_0_PRH_enable_cmd ),
        .PRH_write_read        ( CtrlBus_HandShake_0_PRH_write_read ),
        .CTRL_read_data_frame  ( C_read_data_frame_net_0 ),
        .PRH_addr_frame        ( CtrlBus_HandShake_0_PRH_addr_frame ),
        .PRH_write_data_frame  ( CtrlBus_HandShake_0_PRH_write_data_frame ) 
        );

//--------DataRamManage
DataRamManage DataRamManage_0(
        // Inputs
        .Clock                   ( Clock ),
        .Reset_N                 ( Reset_N ),
        .CountOfSampleWord_Write ( FIFOs_Reader_0_CountOfSampleWord_Write ),
        .CountOfEventWord_Write  ( FIFOs_Reader_0_CountOfEventWord_Write ),
        .CountOfSampleWord_Read  ( Communication_Builder_0_CountOfSampleWord_Read ),
        .CountOfEventWord_Read   ( Communication_Builder_0_CountOfEventWord_Read ),
        // Outputs
        .EnableOfWrite           ( DataRamManage_0_EnableOfWrite ),
        .EnableOfRead            (  ) 
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
        .RamMan_WriteEnable            ( DataRamManage_0_EnableOfWrite ),
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
        .Event_FIFO_R_Enable           ( Diag_1_0 ),
        .Block_0_Sample_FIFO_R_Enable  ( FIFOs_Reader_0_Block_0_Sample_FIFO_R_Enable ),
        .Block_1_Sample_FIFO_R_Enable  ( FIFOs_Reader_0_Block_1_Sample_FIFO_R_Enable ),
        .Event_RAM_W_Enable_Start_ADDR ( FIFOs_Reader_0_Event_RAM_W_Enable_Start_ADDR ),
        .Event_RAM_W_Enable_Number     ( FIFOs_Reader_0_Event_RAM_W_Enable_Number ),
        .Event_RAM_W_Enable_Size       ( FIFOs_Reader_0_Event_RAM_W_Enable_Size ),
        .Event_RAM_W_Enable_Status     ( FIFOs_Reader_0_Event_RAM_W_Enable_Status ),
        .Sample_RAM_W_Enable           ( FIFOs_Reader_0_Sample_RAM_W_Enable ),
        .CountOfSampleWord_Write       ( FIFOs_Reader_0_CountOfSampleWord_Write ),
        .CountOfEventWord_Write        ( FIFOs_Reader_0_CountOfEventWord_Write ),
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
        .Fifo_Write          ( Trigger_Top_Part_0_ALL_FIFO_Write ),
        .Fifo_Read           ( FIFOs_Reader_0_Block_0_Sample_FIFO_R_Enable ),
        .RESET_N_Fifo        ( Fifo_RESET_N ),
        .Input_Data_0        ( Input_Data_0_00 ),
        .Input_Data_1        ( Input_Data_1_00 ),
        .Input_Data_2        ( Input_Data_2_00 ),
        .Input_Data_3        ( Input_Data_3_00 ),
        .TRG_Threshold       ( Trigger_Top_Part_0_TRG_Threshold ),
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
        .Fifo_Write          ( Trigger_Top_Part_0_ALL_FIFO_Write ),
        .Fifo_Read           ( FIFOs_Reader_0_Block_1_Sample_FIFO_R_Enable ),
        .RESET_N_Fifo        ( Fifo_RESET_N ),
        .Input_Data_0        ( Input_Data_0_01 ),
        .Input_Data_1        ( Input_Data_1_01 ),
        .Input_Data_2        ( Input_Data_2_01 ),
        .Input_Data_3        ( Input_Data_3_01 ),
        .TRG_Threshold       ( Trigger_Top_Part_0_TRG_Threshold ),
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

//--------Trigger_Top_Part
Trigger_Top_Part Trigger_Top_Part_0(
        // Inputs
        .Clock                         ( Clock ),
        .Reset_N                       ( Fifo_RESET_N ),
        .C_enable_cmd                  ( CtrlBus_HandShake_0_PRH_enable_cmd ),
        .C_write_read                  ( CtrlBus_HandShake_0_PRH_write_read ),
        .RE                            ( Diag_1_0 ),
        .EXT_TriggerInput              ( EXT_TriggerInput ),
        .C_addr_frame                  ( CtrlBus_HandShake_0_PRH_addr_frame ),
        .C_write_data_frame            ( CtrlBus_HandShake_0_PRH_write_data_frame ),
        .TRG_Detect_Vector             ( Input_Data_Part_0_TRG_Detect_Vector ),
        // Outputs
        .C_busy                        ( Trigger_Top_Part_0_C_busy ),
        .Control_Test_Generator_Enable ( Control_Test_Generator_Enable_net_0 ),
        .ALL_FIFO_Write                ( Trigger_Top_Part_0_ALL_FIFO_Write ),
        .EMPTY                         ( Trigger_Top_Part_0_EMPTY ),
        .ACQ_RunOut                    ( ACQ_RunOut_net_0 ),
        .Control_Trigger_Out           ( Control_Trigger_Out_net_0 ),
        .Control_Busy_Out              ( Control_Busy_Out_net_0 ),
        .Control_Enable_Out            ( Control_Enable_Out_net_0 ),
        .Fifo_NotFree_Out              ( Fifo_NotFree_Out_net_0 ),
        .Control_Abort_Out             ( Control_Abort_Out_net_0 ),
        .SelfTrigger_Out               ( SelfTrigger_Out_net_0 ),
        .C_read_data_frame             ( Trigger_Top_Part_0_C_read_data_frame ),
        .TRG_Threshold                 ( Trigger_Top_Part_0_TRG_Threshold ),
        .Q                             ( Trigger_Top_Part_0_Q ) 
        );


endmodule
