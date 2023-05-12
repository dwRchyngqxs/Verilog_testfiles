`include "defs.vh"

module ddr_arbiter_mux
(
	input i_clk300,
	input i_reset,
	
	input [`N_UNITS-1:0] i_unit_id_a,
	input i_rdata_req_a,
	input [`MEM_ADDRBITS-1:0] i_raddr_a,
	output reg o_rdata_req_accepted_a,
	
	input [`N_UNITS-1:0] i_unit_id_b,
	input i_rdata_req_b,
	input [`MEM_ADDRBITS-1:0] i_raddr_b,
	output reg o_rdata_req_accepted_b,
	
	output reg [`N_UNITS-1:0] o_unit_id,
	output reg o_rdata_req,
	output reg [`MEM_ADDRBITS-1:0] o_raddr,
	input i_rdata_req_accepted
);

localparam S_PRIORITY_A = 1'b0, S_PRIORITY_B = 1'b1;
reg state, nextstate;

always @ (posedge i_clk300 or posedge i_reset) begin
	if (i_reset) begin
		state <= S_PRIORITY_A;
	end
	else begin
		state <= nextstate;
	end
end

always @* begin
	nextstate = state;
	
	o_rdata_req = 1'b0;
	o_raddr = 'bx;
	o_unit_id = 'bx;
	
	o_rdata_req_accepted_a = 1'b0;
	o_rdata_req_accepted_b = 1'b0;
	
	case (state)
		S_PRIORITY_A: begin
			if (i_rdata_req_a) begin
				o_unit_id = i_unit_id_a;
				o_rdata_req = 1'b1;
				o_raddr = i_raddr_a;
				
				if (i_rdata_req_accepted) begin
					o_rdata_req_accepted_a = 1'b1;
					nextstate = S_PRIORITY_B;
				end
			end
			else if (i_rdata_req_b) begin
				o_unit_id = i_unit_id_b;
				o_rdata_req = 1'b1;
				o_raddr = i_raddr_b;
				
				if (i_rdata_req_accepted) begin
					o_rdata_req_accepted_b = 1'b1;
				end
			end
		end
		
		S_PRIORITY_B: begin
			if (i_rdata_req_b) begin
				o_unit_id = i_unit_id_b;
				o_rdata_req = 1'b1;
				o_raddr = i_raddr_b;
				
				if (i_rdata_req_accepted) begin
					o_rdata_req_accepted_b = 1'b1;
					nextstate = S_PRIORITY_A;
				end
			end
			else if (i_rdata_req_a) begin
				o_unit_id = i_unit_id_a;
				o_rdata_req = 1'b1;
				o_raddr = i_raddr_a;
				
				if (i_rdata_req_accepted) begin
					o_rdata_req_accepted_a = 1'b1;
				end
			end
		end
		
		default: begin
		end
	endcase
end

endmodule




module ddr_arbiter
(
	input i_clk300,
	input i_reset,
	
	input [`N_UNITS-1:0] i_rdata_req,
	input [`N_UNITS*`MEM_ADDRBITS-1:0] i_raddr,
	output [`MEM_WIDTH-1:0] o_rdata,
	output [`N_UNITS-1:0] o_rdata_valid,
	output [`N_UNITS-1:0] o_rdata_req_accepted,
	
	output o_rdata_req,
	output [`MEM_ADDRBITS-1:0] o_raddr,
	input i_rdata_lastword,
	input [`MEM_WIDTH-1:0] i_rdata,
	input i_rdata_valid,
	input i_rdata_req_accepted
);

wire rdata_req[`N_UNITSBITS:0][`N_UNITS-1:0];
wire [`MEM_ADDRBITS-1:0] raddr[`N_UNITSBITS:0][`N_UNITS-1:0];
wire rdata_req_accepted[`N_UNITSBITS:0][`N_UNITS-1:0];
wire [`N_UNITS-1:0] unit_id[`N_UNITSBITS:0][`N_UNITS-1:0];

wire [`N_UNITS-1:0] fifo_q;
scfifo #
(
	.lpm_width(`N_UNITS),
	.lpm_numwords(`N_UNITS),
	.lpm_widthu(`N_UNITSBITS),
	.lpm_showahead("ON"),
	.add_ram_output_register("ON"),
	.underflow_checking("OFF"),
	.overflow_checking("OFF")
) read_trans_fifo
(
	.data(unit_id[`N_UNITSBITS][0]),
	.clock(i_clk300),
	.wrreq(o_rdata_req && i_rdata_req_accepted),
	.rdreq(i_rdata_valid && i_rdata_lastword),
	.aclr(i_reset),
	.q(fifo_q)
);

genvar level;
genvar i;
genvar n_outputs;

generate
	for (i = 0; i < `N_UNITS; i = i + 1) begin : in_out_connect
		assign rdata_req[0][i] = i_rdata_req[i];
		assign raddr[0][i] = i_raddr[ (i+1)*`MEM_ADDRBITS - 1 -: `MEM_ADDRBITS ];
		assign unit_id[0][i] = 1 << i;
		assign o_rdata_req_accepted[i] = rdata_req_accepted[0][i];
		
		assign o_rdata_valid[i] = i_rdata_valid & fifo_q[i];
	end
endgenerate

assign o_rdata_req = rdata_req[`N_UNITSBITS][0];
assign o_raddr = raddr[`N_UNITSBITS][0];
assign rdata_req_accepted[`N_UNITSBITS][0] = i_rdata_req_accepted;
assign o_rdata = i_rdata;

generate
	for (level = 0; level < `N_UNITSBITS; level = level + 1) begin : muxlevels	
		for (n_outputs = (`N_UNITS >> (level + 1)); n_outputs != -1; n_outputs = -1) begin : dummy
		for (i = 0; i < n_outputs; i = i + 1) begin : muxes
			ddr_arbiter_mux a_mux
			(
				.i_clk300(i_clk300),
				.i_reset(i_reset),
				
				.i_unit_id_a(unit_id[level][i*2]),
				.i_rdata_req_a(rdata_req[level][i*2]),
				.i_raddr_a(raddr[level][i*2]),
				.o_rdata_req_accepted_a(rdata_req_accepted[level][i*2]),
				
				.i_unit_id_b(unit_id[level][i*2+1]),
				.i_rdata_req_b(rdata_req[level][i*2+1]),
				.i_raddr_b(raddr[level][i*2+1]),
				.o_rdata_req_accepted_b(rdata_req_accepted[level][i*2+1]),
				
				.o_unit_id(unit_id[level+1][n_outputs + i]),
				.o_rdata_req(rdata_req[level+1][n_outputs + i]),
				.o_raddr(raddr[level+1][n_outputs + i]),
				.i_rdata_req_accepted(rdata_req_accepted[level+1][n_outputs + i])
			);
			
			pipe_interlock #
			(
				.WIDTH(`N_UNITS + `MEM_ADDRBITS)
			)
			reg_stage
			(
				.i_clk(i_clk300),
				.i_reset(i_reset),
				.i_in({unit_id[level+1][n_outputs + i], raddr[level+1][n_outputs + i]}),
				.i_have(rdata_req[level+1][n_outputs + i]),
				.o_want(rdata_req_accepted[level+1][n_outputs + i]),
				.o_out({unit_id[level+1][i], raddr[level+1][i]}),
				.o_have(rdata_req[level+1][i]),
				.i_want(rdata_req_accepted[level+1][i])
			);
		end
		end
	end
endgenerate

endmodule

	
	