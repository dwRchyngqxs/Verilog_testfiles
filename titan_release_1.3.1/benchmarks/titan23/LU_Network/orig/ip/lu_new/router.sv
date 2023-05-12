`include "lu_new_pkg.sv"
import lu_new::*;

module router #
(
	parameter DATA_WIDTH = 256,
	parameter CONTROL_WIDTH = 2
)
(
	input [NETADDRBITS-1:0] c_id,
	
	// this clock should be network clock
	input clk,
	input reset,
	
	// for transmitting to local node
	output logic [DATA_WIDTH-1:0] o_local_data,
	output logic o_local_SOP,
	output logic o_local_EOP,
	output logic o_local_valid,
	input logic i_local_ready,
	
	// for recieving from local node
	input logic [DATA_WIDTH-1:0] i_local_data,
	input logic i_local_SOP,
	input logic i_local_EOP,
	input logic i_local_valid,
	output logic o_local_ready,
	
	// for recieving data from upstream
	input logic [DATA_WIDTH-1:0] i_ntwk_data,
	input logic i_ntwk_SOP,
	input logic i_ntwk_EOP,
 	input logic i_ustream_valid,
	output logic o_ustream_ready,
	
	// for transmitting data downstream
	input logic i_dstream_ready,
	output logic o_dstream_valid,
	output logic [DATA_WIDTH-1:0] o_ntwk_data,
	output logic o_ntwk_SOP,
	output logic o_ntwk_EOP
);

// internal signals: network traffic coming out of input buffer
logic [DATA_WIDTH-1:0]		inbuf_data;
logic inbuf_SOP;
logic inbuf_EOP;
logic inbuf_ready;
logic inbuf_valid;

// internal wire for examining header packets (HACK)
t_head_packet inbuf_head_packet;
t_head_packet local_head_packet;

assign inbuf_head_packet = t_head_packet'(inbuf_data);
assign local_head_packet = t_head_packet'(i_local_data);

assign o_local_SOP = inbuf_SOP;
assign o_local_EOP = inbuf_EOP;
assign o_local_data = inbuf_data;

// for buffering input from network
pipe_interlock #
(	
	.WIDTH(DATA_WIDTH+CONTROL_WIDTH),
	.REGISTERED(1),
	.MLAB(0)
)
inbuf
(
	.i_clk(clk),
	.i_reset(reset),
	
	.i_in({i_ntwk_data, i_ntwk_SOP, i_ntwk_EOP}),
	.i_have(i_ustream_valid),
	.o_want(o_ustream_ready),
	
	.o_out({inbuf_data, inbuf_SOP, inbuf_EOP}),
	.o_have(inbuf_valid),
	.i_want(inbuf_ready)
);

logic [DATA_WIDTH-1:0] outbuf_data;
logic outbuf_SOP;
logic outbuf_EOP;
logic outbuf_valid;
logic outbuf_ready;

// for buffering output to network
pipe_interlock #
(	
	.WIDTH(DATA_WIDTH + CONTROL_WIDTH),
	.REGISTERED(1),
	.MLAB(0)
)
outbuf
(
	.i_clk(clk),
	.i_reset(reset),
	
	.i_in({outbuf_data, outbuf_SOP, outbuf_EOP}),
	.i_have(outbuf_valid),
	.o_want(outbuf_ready),
	
	.o_out({o_ntwk_data, o_ntwk_SOP, o_ntwk_EOP}),
	.o_have(o_dstream_valid),
	.i_want(i_dstream_ready)
);

enum 
{
	I_FWD,
	I_LOCAL,
	I_BCAST,
	I_EAT
} inbuf_sel;

enum
{
	O_LOCAL,
	O_FWD,
	O_IDLE
} outbuf_sel;

logic fwd_valid;
logic fwd_ready;

always_comb begin
	case (outbuf_sel)
		O_FWD: begin
			outbuf_data = inbuf_data;
			outbuf_SOP = inbuf_SOP;
			outbuf_EOP = inbuf_EOP;
			outbuf_valid = fwd_valid;
			fwd_ready = outbuf_ready;
			o_local_ready = '0;
		end
		
		O_LOCAL: begin
			outbuf_data = i_local_data;
			outbuf_SOP = i_local_SOP;
			outbuf_EOP = i_local_EOP;
			outbuf_valid = i_local_valid;
			o_local_ready = outbuf_ready;
			fwd_ready = '0;
		end
		
		O_IDLE: begin
			outbuf_data = 'x;
			outbuf_SOP = 'x;
			outbuf_EOP = 'x;
			outbuf_valid = '0;
			o_local_ready = '0;
			fwd_ready = '1;
		end
	endcase
end

// Decoding of header packet info
wire inbuf_bcast = inbuf_head_packet.DEST_BCAST;
wire inbuf_for_us = inbuf_head_packet.DEST_ID == c_id;
wire inbuf_from_us = inbuf_head_packet.RQST_ID == c_id;
wire inbuf_isdata = !inbuf_EOP;
wire inbuf_priority = inbuf_head_packet.RD_RQST;
wire inbuf_enddata = !inbuf_SOP && inbuf_EOP;

wire local_isdata = !i_local_EOP;
wire local_enddata = !i_local_SOP && i_local_EOP;
wire local_priority = local_head_packet.RD_RQST;

always_comb begin
	case (inbuf_sel)
		I_FWD: begin
			fwd_valid = inbuf_valid;
			inbuf_ready = fwd_ready;
			o_local_valid = '0;
		end
		
		I_LOCAL: begin
			fwd_valid = '0;
			inbuf_ready = i_local_ready;
			o_local_valid = inbuf_valid;
		end
		
		I_BCAST: begin
			fwd_valid = inbuf_valid && i_local_ready;
			o_local_valid = inbuf_valid && fwd_ready;
			inbuf_ready = i_local_ready && fwd_ready;
		end
		
		I_EAT: begin
			fwd_valid = '0;
			o_local_valid = '0;
			inbuf_ready = '1;
		end
	endcase
end


enum int unsigned
{
	S_IN_HEADER,
	S_IN_LDATA,
	S_IN_FDATA,
	S_IN_BDATA,
	S_IN_KDATA
} in_state, in_nextstate;

enum int unsigned
{
	S_OUT_HEADER,
	S_OUT_FDATA,
	S_OUT_LDATA
} out_state, out_nextstate;

always_ff @ (posedge clk or posedge reset) begin
	if (reset) begin
		in_state <= S_IN_HEADER;
		out_state <= S_OUT_HEADER;
	end
	else begin
		in_state <= in_nextstate;
		out_state <= out_nextstate;
	end
end

always_comb begin
	in_nextstate = in_state;
	
	inbuf_sel = I_EAT;
	
	case (in_state)
		S_IN_HEADER: begin
			if (inbuf_valid) begin
				if (inbuf_from_us) begin
					inbuf_sel = I_EAT;
					if (inbuf_isdata) in_nextstate = S_IN_KDATA;
				end
				else if (inbuf_bcast) begin
					inbuf_sel = I_BCAST;
					if (inbuf_isdata && inbuf_ready) in_nextstate = S_IN_BDATA;
				end
				else if (inbuf_for_us) begin
					inbuf_sel = I_LOCAL;
					if (inbuf_isdata && inbuf_ready) in_nextstate = S_IN_LDATA;
				end
				else begin
					inbuf_sel = I_FWD;
					if (inbuf_isdata && inbuf_ready) in_nextstate = S_IN_FDATA;
				end
			end
		end
		
		S_IN_LDATA: begin
			inbuf_sel = I_LOCAL;
			
			if (inbuf_valid) begin				
				// Assumption: read request only, those are never broadcast
				if (inbuf_SOP && !inbuf_for_us) begin
					inbuf_sel = I_FWD;
				end
				
				if (inbuf_ready && inbuf_enddata) begin
					in_nextstate = S_IN_HEADER;
				end
			end
		end
		
		S_IN_BDATA: begin
			inbuf_sel = I_BCAST;
			
			if (inbuf_valid) begin
				if (inbuf_SOP) begin 
					if (inbuf_for_us) inbuf_sel = I_LOCAL;
					else inbuf_sel = I_FWD;
				end
				
				if (inbuf_ready && inbuf_enddata) begin
					in_nextstate = S_IN_HEADER;
				end
			end
		end
		
		S_IN_FDATA: begin
			inbuf_sel = I_FWD;
			
			if (inbuf_valid) begin
				if (inbuf_SOP && inbuf_for_us) begin
					inbuf_sel = I_LOCAL;
				end
				
				// Always exclusive from previous if statement due to inbuf_SOP
				if (inbuf_ready && inbuf_enddata) begin
					in_nextstate = S_IN_HEADER;
				end
			end
		end
		
		S_IN_KDATA: begin
			inbuf_sel = I_EAT;
			
			if (inbuf_valid) begin
				if (inbuf_SOP) begin
					if (inbuf_for_us) inbuf_sel = I_LOCAL;
					else inbuf_sel = I_FWD;
				end
				
				if (inbuf_enddata) begin
					in_nextstate = S_IN_HEADER;
				end
			end
		end
	endcase
end



always_comb begin
	out_nextstate = out_state;

	outbuf_sel = O_IDLE;
	
	case (out_state)
		S_OUT_HEADER: begin
			if (i_local_valid) begin
				if (local_isdata) out_nextstate = S_OUT_LDATA;
				outbuf_sel = O_LOCAL;
			end
			else if (fwd_valid) begin
				outbuf_sel = O_FWD;
				if (inbuf_isdata) out_nextstate = S_OUT_FDATA;
			end			
		end
		
		S_OUT_FDATA: begin
			outbuf_sel = O_FWD;
			
			if (i_local_valid && local_priority) begin
				outbuf_sel = O_LOCAL;
			end
			
			if (fwd_valid && fwd_ready && inbuf_enddata) begin
				out_nextstate = S_OUT_HEADER;
			end
		end
		
		S_OUT_LDATA: begin
			outbuf_sel = O_LOCAL;
			
			if (fwd_valid && inbuf_priority) begin
				outbuf_sel = O_FWD;
			end
			
			if (i_local_valid && o_local_ready && local_enddata) begin
				out_nextstate = S_OUT_HEADER;
			end
		end
	endcase
end


endmodule
