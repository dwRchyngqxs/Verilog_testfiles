module top(input en, d, output reg q);

always_ff @(*)
	q = !d;

endmodule
