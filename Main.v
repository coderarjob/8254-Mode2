`timescale 1ns / 1ps

/*
* This is a scaled down emulation of mode 2 of 8254 IC from intel.
* It will function as a divide-by-n counter which will divide the input frequency by n.
* The output will be controlled by a gate and 4 bit data lines provides the divisor.
* The new divisor is applied when the WR(bar) signal is received.
*
* Dated: 8th April 2020
* Version: 20200408 (Initial)
* 
*/

module Mode2Counter(
		clk, clkout, gate, wr, counter
    );
	 parameter DEF_COUNT = 3;
	 
	 input 			clk, gate, wr;
	 input [3:0]	counter;
	 output 		clkout;
	 
	 
	 reg			clkout;
	 reg [3:0] 	    count,			// Counts down every positive edge
					set_count;		// Last set Count value.
			
	 initial begin
		count = DEF_COUNT;
		clkout = 1;
		set_count = DEF_COUNT;
	 end
		
	always @(posedge clk) begin
		if (wr == 0) begin
			set_count = counter;
			count = set_count;
		end
		if (gate == 0) begin
			count = 2;			// This ensures that the output begins at the next positive edge of the clk, when gate becomes high.
			clkout = 1;
		end
		else begin
			count = count -1;
			if (count == 1 || count == 0) begin
				if (count == 0) count = set_count; 
				clkout = ~clkout;
			end
		end
	end								
endmodule
