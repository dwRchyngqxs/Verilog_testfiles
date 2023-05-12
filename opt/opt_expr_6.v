module opt_expr_sub_test1(input [3:0] i, input [7:0] j, output [8:0] o);
    assign o = j - (i << 4);
endmodule
