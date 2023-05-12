module defvalue_top(input clock, input [3:0] delta, output [3:0] cnt1, cnt2);
	cnt #(1) foo (.clock, .cnt(cnt1), .delta);
	cnt #(2) bar (.clock, .cnt(cnt2));
endmodule

module cnt #(
	parameter integer initval = 0
) (
	input clock,
	output logic [3:0] cnt = initval,
	input [3:0] delta
);
	assign (weak0, weak1) delta = 10;
	always @(posedge clock)
		cnt <= cnt + delta;
endmodule
