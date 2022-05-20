// DEMOS FUNCTIONALITY OF hex_to_7seg MODULE

module demo_7seg (s, dsp);
	
	input [9:0] s;
	output [6:0] dsp;
	wire [6:0] hex_in;
	
	hex_to_7seg uut(
		.hex(hex_in),
		.out_7seg(dsp)
	);
	
	assign hex_in = (s[0] + s[2] + s[4] + s[6] + s[8]) * 2 + s[1] + s[3] + s[5] + s[7] + s[9];
	
endmodule
