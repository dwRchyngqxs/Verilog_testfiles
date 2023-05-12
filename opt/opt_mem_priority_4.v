module top(
	input [3:0] wa1, wa2, ra,
	input [1:0] wd1, wd2,
	input clk, we1, we2,
	output [3:0] rd);

reg [3:0] mem[0:15];
assign rd = mem[ra];

always @(posedge clk) begin
	if (we1)
		mem[wa1][1:0] <= wd1;
	if (we2)
		mem[wa2][3:2] <= wd2;
end

endmodule
