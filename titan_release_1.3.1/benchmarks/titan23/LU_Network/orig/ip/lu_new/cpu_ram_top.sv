`include "lu_new_pkg.sv"
import lu_new::*;

module cpu_top_ram
(
	input clk,
	input reset,
	
	input i_net_wclaim,
	input i_net_wrelease,
	input [TOP_AWIDTH-1:0] i_net_waddr,
	input [TOP_DWIDTH-1:0] i_net_wdata,
	input i_net_we,
	
	input [TOP_AWIDTH-1:0] i_comp_raddr,
	output logic [TOP_DWIDTH-1:0] o_comp_rdata,
	input [TOP_AWIDTH-1:0] i_comp_waddr,
	input [TOP_DWIDTH-1:0] i_comp_wdata,
	input [7:0] i_comp_be,
	input i_comp_we
);

// Who owns the write port?
enum int unsigned {COMP, NET} owner;

always_ff @ (posedge clk or posedge reset) begin
	if (reset) owner <= COMP;
	else begin
		if (i_net_wrelease) owner <= COMP;
		else if (i_net_wclaim) owner <= NET;
	end
end

logic [TOP_DWIDTH-1:0] wdata;
logic [TOP_DWIDTH-1:0] rdata;
logic we;
logic [TOP_AWIDTH-1:0] waddr;
logic [TOP_AWIDTH-1:0] raddr;

always_ff @ (posedge clk) begin
	wdata <= (owner == COMP) ? i_comp_wdata : i_net_wdata;
	we <= (owner == COMP) ? i_comp_we : i_net_we;
	waddr <= (owner == COMP) ? i_comp_waddr : i_net_waddr;
	raddr <= i_comp_raddr;
end

assign o_comp_rdata = rdata;

genvar gi;
generate
	for (gi = 0; gi < TOP_SLICES; gi++) begin : slices
		logic [7:0] be;
		
		// Each comp_be is for a 32-bit word, so turn into 8-bit byte
		always_ff @ (posedge clk) begin
			be <= (owner == COMP) ? { {4{i_comp_be[2*gi+1]}}, {4{i_comp_be[2*gi]}} } : '1;
		end
	
		altsyncram #
		(
			.operation_mode("DUAL_PORT"),
			.width_a(64),
			.widthad_a(TOP_AWIDTH),
			.width_byteena_a(8),
			.width_b(64),
			.widthad_b(TOP_AWIDTH),
			.address_reg_b("CLOCK0"),
			.outdata_reg_b("CLOCK0"),
			.ram_block_type("M144K")
		) mem_slice
		(
			.clock0(clk),
			.address_a(waddr),
			.data_a(wdata[(gi+1)*64-1 -: 64]),
			.wren_a(we),
			.byteena_a(be),
			.address_b(raddr),
			.q_b(rdata[(gi+1)*64-1 -: 64])
		);
	end
endgenerate

endmodule
