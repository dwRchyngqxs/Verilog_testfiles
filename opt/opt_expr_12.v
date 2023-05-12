module opt_expr_alu_test_ci0_bi0(input [7:0] a, input [3:0] b, output [8:0] x, y, co);
    \$alu #(.A_SIGNED(0), .B_SIGNED(0), .A_WIDTH(8), .B_WIDTH(8), .Y_WIDTH(9)) alu (.A(a), .B({b, 4'b0000}), .CI(1'b0), .BI(1'b0), .X(x), .Y(y), .CO(co));
endmodule
