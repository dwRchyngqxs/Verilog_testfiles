module test;
    localparam TIME_TYP = 0.7;
    wire o, a, b;
    and #(0:TIME_TYP:2) and_gate (o, a, b);
    wire #(2:TIME_TYP:4) x;
    assign o = x;
endmodule
