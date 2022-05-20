// IMPLEMENTS A 4-BIT TO 8-BIT DECODER THAT TRANSLATES THE FSM OUTPUT TO
// THE NECESSARY INSTRUCTIONS FOR CONTROLLING BUFFERS, REGISTERS, & ALU

module decoder (F, G);

	input [3:0] F;
	output [7:0] G;
	
	wire a, b, c, d;
	
	assign a = F[3];
	assign b = F[2];
	assign c = F[1];
	assign d = F[0];
	
	// Enable Buffer & Register X
	assign G[0] = (a & ~d) | (b & c & ~d) | (~a & ~b & ~c & d);
	
	// Enable Buffer & Register Y
	assign G[1] = (~b & c & ~d) | (b & ~c & ~d);
	
	// Enable Input Switch Buffer
	assign G[2] = ~a & ~b & ~c & d;
	
	// Enable Immediate 3 Buffer
	assign G[3] = ~b & c & ~d;
	
	// Enable Register Z
	assign G[4] = (a & d) | (b & d) | (c & d);
	
	// Enable Buffer Z
	assign G[5] = a | b | (c & d);
	
	// ALU Control MSB
	assign G[6] = a | (b & c);
	
	// ALU Control LSB
	assign G[7] = ~c;

endmodule
