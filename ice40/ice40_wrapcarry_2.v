module top(input A, B, CI, output O, CO);
    (* foo = "bar", answer = 42, keep=0 *)
	SB_CARRY carry (
		.I0(A),
		.I1(B),
		.CI(CI),
		.CO(CO)
	);
    (* keep, blah="blah", answer = 43 *)
	SB_LUT4 #(
		.LUT_INIT(16'b 0110_1001_1001_0110)
	) adder (
		.I0(1'b0),
		.I1(A),
		.I2(B),
		.I3(1'b0),
		.O(O)
	);
endmodule
