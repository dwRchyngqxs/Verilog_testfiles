module test;
    reg clk;
    initial clk = 1'b0;
    always #(100: 180: 230) clk = ~clk;
endmodule
