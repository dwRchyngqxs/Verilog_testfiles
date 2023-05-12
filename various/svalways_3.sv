module top(input en, d, output reg q);

always_comb
	if (en) q = d;

endmodule
