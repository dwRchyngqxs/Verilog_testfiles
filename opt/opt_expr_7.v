module opt_expr_sub_signed_test1(input signed [3:0] i, input signed [7:0] j, output signed [8:0] o);
    assign o = j - (i << 4);
endmodule
