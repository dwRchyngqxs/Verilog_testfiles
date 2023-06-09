// Quartus II Verilog Template
// Barrel shifter

module barrel_shifter
#(parameter M=8, parameter N=2**M)
(
	input [N-1:0] data,
	input [M-1:0] distance,
	input clk, enable, shift_left,
	output reg [N-1:0] sr_out
);

	// Declare temporary registers
	reg [2*N-1:0] tmp;

	// Shift/rotate in the specified direction and
	// by the specified amount
	always @ (posedge clk)
	begin
		tmp = {data,data};

		if (enable == 1'b1)
			if (shift_left)
			begin
				tmp = tmp << distance;	
				sr_out <= tmp[2*N-1:N];
			end
			else
			begin
				tmp = tmp >> distance;
				sr_out <= tmp[N-1:0];
			end
	end

endmodule
