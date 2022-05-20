// IMPLEMENTS A RISING-EDGE, 4-BIT, D FLIP-FLOP WITH RESET

module dff_4bit (D, Q, rst, clk);
	
	input [3:0] D;
	input rst, clk;
	output reg [3:0] Q;
	
	always @(posedge clk) begin
		
		if(rst == 1) Q <= 0;
		else Q <= D;
		
	end
	
endmodule
