// Silicon Creations
// Copyright 2012 Silicon Creations LLC. All rights reserved.
// date : Wed Aug 21 14:04:49 EDT 2013
// support@siliconcr.com

`timescale 1ns / 1ps

module CORERFDsync (
        outClk,
        outRstn,
        asyncInput,
        syncOutput
    );

    parameter SIGNAL_WIDTH = 1;
    parameter INIT_VAL = 0;

    input  outClk;                          // clock from output clock domain
    input  outRstn;                         // active LOW reset from output clock domain
    input  [SIGNAL_WIDTH-1:0] asyncInput;   // input from input clock domain
    output [SIGNAL_WIDTH-1:0] syncOutput;   // output synchronized to output clock domain

    reg [SIGNAL_WIDTH-1:0] syncOutput;
    reg [SIGNAL_WIDTH-1:0] syncTemp;

    always @ (posedge outClk or negedge outRstn) begin
        if (!outRstn) begin
            syncTemp   <= {(SIGNAL_WIDTH){INIT_VAL[0]}};
            syncOutput <= {(SIGNAL_WIDTH){INIT_VAL[0]}};
        end
        else begin
            syncTemp   <= asyncInput;
            syncOutput <= syncTemp;
        end
    end
endmodule 
