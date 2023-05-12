module peepopt_shiftmul_2 (input [11:0] D, input [1:0] S, output [11:0] Y);
	assign Y = D >> (S*3);
endmodule
