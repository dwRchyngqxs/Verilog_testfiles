module top(input [24:0] a, input [17:0] b, output [42:0] o1, o2, o5);
DSP48E1 m1 (.A(a), .B(16'd1234), .P(o1));
assign o2 = a * 16'd0;
wire [42:0] o3, o4;
DSP48E1 m2 (.A(a), .B(b), .P(o3));
assign o4 = a * b;
DSP48E1 m3 (.A(a), .B(b), .P(o5));
endmodule
