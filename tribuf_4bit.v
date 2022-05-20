// IMPLEMENTS A 4-BIT TRI-STATE BUFFER

module tribuf_4bit (IN, OUT, enable);
	
	input [3:0] IN;
	input enable;
	output wire [3:0] OUT;
	
	assign OUT = enable ? IN : 'bz;
	
endmodule
