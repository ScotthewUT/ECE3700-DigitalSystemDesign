// CONVERTS A 50 MHz CLOCK TO A 1 Hz CLOCK

module clock_divider(clk_50MHz, rst, clk_1Hz);

	input clk_50MHz, rst;
	output reg clk_1Hz;
	reg [24:0] count;		// log_2[(50MHz/1Hz)/2] = 24.575... => 25

	always @(posedge clk_50MHz, posedge rst) begin
		if(rst == 1) begin
			count <= 0;
			clk_1Hz <= 0;
		end
		else if(count == 25_000_000) begin
			count <= 0;
			clk_1Hz <= ~clk_1Hz;
		end
		else begin
			count <= count + 1;
			clk_1Hz <= clk_1Hz;
		end
	end

endmodule
