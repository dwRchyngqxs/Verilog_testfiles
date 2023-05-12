module test;
    wire o, a, b;
    and #(1:2:3, 4:5:6) and_gate (o, a, b);
    wire #(1:2:3, 4:5:6, 7:8:9) x;
    assign o = x;
endmodule
