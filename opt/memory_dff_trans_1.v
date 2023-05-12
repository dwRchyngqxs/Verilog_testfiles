module top(
	input [3:0] addr,
	input [3:0] wd,
	input we,
	input clk,
	output reg [3:0] rd
);

reg [3:0] mem[0:15];

always @(posedge clk) begin
	if (we) begin
		mem[addr] <= wd;
		rd <= wd;
	end else begin
		rd <= mem[addr];
	end
end

endmodule
