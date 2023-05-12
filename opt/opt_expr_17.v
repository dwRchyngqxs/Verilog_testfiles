module opt_expr_shiftx_3bit(input [9:0] a, input [3:0] b, output [2:0] y);
    \$shiftx #(.A_SIGNED(0), .B_SIGNED(0), .A_WIDTH(14), .B_WIDTH(4), .Y_WIDTH(3)) shiftx (.A({4'bxx00,a}), .B(b), .Y(y));
endmodule
