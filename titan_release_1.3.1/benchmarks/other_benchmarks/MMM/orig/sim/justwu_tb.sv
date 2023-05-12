`timescale 1ns/1ps 
`uselib lib=altera_mf
`uselib lib=lpm

`include "../hdl/defs.vh"

module justwu_tb();

localparam DEBUG=0;

reg i_clk;
reg i_reset;
reg i_go;
wire o_done;
reg [`MATRIX_WIDTHV-1:0] i_n_vertices;
reg [`MAX_CLIQUESIZEBITS-1:0] i_init_maxsize;
reg [14:0] i_matrix_waddr;
reg [31:0] i_matrix_data;
reg i_matrix_we;
wire [`MAX_CLIQUESIZEBITS-1:0] o_clq_size;
wire [`MATRIX_WIDTHV-1:0] o_clq_v;
wire o_clq_valid;

justwu_top dut(.*);

integer fp;
integer d;
reg [9:0] clique_storage[128:0];
reg [31:0] n_cliques;
reg [31:0] clique_ptr;
reg [4:0] maxsize;
integer problem_no;

// Clock generator
initial i_clk = 0;
always begin
	#1.5 i_clk = ~i_clk;
end

// Clique generator (ho ho!)
enum {S_IDLE, S_ACTIVE} state;

initial begin
  state = S_IDLE;
end

always @ (posedge i_clk) begin
  case (state)
  S_IDLE: begin
    if (o_clq_valid) begin      
      if (o_clq_size > maxsize) begin
        maxsize <= o_clq_size;
        clique_ptr <= 1;
        n_cliques <= 1;
        clique_storage[0] <= o_clq_v;
      end
      else begin
        clique_ptr <= clique_ptr + 1;
        n_cliques <= n_cliques + 1;
        clique_storage[clique_ptr] <= o_clq_v;
      end
      
      state <= S_ACTIVE;
    end
  end
  
  S_ACTIVE: begin
    if (o_clq_valid) begin
      clique_storage[clique_ptr] <= o_clq_v;
      clique_ptr <= clique_ptr + 1;
    end
    else begin
      state <= S_IDLE;
    end
  end
  endcase
end


// Tasks
task reset;
  i_go = 0;
  i_matrix_waddr = 'bx;
  i_matrix_data = 'bx;
  i_matrix_we = 0;
  i_n_vertices = 'bx;
  i_init_maxsize = 'bx;
  
  @(negedge i_clk);
	i_reset = 1;
	@(negedge i_clk);
	i_reset = 0;
endtask

task read_input;
  integer i;
  integer j;
  integer n_cols;
  
  d = $fscanf(fp, "%d\n%d\n", i_init_maxsize, i_n_vertices);
  if (DEBUG) $display("Init maxsize %d\nVertices %d", i_init_maxsize, i_n_vertices);
  n_cols = (i_n_vertices + 31) / 32;

  for (i = 0; i < i_n_vertices; i++) begin
    for (j = 0; j < n_cols; j++) begin
      @(negedge i_clk);
      i_matrix_we = 1;      
      i_matrix_waddr = i*(1024/32) + j;
      d = $fscanf(fp, "%d", i_matrix_data);
      if (DEBUG) $display("Entry %d", i_matrix_data);
    end
  end
  
  @(negedge i_clk);
  i_matrix_we = 0;    
endtask

task run_problem;
  n_cliques = 'b0;
  clique_ptr = 'b0;
  maxsize = i_init_maxsize;
  
  @(negedge i_clk);
  i_go = 1'b1;
  wait (o_done == 1'b1);
  @(negedge i_clk);
  i_go = 1'b0;
  @(posedge i_clk);
  @(posedge i_clk);
  @(posedge i_clk);
  @(posedge i_clk);
  wait(o_clq_valid == 1'b0);
  @(posedge i_clk);
  @(posedge i_clk);
endtask

task verify_output;
  integer true_maxsize;
  integer true_ncliques;
  integer read_ptr;
  integer true_v;
    
  d = $fscanf(fp, "%d\n%d\n", true_maxsize, true_ncliques);
  if (DEBUG) $display("True maxsize %d\nN_Cliques %d", true_maxsize, true_ncliques);
  if (true_maxsize != maxsize) 
    $display("Maxsize expected %d got %d", true_maxsize, maxsize);
  if (true_ncliques != n_cliques)
    $display("NCliques expected %d got %d", true_ncliques, n_cliques);
  
  read_ptr = 0; 
  
  if (true_maxsize != maxsize || true_ncliques != n_cliques) begin
	$display("Expected/reported vertices:");
	while (read_ptr != clique_ptr) begin
		d = $fscanf(fp, "%d\n", true_v);
		$display("%d\t%d", true_v, clique_storage[read_ptr]);
		read_ptr++;
	end
	
	while (read_ptr != true_maxsize*true_ncliques) begin
		d = $fscanf(fp, "%d\n", true_v);
		$display("%d", true_v);
		read_ptr++;
	end
	
	$finish;
  end
  
  while (read_ptr != clique_ptr) begin
    d = $fscanf(fp, "%d\n", true_v);
    if (DEBUG) $display("Vertex %d", true_v);
    if (true_v != clique_storage[read_ptr]) begin
      $display("Vertex %d expected %d got %d", read_ptr, true_v, clique_storage[read_ptr]);
      $finish;
    end
    
    read_ptr++;
  end
  
  
endtask

// Main
initial begin
  problem_no = 0;
  
  reset();
  fp = $fopen("tb_data.txt", "r");
  if (fp == 0) begin
    $display ("Unable to open file\n");
    $stop;
  end
  
  while (!$feof(fp)) begin
    read_input();
    run_problem();
    verify_output();
    problem_no++;
  end
  $fclose(fp);
  $finish;
end



endmodule
