module mux2(a, b, s, y);
	input a, b, s;
	output y;

	wire s_n = ~s;
	wire t0 = s & a;
	wire t1 = s_n & b;
	assign y = t0 | t1;
endmodule
