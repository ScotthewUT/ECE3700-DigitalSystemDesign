// COUNTS BUTTON PRESSES FROM 0 TO F IN HEX

module hex_counter (btn, rst, display_7seg);
	
	input btn, rst;
	wire [3:0] dff_in, dff_out;
	reg [3:0] cnt;
	output [6:0] display_7seg;
	
	dff_4bit dff(
		.D(dff_in),
		.Q(dff_out),
		.rst(rst),
		.clk(btn)
	);
	
	hex_to_7seg dsp(
		.hex(dff_out),
		.out_7seg(display_7seg)
	);
	
	assign dff_in = cnt;
	
	always @dff_out begin
		cnt <= dff_out + 1;
	end
	
endmodule
