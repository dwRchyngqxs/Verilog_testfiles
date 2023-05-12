module test;
    localparam TIME_STEP = 0.7;
    wire o, a, b;
    and #(TIME_STEP, 2) and_gate (o, a, b);
    wire #(0, TIME_STEP, TIME_STEP) x;
    assign o = x;
endmodule
