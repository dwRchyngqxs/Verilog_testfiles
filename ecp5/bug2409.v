module t ();

input CLK;
input [10:0] A;
input WE;
input C;
input [7:0] DI;
output reg [7:0] DO;

reg [7:0] mem[2047:0];

always @(posedge CLK) begin
	if (C)
		if (WE)
			mem[A] <= DI;
	DO <= mem[A];
end

endmodule
