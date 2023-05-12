module test (
	input clk, d,
	output reg q
);
wire nop = 1'h0;
always @(posedge clk, posedge nop) begin
	if (nop) q <= 1'b0;
	else q <= d;
end
endmodule
