module test (input en, input a, input b, output c);
    wire [15:0] add0_res = a + b;
    assign #(3, 3) c = (en) ? a : 1'bz;
endmodule
