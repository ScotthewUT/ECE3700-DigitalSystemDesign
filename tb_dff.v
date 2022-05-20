// TESTBENCH FOR 4-BIT D FLIP-FLOP

`timescale 1ns / 1ps

module tb_dff();

	// Inputs
	reg clk, rst;
	reg [3:0] D;
	// Outputs
	wire [3:0] Q;
	
	dff_4bit uut(
		.D(D),
		.Q(Q),
		.rst(rst),
		.clk(clk)
	);
	
	initial begin
		clk = 0; rst = 0; #5;
		rst = 1; clk = 1; #5;
		clk = 0; #5
		rst = 0; #5;
	end
	
	always begin
		#5; clk = ~clk;
	end
	
	always @(negedge clk) begin
		D = 4'b0000; #10;
		D = 4'b0001; #10;
		D = 4'b0010; #10;
		D = 4'b0011; #10;
		D = 4'b0100; #10;
		D = 4'b0101; #10;
		D = 4'b0110; #10;
		D = 4'b0111; #10;
		D = 4'b1000; #10;
		D = 4'b1001; #10;
		D = 4'b1010; #10;
		D = 4'b1011; #10;
		D = 4'b1100; #10;
		D = 4'b1101; #10;
		D = 4'b1110; #10;
		D = 4'b1111; #10;
	end

endmodule
