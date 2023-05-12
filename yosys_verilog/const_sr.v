module test (
	input clk, rst, d,
	output reg q
);
wire nop = 1'h0;
always @(posedge clk, posedge nop, posedge rst) begin
	if (rst) q <= 1'b0;
	else if (nop) q <= 1'b1;
	else q <= d;
end
endmodule
