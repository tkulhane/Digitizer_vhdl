//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Wed Jun  5 15:14:20 2024
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
    Data_In,
    EXT_TriggerInput,
    Fifo_RESET_N,
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
input          CTRL_Clock;
input          CTRL_Reset_N;
input  [7:0]   C_addr_frame;
input          C_enable_cmd;
input  [15:0]  C_write_data_frame;
input          C_write_read;
input          Clock;
input          Communication_Builder_RUN;
input          Communication_Read;
input  [383:0] Data_In;
input          EXT_TriggerInput;
input          Fifo_RESET_N;
input          Reset_N;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output         ACQ_RunOut;
output         C_busy;
output [15:0]  C_read_data_frame;
output [31:0]  Communication_Data_Frame;
output         Communication_Data_Req;
output         Communication_Empty;
output         Control_Abort_Out;
output         Control_Busy_Out;
output         Control_Enable_Out;
output         Control_Test_Generator_Enable;
output         Control_Trigger_Out;
output         Diag_0;
output         Diag_1;
output         Diag_2;
output         Diag_3;
output         Fifo_NotFree_Out;
output         SelfTrigger_Out;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire             ACQ_RunOut_net_0;
wire   [7:0]     C_addr_frame;
wire             C_busy_net_0;
wire             C_enable_cmd;
wire   [15:0]    C_read_data_frame_net_0;
wire   [15:0]    C_write_data_frame;
wire             C_write_read;
wire             Clock;
wire   [31:0]    Communication_Builder_0_Communication_Data_Frame;
wire             Communication_Builder_0_CountOfEventWord_Read;
wire             Communication_Builder_0_CountOfSampleWord_Read;
wire   [9:0]     Communication_Builder_0_Event_RAM_R_Address;
wire   [7:0]     Communication_Builder_0_Event_RAM_W_Data_Status;
wire             Communication_Builder_0_Event_RAM_W_Enable_Status;
wire   [15:0]    Communication_Builder_0_Sample_RAM_R_Address;
wire   [3:0]     Communication_Builder_0_Sample_RAM_R_Block_Address;
wire             Communication_Builder_RUN;
wire   [31:0]    Communication_Data_Frame_net_0;
wire             Communication_Data_Req_net_0;
wire             Communication_Empty_net_0;
wire             Communication_Read;
wire             Control_Abort_Out_net_0;
wire             Control_Busy_Out_net_0;
wire             Control_Enable_Out_net_0;
wire             Control_Test_Generator_Enable_net_0;
wire             Control_Trigger_Out_net_0;
wire             CTRL_Clock;
wire             CTRL_Reset_N;
wire   [7:0]     CtrlBus_HandShake_0_PRH_addr_frame;
wire             CtrlBus_HandShake_0_PRH_enable_cmd;
wire   [15:0]    CtrlBus_HandShake_0_PRH_write_data_frame;
wire             CtrlBus_HandShake_0_PRH_write_read;
wire   [383:0]   Data_In;
wire             DataRamManage_0_EnableOfWrite;
wire             Diag_0_net_0;
wire             Diag_1_net_0;
wire             Diag_1_0;
wire   [11:0]    Dummy_Block_0_Data_Out11to0;
wire   [59:48]   Dummy_Block_0_Data_Out59to48;
wire   [107:96]  Dummy_Block_0_Data_Out107to96;
wire   [155:144] Dummy_Block_0_Data_Out155to144;
wire   [203:192] Dummy_Block_0_Data_Out203to192;
wire   [251:240] Dummy_Block_0_Data_Out251to240;
wire   [299:288] Dummy_Block_0_Data_Out299to288;
wire   [347:336] Dummy_Block_0_Data_Out347to336;
wire   [7:0]     Event_Info_RAM_Block_0_A_DOUT_Event_Status;
wire   [19:0]    Event_Info_RAM_Block_0_B_DOUT_Event_Number;
wire   [19:0]    Event_Info_RAM_Block_0_B_DOUT_Event_Size;
wire   [19:0]    Event_Info_RAM_Block_0_B_DOUT_Event_Start_ADDR;
wire   [7:0]     Event_Info_RAM_Block_0_B_DOUT_Event_Status;
wire             EXT_TriggerInput;
wire             Fifo_NotFree_Out_net_0;
wire             Fifo_RESET_N;
wire             FIFOs_Reader_0_Block_0_Sample_FIFO_R_Enable;
wire             FIFOs_Reader_0_Block_1_Sample_FIFO_R_Enable;
wire             FIFOs_Reader_0_CountOfEventWord_Write;
wire             FIFOs_Reader_0_CountOfSampleWord_Write;
wire   [9:0]     FIFOs_Reader_0_Event_RAM_W_Address;
wire   [19:0]    FIFOs_Reader_0_Event_RAM_W_Data_Number;
wire   [19:0]    FIFOs_Reader_0_Event_RAM_W_Data_Size;
wire   [19:0]    FIFOs_Reader_0_Event_RAM_W_Data_Start_ADDR;
wire   [7:0]     FIFOs_Reader_0_Event_RAM_W_Data_Status;
wire             FIFOs_Reader_0_Event_RAM_W_Enable_Number;
wire             FIFOs_Reader_0_Event_RAM_W_Enable_Size;
wire             FIFOs_Reader_0_Event_RAM_W_Enable_Start_ADDR;
wire             FIFOs_Reader_0_Event_RAM_W_Enable_Status;
wire   [15:0]    FIFOs_Reader_0_Sample_RAM_W_Address;
wire   [3:0]     FIFOs_Reader_0_Sample_RAM_W_Block_Address;
wire   [63:0]    FIFOs_Reader_0_Sample_RAM_W_Data;
wire             FIFOs_Reader_0_Sample_RAM_W_Enable;
wire   [15:0]    Input_Data_Part_0_Q_0;
wire   [15:0]    Input_Data_Part_0_Q_1;
wire   [15:0]    Input_Data_Part_0_Q_2;
wire   [15:0]    Input_Data_Part_0_Q_3;
wire   [7:0]     Input_Data_Part_0_TRG_Detect_Vector;
wire   [15:0]    Input_Data_Part_1_Q_0;
wire   [15:0]    Input_Data_Part_1_Q_1;
wire   [15:0]    Input_Data_Part_1_Q_2;
wire   [15:0]    Input_Data_Part_1_Q_3;
wire             Reset_N;
wire   [63:0]    Sample_RAM_Block_0_B_Output_Data;
wire             SelfTrigger_Out_net_0;
wire   [383:0]   Test_Generator_for_Lanes_0_Test_DataOut;
wire             Trigger_Top_Part_0_ALL_FIFO_Write;
wire             Trigger_Top_Part_0_C_busy;
wire   [15:0]    Trigger_Top_Part_0_C_read_data_frame;
wire             Trigger_Top_Part_0_Control_Mux_DataTest_Sel;
wire             Trigger_Top_Part_0_EMPTY;
wire   [17:0]    Trigger_Top_Part_0_Q;
wire   [11:0]    Trigger_Top_Part_0_TRG_Threshold;
wire   [383:0]   VectorMux_0_DataOut;
wire             C_busy_net_1;
wire             Communication_Empty_net_1;
wire             Diag_0_net_1;
wire             Diag_1_0_net_0;
wire             Communication_Data_Req_net_1;
wire             Control_Test_Generator_Enable_net_1;
wire             ACQ_RunOut_net_1;
wire             Control_Trigger_Out_net_1;
wire             Control_Busy_Out_net_1;
wire             Control_Enable_Out_net_1;
wire             Fifo_NotFree_Out_net_1;
wire             Control_Abort_Out_net_1;
wire             SelfTrigger_Out_net_1;
wire   [15:0]    C_read_data_frame_net_1;
wire   [31:0]    Communication_Data_Frame_net_1;
wire   [119:108] Data_Out_slice_0;
wire   [131:120] Data_Out_slice_1;
wire   [143:132] Data_Out_slice_2;
wire   [167:156] Data_Out_slice_3;
wire   [179:168] Data_Out_slice_4;
wire   [191:180] Data_Out_slice_5;
wire   [215:204] Data_Out_slice_6;
wire   [227:216] Data_Out_slice_7;
wire   [239:228] Data_Out_slice_8;
wire   [23:12]   Data_Out_slice_9;
wire   [263:252] Data_Out_slice_10;
wire   [275:264] Data_Out_slice_11;
wire   [287:276] Data_Out_slice_12;
wire   [311:300] Data_Out_slice_13;
wire   [323:312] Data_Out_slice_14;
wire   [335:324] Data_Out_slice_15;
wire   [359:348] Data_Out_slice_16;
wire   [35:24]   Data_Out_slice_17;
wire   [371:360] Data_Out_slice_18;
wire   [383:372] Data_Out_slice_19;
wire   [47:36]   Data_Out_slice_20;
wire   [71:60]   Data_Out_slice_21;
wire   [83:72]   Data_Out_slice_22;
wire   [95:84]   Data_Out_slice_23;
wire   [383:0]   Data_Out_net_0;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire             GND_net;
wire   [2:0]     Order_Of_TRG_Unit_0_const_net_0;
wire   [2:0]     Order_Of_TRG_Unit_1_const_net_0;
wire   [2:0]     Order_Of_TRG_Unit_3_const_net_0;
wire   [2:0]     Order_Of_TRG_Unit_2_const_net_0;
wire   [2:0]     Order_Of_TRG_Unit_0_const_net_1;
wire   [2:0]     Order_Of_TRG_Unit_1_const_net_1;
wire   [2:0]     Order_Of_TRG_Unit_3_const_net_1;
wire   [2:0]     Order_Of_TRG_Unit_2_const_net_1;
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
// Slices assignments
//--------------------------------------------------------------------
assign Dummy_Block_0_Data_Out11to0    = Data_Out_net_0[11:0];
assign Dummy_Block_0_Data_Out59to48   = Data_Out_net_0[59:48];
assign Dummy_Block_0_Data_Out107to96  = Data_Out_net_0[107:96];
assign Dummy_Block_0_Data_Out155to144 = Data_Out_net_0[155:144];
assign Dummy_Block_0_Data_Out203to192 = Data_Out_net_0[203:192];
assign Dummy_Block_0_Data_Out251to240 = Data_Out_net_0[251:240];
assign Dummy_Block_0_Data_Out299to288 = Data_Out_net_0[299:288];
assign Dummy_Block_0_Data_Out347to336 = Data_Out_net_0[347:336];
assign Data_Out_slice_0               = Data_Out_net_0[119:108];
assign Data_Out_slice_1               = Data_Out_net_0[131:120];
assign Data_Out_slice_2               = Data_Out_net_0[143:132];
assign Data_Out_slice_3               = Data_Out_net_0[167:156];
assign Data_Out_slice_4               = Data_Out_net_0[179:168];
assign Data_Out_slice_5               = Data_Out_net_0[191:180];
assign Data_Out_slice_6               = Data_Out_net_0[215:204];
assign Data_Out_slice_7               = Data_Out_net_0[227:216];
assign Data_Out_slice_8               = Data_Out_net_0[239:228];
assign Data_Out_slice_9               = Data_Out_net_0[23:12];
assign Data_Out_slice_10              = Data_Out_net_0[263:252];
assign Data_Out_slice_11              = Data_Out_net_0[275:264];
assign Data_Out_slice_12              = Data_Out_net_0[287:276];
assign Data_Out_slice_13              = Data_Out_net_0[311:300];
assign Data_Out_slice_14              = Data_Out_net_0[323:312];
assign Data_Out_slice_15              = Data_Out_net_0[335:324];
assign Data_Out_slice_16              = Data_Out_net_0[359:348];
assign Data_Out_slice_17              = Data_Out_net_0[35:24];
assign Data_Out_slice_18              = Data_Out_net_0[371:360];
assign Data_Out_slice_19              = Data_Out_net_0[383:372];
assign Data_Out_slice_20              = Data_Out_net_0[47:36];
assign Data_Out_slice_21              = Data_Out_net_0[71:60];
assign Data_Out_slice_22              = Data_Out_net_0[83:72];
assign Data_Out_slice_23              = Data_Out_net_0[95:84];
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
        .PRH_Reset_N           ( Reset_N ),
        .CTRL_enable_cmd       ( C_enable_cmd ),
        .CTRL_write_read       ( C_write_read ),
        .PRH_busy              ( Trigger_Top_Part_0_C_busy ),
        .PRH_In_Reset          ( Reset_N ),
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

