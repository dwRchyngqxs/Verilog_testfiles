module wreduce_sub_test(input [3:0] i, input [7:0] j, output [8:0] o);
    assign o = (j >> 4) - i;
endmodule
