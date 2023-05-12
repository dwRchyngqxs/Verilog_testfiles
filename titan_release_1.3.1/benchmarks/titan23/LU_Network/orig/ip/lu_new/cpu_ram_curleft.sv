`include "lu_new_pkg.sv"
import lu_new::*;

module cpu_ram_curleft #
(
	parameter LEFT = 0
)
(
	input clk,
	input reset,
	
	// Comp. Write
	input [CURLEFT_AWIDTH-1:0] i_comp_waddr [LANES],
	input [LANES-1:0][31:0] i_comp_wdata,
	input [LANES-1:0] i_comp_we,
	
	// Comp. Read
	input [CURLEFT_AWIDTH-1:0] i_comp_raddr [LANES],
	output logic [LANES-1:0] [31:0] o_comp_rdata,
	
	// Net Write
	input i_net_wclaim,
	input i_net_wrelease,
	input [CURLEFT_AWIDTH-1:0] i_net_waddr,
	input [CURLEFT_DWIDTH-1:0] i_net_wdata,
	input [1:0] i_net_we,
	
	// Net Read
	input i_net_rclaim,
	input i_net_rrelease,
	input i_net_renable,
	input [CURLEFT_AWIDTH-1:0] i_net_raddr,
	output logic [CURLEFT_DWIDTH-1:0] o_net_rdata
);

enum int unsigned {COMP, NET} owner_r, owner_w;

always_ff @ (posedge clk or posedge reset) begin
	if (reset) begin
		owner_r <= COMP;
		owner_w <= COMP;
	end
	else begin
		if (!LEFT) begin
			if (i_net_rrelease) owner_r <= COMP;
			else if (i_net_rclaim) owner_r <= NET;
		end
	
		if (i_net_wrelease) owner_w <= COMP;
		else if (i_net_wclaim) owner_w <= NET;
	end
end

logic [LANES-1:0][31:0] wdata;
logic [LANES-1:0][31:0] rdata;

wire rpipe_enable = LEFT || (owner_r == COMP) || i_net_renable;

always_ff @ (posedge clk) begin
	wdata <= (owner_w == COMP) ? i_comp_wdata: i_net_wdata;
end

genvar gi;
generate
	for (gi = 0; gi < LANES; gi++) begin : slices
		logic [CURLEFT_AWIDTH-1:0] waddr;
		logic [CURLEFT_AWIDTH-1:0] raddr;
		logic we;
	
		always_ff @ (posedge clk) begin
			if (rpipe_enable) begin
				raddr <= (LEFT || owner_r == COMP) ? i_comp_raddr[gi] : i_net_raddr;
			end
		
			waddr <= (owner_w == COMP) ? i_comp_waddr[gi] : i_net_waddr;
			we <= (owner_w == COMP) ? i_comp_we[gi] : i_net_we[gi / 8];
		end
		
		
		altsyncram #
		(
			.operation_mode("DUAL_PORT"),
			.width_a(32),
			.widthad_a(CURLEFT_AWIDTH),
			.width_b(32),
			.widthad_b(CURLEFT_AWIDTH),
			.outdata_reg_b("CLOCK1"),
			.ram_block_type("M9K")
		) mem_slice
		(
			.clock0(clk),
			.clock1(clk),
			.address_a(waddr),
			.data_a(wdata[gi]),
			.wren_a(we),
			.address_b(raddr),
			.q_b(rdata[gi]),
			.clocken1(rpipe_enable)
		);
	end
endgenerate

assign o_comp_rdata = rdata;
assign o_net_rdata = rdata;

endmodule
