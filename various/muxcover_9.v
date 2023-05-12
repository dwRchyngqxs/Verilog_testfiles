module mux2in16(input [1:0] i, input s, output o);
    assign o = s ? i[1] : i[0];
endmodule
