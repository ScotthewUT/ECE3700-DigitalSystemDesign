`timescale 1ns / 1ps

module tb_ripcar_adder_4bit();

// Inputs
reg [3:0] A, B;
reg Cin;
// Outputs
wire [3:0] SUM;
wire Cout;
// For-loop iterators
integer i,j;

// Declare test module...
// <module name> <variable name> (port mapping);

ripcar_adder_4bit uut (
	.A(A),
	.B(B),
	.carry_in(Cin),
	.carry_out(Cout),
	.sum(SUM[3:0])
);

initial begin

	A = 0;
	B = 0;
	Cin = 0;
	
	for(i = 0; i < 16; i = i + 1) begin
		B = i;
		for(j = 0; j < 16; j = j + 1) begin
			A = j;
			#5
			if (Cout == 0) begin
				$display("%d + %d = %d", A, B, SUM);
			end
			if (Cout == 1) begin
				$display("%d + %d = %d  <--carried out", A, B, SUM);
			end
		end
	end
	
end


endmodule
