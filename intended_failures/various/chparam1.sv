module top #(
        parameter [31:0] X = 0
) (
        input [31:0] din,
        output [31:0] dout
);
        assign dout = X-din;
endmodule

module top_props #(
        parameter [31:0] X = 0
) (
        input [31:0] dout
);
        always @* assert (dout != X);
endmodule

bind top top_props #(.X(123456789)) props (.*);
