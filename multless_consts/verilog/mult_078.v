/*------------------------------------------------------------------------------
 * This code was generated by Spiral Multiplier Block Generator, www.spiral.net
 * Copyright (c) 2006, Carnegie Mellon University
 * All rights reserved.
 * The code is distributed under a BSD style license
 * (see http://www.opensource.org/licenses/bsd-license.php)
 *------------------------------------------------------------------------------ */
/* ./multBlockGen.pl 7733 -fractionalBits 0*/
module multiplier_block (
    i_data0,
    o_data0
);

  // Port mode declarations:
  input   [31:0] i_data0;
  output  [31:0]
    o_data0;

  //Multipliers:

  wire [31:0]
    w1,
    w512,
    w511,
    w2044,
    w2045,
    w16,
    w2061,
    w8244,
    w7733;

  assign w1 = i_data0;
  assign w16 = w1 << 4;
  assign w2044 = w511 << 2;
  assign w2045 = w1 + w2044;
  assign w2061 = w2045 + w16;
  assign w511 = w512 - w1;
  assign w512 = w1 << 9;
  assign w7733 = w8244 - w511;
  assign w8244 = w2061 << 2;

  assign o_data0 = w7733;

  //multiplier_block area estimate = 7361.32319144118;
endmodule //multiplier_block

module surround_with_regs(
	i_data0,
	o_data0,
	clk
);

	// Port mode declarations:
	input   [31:0] i_data0;
	output  [31:0] o_data0;
	reg  [31:0] o_data0;
	input clk;

	reg [31:0] i_data0_reg;
	wire [30:0] o_data0_from_mult;

	always @(posedge clk) begin
		i_data0_reg <= i_data0;
		o_data0 <= o_data0_from_mult;
	end

	multiplier_block mult_blk(
		.i_data0(i_data0_reg),
		.o_data0(o_data0_from_mult)
	);

endmodule
