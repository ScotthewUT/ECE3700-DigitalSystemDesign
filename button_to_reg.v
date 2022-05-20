// MAPS THE RESET, START, AND STOP BUTTONS TO REGISTERS

module button_to_reg(clk, rst_btn, start_btn, stop_btn, rst_reg, start_reg, stop_reg);

	input clk, rst_btn, start_btn, stop_btn;
	output reg rst_reg, start_reg, stop_reg;

// Preserve start, stop, & reset triggers between cycles.
	always @(posedge clk) begin
		if (rst_btn == 1) begin
			rst_reg   <= 1;
			start_reg <= 0;
			stop_reg  <= 0;
		end
		else if(start_btn == 0) begin
			rst_reg   <= 0;
			start_reg <= 1;
			stop_reg  <= 0;
		end
		else if(stop_btn == 0) begin
			rst_reg   <= 0;
			start_reg <= 0;
			stop_reg  <= 1;
		end
		else begin
			rst_reg   <= rst_reg;
			start_reg <= start_reg;
			stop_reg  <= stop_reg;
		end
	end
	
endmodule
