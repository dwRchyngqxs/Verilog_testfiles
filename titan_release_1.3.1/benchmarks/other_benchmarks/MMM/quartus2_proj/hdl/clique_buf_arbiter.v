`include "defs.vh"

module clique_buf_arbiter_mux
(
	input i_clk300,
	input i_reset,
	
	input i_nocliques,
	
	input i_clq_valid_a,
	input [`MAX_CLIQUESIZEBITS-1:0] i_clq_size_a,
	input [15:0] i_clq_vertex_a,
	input i_clq_strobe_a,
	output reg o_clq_accept_a,
	
	input i_clq_valid_b,
	input [`MAX_CLIQUESIZEBITS-1:0] i_clq_size_b,
	input [15:0] i_clq_vertex_b,
	input i_clq_strobe_b,
	output reg o_clq_accept_b,
	
	output reg o_clq_valid,
	output reg [`MAX_CLIQUESIZEBITS-1:0] o_clq_size,
	output reg [15:0] o_clq_vertex,
	output reg o_clq_strobe,
	input i_clq_accept
);

localparam [1:0] S_PRIORITY_A = 2'd0, S_PRIORITY_B = 2'd1, S_FINISH_A = 2'd2, S_FINISH_B = 2'd3;
reg [1:0] state, nextstate;

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
	
	o_clq_valid = 1'b0;
	o_clq_size = 'bx;
	o_clq_vertex = 16'bx;
	o_clq_strobe = 1'b0;
	
	o_clq_accept_a = 1'b0;
	o_clq_accept_b = 1'b0;
	
	case (state)
		S_PRIORITY_A: begin
			if (i_clq_valid_a) begin
				o_clq_valid = 1'b1;
				o_clq_size = i_clq_size_a;
				o_clq_vertex = i_clq_vertex_a;
				o_clq_strobe = i_clq_strobe_a;
				
				if (i_clq_accept) begin
					o_clq_accept_a = 1'b1;
					if (!i_nocliques) begin
						nextstate = S_FINISH_A;
					end
				end
			end
			else if (i_clq_valid_b) begin
				o_clq_valid = 1'b1;
				o_clq_size = i_clq_size_b;
				o_clq_vertex = i_clq_vertex_b;
				o_clq_strobe = i_clq_strobe_b;
				
				if (i_clq_accept) begin
					o_clq_accept_b = 1'b1;
					if (!i_nocliques) begin
						nextstate = S_FINISH_B;
					end
				end
			end
		end
		
		S_PRIORITY_B: begin
			if (i_clq_valid_b) begin
				o_clq_valid = 1'b1;
				o_clq_size = i_clq_size_b;
				o_clq_vertex = i_clq_vertex_b;
				o_clq_strobe = i_clq_strobe_b;
				
				if (i_clq_accept) begin
					o_clq_accept_b = 1'b1;
					if (!i_nocliques) begin
						nextstate = S_FINISH_B;
					end
				end
			end
			else if (i_clq_valid_a) begin
				o_clq_valid = 1'b1;
				o_clq_size = i_clq_size_a;
				o_clq_vertex = i_clq_vertex_a;
				o_clq_strobe = i_clq_strobe_a;
				
				if (i_clq_accept) begin
					o_clq_accept_a = 1'b1;
					if (!i_nocliques) begin
						nextstate = S_FINISH_A;
					end
				end
			end
		end
		
		S_FINISH_A: begin
			o_clq_valid = i_clq_valid_a;
			o_clq_size = i_clq_size_a;
			o_clq_vertex = i_clq_vertex_a;
			o_clq_strobe = i_clq_strobe_a;
			o_clq_accept_a = i_clq_accept;
			if (i_clq_valid_a && i_clq_strobe_a && i_clq_accept) begin
				nextstate = S_PRIORITY_B;
			end
		end
		
		S_FINISH_B: begin
			o_clq_valid = i_clq_valid_b;
			o_clq_size = i_clq_size_b;
			o_clq_vertex = i_clq_vertex_b;
			o_clq_strobe = i_clq_strobe_b;
			o_clq_accept_b = i_clq_accept;
			if (i_clq_valid_b && i_clq_strobe_b && i_clq_accept) begin
				nextstate = S_PRIORITY_A;
			end
		end
		
		default: begin
		end
	endcase
