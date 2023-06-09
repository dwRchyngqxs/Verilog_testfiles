module top(input [15:0] a, b, output [31:0] o1, o2, o5);
SB_MAC16 m1 (.A(a), .B(16'd1234), .O(o1));
assign o2 = a * 16'd0;
wire [31:0] o3, o4;
SB_MAC16 m2 (.A(a), .B(b), .O(o3));
assign o4 = a * b;
SB_MAC16 m3 (.A(a), .B(b), .O(o5));
endmodule
