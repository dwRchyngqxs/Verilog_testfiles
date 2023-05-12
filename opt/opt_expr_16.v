module opt_expr_shiftx_1bit(input [2:0] a, input [1:0] b, output y);
    \$shiftx #(.A_SIGNED(0), .B_SIGNED(0), .A_WIDTH(4), .B_WIDTH(2), .Y_WIDTH(1)) shiftx (.A({1'bx,a}), .B(b), .Y(y));
endmodule
