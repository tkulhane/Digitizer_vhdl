//**********************************************************************
// Copyright 2016-2017 by Silicon Creations Inc.  All rights reserved. *
// No portion of this material may be reproduced in any form           *
// without the written permission from Silicon Creations.              *
// All information contained is Silicon Creations company private,     *
// proprietary, and trade secret.                                      *
//**********************************************************************
// Context:     		Silicon Creations RTL
// Filename:    		socSyncEn.v
// Author:      		B. Tutro
// Version              1.0: 	Wed Aug 15 15:39:02 EDT 2018
// support@siliconcr.com
//**********************************************************************
//
// 
//

`timescale 1ns / 1ps

module CORERFDsyncen (
        outClk,
        outRstn,
        outEn,
        asyncInput,
        syncOutput
    );

    parameter SIGNAL_WIDTH = 1;
    parameter INIT_VAL = 0;

    input  outClk;                          // clock from output clock domain
    input  outRstn;                         // active LOW reset from output clock domain
    input  outEn;                           // active high enable from output clock domain
    input  [SIGNAL_WIDTH-1:0] asyncInput;   // input from input clock domain
    output [SIGNAL_WIDTH-1:0] syncOutput;   // output synchronized to output clock domain

    reg [SIGNAL_WIDTH-1:0] syncOutput;
    reg [SIGNAL_WIDTH-1:0] syncTemp;

    always @ (posedge outClk or negedge outRstn) begin
        if (!outRstn) begin
            syncTemp   <= {(SIGNAL_WIDTH){INIT_VAL[0]}};
            syncOutput <= {(SIGNAL_WIDTH){INIT_VAL[0]}};
        end
        else if (outEn) begin
            syncTemp   <= asyncInput;
            syncOutput <= syncTemp;
        end
    end
endmodule 
