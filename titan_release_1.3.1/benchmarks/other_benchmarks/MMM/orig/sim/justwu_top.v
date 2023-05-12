`include "../hdl/defs.vh"

module justwu_top
(
	input i_clk,
	input i_reset,
	
	input i_go,
	output o_done,
	input [`MATRIX_WIDTHV-1:0] i_n_vertices,
	input [`MAX_CLIQUESIZEBITS-1:0] i_init_maxsize,
	
	input [14:0] i_matrix_waddr,
	input [31:0] i_matrix_data,
	input i_matrix_we,
	
	output [`MAX_CLIQUESIZEBITS-1:0] o_clq_size,
	output [`MATRIX_WIDTHV-1:0] o_clq_v,
	output o_clq_valid
);

reg [`MAX_CLIQUESIZEBITS-1:0] global_maxsize;

localparam [0:0] S_IDLE=1'd0, S_WORKING=1'd1;
reg [0:0] state;

always @ (posedge i_clk or posedge i_reset) begin
	if (i_reset) begin
		state <= S_IDLE;
		global_maxsize <= 'd0;
	end
	else begin
		case (state)
			S_IDLE: begin
				global_maxsize <= i_init_maxsize;							
				if (i_go) begin
					state <= S_WORKING;
				end
			end
			
			S_WORKING: begin
				if (o_clq_valid && o_clq_size > global_maxsize) begin
					global_maxsize <= o_clq_size;
				end
				if (o_done) begin
					state <= S_IDLE;
				end
			end
		endcase
	end
end

wire matrix_req;
wire matrix_enable;
wire [`MATRIX_WIDTHV-1:0] matrix_i;
wire [`MATRIX_WIDTHV-1:0] matrix_j;
wire [`MATRIX_WIDTHV-1:0] matrix_nverts;
wire matrix_ready;
wire matrix_valid;
wire matrix_isconn;
wire matrix_squash;

wu_cache cache
(
	.i_clk(i_clk),
	.i_reset(i_reset),
	.i_enable(matrix_enable),
	
	.i_matrix_waddr(i_matrix_waddr),
	.i_matrix_data(i_matrix_data),
	.i_matrix_we(i_matrix_we),
	
	.i_matrix_req(matrix_req),
	.i_matrix_i(matrix_i),
	.i_matrix_j(matrix_j),
	.i_matrix_nverts(matrix_nverts),
	.o_matrix_ready(matrix_ready),
	.o_matrix_valid(matrix_valid),
	.o_matrix_isconn(matrix_isconn),
	.i_matrix_squash(matrix_squash)
);

work_unit wu
(
	.i_clk(i_clk),
	.i_reset(i_reset),
	
	.i_go(i_go),
	.o_done(o_done),
	.i_nverts(i_n_vertices),
	.i_global_maxsize(global_maxsize),
	
	.o_clq_size(o_clq_size),
	.o_clq_v(o_clq_v),
	.o_clq_valid(o_clq_valid),
	
	.o_matrix_req(matrix_req),
	.o_matrix_enable(matrix_enable),
	.o_matrix_i(matrix_i),
	.o_matrix_j(matrix_j),
	.o_matrix_nverts(matrix_nverts),
	.i_matrix_ready(matrix_ready),
	.i_matrix_valid(matrix_valid),
	.i_matrix_isconn(matrix_isconn),
	.o_matrix_squash(matrix_squash)
);

endmodule
