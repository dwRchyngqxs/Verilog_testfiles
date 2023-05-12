`include "defs.vh"

module ddr_iface
(
	input i_clk300,
	input i_clk150,
	input i_clk_ddr,
	input i_reset,
	
	input [`MEM_ADDRBITS-1:0] i_waddr,
	input [`MEM_WIDTH-1:0] i_wdata,
	input i_wdata_have,
	output reg o_wdata_accept,
	
	input [`MEM_ADDRBITS-1:0] i_raddr,
	output [`MEM_WIDTH-1:0] o_rdata,
	input i_rdata_req,
	output reg o_rdata_req_accepted,
	output o_rdata_valid,
	output reg o_rdata_lastword,
	
	output reg [`MEM_ADDRBITS-1:0] o_ddr_address,
	output reg o_ddr_write_req,
	output reg o_ddr_read_req,
	output reg o_ddr_burstbegin,
	output reg [`MEM_WIDTH-1:0] o_ddr_wdata,
	output reg [15:0] o_ddr_be,
	output reg [3:0] o_ddr_size,
	input i_ddr_ready,
	input	[`MEM_WIDTH-1:0] i_ddr_rdata,
	input i_ddr_rdata_valid,
	input i_ddr_init_done
);

// Sync generator 150->300

reg sync_150;
initial sync_150 = 0;

always @ (posedge i_clk150) begin
	sync_150 <= ~sync_150;
end

// 300->ddr fifo

reg [`MEM_ADDRBITS-1:0] to_fifo_din_addr;
reg [`MEM_WIDTH-1:0] to_fifo_din_wdata;
reg [3:0] to_fifo_din_size;
reg to_fifo_din_read_req;
reg to_fifo_din_write_req;
reg to_fifo_din_burstbegin;

wire [`MEM_ADDRBITS-1:0] to_fifo_q_addr;
wire [`MEM_WIDTH-1:0] to_fifo_q_wdata;
wire [3:0] to_fifo_q_size;
wire to_fifo_q_read_req;
wire to_fifo_q_write_req;
wire to_fifo_q_burstbegin;

reg to_fifo_rdreq;
reg to_fifo_wrreq;
wire to_fifo_empty;
wire to_fifo_full;
dcfifo #
(
	.lpm_numwords(8),
	.lpm_showahead("ON"),
	.lpm_width(`MEM_ADDRBITS + `MEM_WIDTH + 7),
	.lpm_widthu(3),
	.overflow_checking("OFF"),
	.underflow_checking("OFF"),
	.add_ram_output_register("ON")
) to_ddr_fifo
(
	.aclr(i_reset),
	.data({to_fifo_din_addr, to_fifo_din_wdata, to_fifo_din_size, to_fifo_din_read_req, to_fifo_din_write_req, to_fifo_din_burstbegin}),
	.rdclk(i_clk_ddr),
	.wrclk(i_clk300),
	.rdreq(to_fifo_rdreq),
	.wrreq(to_fifo_wrreq),
	.q({to_fifo_q_addr, to_fifo_q_wdata, to_fifo_q_size, to_fifo_q_read_req, to_fifo_q_write_req, to_fifo_q_burstbegin}),
	.rdempty(to_fifo_empty),
	.wrfull(to_fifo_full)
);

// ddr->300 fifo