//--------Dummy_Block
Dummy_Block Dummy_Block_0(
        // Inputs
        .Data_In  ( VectorMux_0_DataOut ),
        // Outputs
        .Data_Out ( Data_Out_net_0 ) 
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
        .Input_Data_0        ( Dummy_Block_0_Data_Out11to0 ),
        .Input_Data_1        ( Dummy_Block_0_Data_Out59to48 ),
        .Input_Data_2        ( Dummy_Block_0_Data_Out107to96 ),
        .Input_Data_3        ( Dummy_Block_0_Data_Out155to144 ),
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
        .Input_Data_0        ( Dummy_Block_0_Data_Out203to192 ),
        .Input_Data_1        ( Dummy_Block_0_Data_Out251to240 ),
        .Input_Data_2        ( Dummy_Block_0_Data_Out299to288 ),
        .Input_Data_3        ( Dummy_Block_0_Data_Out347to336 ),
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

//--------Test_Generator_for_Lanes
Test_Generator_for_Lanes Test_Generator_for_Lanes_0(
        // Inputs
        .Clock        ( Clock ),
        .Reset_N      ( Fifo_RESET_N ),
        .Test_Enable  ( Control_Test_Generator_Enable_net_0 ),
        // Outputs
        .Test_DataOut ( Test_Generator_for_Lanes_0_Test_DataOut ) 
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
        .Q                             ( Trigger_Top_Part_0_Q ),
        .Control_Mux_DataTest_Sel      ( Trigger_Top_Part_0_Control_Mux_DataTest_Sel ) 
        );

//--------VectorMux
VectorMux VectorMux_0(
        // Inputs
        .DataIn_0 ( Data_In ),
        .DataIn_1 ( Test_Generator_for_Lanes_0_Test_DataOut ),
        .Sel      ( Trigger_Top_Part_0_Control_Mux_DataTest_Sel ),
        // Outputs
        .DataOut  ( VectorMux_0_DataOut ) 
        );


endmodule
