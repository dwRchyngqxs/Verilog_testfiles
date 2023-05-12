module top();

input clk;
input en;
input s;

output [15:0] rd;
input [3:0] wa;
input [15:0] wd;

reg [15:0] mem[0:15];

assign rd = mem[wa];

always @(posedge clk) begin
	if (en) begin
		mem[wa] <= {s ? rd : wd[15:8], s ? wd[7:0] : rd};
	end
end

endmodule
