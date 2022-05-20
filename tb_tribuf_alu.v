// TESTBENCH FOR TRI-STATE BUFFERS & ALU

`timescale 1ns / 1ps

module tb_tribuf_alu();

// Inputs
reg [3:0] X, Y;
reg [1:0] ctrl;
reg en_x, en_y, en_z;
// Outputs
wire [3:0] OUT;
// ALU Connections
wire [3:0] x_in, y_in, z_out;


tribuf_4bit tri_x(
	.IN (X),
	.OUT (x_in),
	.enable (en_x)
);


tribuf_4bit tri_y(
	.IN (Y),
	.OUT (y_in),
	.enable (en_y)
);


tribuf_4bit tri_z(
	.IN (z_out),
	.OUT (OUT),
	.enable (en_z)
);


alu uut(
	.X (x_in),
	.Y (y_in),
	.Z (z_out),
	.ctrl (ctrl)
);


initial begin

	X = 0;
	Y = 0;
	ctrl = 0;
	en_x = 0;
	en_y = 0;
	en_z = 0;
	#5;
	
	$display("INITIALIZE:");
	$display("    IN = %d & %d", X, Y);
	$display("     X = %b", x_in);
	$display("     Y = %b", y_in);
	$display("     Z = %b", z_out);
	$display("   OUT = %b", OUT);
	
	X = 6;
	Y = 5;
	#5
	
	$display("DATA ARIVES AT BUFFERS:");
	$display("    IN = %d & %d", X, Y);
	$display("     X = %b", x_in);
	$display("     Y = %b", y_in);
	$display("     Z = %b", z_out);
	$display("   X+Y = %b", OUT);
	
	en_x = 1;
	en_y = 1;
	#5
	
	$display("INPUT BUFFERS ENABLED:");
	$display("       IN = %d & %d", X, Y);
	$display("        X = %b", x_in);
	$display("        Y = %b", y_in);
	$display("  Z = X+Y = %b", z_out);
	$display("      OUT = %b", OUT);
	
	en_z = 1;
	#5
	
	$display("OUTPUT BUFFER ENABLED:");
	$display("       IN = %d & %d", X, Y);
	$display("        X = %b", x_in);
	$display("        Y = %b", y_in);
	$display("  Z = X+Y = %b", z_out);
	$display("      OUT = %b", OUT);
	
	en_x = 0;
	en_y = 0;
	en_z = 0;
	ctrl = 1;
	#5
	
	$display("BUFFERS DISABLED; NEW ALU CTRL:");
	$display("       IN = %d & %d", X, Y);
	$display("        X = %b", x_in);
	$display("        Y = %b", y_in);
	$display("  Z = X|Y = %b", z_out);
	$display("      OUT = %b", OUT);
	
	en_x = 1;
	en_y = 1;
	#5
	
	$display("INPUT BUFFERS ENABLED:");
	$display("       IN = %d & %d", X, Y);
	$display("        X = %b", x_in);
	$display("        Y = %b", y_in);
	$display("  Z = X|Y = %b", z_out);
	$display("      OUT = %b", OUT);
	
	en_z = 1;
	#5
	
	$display("OUTPUT BUFFER ENABLED:");
	$display("       IN = %d & %d", X, Y);
	$display("        X = %b", x_in);
	$display("        Y = %b", y_in);
	$display("  Z = X|Y = %b", z_out);
	$display("      OUT = %b", OUT);
	
	en_x = 0;
	en_y = 0;
	en_z = 0;
	ctrl = 2;
	#5
	
	$display("BUFFERS DISABLED; NEW ALU CTRL:");
	$display("      IN = %d & %d", X, Y);
	$display("       X = %b", x_in);
	$display("       Y = %b", y_in);
	$display("  Z = ~X = %b", z_out);
	$display("     OUT = %b", OUT);
	
	en_x = 1;
	en_y = 1;
	#5
	
	$display("INPUT BUFFERS ENABLED:");
	$display("      IN = %d & %d", X, Y);
	$display("       X = %b", x_in);
	$display("       Y = %b", y_in);
	$display("  Z = ~X = %b", z_out);
	$display("     OUT = %b", OUT);
	
	en_z = 1;
	#5
	
	$display("OUTPUT BUFFER ENABLED:");
	$display("      IN = %d & %d", X, Y);
	$display("       X = %b", x_in);
	$display("       Y = %b", y_in);
	$display("  Z = ~X = %b", z_out);
	$display("     OUT = %b", OUT);
	
	en_x = 0;
	en_y = 0;
	en_z = 0;
	ctrl = 3;
	#5
	
	$display("BUFFERS DISABLED; NEW ALU CTRL:");
	$display("       IN = %d & %d", X, Y);
	$display("        X = %b", x_in);
	$display("        Y = %b", y_in);
	$display("  Z = X^Y = %b", z_out);
	$display("      OUT = %b", OUT);
	
	en_x = 1;
	en_y = 1;
	#5
	
	$display("INPUT BUFFERS ENABLED:");
	$display("       IN = %d & %d", X, Y);
	$display("        X = %b", x_in);
	$display("        Y = %b", y_in);
	$display("  Z = X^Y = %b", z_out);
	$display("      OUT = %b", OUT);
	
	en_z = 1;
	#5
	
	$display("OUTPUT BUFFER ENABLED:");
	$display("       IN = %d & %d", X, Y);
	$display("        X = %b", x_in);
	$display("        Y = %b", y_in);
	$display("  Z = X^Y = %b", z_out);
	$display("      OUT = %b", OUT);
	
	en_x = 0;
	en_y = 0;
	en_z = 0;
	ctrl = 0;
	#5
	
	$display("BUFFERS DISABLED; NEW ALU CTRL:");
	$display("    IN = %d & %d", X, Y);
	$display("     X = %b", x_in);
	$display("     Y = %b", y_in);
	$display("     Z = %b", z_out);
	$display("   X+Y = %b", OUT);
	
	X = 7;
	Y = 10;
	#5
	
	$display("DATA ARIVES AT BUFFERS:");
	$display("    IN = %d & %d", X, Y);
	$display("     X = %b", x_in);
	$display("     Y = %b", y_in);
	$display("     Z = %b", z_out);
	$display("   X+Y = %b", OUT);
	
	en_x = 1;
	en_y = 1;
	#5
	
	$display("INPUT BUFFERS ENABLED:");
	$display("       IN = %d & %d", X, Y);
	$display("        X = %b", x_in);
	$display("        Y = %b", y_in);
	$display("  Z = X+Y = %b", z_out);
	$display("      OUT = %b", OUT);
	
	en_z = 1;
	#5
	
	$display("OUTPUT BUFFER ENABLED:");
	$display("       IN = %d & %d", X, Y);
	$display("        X = %b", x_in);
	$display("        Y = %b", y_in);
	$display("  Z = X+Y = %b", z_out);
	$display("      OUT = %b", OUT);
	
	en_x = 0;
	en_y = 0;
	en_z = 0;
	ctrl = 1;
	#5
	
	$display("BUFFERS DISABLED; NEW ALU CTRL:");
	$display("       IN = %d & %d", X, Y);
	$display("        X = %b", x_in);
	$display("        Y = %b", y_in);
	$display("  Z = X|Y = %b", z_out);
	$display("      OUT = %b", OUT);
	
	en_x = 1;
	en_y = 1;
	#5
	
	$display("INPUT BUFFERS ENABLED:");
	$display("       IN = %d & %d", X, Y);
	$display("        X = %b", x_in);
	$display("        Y = %b", y_in);
	$display("  Z = X|Y = %b", z_out);
	$display("      OUT = %b", OUT);
	
	en_z = 1;
	#5
	
	$display("OUTPUT BUFFER ENABLED:");
	$display("       IN = %d & %d", X, Y);
	$display("        X = %b", x_in);
	$display("        Y = %b", y_in);
	$display("  Z = X|Y = %b", z_out);
	$display("      OUT = %b", OUT);
	
	en_x = 0;
	en_y = 0;
	en_z = 0;
	ctrl = 2;
	#5
	
	$display("BUFFERS DISABLED; NEW ALU CTRL:");
	$display("      IN = %d & %d", X, Y);
	$display("       X = %b", x_in);
	$display("       Y = %b", y_in);
	$display("  Z = ~X = %b", z_out);
	$display("     OUT = %b", OUT);
	
	en_x = 1;
	en_y = 1;
	#5
	
	$display("INPUT BUFFERS ENABLED:");
	$display("      IN = %d & %d", X, Y);
	$display("       X = %b", x_in);
	$display("       Y = %b", y_in);
	$display("  Z = ~X = %b", z_out);
	$display("     OUT = %b", OUT);
	
	en_z = 1;
	#5
	
	$display("OUTPUT BUFFER ENABLED:");
	$display("      IN = %d & %d", X, Y);
	$display("       X = %b", x_in);
	$display("       Y = %b", y_in);
	$display("  Z = ~X = %b", z_out);
	$display("     OUT = %b", OUT);
	
	en_x = 0;
	en_y = 0;
	en_z = 0;
	ctrl = 3;
	#5
	
	$display("BUFFERS DISABLED; NEW ALU CTRL:");
	$display("       IN = %d & %d", X, Y);
	$display("        X = %b", x_in);
	$display("        Y = %b", y_in);
	$display("  Z = X^Y = %b", z_out);
	$display("      OUT = %b", OUT);
	
	en_x = 1;
	en_y = 1;
	#5
	
	$display("INPUT BUFFERS ENABLED:");
	$display("       IN = %d & %d", X, Y);
	$display("        X = %b", x_in);
	$display("        Y = %b", y_in);
	$display("  Z = X^Y = %b", z_out);
	$display("      OUT = %b", OUT);
	
	en_z = 1;
	#5
	
	$display("OUTPUT BUFFER ENABLED:");
	$display("       IN = %d & %d", X, Y);
	$display("        X = %b", x_in);
	$display("        Y = %b", y_in);
	$display("  Z = X^Y = %b", z_out);
	$display("      OUT = %b", OUT);

end


endmodule
