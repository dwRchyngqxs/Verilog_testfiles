module top(input d, output reg q);

always_comb @(d)
	q = ~d;

endmodule
