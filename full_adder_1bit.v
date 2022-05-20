// 1-BIT FULL ADDER
module full_adder_1bit(a, b, carry_in, carry_out, sum);

input a, b, carry_in;
output carry_out, sum;

assign sum = a ^ b ^ carry_in;
assign carry_out = ((a ^ b) & carry_in) | (a & b);

endmodule