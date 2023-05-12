module opt_expr_mul_low_bits(input [2:0] a, input [2:0] b, output [7:0] y);
    \$mul #(.A_SIGNED(0), .B_SIGNED(0), .A_WIDTH(4), .B_WIDTH(4), .Y_WIDTH(8)) mul (.A({a, 1'b0}), .B({b, 1'b0}), .Y(y));
endmodule
