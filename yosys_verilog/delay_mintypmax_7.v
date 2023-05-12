module test (input en, input a, input b, output c);
    wire [15:0] add0_res = a + b;
    assign #(15:20:30) c = (en) ? a : 1'bz;
endmodule
