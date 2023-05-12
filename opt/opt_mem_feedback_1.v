module top();

input clk;
input en;
input s;

input [3:0] ra;
output [15:0] rd;
input [3:0] wa;
input [15:0] wd;

reg [15:0] mem[0:15];

assign rd = mem[ra];

always @(posedge clk) begin
	if (en) begin
		mem[wa] <= {mem[wa][15:8], s ? wd[7:0] : mem[wa][7:0]};
	end
end

endmodule
