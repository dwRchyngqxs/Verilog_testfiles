// Quartus II Verilog Template
// Unsigned multiply with input and output registers

module unsigned_multiply_with_input_and_output_registers
#(parameter WIDTH=8)
(
	input clk,
	input [WIDTH-1:0] dataa,
	input [WIDTH-1:0] datab,
	output reg [2*WIDTH-1:0] dataout
);

	// Declare input and output registers
	reg [WIDTH-1:0] dataa_reg;
	reg [WIDTH-1:0] datab_reg;
	wire [2*WIDTH-1:0] mult_out;

	// Store the result of the multiply
	assign mult_out = dataa_reg * datab_reg;

	// Update data
	always @ (posedge clk)
	begin
		dataa_reg <= dataa;
		datab_reg <= datab;
		dataout <= mult_out;
	end

endmodule
