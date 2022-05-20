// 4-BIT RIPPLE-CARRY ADDER WHICH CHAINS 4 1-BIT FULL ADDERS
module ripcar_adder_4bit(A, B, carry_in, carry_out, sum);

input [3:0] A, B;
input carry_in;
output carry_out;
output [3:0] sum;
wire [2:0] carry;

full_adder_1bit fa0(
	.a(A[0]),
	.b(B[0]),
	.carry_in(carry_in),
	.carry_out(carry[0]),
	.sum(sum[0])
	);

full_adder_1bit fa1(
	.a(A[1]),
	.b(B[1]),
	.carry_in(carry[0]),
	.carry_out(carry[1]),
	.sum(sum[1])
);

full_adder_1bit fa2(
	.a(A[2]),
	.b(B[2]),
	.carry_in(carry[1]),
	.carry_out(carry[2]),
	.sum(sum[2])
);

full_adder_1bit fa3(
	.a(A[3]),
	.b(B[3]),
	.carry_in(carry[2]),
	.carry_out(carry_out),
	.sum(sum[3])
);

endmodule