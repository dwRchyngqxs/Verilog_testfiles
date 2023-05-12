module opt_expr_sub_test2(input [3:0] i, input [7:0] j, output [8:0] o);
    assign o = (i << 4) - j;
endmodule
