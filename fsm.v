// IMPLEMENTS A 4-BIT FINITE STATE MACHINE (MOORE MACHINE)
// SIMILAR TO A MOD-10 UP COUNTER EXCEPT HOLDS AT STATE 9 UNTIL RESET

module fsm (clk, rst, Q);

	input clk, rst;
	output [3:0] Q;
	
	reg [3:0] PS, NS;
	
	always @(posedge clk) begin
	
		if(rst == 1) PS <= 1'b0;
		else PS <= NS;
	
	end
	
	always @* begin
	
		if(PS == 4'b1001) NS = 4'b1001;
		else NS = PS + 1'b1;
	
	end
	
	assign Q = PS;

endmodule
