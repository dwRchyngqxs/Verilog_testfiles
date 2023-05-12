module top(input en, d, output reg q);

always_latch
	q = !d;

endmodule
