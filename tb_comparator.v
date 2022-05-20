`timescale 1ns / 1ps

module tb_comparator();

	// Inputs
	reg [3:0] A, B;
	reg c;
	// Outputs
	wire F1, F2, F3;
	// Loop Iterator and signed versions of A & B.
	integer iter, a, b, counter;
	
	// Module under test w/ port mapping.
	comparator uut(
		.A (A), .B (B), .c (c),
		.F1 (F1), .F2 (F2), .F3 (F3) );
	
	initial begin
	
		counter = 0;
	
		for (iter = 0; iter < 2**9; iter = iter + 1) begin
			{c, A, B} = iter;
			#5
			// Only printing 96 of the 512 trials.
			if (iter % 7 == 0 || iter % 19 == 11) begin
				if (~c) begin
					$display("%0d)  c = %b; A = %d; B = %d --> F = %b%b%b", counter, c, A, B, F1, F2, F3);
				end
				else begin
					a = $signed(A);
					b = $signed(B);
					#5
					$display("%0d)  c = %d; A = %0d; B = %0d --> F = %b%b%b", counter, c, a, b, F1, F2, F3);
				end
				counter = counter + 1;
			end
		end
	
	end
	
endmodule
