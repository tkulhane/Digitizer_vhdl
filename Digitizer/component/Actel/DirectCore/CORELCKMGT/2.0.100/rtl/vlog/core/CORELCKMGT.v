// ********************************************************************
// Microsemi Corporation Proprietary and Confidential 
//  Copyright 2018 Microsemi Corporation.  All rights reserved.
//
// ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN 
// ACCORDANCE WITH THE MICROSEMI LICENSE AGREEMENT AND MUST BE APPROVED 
// IN ADVANCE IN WRITING.  
//  
// Description:  Lane Lock Management (CORELCKMGT.sv)
//
// Revision Information:
// Date     Description
// 14Sep18 Initial Release 
//
// SVN Revision Information:
// SVN $Revision: 8763 $
// SVN $Date: 2018-10-11 09:40:21 -0700 (Thu, 11 Oct 2018) $
//
// Resolved SARs
// SAR      Date     Who   Description
// 101423   20Sep18  Brian Corrected value of lckfrc_st upon reset
// 101850   8Oct18   Brian CALIB_SYNC_HOLD input port added. Suppression
//                         of CDRNRM to REQL2R fsm transition while
//                         CoreLaneMstr is undergoing receiver calibration.
// 102006   8Oct18   Brian CoE requested port naming changes.
// 102008   8Oct18   Brian RX_IDLE CDC robustness.
// 102153  11Oct18   Brian Coding error in synch pipeline for SYNC
// 102879   5Nov18   Alex  Replaced all SystemVerilog code with Verilog code
// Notes: 
//        
// *********************************************************************/ 

