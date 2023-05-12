module top(
	input [7:0] addr,
	input [7:0] wd,
	input we,
	input re,
	input clk,
	output reg [31:0] rd
);

reg [7:0] mem[0:255];

always @(posedge clk) begin
	if (we)
		mem[addr] <= wd;
	if (re) begin
		rd[7:0] <= mem[{addr[7:2], 2'b00}];
		rd[15:8] <= mem[{addr[7:2], 2'b01}];
		rd[23:16] <= mem[{addr[7:2], 2'b10}];
		rd[31:24] <= mem[{addr[7:2], 2'b11}];
		case ({we, addr[1:0]})
		3'b100: rd[7:0] <= wd;
		3'b101: rd[15:8] <= wd;
		3'b110: rd[23:16] <= wd;
		3'b111: rd[31:24] <= wd;
		endcase
	end
end

endmodule
