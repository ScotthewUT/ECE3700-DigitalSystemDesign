// TESTBENCH FOR HIERARCHICAL CPU & CONTROLLER

`timescale 1ns / 1ps

module tb_processor();
	
	//Inputs
	reg [3:0] S;
	reg clk, rst;
	// Outputs
	wire [6:0] dsp_7seg;
	
	processor uut(
		.S (S),
		.clk (clk),
		.rst (rst),
		.dsp_7seg (dsp_7seg)
	);
	
	
	initial begin
		
		S = 0; clk = 0; rst = 0; #5;
		
	end
	
	
	always begin
		
		#100; clk = ~clk;
		
	end
	
	
	always @(dsp_7seg) begin
		
		$display("Switch:   %d", S);
		
		case (dsp_7seg)
			7'b1000000:   $display("Display:  0\n");
			7'b1111001:   $display("Display:  1\n");
			7'b0100100:   $display("Display:  2\n");
			7'b0110000:   $display("Display:  3\n");
			7'b0011001:   $display("Display:  4\n");
			7'b0010010:   $display("Display:  5\n");
			7'b0000010:   $display("Display:  6\n");
			7'b1111000:   $display("Display:  7\n");
			7'b0000000:   $display("Display:  8\n");
			7'b0011000:   $display("Display:  9\n");
			7'b0001000:   $display("Display:  A\n");
			7'b0000011:   $display("Display:  b\n");
			7'b1000110:   $display("Display:  C\n");
			7'b0100001:   $display("Display:  d\n");
			7'b0000110:   $display("Display:  E\n");
			7'b0001110:   $display("Display:  F\n");
			default:      $display("Display:  error\n");
		endcase
		
		rst = 1; #200
		
		if(S == 15) S = 0;
		else S = S + 1;
		#5;
		
		rst = 0; #5;
		
	end
	
	
endmodule
