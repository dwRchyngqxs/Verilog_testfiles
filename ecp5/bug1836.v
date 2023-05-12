module top(
	input clk,
	output reg [15:0] sig1, sig2
);
	reg [7:0] ptr1, ptr2;
	reg [15:0] mem [0:255];

	initial begin
		$readmemh("bug1836.mem", mem);
	end

	always @(posedge clk) begin
		sig1 <= mem[ptr1];
		ptr1 <= ptr1 + 3;
		sig2 <= mem[ptr2];
		ptr2 <= ptr2 + 7;
	end
endmodule
