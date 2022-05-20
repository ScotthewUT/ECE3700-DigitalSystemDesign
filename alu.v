// IMPLEMENTS AN ALU WHICH IS DESCRIBED BY A 4:1 MUX
//   00: Z = X + Y (CARRY-BIT IS DROPPED)
//   01: Z = X or Y
//   02: Z = X'
//   03: Z = X xor Y

module alu (X, Y, Z, ctrl);
	
	input [3:0] X, Y;
	input [1:0] ctrl;
	output reg [3:0] Z;
	
	always @* begin
		
		if(ctrl == 0) 		 Z = X + Y;
		else if(ctrl == 1) Z = X | Y;
		else if(ctrl == 2) Z = ~X;
		else 					 Z = X ^ Y;
		
	end
	
endmodule
