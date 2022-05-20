// IMPLEMENTS A 4-BIT REGISTER WITH ENABLE AND RESET

module reg_4bit (D, Q, clk, enable, reset);
	
	input [3:0] D;
	input clk, enable, reset;
	output reg [3:0] Q;
	
	always @(negedge clk) begin
		
		if(reset == 1) Q <= 0;
		else if(enable == 1) Q <= D;
		else Q <= Q;
		
	end
	
endmodule
