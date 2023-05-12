//Replacement for Xilinx corgen fifo_16
module fifo_16 #(
		parameter AWIDTH	= 9		// 2 BRAM = total 512 cells
		)(
		input clk,
		input rst,
		input [AWIDTH-1:0] din,
		input wr_en,
		input rd_en,
		output [AWIDTH-1:0] dout,
		//output full,
		//output empty,
		output valid);

	alt_fifo	alt_fifo_inst (
		.clock ( clk ),
		.data ( din ),
		.rdreq ( rd_en ),
		.sclr ( rst ),
		.wrreq ( wr_en ),
		.full(valid),
		.q ( dout )
		);

endmodule
