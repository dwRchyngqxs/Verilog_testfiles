`timescale 1ns/1ps 
`uselib lib=altera_mf
`uselib lib=lpm

`include "../hdl/defs.vh"

module tb();

localparam DEBUG=0;

reg i_clk300;
reg i_clk50;
reg i_reset;
reg [31:0] i_indata;
reg i_indata_ready;
wire o_indata_want;
wire [31:0] o_outdata;
wire o_outdata_ready;
reg i_outdata_want;

mmm_hard dut(.*);

integer fp;
integer d;
integer problem_no;

// Clock generator
initial i_clk300 = 0;
always begin
	#1.5 i_clk300 = ~i_clk300;
end

initial i_clk50 = 0;
always begin
  #3 i_clk50 = ~i_clk50;
end

// Tasks
task reset;
  i_indata_ready = 1'b0;
  i_outdata_want = 1'b0;
  
  @(negedge i_clk50);
	i_reset = 1;
	@(negedge i_clk50);
	i_reset = 0;
endtask

task read_input;
  integer i;
  integer j;
  integer n_cols;
  
  reg [4:0] init_maxsize;
  reg [11:0] n_vertices;
  
  d = $fscanf(fp, "%d\n%d\n", init_maxsize, n_vertices);
  if (DEBUG) $display("Init maxsize %d\nVertices %d", init_maxsize, n_vertices);
 
  @(negedge i_clk50);
  i_indata[15:0] = init_maxsize;
  i_indata[31:16] = n_vertices;
  i_indata_ready = 1'b1;
  wait(o_indata_want);
  @(negedge i_clk50);
  i_indata_ready = 1'b0;
  n_cols = (n_vertices + 31) / 32;

  for (i = 0; i < n_vertices; i++) begin
    for (j = 0; j < n_cols; j++) begin
      @(negedge i_clk50);
      i_indata_ready = 1'b1;
      d = $fscanf(fp, "%d", i_indata);
      if (DEBUG) $display("Entry %d", i_indata);
      wait(o_indata_want);
    end
  end
  
  @(negedge i_clk50);
  i_indata_ready = 1'b0;
endtask


task verify_output;
  integer maxsize;
  integer n_cliques;
  integer true_maxsize;
  integer true_ncliques;

  reg [11:0] clique_storage[10000:0];
  integer read_ptr;
  integer true_v;
  
  i_outdata_want = 1'b1;
  wait(o_outdata_ready);
  @(posedge i_clk50);
  n_cliques = o_outdata[15:0];
  maxsize = o_outdata[31:16];
  @(posedge i_clk50);
  
  for (read_ptr = 0; read_ptr < n_cliques * maxsize; read_ptr += 2) begin
    @(negedge i_clk50);
    wait(o_outdata_ready);
    clique_storage[read_ptr] = o_outdata[15:0];
    clique_storage[read_ptr+1] = o_outdata[31:16];
    if (DEBUG) $display("%d: %d %d", read_ptr, o_outdata[15:0], o_outdata[31:16]);
  end

  
  d = $fscanf(fp, "%d\n%d\n", true_maxsize, true_ncliques);
  if (DEBUG) $display("Problem %d", problem_no);
  if (DEBUG) $display("True maxsize %d\nN_Cliques %d", true_maxsize, true_ncliques);
  
  if (true_maxsize != maxsize) 
    $display("Maxsize expected %d got %d", true_maxsize, maxsize);
  if (true_ncliques != n_cliques)
    $display("NCliques expected %d got %d", true_ncliques, n_cliques);
  
  read_ptr = 0;
  
  if (true_maxsize != maxsize || true_ncliques != n_cliques) begin
    $display("Expected/reported vertices:");
    while (read_ptr != maxsize*n_cliques) begin
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
  
  while (read_ptr < n_cliques * maxsize) begin
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
    verify_output();
    problem_no++;
  end
  $fclose(fp);
  $finish;
end



endmodule
