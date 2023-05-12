module ffbb ();
parameter [0:0] INIT = 1'bx;
input D, C;
output Q;
endmodule

module top();
input clk;
input d;
output reg q0 = 0;
output reg q1 = 1;
output reg qq0 = 0;
output reg qx;

always @(posedge clk) begin
	q0 <= d;
	q1 <= d;
	qq0 <= q0;
	qx <= d;
end
endmodule
