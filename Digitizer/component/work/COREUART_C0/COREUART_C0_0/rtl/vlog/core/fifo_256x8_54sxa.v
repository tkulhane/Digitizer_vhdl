// ********************************************************************
// Actel Corporation Proprietary and Confidential
//  Copyright 2008 Actel Corporation.  All rights reserved.
//
// ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
// ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED
// IN ADVANCE IN WRITING.
//
// Description: CoreUART/ CoreUARTapb UART core
//
//
//  Revision Information:
// Date     Description
// Jun09    Revision 4.1
// Aug10    Revision 4.2
//
// SVN Revision Information:
// SVN $Revision: 8508 $
// SVN $Date: 2009-06-15 16:49:49 -0700 (Mon, 15 Jun 2009) $
//
// Resolved SARs
// SAR      Date     Who   Description
// 20741    2Sep10   AS    Increased baud rate by ensuring fifo ctrl runs off
//                         sys clk (not baud clock).  See note below.
//
// Notes:
// best viewed with tabstops set to "4"

`timescale 1 ns/100 ps

module COREUART_C0_COREUART_C0_0_fifo_256x8(DO, RCLOCK, WCLOCK, DI, WRB, RDB, RESET, FULL, EMPTY);
output [7:0] DO;
input RCLOCK;
input WCLOCK;
input [7:0] DI;
input WRB;
input RDB;
input RESET;
output FULL;
output EMPTY;

parameter SYNC_RESET = 0;
parameter [7:0] LEVEL = 64;

wire [7:0] DO;
wire  FULL, EMPTY;

COREUART_C0_COREUART_C0_0_fifo_ctrl_256 #(.SYNC_RESET(SYNC_RESET)) fifo_ctrl_256 (.data_in(DI), .data_out(DO), .write_n(WRB), .read_n(RDB), .clock(WCLOCK), 
			  .full(FULL), .empty(EMPTY), .half(GEQTH), .reset_n(RESET), .LEVEL(LEVEL) );

endmodule

/*********************************************************/
// MODULE:		Synchronous FIFO
//
// FILE NAME:	fifo_ctl.v
// 
// CODE TYPE:	Register Transfer Level
//
// DESCRIPTION:	This module defines a Synchronous FIFO. The
// FIFO memory is implemented as a ring buffer. The read
// pointer points to the beginning of the buffer, while the
// write pointer points to the end of the buffer. Note that
// in this RTL version, the memory has one more location than
// the FIFO needs in order to calculate the FIFO count
// correctly.
//
/*********************************************************/

// fifo control logic 
module COREUART_C0_COREUART_C0_0_fifo_ctrl_256(
		clock,
		reset_n,
		data_in,
		read_n,
		write_n,
		LEVEL,
		data_out,
		full,
		empty,
		half);
		
parameter SYNC_RESET = 0;
parameter FIFO_DEPTH = 16;	// Depth of FIFO (number of bytes)
parameter FIFO_BITS = 4;	// Number of bits required to
parameter FIFO_WIDTH = 8;	// Width of FIFO data

// INPUTS
input					clock;		// Clock input
input					reset_n;	// Active low reset
input [FIFO_WIDTH-1:0]	                data_in; 	// Data input to FIFO
input					read_n;	 	// Read FIFO (active low)
input					write_n;	// Write FIFO (active low)
input [7:0]                             LEVEL;
// OUTPUTS
output [FIFO_WIDTH-1:0]	                data_out;	// FIFO output data
output						full;		// FIFO is full
output						empty;		// FIFO is empty
output						half;		// FIFO is half full
										// or more

// INOUTS

// SIGNAL DECLARATIONS
wire					clock;
wire					reset_n;
wire [FIFO_WIDTH-1:0]	data_in;
wire					read_n;
wire					write_n;
reg  [FIFO_WIDTH-1:0]	data_out;
wire					full;
wire					empty;
wire					half;
wire  [FIFO_WIDTH-1:0]	data_out_0;
reg  read_n_hold;

							// How many locations in the FIFO
							// are occupied?
reg [FIFO_BITS-1:0]	counter;
							// FIFO read pointer points to
							// the location in the FIFO to
							// read from next
reg [FIFO_BITS-1:0]	rd_pointer;
							// FIFO write pointer points to
							// the location in the FIFO to
							// write to next
reg [FIFO_BITS-1:0]	wr_pointer;

wire aresetn;
wire sresetn; 

// ASSIGN STATEMENTS
assign aresetn = (SYNC_RESET==1) ? 1'b1 : reset_n;
assign sresetn = (SYNC_RESET==1) ? reset_n : 1'b1;
assign full = (counter == FIFO_DEPTH - 1) ? 1'b1 : 1'b0;
assign empty = (counter == 0) ? 1'b1 : 1'b0;
assign half = (counter >= LEVEL) ? 1'b1 : 1'b0;

// MAIN CODE

// This block contains all devices affected by the clock 
// and reset inputs
always @(posedge clock or negedge aresetn ) begin
	if ((!aresetn) || (!sresetn)) begin
		// Reset the FIFO pointer
		rd_pointer <= {FIFO_BITS{1'b0}};
		wr_pointer <= {FIFO_BITS{1'b0}};
		counter <= {FIFO_BITS{1'b0}};
	end
	else begin
		if (~read_n) begin
			// Check for FIFO underflow
			/*
			if (counter == 0) begin
				$display("\nERROR at time %0t:", $time);
				$display("FIFO Underflow\n");
							
				// Use $stop for debugging
				$stop;
			end
                       */

			// If we are doing a simultaneous read and write,
			// there is no change to the counter
			if (write_n) begin
				// Decrement the FIFO counter
				counter <= counter - 1;
			end

			// Increment the read pointer
			// Check if the read pointer has gone beyond the
			// depth of the FIFO. If so, set it back to the
			// beginning of the FIFO
			if (rd_pointer == FIFO_DEPTH-1)
				rd_pointer <= {FIFO_BITS{1'b0}};
			else
				rd_pointer <= rd_pointer + 1;
		end
		if (~write_n) begin
			// Check for FIFO overflow
			if (counter >= FIFO_DEPTH) begin
				$display("\nERROR at time %0t:", $time);
				$display("FIFO Overflow\n");
							
				// Use $stop for debugging
				$stop;
			end

			// If we are doing a simultaneous read and write,
			// there is no change to the counter
			if (read_n) begin
				// Increment the FIFO counter
				counter <= counter + 1;
			end

			// Increment the write pointer
			// Check if the write pointer has gone beyond the
			// depth of the FIFO. If so, set it back to the
			// beginning of the FIFO
			if (wr_pointer == FIFO_DEPTH-1)
				wr_pointer <= {FIFO_BITS{1'b0}};
			else
				wr_pointer <= wr_pointer + 1;
		end
	end
end

always @(posedge clock or negedge aresetn ) 
  begin
    if ((!aresetn) || (!sresetn)) 
     begin
       read_n_hold <= 1'b0;
     end 
    else
     begin
       read_n_hold <= read_n;
       if (read_n_hold  == 1'b0)
        begin
          data_out <= data_out_0;
        end
       else 
        begin
          data_out <= data_out;
        end
     end
  end

COREUART_C0_COREUART_C0_0_ram16x8 ram16x8 (.clk(clock), .data_in(data_in), .data_out(data_out_0), .write_address(wr_pointer), 
	                    .read_address(rd_pointer), .write_n(write_n), .read_n(read_n) ); 
endmodule


module COREUART_C0_COREUART_C0_0_ram16x8( clk,
		data_in,
		read_address,
		write_address,
		write_n,
		read_n,
		data_out);

// PARAMETERS
parameter RAM_WIDTH = 8;	// Width of RAM (number of bits)
parameter RAM_DEPTH = 16;	// Depth of RAM (number of bytes)
parameter ADDR_SZ = 4;	// Number of bits required to
			// represent the RAM address

// INPUTS
input		    clk;  	// clock signal 
input [ADDR_SZ-1:0] read_address; 	// Read address
input [ADDR_SZ-1:0] write_address; 	// Write address
input		    write_n;  	// Write strobe (active low)
input		    read_n; 		// Output enable (active low)
input [RAM_WIDTH-1:0]	data_in;	// RAM data in

// OUTPUTS
output [RAM_WIDTH-1:0]	data_out;	// RAM data out

// SIGNAL DECLARATIONS
wire [ADDR_SZ-1:0] 	read_address;
wire [ADDR_SZ-1:0] 	write_address;
wire			write_n;
wire			read_n;
reg [RAM_WIDTH-1:0]	data_out;

// The RAM
reg  [RAM_WIDTH-1:0]	memory [RAM_DEPTH-1:0];

// Write to the RAM 
always @(posedge clk) 
        begin
          if (write_n == 1'b0)
           begin
	     memory[write_address] = data_in;
	   end
        end

// Read from the RAM 
always @(posedge clk) 
        begin
          if (read_n == 1'b0)
           begin
             data_out = memory[read_address];
	   end
        end

endmodule		

