module top(
	input [3:0] ra,
	input [3:0] wa1,
	input [3:0] wa2,
	input [3:0] wd1,
	input [3:0] wd2,
	input we1, we2,
	input re,
	input clk,
	output reg [3:0] rd
);

reg [3:0] mem[0:15];

always @(posedge clk) begin
	if (we1)
		mem[wa1] <= wd1;
	if (we2)
		mem[wa2] <= wd2;
	if (re) begin
		rd <= mem[ra];
		if (we2 && wa2 == ra)
			rd <= wd2;
		if (we1 && wa1 == ra)
			rd <= 4'hx;
	end
end

endmodule
