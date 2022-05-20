// COUNTS SECONDS FROM 0 TO 9 WITH START, STOP, & RESET BUTTONS

module stopwatch (clk_sys, rst_btn, start_btn, stop_btn, dsp_7seg);
	
	input clk_sys, rst_btn, start_btn, stop_btn;
	wire clk_dff;
	wire [3:0] D, Q;
	wire rst, start, stop;
	output [6:0] dsp_7seg;
	
	button_to_reg btnreg(
		.clk(clk_sys),
		.rst_btn(rst_btn),
		.start_btn(start_btn),
		.stop_btn(stop_btn),
		.rst_reg(rst),
		.start_reg(start),
		.stop_reg(stop)
	);
	
	clock_divider clkdiv(
		.clk_50MHz(clk_sys),
		.rst(rst),
		.clk_1Hz(clk_dff)
	);
	
	dff_4bit_v2 dff(
		.D(D),
		.Q(Q),
		.clk(clk_dff),
		.rst(rst),
		.start(start),
		.stop(stop)
	);
	
	hex_to_7seg dsp(
		.hex(Q),
		.out_7seg(dsp_7seg)
	);
	
	assign D = (Q < 9) ? Q + 1 : 0;
	
endmodule
