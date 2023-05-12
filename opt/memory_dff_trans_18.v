module top(
	input [7:0] addr,
	input [31:0] wd,
	input we,
	input re,
	input clk,
	output reg [31:0] rd
);

reg [7:0] mem[0:255];

always @(posedge clk) begin
	if (we) begin
		mem[{addr[7:2], 2'b00}] <= wd[7:0];
		mem[{addr[7:2], 2'b01}] <= wd[15:8];
		mem[{addr[7:2], 2'b10}] <= wd[23:16];
		mem[{addr[7:2], 2'b11}] <= wd[31:24];
	end
	if (re) begin
		rd[7:0] <= mem[{addr[7:2], 2'b00}];
		rd[15:8] <= mem[{addr[7:2], 2'b01}];
		rd[23:16] <= mem[{addr[7:2], 2'b10}];
		rd[31:24] <= mem[{addr[7:2], 2'b11}];
		if (we)
			rd <= wd;
	end
end

endmodule