end

endmodule




module clique_buf_arbiter
(
	input i_clk300,
	input i_reset,
	
	input i_nocliques,
	
	input [`N_UNITS-1:0] i_clq_valid,
	input [`N_UNITS*`MAX_CLIQUESIZEBITS-1:0] i_clq_size,
	input [`N_UNITS*16-1:0] i_clq_vertex,
	input [`N_UNITS-1:0] i_clq_strobe,
	output [`N_UNITS-1:0] o_clq_accept,
	
	output o_clq_valid,
	output [`MAX_CLIQUESIZEBITS-1:0] o_clq_size,
	output [15:0] o_clq_vertex,
	output o_clq_strobe
);

wire valid[`N_UNITSBITS:0][`N_UNITS-1:0];
wire [`MAX_CLIQUESIZEBITS-1:0] size[`N_UNITSBITS:0][`N_UNITS-1:0];
wire [15:0] vertex[`N_UNITSBITS:0][`N_UNITS-1:0];
wire strobe[`N_UNITSBITS:0][`N_UNITS-1:0];
wire accept[`N_UNITSBITS:0][`N_UNITS-1:0];

genvar level;
genvar i;
genvar n_outputs;

generate
	for (i = 0; i < `N_UNITS; i = i + 1) begin : in_out_connect
		assign valid[0][i] = i_clq_valid[i];
		assign size[0][i] = i_clq_size[ (i+1)*`MAX_CLIQUESIZEBITS - 1 -: `MAX_CLIQUESIZEBITS ];
		assign vertex[0][i] = i_clq_vertex[ (i+1)*16 - 1 -: 16 ];
		assign strobe[0][i] = i_clq_strobe[i];
		assign o_clq_accept[i] = accept[0][i];
	end
endgenerate

assign o_clq_valid = valid[`N_UNITSBITS][0];
assign o_clq_size = size[`N_UNITSBITS][0];
assign o_clq_vertex = vertex[`N_UNITSBITS][0];
assign o_clq_strobe = strobe[`N_UNITSBITS][0];
assign accept[`N_UNITSBITS][0] = 1'b1;

generate
	for (level = 0; level < `N_UNITSBITS; level = level + 1) begin : muxlevels	
		for (n_outputs = (`N_UNITS >> (level + 1)); n_outputs != -1; n_outputs = -1) begin : dummy
		for (i = 0; i < n_outputs; i = i + 1) begin : muxes
			clique_buf_arbiter_mux a_mux
			(
				.i_clk300(i_clk300),
				.i_reset(i_reset),
				.i_nocliques(i_nocliques),
				
				.i_clq_valid_a(valid[level][i*2]),
				.i_clq_size_a(size[level][i*2]),
				.i_clq_vertex_a(vertex[level][i*2]),
				.i_clq_strobe_a(strobe[level][i*2]),
				.o_clq_accept_a(accept[level][i*2]),
				
				.i_clq_valid_b(valid[level][i*2+1]),
				.i_clq_size_b(size[level][i*2+1]),
				.i_clq_vertex_b(vertex[level][i*2+1]),
				.i_clq_strobe_b(strobe[level][i*2+1]),
				.o_clq_accept_b(accept[level][i*2+1]),
				
				.o_clq_valid(valid[level+1][n_outputs + i]),
				.o_clq_size(size[level+1][n_outputs + i]),
				.o_clq_vertex(vertex[level+1][n_outputs + i]),
				.o_clq_strobe(strobe[level+1][n_outputs + i]),
				.i_clq_accept(accept[level+1][n_outputs + i])
			);
			
			pipe_interlock #
			(
				.WIDTH(`MAX_CLIQUESIZEBITS + 16 + 1)
			)
			reg_stage
			(
				.i_clk(i_clk300),
				.i_reset(i_reset),
				.i_in({size[level+1][n_outputs + i], vertex[level+1][n_outputs + i],
					strobe[level+1][n_outputs + i]}),
				.i_have(valid[level+1][n_outputs + i]),
				.o_want(accept[level+1][n_outputs + i]),
				.o_out({size[level+1][i], vertex[level+1][i],
					strobe[level+1][i]}),
				.o_have(valid[level+1][i]),
				.i_want(accept[level+1][i])
			);
		end
		end
	end
endgenerate

endmodule

	
	