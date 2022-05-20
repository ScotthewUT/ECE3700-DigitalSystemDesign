// 4-BIT LOOKAHEAD-CARRY ADDER
module lookahead_adder_4bit(A, B, carry_in, carry_out, sum);

input [3:0] A, B;
input carry_in;
output carry_out;
output [3:0] sum;
wire [3:0] gen, pro, car;

assign gen = A & B;
assign pro = A ^ B;

assign car[0] = carry_in;
assign car[1] = gen[0] | (pro[0] & car[0]);
assign car[2] = gen[1] | (pro[1] & gen[0]) | (pro[1] & pro[0] & car[0]);
assign car[3] = gen[2] | (pro[2] & gen[1]) | (pro[2] & pro[1] & gen[0]) | (pro[2] & pro[1] & pro[0] & car[0]);
assign carry_out = gen[3] | (pro[3] & gen[2]) | (pro[3] & pro[2] & gen[1]) | (pro[3] & pro[2] & pro[1] & gen[0]) |(pro[3] & pro[2] & pro[1] & pro[0] & car[0]);

assign sum = pro ^ car;

endmodule