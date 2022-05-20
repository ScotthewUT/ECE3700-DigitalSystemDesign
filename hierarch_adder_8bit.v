// 8-BIT HIERARCHICAL ADDER WHICH CHAINS TWO 4-BIT LOOKAHEAD ADDERS IN RIPPLE-CARRY
module hierarch_adder_8bit(A_msb, A_lsb, B_msb, B_lsb, carry_in, carry_out, sum);

input [3:0] A_msb, A_lsb, B_msb, B_lsb;
input carry_in;
output carry_out;
output [7:0] sum;
wire carry;

lookahead_adder_4bit cla30(
	.A(A_lsb),
	.B(B_lsb),
	.carry_in(carry_in),
	.carry_out(carry),
	.sum(sum[3:0])
);

lookahead_adder_4bit cla74(
	.A(A_msb),
	.B(B_msb),
	.carry_in(carry),
	.carry_out(carry_out),
	.sum(sum[7:4])
);

endmodule