module top(input clk, input [3:0] addr, output reg [0:0] dout);
	reg [1:0] mem[0:15];
	initial begin
		mem[0] = 2'b00;
		mem[1] = 2'b01;
		mem[2] = 2'b10;
		mem[3] = 2'b11;
	end
	always @(posedge clk)
		dout <= mem[addr];
endmodule
