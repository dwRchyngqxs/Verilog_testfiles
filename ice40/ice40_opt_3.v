module top(input I3, I2, I1, I0, output O, O2);
	SB_LUT4 #(
		.LUT_INIT(8'b 1001_0110)
	) u0 (
		.I0(I0),
		.I1(I1),
		.I2(I2),
		.I3(),
		.O(O)
	);
	wire CO;
	\$__ICE40_CARRY_WRAPPER #(
		.LUT(~8'b 1001_0110),
		.I3_IS_CI(1'b0)
	) u1 (
		.A(1'b0),
		.B(1'b0),
		.CI(1'b0),
		.I0(),
		.I3(),
		.CO(CO),
		.O(O2)
	);
endmodule
