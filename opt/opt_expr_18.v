module opt_expr_shift_1bit(input [2:0] a, input [1:0] b, output y);
    \$shift #(.A_SIGNED(0), .B_SIGNED(0), .A_WIDTH(4), .B_WIDTH(2), .Y_WIDTH(1)) shift (.A({1'b0,a}), .B(b), .Y(y));
endmodule
