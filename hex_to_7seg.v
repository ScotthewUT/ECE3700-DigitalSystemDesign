// MAPS SINGLE HEX DIGIT TO 7-BIT BINARY FOR 7-SEG DISPLAY USE.

module hex_to_7seg (hex, out_7seg);

	input [3:0] hex;
	output reg [6:0] out_7seg;
	
	always @* begin
		case (hex)
			'h0:		out_7seg = 7'b1000000; // 0
			'h1:		out_7seg = 7'b1111001; // 1
			'h2:		out_7seg = 7'b0100100; // 2
			'h3:		out_7seg = 7'b0110000; // 3
			'h4:		out_7seg = 7'b0011001; // 4
			'h5:		out_7seg = 7'b0010010; // 5
			'h6:		out_7seg = 7'b0000010; // 6
			'h7:		out_7seg = 7'b1111000; // 7
			'h8:		out_7seg = 7'b0000000; // 8
			'h9:		out_7seg = 7'b0011000; // 9
			'hA:		out_7seg = 7'b0001000; // A
			'hb:		out_7seg = 7'b0000011; // b
			'hC:		out_7seg = 7'b1000110; // C
			'hd:		out_7seg = 7'b0100001; // d
			'hE:		out_7seg = 7'b0000110; // E
			'hF:		out_7seg = 7'b0001110; // F
			default:	out_7seg = 7'b0110110; // error
		endcase
	end

endmodule
