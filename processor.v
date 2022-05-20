// IMPLEMENTS A SIMPLE CPU & CONTROLLER AS SPECIFIED IN LAB 5.

module processor (S, clk, rst, dsp_7seg);
	
	input [3:0] S;
	input clk, rst;
	output [6:0] dsp_7seg;
	
	wire [3:0] fsm_to_decoder;
	wire [7:0] decoder_out;
	wire [3:0] buf_to_regX, buf_to_regY, reg_to_bufZ;
	wire [3:0] reg_to_aluX, reg_to_aluY, alu_to_regZ;
	wire [1:0] ctrl_to_ALU;
	wire [3:0] bus;
	wire enX, enY, enRegZ, enBufZ, en3, enSw;
	
	parameter imm = 4'b0011;
	
	
	fsm moore(
		.clk (clk),
		.rst (rst),
		.Q (fsm_to_decoder)
	);
	
	decoder dec(
		.F (fsm_to_decoder),
		.G (decoder_out)
	);
	
	alu mux(
		.X (reg_to_aluX),
		.Y (reg_to_aluY),
		.Z (alu_to_regZ),
		.ctrl (ctrl_to_ALU)
	);
	
	reg_4bit regX(
		.D (buf_to_regX),
		.Q (reg_to_aluX),
		.clk (clk),
		.enable (enX),
		.reset (rst)
	);
	
	reg_4bit regY(
		.D (buf_to_regY),
		.Q (reg_to_aluY),
		.clk (clk),
		.enable (enY),
		.reset (rst)
	);
	
	reg_4bit regZ(
		.D (alu_to_regZ),
		.Q (reg_to_bufZ),
		.clk (clk),
		.enable (enRegZ),
		.reset (rst)
	);
	
	tribuf_4bit bufX(
		.IN (bus),
		.OUT (buf_to_regX),
		.enable (enX)
	);
	
	tribuf_4bit bufY(
		.IN (bus),
		.OUT (buf_to_regY),
		.enable (enY)
	);
	
	tribuf_4bit bufZ(
		.IN (reg_to_bufZ),
		.OUT (bus),
		.enable (enBufZ)
	);
	
	tribuf_4bit buf3(
		.IN (imm),
		.OUT (bus),
		.enable (en3)
	);
	
	tribuf_4bit bufSw(
		.IN (S),
		.OUT (bus),
		.enable (enSw)
	);
	
	hex_to_7seg dsp(
		.hex (bus),
		.out_7seg (dsp_7seg)
	);
	
	
	// Enable Buffer & Register X
	assign enX = decoder_out[0];
	
	// Enable Buffer & Register Y
	assign enY = decoder_out[1];
	
	// Enable Input Switch Buffer
	assign enSw = decoder_out[2];
	
	// Enable Immediate 3 Buffer
	assign en3 = decoder_out[3];
	
	// Enable Register Z
	assign enRegZ = decoder_out[4];
	
	// Enable Buffer Z
	assign enBufZ = decoder_out[5];
	
	// ALU Control MSB
	assign ctrl_to_ALU[1] = decoder_out[6];
	
	// ALU Control LSB
	assign ctrl_to_ALU[0] = decoder_out[7];
	
	
endmodule
