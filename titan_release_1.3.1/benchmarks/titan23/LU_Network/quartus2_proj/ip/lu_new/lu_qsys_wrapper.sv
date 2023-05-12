`include "lu_new_pkg.sv"
import lu_new::*;

module lu_qsys_wrapper #
(
	parameter BURSTLEN=6,
	parameter ADDRESS_WIDTH=30
)
(
	input comp_clk,
	input ddr_clk,
	input reset,

	// Avalon slave for host control (clk_b)
	input [1:0] s_address,
	input [31:0] s_writedata,
	output logic [31:0] s_readdata,
	output logic s_waitrequest,
	input s_read,
	input s_write,
	
	// Avalon master for DDR usage by the core (also clk_b)
	output [31:0] ddr_byteenable,
	output ddr_read,
	output [BURSTLEN-1:0] ddr_size,
	output [255:0] ddr_writedata,
	output ddr_write,
	input [255:0] ddr_rdata,
	input ddr_rdatavalid,
	input ddr_waitrequest,
	output [ADDRESS_WIDTH-1:0] ddr_address
);

logic done, done_set, done_clear;
logic start;
logic [31:0] N; bit N_load;

logic [31:0] cycles_hi;
logic [31:0] cycles_lo;
bit cycles_reset;
bit cycles_inc, cycles_inc_set, cycles_inc_clear;

localparam [1:0] A_N = 2'd0, A_CONTROL = 2'd2, A_CYCLES_HI = 2'd1, A_CYCLES_LO = 2'd3;

always @ (posedge ddr_clk or posedge reset) begin
	if (reset) begin
		N <= '0;
		done <= '0;
		cycles_hi <= '0;
		cycles_lo <= '0;
		cycles_inc <= '0;
	end
	else  begin
		if (N_load) N <= s_writedata;
		
		if (cycles_inc_clear) cycles_inc <= '0;
		else if (cycles_inc_set) cycles_inc <= '1;
		
		if (done_clear) done <= '0;
		else if (done_set) done <= '1;
		
		if (cycles_reset) cycles_lo <= '0;
		else if (cycles_inc) cycles_lo <= cycles_lo + 32'd1;
		
		if (cycles_reset) cycles_hi <= '0;
		else if (cycles_inc && cycles_lo == '1) cycles_hi <= cycles_hi + 32'd1;
	end
end

always_comb begin
	s_readdata = 'x;
	start = '0;
	s_waitrequest = '0;
	done_clear = '0;
	N_load = '0;
	cycles_inc_set = '0;
	cycles_reset = '0;
	cycles_inc_clear = done;
	
	case (s_address)
		A_N: begin
			N_load = s_write;
		end
		
		A_CONTROL: begin
			if (s_write) begin
				start = '1;
				cycles_inc_set = '1;
				cycles_reset = '1;
			end
			
			if (s_read) begin
				s_waitrequest = !done;
				done_clear = done;
			end
		end
		
		A_CYCLES_LO: begin
			s_readdata = cycles_lo;
		end
		
		A_CYCLES_HI: begin
			s_readdata = cycles_hi;
		end
		
		default: begin
		end
	endcase
end

`ifdef D_ARB
	`define TOP lu_new_top_arb
`else
	`define TOP lu_new_top
`endif

`TOP #
(
	.BURSTLEN(BURSTLEN),
	.ADDRESS_WIDTH(ADDRESS_WIDTH)
)
lu_top_inst
(
	.clk_a(comp_clk),
	.clk_b(ddr_clk),
	.reset(reset),
	
	.i_nblocks(N[MAX_BDIMBITS-1:0]),
	.i_go(start),
	.o_done(done_set),
	
	.ddr_byteenable(ddr_byteenable),
	.ddr_read(ddr_read),
	.ddr_size(ddr_size),
	.ddr_writedata(ddr_writedata),
	.ddr_write(ddr_write),
	.ddr_rdata(ddr_rdata),
	.ddr_rdatavalid(ddr_rdatavalid),
	.ddr_waitrequest(ddr_waitrequest),
	.ddr_address(ddr_address)
);
	
endmodule
