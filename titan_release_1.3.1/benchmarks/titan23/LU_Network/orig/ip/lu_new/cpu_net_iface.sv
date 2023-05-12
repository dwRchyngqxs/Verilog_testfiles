`include "lu_new_pkg.sv"
import lu_new::*;

module cpu_net_iface 
(
	input clk,
	input reset,
	
	input [NETADDRBITS-1:0] c_id,
	
	// To router
	input [NET_DWIDTH-1:0] i_net_data,
	input i_net_valid,
	output logic o_net_ready,
	input i_net_sop,
	input i_net_eop,
	
	output logic [NET_DWIDTH-1:0] o_net_data,
	output logic o_net_valid,
	input i_net_ready,
	output logic o_net_sop,
	output logic o_net_eop,
	
	// To computation core
	output logic [NET_DWIDTH-1:0] o_comp_data,
	output logic o_comp_valid,
	output logic o_comp_sop,
	output logic o_comp_eop,
	input i_comp_ready,
	
	input [NET_DWIDTH-1:0] i_comp_data,
	input i_comp_valid,
	input i_comp_sop,
	input i_comp_eop,
	output logic o_comp_ready,
	
	// To main machine: GO message
	output logic o_go,
	output logic o_go_firstcol,
	output logic [MAX_BDIMBITS-1:0] o_go_blkx,
	output logic [MAX_BDIMBITS-1:0] o_go_blky,
	output logic [MAX_BDIMBITS-1:0] o_go_blkymax,
	output logic [MAX_BDIMBITS-1:0] o_go_blkxmin,
	
	// To main machine: RDDONE message
	output logic o_rddone,
	output t_buftrio o_rddone_whichbufs,
	output logic o_rddone_whichpage,
	
	// From main machine: RDREQ message
	input i_rdreq,
	output logic o_rdreq_ack,
	input i_rdreq_toctrl,
	input [MAX_BDIMBITS-1:0] i_rdreq_blkx,
	input [MAX_BDIMBITS-1:0] i_rdreq_blky,
	input t_buftrio i_rdreq_whichbufs,
	input i_rdreq_whichpage,
	
	// From main machine: DONE message
	input i_done,
	output logic o_done_ack
);


// Extract header from input
t_head_packet in_header;
assign in_header = t_head_packet'(i_net_data);

// Forward input to output (may do something more interesting later)
assign o_comp_data = i_net_data;
assign o_comp_valid = i_net_valid;
assign o_comp_sop = i_net_sop;
assign o_comp_eop = i_net_eop;
assign o_net_ready = i_comp_ready;

// Outgoing header to network
t_head_packet out_header, out_header_din;
logic out_header_load;

always_ff @ (posedge clk) begin
	if (out_header_load) out_header <= out_header_din;
end

// Outgoing data mux: from comp core, or our own header
enum logic {OUT_PASSTHRU, OUT_INJECT} out_owner;
always_comb begin
	case (out_owner)
		OUT_PASSTHRU: begin
			o_net_data = i_comp_data;
			o_net_valid = i_comp_valid;
			o_net_sop = i_comp_sop;
			o_net_eop = i_comp_eop;
			o_comp_ready = i_net_ready;
		end
		
		OUT_INJECT: begin
			o_net_data = out_header;
			o_net_valid = '1;
			o_net_sop = '1;
			o_net_eop = '1;
			o_comp_ready = '0;
		end
	endcase
end


// Receive: hold bufs/page until completion
t_buftrio rcv_whichbufs;
logic rcv_whichpage;
logic rcv_load;

always_ff @ (posedge clk) begin
	if (rcv_load) begin
		rcv_whichbufs <= in_header.WHICHBUFS;
		rcv_whichpage <= in_header.WHICHPAGE;
	end
end

assign rcv_load = i_net_valid && o_net_ready && i_net_sop && in_header.RD_DATA; 
assign o_rddone = i_net_valid && o_net_ready && !i_net_sop && i_net_eop; // assume only RD_DATA does this
assign o_rddone_whichbufs = rcv_whichbufs;
assign o_rddone_whichpage = rcv_whichpage;


// Receive: extract GO message
assign o_go = i_net_valid && o_net_ready && i_net_sop && in_header.MSG_GO;
assign o_go_firstcol = in_header.FIRSTCOL;
assign o_go_blkx = in_header.BLKX;
assign o_go_blky = in_header.BLKY;
assign o_go_blkxmin = in_header.BLKXMIN;
assign o_go_blkymax = in_header.BLKYMAX;


// Transmit: state machine

enum int unsigned
{
	S_T_HEADER,
	S_T_RDREQ,
	S_T_DONE,
	S_T_PASSTHRU
} t_state, t_nextstate;

always_ff @ (posedge clk or posedge reset) begin
	if (reset) t_state <= S_T_HEADER;
	else t_state <= t_nextstate;
end

always_comb begin
	t_nextstate = t_state;
	
	out_header_din = t_head_packet'('x);
	out_header_din.BLKX = i_rdreq_blkx;
	out_header_din.BLKY = i_rdreq_blky;
	out_header_din.WHICHPAGE = i_rdreq_whichpage;
	out_header_din.WHICHBUFS = i_rdreq_whichbufs;
	out_header_din.RQST_ID = c_id;
	out_header_din.DEST_BCAST = '0;
	out_header_din.RD_RQST = '0;
	out_header_din.WR_DATA = '0;
	out_header_din.RD_DATA = '0;
	out_header_din.MSG_GO = '0;
	out_header_din.MSG_DONE = '0;
	
	out_header_load = '0;
	out_owner = OUT_PASSTHRU;
	
	o_done_ack = '0;
	o_rdreq_ack = '0;
	
	case (t_state)
		S_T_HEADER: begin
			if (i_comp_valid && i_comp_sop && !i_comp_eop) begin
				t_nextstate = S_T_PASSTHRU;
			end
			else if (i_rdreq) begin
				out_header_din.RD_RQST = '1;
				out_header_din.DEST_ID = i_rdreq_toctrl ? NETADDR_CTRL : NETADDR_MEM;
				out_header_load = '1;
				t_nextstate = S_T_RDREQ;
			end
			else if (i_done) begin
				out_header_din.MSG_DONE = '1;
				out_header_din.DEST_ID = NETADDR_CTRL;
				out_header_load = '1;
				t_nextstate = S_T_DONE;
			end
		end
		
		S_T_RDREQ: begin
			out_owner = OUT_INJECT;
			if (i_net_ready) begin
				o_rdreq_ack = '1;
				t_nextstate = S_T_HEADER;
			end
		end
		
		S_T_DONE: begin
			out_owner = OUT_INJECT;
			if (i_net_ready) begin
				o_done_ack = '1;
				t_nextstate = S_T_HEADER;
			end
		end
		
		S_T_PASSTHRU: begin
			if (i_comp_valid && i_comp_eop) t_nextstate = S_T_HEADER;
		end
	endcase
end



	

endmodule