reg [`MEM_WIDTH-1:0] from_fifo_din;
wire [`MEM_WIDTH-1:0] from_fifo_q;
wire from_fifo_rdreq;
reg from_fifo_wrreq;
wire from_fifo_empty;
wire from_fifo_full;
dcfifo #
(
	.lpm_numwords(8),
	.lpm_showahead("ON"),
	.lpm_width(`MEM_WIDTH),
	.lpm_widthu(3),
	.overflow_checking("OFF"),
	.underflow_checking("ON")
) from_ddr_fifo
(
	.aclr(i_reset),
	.data(from_fifo_din),
	.rdclk(i_clk300),
	.wrclk(i_clk_ddr),
	.rdreq(from_fifo_rdreq),
	.wrreq(from_fifo_wrreq),
	.q(from_fifo_q),
	.rdempty(from_fifo_empty),
	.wrfull(from_fifo_full)
);

pipe_interlock #
(
	.WIDTH(`MEM_WIDTH)
) from_ddr_extra_stage
(
	.i_clk(i_clk300),
	.i_reset(i_reset),
	.i_in(from_fifo_q),
	.i_have(!from_fifo_empty),
	.o_want(from_fifo_rdreq),
	.o_out(o_rdata),
	.o_have(o_rdata_valid),
	.i_want(1'b1)
);

// 300 domain

localparam [1:0] S_WRITE_PRIORITY = 2'd0, S_READ_PRIORITY = 2'd1;
reg [1:0] state, nextstate;

reg sync_150_prev;
wire i_wdata_have_throttled = i_wdata_have && (sync_150 == sync_150_prev);

always @ (posedge i_clk300 or posedge i_reset) begin
	if (i_reset) begin
		state <= S_WRITE_PRIORITY;
	end
	else begin
		state <= nextstate;
		
		sync_150_prev <= sync_150;
	end
end


reg [`MEM_WIDTH-1:0] wdata;
reg [`MEM_ADDRBITS-1:0] waddr;
reg wdata_have_throttled;

always @ (posedge i_clk300 or posedge i_reset) begin
	if (i_reset) begin
		wdata_have_throttled <= 1'b0;
	end
	else begin
		case (wdata_have_throttled)
			1'b0: begin
				if (i_wdata_have_throttled) begin
					wdata_have_throttled <= 1'b1;
					wdata <= i_wdata;
					waddr <= i_waddr;
				end
			end
			
			1'b1: begin
				if (o_wdata_accept) begin
					wdata_have_throttled <= i_wdata_have_throttled;
					if (i_wdata_have_throttled) begin
						wdata_have_throttled <= 1'b1;
						wdata <= i_wdata;
						waddr <= i_waddr;
					end
				end
			end
		endcase
	end
end							
			

always @* begin
	nextstate = state;
	
	o_wdata_accept = 1'b0;
	o_rdata_req_accepted = 1'b0;
	
	to_fifo_din_addr = 'bx;
	to_fifo_din_wdata = wdata;
	to_fifo_din_size = 'bx;
	to_fifo_din_read_req = 1'b0;
	to_fifo_din_write_req = 1'b0;
	to_fifo_din_burstbegin = 1'b0;
	to_fifo_wrreq = 1'b0;
	
	case (state)
		S_WRITE_PRIORITY: begin			
			if (wdata_have_throttled) begin
				to_fifo_din_addr = waddr;
				to_fifo_din_size = 4'd1;
				to_fifo_din_burstbegin = 1'b1;
				to_fifo_din_write_req = 1'b1;
				
				if (!to_fifo_full) begin
					o_wdata_accept = 1'b1;
					to_fifo_wrreq = 1'b1;
					nextstate = S_READ_PRIORITY;
				end
			end
			else if (i_rdata_req) begin
				to_fifo_din_addr = i_raddr;
				to_fifo_din_size = 4'd8;
				to_fifo_din_burstbegin = 1'b1;
				to_fifo_din_read_req = 1'b1;
				
				if (!to_fifo_full) begin
					o_rdata_req_accepted = 1'b1;
					to_fifo_wrreq = 1'b1;
				end
			end
		end
		
		S_READ_PRIORITY: begin
			if (i_rdata_req) begin
				to_fifo_din_addr = i_raddr;
				to_fifo_din_size = 4'd8;
				to_fifo_din_burstbegin = 1'b1;
				to_fifo_din_read_req = 1'b1;
				
				if (!to_fifo_full) begin
					o_rdata_req_accepted = 1'b1;
					to_fifo_wrreq = 1'b1;
				end
			end
			else if (wdata_have_throttled) begin
				to_fifo_din_addr = waddr;
				to_fifo_din_size = 4'd1;
				to_fifo_din_burstbegin = 1'b1;
				to_fifo_din_write_req = 1'b1;
				
				if (!to_fifo_full) begin
					to_fifo_wrreq = 1'b1;
					o_wdata_accept = 1'b1;
				end
			end
		end
	endcase
end

// read transaction tracker

localparam RS_IDLE = 1'b0, RS_COUNTING = 1'b1;
reg rstate, rnextstate;

reg [`CACHE_BLOCKSIZEBITS-1:0] fill_cnt; reg fill_cnt_reset, fill_cnt_dec;

always @ (posedge i_clk300 or posedge i_reset) begin
	if (i_reset) begin
		rstate <= RS_IDLE;
		fill_cnt <= 'd0;
	end
	else begin
		rstate <= rnextstate;
		
		if (fill_cnt_reset) fill_cnt <= `CACHE_BLOCKSIZE - 1;
		else if (fill_cnt_dec) fill_cnt <= fill_cnt - 1;
	end
end

always @* begin
	rnextstate = rstate;
	
	fill_cnt_dec = 1'b0;
	fill_cnt_reset = 1'b0;
	
	o_rdata_lastword = 1'b0;
	
	case (rstate)
		RS_IDLE: begin
			fill_cnt_reset = 1'b1;
			if (o_rdata_valid) begin
				fill_cnt_reset = 1'b0;
				fill_cnt_dec = 1'b1;
				rnextstate = RS_COUNTING;
			end
		end
		
		RS_COUNTING: begin
			if (o_rdata_valid) begin
				fill_cnt_dec = 1'b1;
				if (fill_cnt == 'd0) begin
					o_rdata_lastword = 1'b1;
					fill_cnt_reset = 1'b0;
					rnextstate = RS_IDLE;
				end
			end
		end
		
		default: begin
		end
	endcase
end	


// ddr side

reg ddr_init_done;
reg [`MEM_ADDRBITS-1:0] ddr_address;
reg [`MEM_WIDTH-1:0] ddr_wdata;
reg ddr_write_req;
reg ddr_read_req;
reg ddr_burstbegin;
reg [3:0] ddr_size;

reg flopfifo_empty, flopfifo_rdreq, flopfifo_wrreq;

always @ (posedge i_clk_ddr or posedge i_reset) begin
	if (i_reset) begin
		ddr_init_done <= 1'b0;
		flopfifo_empty <= 1'b1;
	end
	else begin
		ddr_init_done = i_ddr_init_done;
		
		if (flopfifo_wrreq) begin
			ddr_address <= to_fifo_q_addr;
			ddr_wdata <= to_fifo_q_wdata;
			ddr_size <= to_fifo_q_size;
			ddr_read_req <= to_fifo_q_read_req;
			ddr_write_req <= to_fifo_q_write_req;
			ddr_burstbegin <= to_fifo_q_burstbegin;
		end
		
		if (flopfifo_wrreq && !flopfifo_rdreq) flopfifo_empty <= 1'b0;
		if (!flopfifo_wrreq && flopfifo_rdreq) flopfifo_empty <= 1'b1;
	end
end

always @* begin
	o_ddr_address = ddr_address;
	o_ddr_wdata = ddr_wdata;
	o_ddr_be = 16'hFFFF;
	o_ddr_size = ddr_size;
	o_ddr_write_req = 1'b0;
	o_ddr_read_req = 1'b0;
	o_ddr_burstbegin = 1'b0;
	
	flopfifo_rdreq = 1'b0;
	flopfifo_wrreq = 1'b0;
	to_fifo_rdreq = 1'b0;
	
	if (ddr_init_done && i_ddr_ready && !flopfifo_empty) begin
		o_ddr_write_req = ddr_write_req;
		o_ddr_read_req = ddr_read_req;
		o_ddr_burstbegin = ddr_burstbegin;
		flopfifo_rdreq = 1'b1;		
	end
	
	if (!to_fifo_empty && (flopfifo_empty || flopfifo_rdreq)) begin
		to_fifo_rdreq = 1'b1;
		flopfifo_wrreq = 1'b1;
	end
	
	from_fifo_din = i_ddr_rdata;
	from_fifo_wrreq = i_ddr_rdata_valid;
end


endmodule
