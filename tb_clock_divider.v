// TESTBENCH FOR CLOCK DIVIDER

`timescale 1ns / 1ps

module tb_clock_divider();

	// Inputs
	reg clk_in, rst;
	// Outputs
	wire clk_out;
	
	clock_divider uut(
		.clk_50MHz(clk_in),
		.rst(rst),
		.clk_1Hz(clk_out)
	);
	
	initial begin
		clk_in = 0; rst = 0; #10;
		rst = 1; clk_in = 1; #10;
		clk_in = 0; #10
		rst = 0; #10;
	end
	
	always begin
		#10; clk_in = ~clk_in;
	end

endmodule
