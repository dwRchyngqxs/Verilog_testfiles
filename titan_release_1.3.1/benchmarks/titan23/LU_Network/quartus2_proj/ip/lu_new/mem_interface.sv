`include "lu_new_pkg.sv"
import lu_new::*;

module mem_interface #
(
	parameter DATA_WIDTH = 256,
	parameter CONTROL_WIDTH = 2
)
(
	input clk_b, 
	input reset,
	
	// for receiving packets from router
	input	 logic [DATA_WIDTH-1:0] i_net_data,
	input  logic i_net_SOP,
	input  logic i_net_EOP,
	input  logic i_net_valid,
	output logic o_net_ready,
	
	// for transmitting packets to router
	output logic [DATA_WIDTH-1:0] o_net_data,
	output logic o_net_SOP,
	output logic o_net_EOP,
	output logic o_net_valid,
	input  logic i_net_ready,	
	
	// for interfacing with DDR2 controller
	input  logic         waitrequest,
	output logic [29:0] 	addr,
	input  logic         rdata_valid, 
	input  logic [255:0] rdata,
	output logic [255:0] wdata,
	output logic [31:0]  be,
	output logic         read_req,
	output logic         write_req,
	output logic [5:0]   burstcount
);

typedef struct packed
{
	logic [MAX_BDIMBITS-1:0]	BLKX;			// column x coordinate
	logic [MAX_BDIMBITS-1:0]	BLKY;			// y coordinate of topmost block in column
	t_buftrio						WHICHBUFS;	// which buffers are to be filled
	logic								WHICHPAGE;	// which buffer page (0 or 1) to fill
	logic [NETADDRBITS-1:0]		RQST_ID;		// ID of the node that issued this packet
} t_read_request;

typedef struct packed
{
	logic [MAX_BDIMBITS-1:0]	BLKX;			// column x coordinate
	logic [MAX_BDIMBITS-1:0]	BLKY;			// y coordinate of topmost block in column
} t_write_request;

typedef struct packed
{
	t_buftrio					WHICHBUFS;		// which buffers are to be filled
	logic							WHICHPAGE;		// which buffer page (0 or 1) to fill
	logic [NETADDRBITS-1:0]	DEST_ID;			// ID of the destination node for this packet
} t_read_response;


// Interlock to network input
logic [DATA_WIDTH-1:0] net_in_data;
t_head_packet net_in_header;
logic net_in_valid;
logic net_in_sop;
logic net_in_eop;
logic net_in_ready;
pipe_interlock #
(	
	.WIDTH(DATA_WIDTH + 2),
	.REGISTERED(1)
)
net_in_ilk
(
	.i_clk(clk_b),
	.i_reset(reset),
	
	.i_in({i_net_data, i_net_SOP, i_net_EOP}),
	.i_have(i_net_valid),
	.o_want(o_net_ready),
	
	.o_out({net_in_data, net_in_sop, net_in_eop}),
	.o_have(net_in_valid),
	.i_want(net_in_ready)
);
assign net_in_header = t_head_packet'(net_in_data);
wire net_in_priority = net_in_header.RQST_ID == NETADDR_CTRL;


// Write request and data buffer
logic wrreq_q_wrreq;
logic wrreq_q_empty;
logic wrreq_q_rdreq;
logic wrreq_q_full;
logic [DATA_WIDTH-1:0] wrreq_q_in;
logic [DATA_WIDTH-1:0] wrreq_q_out;
t_write_request wrreq_q_in_header;
t_write_request wrreq_q_out_header;
scfifo #
(
	.lpm_width(DATA_WIDTH),
	.lpm_numwords(16),
	.lpm_widthu(4),
	.lpm_showahead("ON")
)
wrreq_buffer
(
	.clock(clk_b),
	.data(wrreq_q_in),
	.wrreq(wrreq_q_wrreq),
	.rdreq(wrreq_q_rdreq),
	.aclr(reset),
	.q(wrreq_q_out),
	.empty(wrreq_q_empty),
	.full(wrreq_q_full)
);
assign wrreq_q_out_header = t_write_request'(wrreq_q_out);
assign wrreq_q_in_header.BLKX = net_in_header.BLKX;
assign wrreq_q_in_header.BLKY = net_in_header.BLKY;

// Read request buffer
logic rdreq_q_wrreq;
logic rdreq_q_empty;
logic rdreq_q_rdreq;
logic rdreq_q_full;
t_read_request rdreq_q_in;
t_read_request rdreq_q_out;
logic [$bits(t_read_request)-1:0] rdreq_q_out_raw;
scfifo #
(
	.lpm_width($bits(t_read_request)),
	.lpm_numwords(MAX_CPU*3),
	.lpm_widthu(CLogB2(MAX_CPU*3-1)),
	.lpm_showahead("ON")
)
rdreq_buffer
(
	.clock(clk_b),
	.data(rdreq_q_in),
	.wrreq(rdreq_q_wrreq),
	.rdreq(rdreq_q_rdreq),
	.aclr(reset),
	.q(rdreq_q_out_raw),
	.empty(rdreq_q_empty),
	.full(rdreq_q_full)
);
assign rdreq_q_out = t_read_request'(rdreq_q_out_raw);
assign rdreq_q_in.BLKX = net_in_header.BLKX;
assign rdreq_q_in.BLKY = net_in_header.BLKY;
assign rdreq_q_in.WHICHPAGE = net_in_header.WHICHPAGE;
assign rdreq_q_in.WHICHBUFS = net_in_header.WHICHBUFS;
assign rdreq_q_in.RQST_ID = net_in_header.RQST_ID;

// Priority read request buffer
logic rdreqpri_q_wrreq;
logic rdreqpri_q_empty;
logic rdreqpri_q_rdreq;
logic rdreqpri_q_full;
t_read_request rdreqpri_q_in;
t_read_request rdreqpri_q_out;
logic [$bits(t_read_request)-1:0] rdreqpri_q_out_raw;
scfifo #
(
	.lpm_width($bits(t_read_request)),
	.lpm_numwords(MAX_CPU*2),
	.lpm_widthu(CLogB2(MAX_CPU*2-1)),
	.lpm_showahead("ON")
)
rdreqpri_buffer
(
	.clock(clk_b),
	.data(rdreqpri_q_in),
	.wrreq(rdreqpri_q_wrreq),
	.rdreq(rdreqpri_q_rdreq),
	.aclr(reset),
	.q(rdreqpri_q_out_raw),
	.empty(rdreqpri_q_empty),
	.full(rdreqpri_q_full)
);
assign rdreqpri_q_out = t_read_request'(rdreqpri_q_out_raw);
assign rdreqpri_q_in.BLKX = net_in_header.BLKX;
assign rdreqpri_q_in.BLKY = net_in_header.BLKY;
assign rdreqpri_q_in.WHICHPAGE = net_in_header.WHICHPAGE;
assign rdreqpri_q_in.WHICHBUFS = net_in_header.WHICHBUFS;
assign rdreqpri_q_in.RQST_ID = net_in_header.RQST_ID;

// Matrix size, used for memory address calc
logic [MAX_BDIMBITS:0] Nb; bit Nb_load;

// DDR input pipeline

logic [255:0] ddr_wrdata [2:1];
logic [MAX_BDIMBITS-1:0] ddr_x [1:0];
logic [MAX_BDIMBITS-1:0] ddr_y [2:0];
logic [MAX_BDIMBITS*2-1:0] ddr_addr_base_rd [2:2];
logic [MAX_BDIMBITS*2-1:0] ddr_addr_base_wr [2:2];
logic [MAX_BDIMBITS*2-1:0] ddr_addr_base_init [2:2];
logic [BWORDSMEMBITS-1:0] ddr_addr_cnt_rd[2:2];
logic [BWORDSMEMBITS-1:0] ddr_addr_cnt_wr[2:2];
bit ddr_addr_reset [2:0];
bit ddr_addr_inc [2:0];
bit ddr_req [2:0];
bit ddr_is_write [2:0];
bit ddr_pipe_enable;

always @ (posedge clk_b or posedge reset) begin
	if (reset) begin
		ddr_req[1] <= '0;
		ddr_is_write[1] <= '0;
		ddr_req[2] <= '0;
		ddr_is_write[2] <= '0;
	end
	else begin
		if (ddr_pipe_enable) begin
			ddr_wrdata[1] <= wrreq_q_out;
			ddr_x[1] <= ddr_x[0];
			ddr_y[1] <= ddr_y[0];
			ddr_addr_reset[1] <= ddr_addr_reset[0];
			ddr_addr_inc[1] <= ddr_addr_inc[0];
			ddr_req[1] <= ddr_req[0];
			ddr_is_write[1] <= ddr_is_write[0];
			
			ddr_wrdata[2] <= ddr_wrdata[1];
			ddr_y[2] <= ddr_y[1];
			ddr_addr_reset[2] <= ddr_addr_reset[1];
			ddr_addr_inc[2] <= ddr_addr_inc[1];
			ddr_req[2] <= ddr_req[1];
			ddr_is_write[2] <= ddr_is_write[1];
			
			if (ddr_addr_reset[1]) begin
				ddr_addr_base_init[2] <= ddr_x[1] * (* multstyle = "logic" *) Nb;
			end
			
			if (ddr_addr_reset[2]) begin
				if (ddr_is_write[2]) begin
					ddr_addr_base_wr[2] <= ddr_addr_base_init[2] + ddr_y[2];
					ddr_addr_cnt_wr[2] <= '0;
				end
				else begin
					ddr_addr_base_rd[2] <= ddr_addr_base_init[2] + ddr_y[2];
					ddr_addr_cnt_rd[2] <= '0;
				end
			end
			else if (ddr_addr_inc[2]) begin
				if (ddr_is_write[2]) ddr_addr_cnt_wr[2] <= ddr_addr_cnt_wr[2] + ((BWORDSMEMBITS)'(32));
				else ddr_addr_cnt_rd[2] <= ddr_addr_cnt_rd[2] + ((BWORDSMEMBITS)'(32));
			end
		end
	end
end

assign wdata = ddr_wrdata[2];
assign addr = ddr_is_write[2] ? {ddr_addr_base_wr[2], ddr_addr_cnt_wr[2], 5'b0} : {ddr_addr_base_rd[2], ddr_addr_cnt_rd[2], 5'b0};
assign burstcount = 6'd32;
assign be = '1;
assign read_req = ddr_req[2] && !ddr_is_write[2];
assign write_req = ddr_req[2] && ddr_is_write[2];
assign ddr_pipe_enable = !( ddr_req[2] && waitrequest );

typedef enum {RDREQ, RDREQ_PRI, WRREQ} ddr_req_sel_t;
ddr_req_sel_t ddr_req_sel;

always_comb begin
	case (ddr_req_sel)
		RDREQ: {ddr_x[0], ddr_y[0]} = {rdreq_q_out.BLKX, rdreq_q_out.BLKY};
		WRREQ: {ddr_x[0], ddr_y[0]} = {wrreq_q_out_header.BLKX, wrreq_q_out_header.BLKY};
		RDREQ_PRI: {ddr_x[0], ddr_y[0]} = {rdreqpri_q_out.BLKX, rdreqpri_q_out.BLKY};
		default: {ddr_x[0], ddr_y[0]} = 'x;
	endcase
end

// Read response buffer
logic rdresp_q_wrreq;
logic rdresp_q_empty;
logic rdresp_q_rdreq;
t_read_response rdresp_q_in;
t_read_response rdresp_q_out;
logic [$bits(t_read_response)-1:0] rdresp_q_out_raw;
scfifo #
(
	.lpm_width($bits(t_read_response)),
	.lpm_numwords(4),
	.lpm_widthu(2),
	.lpm_showahead("ON")
)
rdresp_buffer
(
	.clock(clk_b),
	.data(rdresp_q_in),
	.wrreq(rdresp_q_wrreq),
	.rdreq(rdresp_q_rdreq),
	.aclr(reset),
	.q(rdresp_q_out_raw),
	.empty(rdresp_q_empty)
);
assign rdresp_q_out = t_read_response'(rdresp_q_out_raw);

typedef enum {RESP_NONPRI, RESP_PRI} rdresp_q_sel_t;
rdresp_q_sel_t rdresp_q_sel;

always_comb begin
	case (rdresp_q_sel)
		RESP_NONPRI: begin
			rdresp_q_in.WHICHBUFS = rdreq_q_out.WHICHBUFS;
			rdresp_q_in.WHICHPAGE = rdreq_q_out.WHICHPAGE;
			rdresp_q_in.DEST_ID = rdreq_q_out.RQST_ID;
		end
		
		RESP_PRI: begin
			rdresp_q_in.WHICHBUFS = rdreqpri_q_out.WHICHBUFS;
			rdresp_q_in.WHICHPAGE = rdreqpri_q_out.WHICHPAGE;
			rdresp_q_in.DEST_ID = rdreqpri_q_out.RQST_ID;
		end
	endcase
end


// Write word counter
logic [4:0] write_cnt;
logic write_cnt_inc;
logic write_cnt_reset;
logic write_cnt_done;

always_ff @ (posedge clk_b) begin
	if (write_cnt_reset) write_cnt <= '0;
	else if (write_cnt_inc) write_cnt <= write_cnt + 5'd1;
end

assign write_cnt_done = (write_cnt == '1); 

// Read/write request counters (counts 16 requests)
logic [3:0] rd_request_cnt;
logic rd_request_cnt_inc;
logic rd_request_cnt_reset;
logic rd_request_cnt_done;

bit rd_request_resume, rd_request_resume_set, rd_request_resume_clear;

logic [3:0] wr_request_cnt;
logic wr_request_cnt_inc;
logic wr_request_cnt_reset;
logic wr_request_cnt_done;

always_ff @ (posedge clk_b) begin
	if(wr_request_cnt_reset) wr_request_cnt <= '0;
	else if(wr_request_cnt_inc) wr_request_cnt <= wr_request_cnt + 4'd1;
	
	if(rd_request_cnt_reset) rd_request_cnt <= '0;
	else if(rd_request_cnt_inc) rd_request_cnt <= rd_request_cnt + 4'd1;
	
	if (rd_request_resume_clear) rd_request_resume <= '0;
	else if (rd_request_resume_set) rd_request_resume <= '1;
end

assign rd_request_cnt_done = (rd_request_cnt == '1);
assign wr_request_cnt_done = (wr_request_cnt == '1);

// Occupancy counter for the read data queue (counts DDR reqs, or 1/16 of a block)
logic [3:0] oc;
logic oc_inc;
logic oc_dec;
logic oc_full;

always_ff @ (posedge clk_b or posedge reset) begin
	if (reset) oc <= '0;
	else begin
		case ({oc_dec,oc_inc}) 
			2'b00: ;
			2'b01: oc <= oc + 4'd1;
			2'b10: oc <= oc - 4'd1;
			2'b11: ;
		endcase
	end
end

assign oc_full = (oc == 4'd8);


// Construct outgoing header packet
t_head_packet net_out_header;
assign net_out_header.WHICHBUFS = rdresp_q_out.WHICHBUFS;
assign net_out_header.WHICHPAGE = rdresp_q_out.WHICHPAGE;
assign net_out_header.DEST_ID = rdresp_q_out.DEST_ID;
assign net_out_header.DEST_BCAST = (rdresp_q_out.DEST_ID == NETADDR_CTRL);
assign net_out_header.RQST_ID = (NETADDRBITS)'(NETADDR_MEM);
assign net_out_header.RD_DATA = '1;
assign net_out_header.MSG_GO = '0;
assign net_out_header.MSG_DONE = '0;
assign net_out_header.WR_DATA = '0;
assign net_out_header.RD_RQST = '0;

// Read data queue
logic [DATA_WIDTH-1:0] rdata_q_in;
logic [DATA_WIDTH-1:0] rdata_q_out;
logic rdata_q_empty;
logic rdata_q_rdreq;
logic rdata_q_wrreq;

scfifo #
(
	.lpm_width(NET_DWIDTH),
	.lpm_numwords(256),
	.lpm_widthu(8),
	.lpm_showahead("ON")
)
rdata_q
(
	.clock(clk_b),
	.data(rdata_q_in),
	.wrreq(rdata_q_wrreq),
	.rdreq(rdata_q_rdreq),
	.aclr(reset),
	.q(rdata_q_out),
	.empty(rdata_q_empty)
);

// logicister output of DDR controller
always_ff @ (posedge clk_b or posedge reset) begin
	if (reset) begin
		rdata_q_wrreq = '0;
	end
	else begin
		rdata_q_in <= rdata;
		rdata_q_wrreq <= rdata_valid;
	end
end

// mux before output to NTWK: select between header and body packet
typedef enum {HEADER, DATA} net_out_sel_t;
net_out_sel_t net_out_sel;
logic [DATA_WIDTH-1:0] net_out_data;
assign net_out_data = (net_out_sel == HEADER ? net_out_header : rdata_q_out);

// counter necessary for EOP generation
logic net_out_sop;
logic net_out_eop;
logic [BWORDSMEMBITS-1:0] net_out_cnt;	
bit net_out_cnt_reset;
bit net_out_cnt_inc;
bit net_out_cnt_done;
bit net_out_cnt_quarter_done;

always_ff @ (posedge clk_b) begin
	if (net_out_cnt_reset) net_out_cnt <= '0;
	else if (net_out_cnt_inc) net_out_cnt <= net_out_cnt + ((BWORDSMEMBITS)'(1));
end

assign net_out_cnt_done = net_out_cnt == '1;
assign net_out_cnt_quarter_done = net_out_cnt[4:0] == '1;
assign net_out_sop = (net_out_sel == HEADER);
assign net_out_eop = net_out_cnt_done;

// interlock to logicister output before sending out to network
logic net_out_ready;
logic net_out_valid;

pipe_interlock #
(	
	.WIDTH(DATA_WIDTH+2),
	.REGISTERED(1)
)
net_out_ilk
(
	.i_clk(clk_b),
	.i_reset(reset),
	
	.i_in({net_out_data, net_out_sop, net_out_eop}),
	.i_have(net_out_valid),
	.o_want(net_out_ready),
	
	.o_out({o_net_data, o_net_SOP, o_net_EOP}),
	.o_have(o_net_valid),
	.i_want(i_net_ready)
);






// Network input control

enum int unsigned
{
	NETIN_HEADER,
	NETIN_DATA
} netin_state, netin_nextstate;

always @ (posedge clk_b or posedge reset) begin
	if (reset) netin_state <= NETIN_HEADER;
	else begin
		netin_state <= netin_nextstate;
		//if (net_in_valid && net_in_sop && net_in_header.MSG_GO) begin
		if (Nb_load) Nb <= net_in_header.BLKYMAX + (MAX_BDIMBITS)'(1);
	end
end

always_comb begin
	netin_nextstate = netin_state;
	
	net_in_ready = '0;
	wrreq_q_wrreq = '0;
	rdreq_q_wrreq = '0;
	rdreqpri_q_wrreq = '0;
	Nb_load = '0;
	wrreq_q_in = 'x;
	
	case (netin_state)
		NETIN_HEADER: begin
			if (net_in_valid) begin
				if (net_in_header.WR_DATA) begin
					wrreq_q_in = wrreq_q_in_header;
					wrreq_q_wrreq = '1;
					
					if (!wrreq_q_full) begin
						net_in_ready = '1;
						netin_nextstate = NETIN_DATA;
					end
				end
				
				if (net_in_header.RD_RQST) begin
					if (net_in_priority) rdreqpri_q_wrreq = '1;
					else rdreq_q_wrreq = '1;
					net_in_ready = '1;
				end
				
				if (net_in_header.MSG_GO) begin
					net_in_ready = '1;
					Nb_load = '1;
				end
			end
		end
		
		NETIN_DATA: begin
			wrreq_q_in = net_in_data;
			
			if (net_in_valid) begin
				if (net_in_sop) begin
					if (net_in_priority)	rdreqpri_q_wrreq = '1;
					else rdreq_q_wrreq = '1;
					
					net_in_ready = '1;
				end
				else if (!wrreq_q_full) begin
					net_in_ready = '1;
					wrreq_q_wrreq = '1;
				
					if (net_in_eop) netin_nextstate = NETIN_HEADER;
				end
			end
		end
	endcase

end






//
// *** CONTROL LOGIC FOR SENDING REQUESTS TO DDR2
//
enum int unsigned
{
	DDR_IDLE,
	DDR_READ,
	DDR_WRITE
}	ddr_state, ddr_nextstate;
	
always_ff @ (posedge clk_b or posedge reset) begin
	if (reset) ddr_state <= DDR_IDLE;
	else ddr_state <= ddr_nextstate;
end	
	
always_comb begin
	ddr_nextstate = ddr_state;
	
	ddr_addr_reset[0] = '0;
	ddr_addr_inc[0] = '0;
	ddr_req[0] = '0;
	ddr_is_write[0] = '0;
	ddr_req_sel = ddr_req_sel_t'('x);
	
	rdreq_q_rdreq = '0;
	rdreqpri_q_rdreq = '0;
	wrreq_q_rdreq = '0;
	
	oc_inc = '0;
	
	rdresp_q_sel = rdresp_q_sel_t'('x);
	rdresp_q_wrreq = '0;
		
	write_cnt_inc = '0;
	write_cnt_reset = '0;
	
	wr_request_cnt_inc = '0;
	wr_request_cnt_reset = '0;
	
	rd_request_cnt_inc = '0;
	rd_request_cnt_reset = '0;
	rd_request_resume_set = '0;
	rd_request_resume_clear = '0;
	
	case (ddr_state)
		DDR_IDLE: begin
			ddr_addr_reset[0] = '1;
			rd_request_cnt_reset = '1;
			wr_request_cnt_reset = '1;
			write_cnt_reset = '1;
			
			if (ddr_pipe_enable) begin
				if (!rdreqpri_q_empty && !oc_full) begin
					ddr_req_sel = RDREQ_PRI;
					ddr_is_write[0] = '0;
					rdreqpri_q_rdreq = '1;
					rdresp_q_sel = RESP_PRI;
					rdresp_q_wrreq = '1;
					rd_request_resume_set = '1;
					ddr_nextstate = DDR_READ;
				end
				else if (!rdreq_q_empty && !oc_full) begin
					ddr_req_sel = RDREQ;
					ddr_is_write[0] = '0;
					rdreq_q_rdreq = '1;
					rdresp_q_sel = RESP_NONPRI;
					rdresp_q_wrreq = '1;
					rd_request_resume_set = '1;
					ddr_nextstate = DDR_READ;
				end
				else if (!wrreq_q_empty) begin
					ddr_is_write[0] = '1;
					wrreq_q_rdreq = '1;
					ddr_req_sel = WRREQ;
					ddr_nextstate = DDR_WRITE;
				end
			end
		end
		
		DDR_READ: begin
			if (ddr_pipe_enable) begin
				if (!oc_full) begin
					oc_inc = '1;
					ddr_req[0] = '1;
					ddr_is_write[0] = '0;
					ddr_addr_inc[0] = '1;
					rd_request_cnt_inc = '1;
					if (rd_request_cnt_done) begin
						rd_request_resume_clear = '1;
						ddr_nextstate = DDR_IDLE;
					end
				end
				else if (!wrreq_q_empty) begin
					ddr_is_write[0] = '1;
					ddr_addr_reset[0] = '1;
					wrreq_q_rdreq = '1;
					wr_request_cnt_reset = '1;
					write_cnt_reset = '1;
					ddr_req_sel = WRREQ;
					ddr_nextstate = DDR_WRITE;
				end
			end
		end
		
		DDR_WRITE: begin
			if(ddr_pipe_enable && !wrreq_q_empty) begin
				ddr_req[0] = '1;
				ddr_is_write[0] = '1;
				write_cnt_inc = '1;
				wrreq_q_rdreq = '1;
				if (write_cnt_done) begin
					ddr_addr_inc[0] = '1;
					write_cnt_reset = '1;
					wr_request_cnt_inc = '1;
					if (wr_request_cnt_done) begin
						if (rd_request_resume) ddr_nextstate = DDR_READ;
						else ddr_nextstate = DDR_IDLE;
					end
				end
			end	
		end
	endcase
end

//
// *** CONTROL LOGIC FOR SENDING READ RESPONSES OUT TO NETWORK
//

enum int unsigned
{
	RDATA_SEND_HEAD,
	RDATA_SEND_DATA
} rdata_state, rdata_nextstate;

always_ff @ (posedge clk_b or posedge reset) begin
	if (reset) rdata_state <= RDATA_SEND_HEAD;
	else rdata_state <= rdata_nextstate;
end
	
always_comb begin
	rdata_nextstate = rdata_state;
	rdresp_q_rdreq = '0;
	rdata_q_rdreq = '0;
	oc_dec = '0;
	net_out_sel = net_out_sel_t'('x);
	net_out_cnt_reset = '0;
	net_out_cnt_inc = '0;
	net_out_valid = '0;
	
	case (rdata_state)
		RDATA_SEND_HEAD: begin
			net_out_sel = HEADER;
			net_out_cnt_reset = '1;
			if(!rdresp_q_empty && !rdata_q_empty) begin
				net_out_valid = '1;
				if (net_out_ready) begin
					rdresp_q_rdreq = '1;
					rdata_nextstate = RDATA_SEND_DATA;
				end
			end
		end
		
		RDATA_SEND_DATA: begin
			net_out_sel = DATA;
			if(!rdata_q_empty && net_out_ready) begin
				net_out_valid = '1;
				rdata_q_rdreq = '1;
				net_out_cnt_inc = '1;
				oc_dec = net_out_cnt_quarter_done;				
				if (net_out_cnt_done) begin
					rdata_nextstate = RDATA_SEND_HEAD;
				end
			end
		end
	endcase
end	
	
	
endmodule
