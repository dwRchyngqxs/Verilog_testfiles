module opt_expr_add_signed_test(input signed [3:0] i, input signed [7:0] j, output signed [8:0] o);
    assign o = (i << 4) + j;
endmodule
