module top(input clk, en, d, output reg p, q, r);

always_ff @(posedge clk)
	p <= d;

always_comb
	q = ~d;

always_latch
	if (en) r = d;

endmodule