module CORELCKMGT
#(
parameter integer       DEBOUNCEUS = 10,
                        // Debounce microseconds for cable-pull
                        // Supported values:
                        // DEBOUNCEUS   Time Range us   DEBOUNCETAP
                        // 10           6.4 - 12.8      0
                        // 1,000        819.2 - 1.64e3  7
                        // 2,000        1.64e4 - 3.28e4 8
                        // 5,000        3.28e4 - 6.55e4 9
                        // 10,000       6.55e4 - 13.1e4 10
                        IQUIETUS = 10,
                        // Initial mask time of peak detector from power-up.
                        // IQUIETUS     Time Range us   IQWAIT  IQTAP
                        // 0            use DEBOUNCEUS  0       0
                        // 10           6.4 - 12.8      1       0 
                        // 1,000        819.2 - 1.64e3  1       7
                        ILOCKDLYUS = 0,
                        // Initial L2D request delay 
                        // ILOCKDLYUS   Time Range us   ILWAIT  ILTAP
                        // 0            0               0       0
                        // 10           6.4 - 12.8      1       0
                        // 20           12.8 - 25.6     1       1
                        // 30           25.6 - 51.2     1       2
                        SDWIN = 0,
                        // Signal-Detect Window Option
                        // SDWIN        Time Range us   WINTAP  WINMAX
                        // 0            6.4             0       255
                        // 1            12.8            1       511
                        // 2            25.6            2       1023
                        // 3            51.2            3       2047
                        SDTHR = 0
                        // Signal-Detect Threshold Option
                        // SDTHR        Threshold       SIGMIN
                        // 0            25% of SDWIN    1*(WINMAX+1)/4
                        // 1            50% of SDWIN    2*(WINMAX+1)/4
                        // 2            75% of SDWIN    3*(WINMAX+1)/4
)
(
// Shared signals
input                   CTRL_CLK,
                        // APBLink and lock management clock
input                   CTRL_SRST_N,
                        // APBLink and lock management reset
                        // active-low asynchronous asserting reset
                        // deasserts synchronous to CTRL_CLK rising edge
                        // This reset must not rise until CTRL_CLCTRL_CLK
                        // is running stable and the PF_XCVR peak
                        // detector is enabled (PF_XCVR UIC complete)
                        // and SYNC is known to be valid.
input [20:0]            LTPULSE,
                        // CORELNKTMR timing pulse family
// CORELANEMSTR Interface
input                   I_LCKFRC,
                        // Feedback from CORELANEMSTR
                        // Everytime O_LCKFRC changes, the
                        // state of I_LCKFRC will eventually become
                        // the same once CORELANEMSTR has completed
                        // the necessary transactions which change
                        // the CDR locking control state.
input                   CALIB_SYNC_HOLD,
output                  O_LCKFRC,
                        // 1==CDR to be forced to lock-to-reference
                        // 0==CDR to be in normal lock mode
// PF_XCVR Interface
input                   RX_IDLE,
// Fabric IP Interface
input                   SYNC
                        // flag for LINKUP from user IP
);
// Alex: replaced timeunit and timeprecision with timescale for SV->Verilog
// timeunit 1ns;
// timeprecision 1ps;
`timescale 1 ns / 1 ps
// Alex: removed parameter checking, not supported by Verilog
// Begin Elaboration-time Parameter checking
// if (!(DEBOUNCEUS inside {10,1_000,2_000,5_000,10_000})) begin :g_a0
//     $fatal(0,"DEBOUNCEUS=%0d; must be one of (10 1,000 2,000 5,000 10,000)",DEBOUNCEUS);
// end :g_a0
// if (!(IQUIETUS inside {0,10,1000})) begin :g_a1
//     $fatal(0,"IQUIETUS=%0d; must be one of (0 10 1,000)",IQUIETUS);
// end :g_a1
// if (!(ILOCKDLYUS inside {0,10,20,30})) begin :g_a2
//     $fatal(0,"ILOCKDLYUS=%0d; must be one of (0 10 20 30)",ILOCKDLYUS);
// end :g_a2
// if (!(SDWIN inside {0,1,2,3})) begin :g_a3
//     $fatal(0,"SDWIN=%0d; must be one of (0 1 2 3)",SDWIN);
// end :g_a3
// if (!(SDTHR inside {0,1,2})) begin :g_a4
//     $fatal(0,"SDTHR=%0d; must be one of (0 1 2)",SDTHR);
// end :g_a4
// End Elaboration-time Parameter checking

// Begin Local Parameter Definitions
localparam integer      DEBOUNCETAP =
    (DEBOUNCEUS==10) ? 0 :
    (DEBOUNCEUS==1_000) ? 7 :
    (DEBOUNCEUS==2_000) ? 8 :
    (DEBOUNCEUS==5_000) ? 9 : 10;
localparam integer      IQWAIT = 
    (IQUIETUS==0) ? 0 : 1;
localparam integer      IQTAP = 
    (IQUIETUS==1_000) ? 7 : 0;
localparam integer      ILWAIT =
    (ILOCKDLYUS==0) ? 0 : 1;
localparam integer      ILTAP = 
    (ILOCKDLYUS==20) ? 1 :
    (ILOCKDLYUS==30) ? 2 : 0;
localparam integer      WINTAP = SDWIN;
localparam integer      WINMAX =
    (SDWIN==0) ?    255 :
    (SDWIN==1) ?    511 :
    (SDWIN==2) ?    1023 : 2047;
localparam integer      SIGMIN = (SDTHR+1) * (WINMAX+1)/4;
localparam integer      SZ_INTG =
    (SIGMIN<128) ? 7 :
    (SIGMIN<256) ? 8 :
    (SIGMIN<512) ? 9 :
    (SIGMIN<1024) ? 10 : 11;
// End Local Parameter Definitions

reg                 lckfrc_st, lckfrc_nx;
reg   [2:0]         sync_st;
reg   [SZ_INTG-1:0] intg_st, intg_nx;
                    // Integration accumulator -
                    // number of cycles where rxidle is low.
reg   [1:0]         rxidle_st;
                    // for domain crossing and capture
                    // of PF_XCVR RX_IDLE output
reg                 neverlocked, neverlocked_nx;

// Begin Qualified Timing pulses gating state transitions
reg                 tpmaskidle;
reg                 tpwin;
reg                 tplckdly;

// Alex: replaced always comb with always @ (*) for SV->Verilog
always @ (*) begin
    if (neverlocked && (IQWAIT==1))
        tpmaskidle = LTPULSE[IQTAP];
    else 
        tpmaskidle = LTPULSE[DEBOUNCETAP];
end
// Alex: replaced always comb with always @ (*) for SV->Verilog
always @ (*) begin
    tpwin = LTPULSE[WINTAP];
end
// Alex: replaced always comb with always @ (*) for SV->Verilog
always @ (*) begin
    tplckdly = LTPULSE[ILTAP];
end
// End Qualified Timing pulses gating state transitions

assign O_LCKFRC = lckfrc_st;

// Alex: replaced enum logic with localparams for SV->Verilog
// enum logic [2:0] {
//     REQL2R = 3'd0,
//     QPKDET = 3'd1,
//     WINRST = 3'd2,
//     WINCNT = 3'd3,
//     IPLCK1 = 3'd4,
//     IPLCK2 = 3'd5,
//     REQNRM = 3'd6,
//     CDRNRM = 3'd7}  fsm_st, fsm_nx;

localparam [3:0] REQL2R = 3'd0;
localparam [3:0] QPKDET = 3'd1;
localparam [3:0] WINRST = 3'd2;
localparam [3:0] WINCNT = 3'd3;
localparam [3:0] IPLCK1 = 3'd4;
localparam [3:0] IPLCK2 = 3'd5;
localparam [3:0] REQNRM = 3'd6;
localparam [3:0] CDRNRM = 3'd7;

reg   [2:0]         fsm_st, fsm_nx;

// Alex: replaced always_ff with always @ for SV->Verilog
always @ (posedge CTRL_CLK or negedge CTRL_SRST_N) begin
    if (~CTRL_SRST_N) begin
        lckfrc_st <= 1'b1;
        fsm_st <= REQL2R;
        sync_st <= 3'b000;
        rxidle_st <= 2'b00;
        intg_st <= {SZ_INTG{1'b0}};
        neverlocked <= 1'b1;
    end else begin
        lckfrc_st   <= lckfrc_nx;
        fsm_st      <= fsm_nx;
        sync_st     <= {sync_st[1:0], SYNC};
        rxidle_st   <= {rxidle_st[0], RX_IDLE};
        intg_st     <= intg_nx;
        neverlocked <= neverlocked_nx;
    end
end

wire sync_fall = (sync_st[2:1] == 2'b10);
wire minsignal = (intg_st >= SIGMIN);

// Alex: replaced always comb with always @ (*) for SV->Verilog
always @ (*) begin :cmb_lckfrc
    lckfrc_nx = lckfrc_st;
    if (fsm_nx==REQL2R) begin
        lckfrc_nx = 1'b1;
    end else if (fsm_nx==REQNRM) begin
        lckfrc_nx = 1'b0;
    end
end

// Alex: replaced always comb with always @ (*) for SV->Verilog
always @ (*) begin :cmb_fsm
    fsm_nx = fsm_st;
    case (fsm_st)
        REQL2R: if (I_LCKFRC && tpmaskidle) fsm_nx = QPKDET;
        QPKDET: if (tpmaskidle) fsm_nx = WINRST;
        WINRST: fsm_nx = WINCNT;
        WINCNT: begin
            if (tpwin) fsm_nx = WINRST;
            else if (minsignal && (ILWAIT==0)) fsm_nx = REQNRM;
            else if (minsignal) fsm_nx = IPLCK1;
        end
        IPLCK1: if (tplckdly) fsm_nx = IPLCK2;
        IPLCK2: if (tplckdly) fsm_nx = REQNRM;
        REQNRM: if (~I_LCKFRC) fsm_nx = CDRNRM;
        CDRNRM: if (!CALIB_SYNC_HOLD && sync_fall) fsm_nx = REQL2R;
    endcase
end //cmb_fsm

// Alex: replaced always comb with always @ (*) for SV->Verilog
always @ (*) begin :cmb_intg
    intg_nx = intg_st;
    case (fsm_nx)
        WINRST: intg_nx = {SZ_INTG{1'b0}};
        WINCNT: if (~rxidle_st[1]) intg_nx = {intg_st} + 1; 
    endcase
end

// Alex: replaced always comb with always @ (*) for SV->Verilog
always @ (*) begin :cmb_neverlocked
    if (fsm_nx==CDRNRM) neverlocked_nx = 1'b0;
    else neverlocked_nx = neverlocked;
end //cmb_neverlocked
endmodule //CORELCKMGT
