// TESTBENCH FOR 8-BIT HIERARCHICAL ADDER

`timescale 1ns / 1ps

module tb_hierarch_adder_8bit();

// Inputs
reg [7:0] A, B;
reg carry_in;
// Outputs
wire [8:0] SUM;


hierarch_adder_8bit uut(
	.A_msb (A[7:4]),
	.A_lsb (A[3:0]),
	.B_msb (B[7:4]),
	.B_lsb (B[3:0]),
	.sum (SUM[7:0]),
	.carry_out (SUM[8]),
	.carry_in (carry_in)
);


initial begin

	A = 0;
	B = 0;
	carry_in = 0;
	#5;
		
	$display("  %b", A);
	$display("+ %b", B);
	$display("----------  no carry");
	$display(" %b\n", SUM);
	
	A = 255;
	B = 255;
	carry_in = 0;
	#5;
		
	$display("  %b", A);
	$display("+ %b", B);
	$display("----------  no carry");
	$display(" %b\n", SUM);
	
	A = 255;
	B = 0;
	carry_in = 1;
	#5;
		
	$display("  %b", A);
	$display("+ %b", B);
	$display("----------  w/ carry = 1");
	$display(" %b\n", SUM);
	
	A = 128;
	B = 64;
	carry_in = 0;
	#5;
		
	$display("  %b", A);
	$display("+ %b", B);
	$display("----------  no carry");
	$display(" %b\n", SUM);
	
	A = 170;
	B = 85;
	carry_in = 0;
	#5
	
	$display("  %b", A);
	$display("+ %b", B);
	$display("----------  no carry");
	$display(" %b", SUM);

end


endmodule
