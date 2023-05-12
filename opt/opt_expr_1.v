module opt_expr_add_test(input [3:0] i, input [7:0] j, output [8:0] o);
    assign o = (i << 4) + j;
endmodule
