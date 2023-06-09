// Quartus II Verilog Template
// Basic 64-stage shift register with multiple taps

module basic_shift_register_with_multiple_taps
#(parameter WIDTH=8, parameter LENGTH=64)
(
	input clk, enable,
	input [WIDTH-1:0] sr_in,
	output [WIDTH-1:0] sr_tap_one, sr_tap_two, sr_tap_three, sr_out
);

	// Declare the shift register
	reg [WIDTH-1:0] sr [LENGTH-1:0];

	// Declare an iterator
	integer n;

	always @ (posedge clk)
	begin
		if (enable == 1'b1)
		begin
			// Shift everything over, load the incoming data
			for (n = LENGTH-1; n>0; n = n-1)
			begin
				sr[n] <= sr[n-1];
			end

			// Shift one position in
			sr[0] <= sr_in;
		end
	end

	assign sr_tap_one = sr[LENGTH/4-1];
	assign sr_tap_two = sr[LENGTH/2-1];
	assign sr_tap_three = sr[3*LENGTH/4-1];

	// Catch the outgoing data
	assign sr_out = sr[LENGTH-1];

endmodule
