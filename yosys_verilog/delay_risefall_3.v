module test (a, b, c, y);
    localparam TIME_STEP = 0.011;
    input signed [3:0] a;
    input signed [1:0] b;
    input signed [1:0] c;
    output [5:0] y;
    assign #(TIME_STEP, TIME_STEP, TIME_STEP) y = (a >> b) >>> c;
endmodule
