module opt_expr_shift_3bit_keepdc(input [9:0] a, input [3:0] b, output [2:0] y);
    \$shift #(.A_SIGNED(0), .B_SIGNED(0), .A_WIDTH(14), .B_WIDTH(4), .Y_WIDTH(3)) shift (.A({4'b0x0x,a}), .B(b), .Y(y));
endmodule
