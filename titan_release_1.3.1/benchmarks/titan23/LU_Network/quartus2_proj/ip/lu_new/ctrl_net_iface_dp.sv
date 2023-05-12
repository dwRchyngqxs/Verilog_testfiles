`include "lu_new_pkg.sv"
import lu_new::*;

module ctrl_net_iface_dp
(
	input clk_b,
	input reset,
	
	// Number of CPUs to expect
	input [NETADDRBITS-1:0] c_n_cpus,
	
	// To router
	input [255:0] i_net_flit,
	input i_net_valid,
	input i_net_sop,
	
	output [255:0] o_net_flit,
	output o_net_valid,
	output o_net_sop,
	output o_net_eop,
	input i_net_ready,
	
	// From the overlord
	input [MAX_BDIMBITS-1:0] i_nblocks,
	
	// To state machine
	input i_load_nblocks,
	
	input i_req_units0_clear,
	input i_req_units1_clear,
	input i_done_units_clear,
	input i_active_units_clear,
	input i_active_units_inc,
	
	input i_k_reset,
	input i_k_inc,
	output logic o_k_done,
	
	input i_j_load_k,
	input i_j_inc,
	output logic o_j_done,
	
	output logic o_all_active,
	output logic o_all_reqed0,
	output logic o_all_reqed1,
	output logic o_all_done,
	
	input i_msg_send,
	input i_msg_is_go,
	input i_msg_is_rdreq,
	input i_msg_rdreq_page,
	input i_msg_tomem,
	input i_msg_firstcol,
	output o_msg_sent
);

// Register the flit at the input
t_head_packet in_header;
logic in_valid;
logic in_sop;

always_ff @ (posedge clk_b or posedge reset) begin
	if (reset) begin
		in_valid <= '0;
	end
	else begin
		in_header <= t_head_packet'(i_net_flit);
		in_valid <= i_net_valid;
		in_sop <= i_net_sop;
	end
end

// Decode incoming messages from CPUs
wire got_done = in_valid && in_sop && in_header.MSG_DONE;
wire got_rdreq0 = in_valid && in_sop && in_header.RD_RQST && (in_header.WHICHPAGE == 1'b0);
wire got_rdreq1 = in_valid && in_sop && in_header.RD_RQST && (in_header.WHICHPAGE == 1'b1);

// Remember RDREQ message details for later
t_buftrio rdreq_whichbufs0;
t_buftrio rdreq_whichbufs1;
logic [MAX_BDIMBITS-1:0] rdreq_blky0;
logic [MAX_BDIMBITS-1:0] rdreq_blky1;
logic [MAX_BDIMBITS-1:0] rdreq_blkx;

always_ff @ (posedge clk_b) begin	
	if (got_rdreq0) begin
		rdreq_whichbufs0 <= in_header.WHICHBUFS;
		rdreq_blky0 <= in_header.BLKY;
		rdreq_blkx <= in_header.BLKX;
	end
	else if (got_rdreq1) begin
		rdreq_whichbufs1 <= in_header.WHICHBUFS;
		rdreq_blky1 <= in_header.BLKY;
		rdreq_blkx <= in_header.BLKX;
	end
end

// Counters for the top loop
logic [MAX_BDIMBITS-1:0] nblocks_minus_1;
logic [MAX_BDIMBITS-1:0] k;
logic [MAX_BDIMBITS-1:0] j;

logic [NETADDRBITS-1:0] req_units0;
logic [NETADDRBITS-1:0] req_units1;
logic [NETADDRBITS-1:0] active_units;
logic [NETADDRBITS-1:0] done_units;

always_ff @ (posedge clk_b) begin
	if (i_load_nblocks) begin
		nblocks_minus_1 <= i_nblocks - (MAX_BDIMBITS)'(1);
	end
	
	if (i_req_units0_clear) req_units0 <= '0;
	else if (got_rdreq0) req_units0 <= req_units0 + (NETADDRBITS)'(1);
	
	if (i_req_units1_clear) req_units1 <= '0;
	else if (got_rdreq1) req_units1 <= req_units1 + (NETADDRBITS)'(1);
	
	if (i_done_units_clear) done_units <= '0;
	else if (got_done) done_units <= done_units + (NETADDRBITS)'(1);
	
	if (i_active_units_clear) active_units <= '0;
	else if (i_active_units_inc) active_units <= active_units + (NETADDRBITS)'(1);
	
	if (i_k_reset) k <= '0;
	else if (i_k_inc) k <= k + (MAX_BDIMBITS)'(1);
	
	if (i_j_load_k) j <= k;
	else if (i_j_inc) j <= j + (MAX_BDIMBITS)'(1);
end

assign o_all_active = (active_units == c_n_cpus);
assign o_all_reqed0 = (req_units0 == active_units);
assign o_all_reqed1 = (req_units1 == active_units);
assign o_all_done = (done_units == active_units);
assign o_k_done = (k == nblocks_minus_1);
assign o_j_done = (j == nblocks_minus_1);


// Construction of output messages

t_head_packet out_header;

always_comb begin
	out_header = t_head_packet'('x);
	
	out_header.BLKXMIN = k;
	out_header.BLKYMAX = nblocks_minus_1;
	out_header.FIRSTCOL = i_msg_firstcol;
	out_header.BLKX = i_msg_tomem? rdreq_blkx : j;
	out_header.BLKY = i_msg_rdreq_page? rdreq_blky1 : rdreq_blky0;
	out_header.WHICHBUFS = i_msg_rdreq_page? rdreq_whichbufs1 : rdreq_whichbufs0;
	out_header.WHICHPAGE = i_msg_rdreq_page;
	out_header.RQST_ID = (NETADDRBITS)'(NETADDR_CTRL);
	out_header.DEST_ID = (NETADDRBITS)'( i_msg_tomem? NETADDR_MEM : active_units );
	out_header.DEST_BCAST = '0;
	out_header.MSG_GO = i_msg_is_go;
	out_header.RD_RQST = i_msg_is_rdreq;
	out_header.MSG_DONE = '0;
	out_header.RD_DATA = '0;
	out_header.WR_DATA = '0;
end


pipe_interlock #
(
	.REGISTERED(1),
	.WIDTH($bits(t_head_packet))
) out_buf
(
	.i_clk(clk_b),
	.i_reset(reset),
	
	.i_in(out_header),
	.i_have(i_msg_send),
	.o_want(o_msg_sent),
	
	.o_out(o_net_flit[$bits(t_head_packet)-1:0]),
	.o_have(o_net_valid),
	.i_want(i_net_ready)
);
assign o_net_flit[255:$bits(out_header)] = 'x;


// We only send 1-flit header packets
assign o_net_sop = '1;
assign o_net_eop = '1;



endmodule
