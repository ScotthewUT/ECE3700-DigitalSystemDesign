module comparator (A, B, c, F1, F2, F3);

	input [3:0] A, B;
	input c;
	output reg F1, F2, F3;
	
	always @* begin
		// Treat A and B as unsigned when c is 0.
		if (c == 0) begin
			if (A > B) begin
				F1 = 1;
				F2 = 0;
				F3 = 0;
			end
			else if (A == B) begin
				F1 = 0;
				F2 = 1;
				F3 = 0;
			end
			else begin // A < B
				F1 = 0;
				F2 = 0;
				F3 = 1;
			end
		end
		// Treat A and B as signed when c is 1.
		else begin
			// Equality check not affected.
			if (A == B) begin
				F1 = 0;
				F2 = 1;
				F3 = 0;
			end
			// Check msb/sign bit. If A has 0 and B has 1, A > B.
			else if (~A[3] && B[3]) begin
				F1 = 1;
				F2 = 0;
				F3 = 0;
			end
			// Check msb/sign bit. If A has 1 and B has 0, A < B.
			else if (A[3] && ~B[3]) begin
				F1 = 0;
				F2 = 0;
				F3 = 1;
			end
			// A and B are either both positive or both negative.
			else begin
				if (A > B) begin
					F1 = 1;
					F2 = 0;
					F3 = 0;
				end
				else begin
					F1 = 0;
					F2 = 0;
					F3 = 1;
				end
			end
		end
	end
	
endmodule
