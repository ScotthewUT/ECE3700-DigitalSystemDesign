// IMPLEMENTS A RISING-EDGE, 4-BIT, D FLIP-FLOP WITH RESET, START, & STOP

module dff_4bit_v2 (D, Q, clk, rst, start, stop);
	
	input [3:0] D;
	input clk, rst, start, stop;
	output reg [3:0] Q;
	
	always @(posedge clk, posedge rst) begin
		
		if(rst == 1) Q <= 0;
		else if(stop == 1) Q <= Q;
		else if(start == 1) Q <= D;
		else Q <= D;
		
	end
	
endmodule