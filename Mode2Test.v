`timescale 1ns / 1ps

module test;
	
	reg clk, gate, wr;
	reg [3:0] counter;
	wire clkout;
	
	initial begin
		clk = 0;
		gate = 0;
		wr = 0;
		counter = 2;
		
		#15 wr = 1;
		#25 wr = 0;
		#35 gate = 1;
		#100 $finish;
	end
	
	always
		#10 clk = ~clk;
		
	Mode2Counter mode2counter(clk, clkout, gate, wr, counter);
endmodule
