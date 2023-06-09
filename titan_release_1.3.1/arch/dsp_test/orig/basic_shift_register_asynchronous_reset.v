// Quartus II Verilog Template
// One-bit wide, N-bit long shift register with asynchronous reset

module basic_shift_register_asynchronous_reset
#(parameter N=256)
(
	input clk, enable, reset,
	input sr_in,
	output sr_out
);

	// Declare the shift register
	reg [N-1:0] sr;

	// Shift everything over, load the incoming bit
	always @ (posedge clk or posedge reset)
	begin
		if (reset == 1'b1)
		begin
			// Load N zeros 
			sr <= {N{1'b0}};
		end
		else if (enable == 1'b1)
		begin
			sr[N-1:1] <= sr[N-2:0];
			sr[0] <= sr_in;
		end
	end

	// Catch the outgoing bit
	assign sr_out = sr[N-1];

endmodule
