module top(input CI, I0, output [1:0] CO, output O);
    wire A = 1'b0, B = 1'b0;
	\$__ICE40_CARRY_WRAPPER #(
		//    A[0]: 1010 1010 1010 1010
		//    A[1]: 1100 1100 1100 1100
		//    A[2]: 1111 0000 1111 0000
		//    A[3]: 1111 1111 0000 0000
		.LUT(~16'b 0110_1001_1001_0110),
		.I3_IS_CI(1'b1)
	) u0 (
		.A(A),
		.B(B),
		.CI(CI),
		.I0(I0),
		.I3(1'bx),
		.CO(CO[0]),
		.O(O)
	);
    SB_CARRY u1 (.I0(~A), .I1(~B), .CI(CI), .CO(CO[1]));
endmodule
