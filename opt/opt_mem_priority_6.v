module top(
	input [5:0] wa1, wa2,
	input [7:0] ra,
	input [31:0] wd1, wd2,
	input clk, we1, we2,
	output [7:0] rd);

reg [7:0] mem[0:255];
assign rd = mem[ra];

always @(posedge clk) begin
	if (we1) begin
		mem[{wa1, 2'b00}] <= wd1[7:0];
		mem[{wa1, 2'b01}] <= wd1[15:8];
		mem[{wa1, 2'b10}] <= wd1[23:16];
		mem[{wa1, 2'b11}] <= wd1[31:24];
	end
	if (we2) begin
		mem[{wa2, 2'b00}] <= wd2[7:0];
		mem[{wa2, 2'b01}] <= wd2[15:8];
		mem[{wa2, 2'b10}] <= wd2[23:16];
		mem[{wa2, 2'b11}] <= wd2[31:24];
	end
end

endmodule
