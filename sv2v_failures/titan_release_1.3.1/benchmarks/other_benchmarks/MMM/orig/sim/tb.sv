`timescale 1ns/1ps 
`include "../hdl/defs.vh"

module tb();

localparam DEBUG = 0;
localparam USB_DELAY = 0;
localparam MIN_SET = 0;

// Clock gen
reg OSC1_50;
initial OSC1_50 = 1'b0;
always #10 OSC1_50 = ~OSC1_50;

reg OSC2_50;
initial #1 OSC2_50 = 1'b0;
always #10 OSC2_50 = ~OSC2_50;


//
// Reset generator
//

reg reset_n;
reg [3:0] reset_n_counter;

initial begin
	reset_n = 1'b0;
	reset_n_counter = 4'd0;
end

always @ (posedge OSC1_50) begin
	if (reset_n == 1'b0) begin
		reset_n_counter <= reset_n_counter + 4'd1;
	end
	
	if (reset_n_counter == 4'b1111) begin
		reset_n <= 1'b1;
	end
end

//
// PLL
//

wire clk150;
wire clk300;
the_pll the_pll_inst
(
	.inclk0(OSC1_50),
	.c0(clk150),
	.c1(clk300),
	.areset(~reset_n)
);

//
// DDR memory model
//

wire [13:0] DDR2_A;
wire [2:0] DDR2_BA;
wire [1:0] DDR2_CS_n;
wire DDR2_WE_n;
wire DDR2_RAS_n;
wire DDR2_CAS_n;
wire [1:0] DDR2_ODT;
wire [1:0] DDR2_CLK_p;
wire [1:0] DDR2_CLK_n;
wire [7:0] DDR2_DM;
wire [7:0] DDR2_DQS_p;
wire [7:0] DDR2_DQS_n;
wire [1:0] DDR2_CKE;
wire [63:0] DDR2_DQ;
    
ddr_full_mem_model mem
(
  .mem_dq      (DDR2_DQ),
  .mem_dqs     (DDR2_DQS_p),
  .mem_dqs_n   (DDR2_DQS_n),
  .mem_addr    (DDR2_A),
  .mem_ba      (DDR2_BA),
  .mem_clk     (DDR2_CLK_p[0]),
  .mem_clk_n   (DDR2_CLK_n[0]),
  .mem_cke     (DDR2_CKE[0]),
  .mem_cs_n    (DDR2_CS_n[0]),
  .mem_ras_n   (DDR2_RAS_n),
  .mem_cas_n   (DDR2_CAS_n),
  .mem_we_n    (DDR2_WE_n),
  .mem_dm      (DDR2_DM),
  .mem_odt     (DDR2_ODT[0])
);
    
    

//
// DDR Controller
//

wire clk_ddr;

wire [25:0] ddr_addr;
wire [15:0] ddr_be;
wire ddr_burstbegin;
wire [127:0] ddr_rdata;
wire [127:0] ddr_wdata;
wire ddr_rdata_valid;
wire ddr_read_req;
wire [3:0] ddr_size;
wire ddr_ready;
wire ddr_write_req;
wire ddr_init_done;

ddr ddr_inst
(
	.pll_ref_clk (OSC1_50),
	.phy_clk (clk_ddr),
	.global_reset_n (reset_n),
	.soft_reset_n (1'b1),
	
	.local_address (ddr_addr),
	.local_be (ddr_be),
	.local_burstbegin (ddr_burstbegin),
	.local_rdata (ddr_rdata),
	.local_rdata_valid (ddr_rdata_valid),
	.local_read_req (ddr_read_req),
	.local_ready (ddr_ready),
	.local_size (ddr_size),
	.local_wdata (ddr_wdata),
	.local_write_req (ddr_write_req),
	.local_init_done(ddr_init_done),
	
	.mem_addr (DDR2_A),
	.mem_ba (DDR2_BA),
	.mem_cas_n (DDR2_CAS_n),
	.mem_cke (DDR2_CKE),
	.mem_clk (DDR2_CLK_p),
	.mem_clk_n (DDR2_CLK_n),
	.mem_cs_n (DDR2_CS_n),
	.mem_dm (DDR2_DM),
	.mem_dq (DDR2_DQ),
	.mem_dqs (DDR2_DQS_p),
	.mem_dqsn (DDR2_DQS_n),
	.mem_odt (DDR2_ODT),
	.mem_ras_n (DDR2_RAS_n),
	.mem_we_n (DDR2_WE_n),
	
	.oct_ctl_rs_value (14'b0),
	.oct_ctl_rt_value (14'b0)
);

// DUT

reg [31:0] i_indata;
reg i_indata_have;
wire o_indata_want;
	
wire [31:0] o_outdata;
wire o_outdata_have;
reg i_outdata_want;

reg [31:0] i_dbg_indata = 32'd0;
reg i_dbg_indata_have = 1'b0;
wire o_dbg_indata_want;
wire [63:0] o_dbg_outdata;

mmm_hard dut
(
  .i_clk300(clk300),
  .i_clk150(clk150),
  .i_clk_ddr(clk_ddr),
  .i_reset(~reset_n),
  
 	.o_ddr_addr(ddr_addr),
	.i_ddr_rdata(ddr_rdata),
	.o_ddr_wdata(ddr_wdata),
	.i_ddr_ready(ddr_ready),
	.o_ddr_burstbegin(ddr_burstbegin),
	.o_ddr_size(ddr_size),
	.o_ddr_read_req(ddr_read_req),
	.o_ddr_write_req(ddr_write_req),
	.i_ddr_rdata_valid(ddr_rdata_valid),
	.o_ddr_be(ddr_be),
	.i_ddr_init_done(ddr_init_done),
	
  .*
);



integer fp;
integer d;
integer problem_no;
integer set_no;

typedef struct
{
  shortint  data[];
  bit       matched;
} t_clique;

// Tasks

task read_input;
  integer i;
  integer n_words;
  reg [31:0] init_maxsize;
  reg [31:0] n_vertices;
  
  d = $fscanf(fp, "%d\n", init_maxsize);
  if (DEBUG) $display("Init maxsize %d", init_maxsize);
 
  i_indata = init_maxsize;
  i_indata_have = 1'b1;
  wait(o_indata_want);
  @(posedge clk150);
  i_indata_have = 1'b0;
  #(USB_DELAY);
  
  n_vertices = 32'h1;
  while (n_vertices[31] == 1'b0) begin
    if (DEBUG) $display("\nProblem %d", problem_no);
      
    d = $fscanf(fp, "%d\n", n_vertices);
    if (DEBUG) $display("N Vertices %d", n_vertices);
      
    #1;
    wait(o_indata_want);
    i_indata= n_vertices;
    i_indata_have = 1'b1;
    @(posedge clk150);
    i_indata_have = 1'b0;
    #(USB_DELAY);

    n_words = (n_vertices[`MAX_VERTSBITS-1:0] * n_vertices[`MAX_VERTSBITS-1:0] + 31) / 32;

    for (i = 0; i < n_words; i++) begin
      #1;
      wait(o_indata_want);
      i_indata_have = 1'b1;
      d = $fscanf(fp, "%d", i_indata);
      if (DEBUG && i == 0) $display("Matrix data 0: %d", i_indata);
      if (DEBUG && i == n_words-1) $display("Matrix data %d: %d", i, i_indata);
      @(posedge clk150);
      i_indata_have = 1'b0;
      #(USB_DELAY); 
    end
    
    problem_no++;
  end
  
  if (DEBUG) $display("Done read problem");
  
  @(posedge clk150);
  i_indata_have = 1'b0;
endtask

task print_clique(t_clique c);
  foreach (c.data[i]) begin
    if (i == 0) $display("Problem: %d", c.data[i]);
    else $display("Vertex: %d", c.data[i]);
  end    
endtask;

task verify_output;
  integer read_maxsize;
  integer read_ncliques;
  t_clique read_cliques[];
  integer read_ptr;
  integer true_maxsize;
  integer true_ncliques;
  t_clique true_cliques[];
  bit matched;
  bit fail;

  if (DEBUG) $display ("Verifying...");
  
  i_outdata_want = 1'b1;
  wait(o_outdata_have);
  @(posedge clk150);
  read_ncliques = o_outdata[15:0];
  read_maxsize = o_outdata[31:16];
  @(posedge clk150);
  
  if (DEBUG) $display("Read maxsize %d\nRead n_cliques %d", read_maxsize, read_ncliques);
  
  read_ptr = 0;
  read_cliques = new[read_ncliques];
  foreach (read_cliques[i]) begin
    read_cliques[i].data = new[read_maxsize + 1];
    read_cliques[i].matched = 1'b0;
    
    foreach (read_cliques[i].data[j]) begin
      if (read_ptr % 2 == 0) begin
        @(negedge clk150);
        wait(o_outdata_have);
        read_cliques[i].data[j] = o_outdata[15:0];
      end
      else begin
        read_cliques[i].data[j] = o_outdata[31:16];
      end
      if (DEBUG) $display("%d: %d", i, read_cliques[i].data[j]);
      read_ptr++;
    end  
  end
  
  @(negedge clk150);
  i_outdata_want = 1'b0;

  d = $fscanf(fp, "%d\n%d\n", true_ncliques, true_maxsize);
  if (DEBUG) $display("True maxsize %d\nTrue n_cliques %d", true_maxsize, true_ncliques);
  
  true_cliques = new[true_ncliques];
  foreach (true_cliques[i]) begin
    true_cliques[i].matched = 1'b0;
    true_cliques[i].data = new[true_maxsize + 1];
    
    foreach (true_cliques[i].data[j]) begin
      d = $fscanf(fp, "%d\n", true_cliques[i].data[j]);
      if (DEBUG) $display("%d: %d", i, true_cliques[i].data[j]);
    end
  end
  
  fail = 1'b0;
      
  if (true_maxsize != read_maxsize) begin
    $display("Set %d: Maxsize expected %d got %d", set_no, true_maxsize, read_maxsize);
    fail = 1'b1;
  end
    
  if (true_ncliques != read_ncliques) begin
    $display("Set %d: NCliques expected %d got %d", set_no, true_ncliques, read_ncliques);    
    fail = 1'b1;
  end
  
  foreach (true_cliques[i]) begin
    if (true_cliques[i].matched)
      continue;
      
    foreach (read_cliques[j]) begin
      matched = 1'b1;  

      if (read_cliques[j].matched)
        continue;      

      foreach (true_cliques[i].data[k]) begin
        if (true_cliques[i].data[k] != read_cliques[j].data[k]) begin
          matched = 1'b0;
          break;
        end
      end
      
      if (matched) begin
        true_cliques[i].matched = 1'b1;
        read_cliques[j].matched = 1'b1;
        break;
      end
    end
  end
  
  foreach (true_cliques[i]) begin
    if (!true_cliques[i].matched) begin
      $display("Clique %d expected but not found", i);
      print_clique(true_cliques[i]);
      fail = 1'b1;
    end
  end
  
  foreach (read_cliques[i]) begin
    if (!read_cliques[i].matched) begin
      $display("Clique %d found but not expected", i);
      print_clique(read_cliques[i]);
      fail = 1'b1;
    end
  end
  
  if (fail) $finish;
endtask


task skip_set;
  integer i;
  integer n_words;
  reg [32:0] init_maxsize;
  reg [32:0] n_vertices;
  integer true_maxsize;
  integer true_ncliques;
  integer read_ptr;
  integer true_v;

  d = $fscanf(fp, "%d\n", init_maxsize);
  n_vertices = 32'h1;

  while (n_vertices[31] == 1'b0) begin
    d = $fscanf(fp, "%d\n", n_vertices);
      
    n_words = (n_vertices[`MAX_VERTSBITS-1:0] * n_vertices[`MAX_VERTSBITS-1:0] + 31) / 32;
    for (i = 0; i < n_words; i++) begin 
      d = $fscanf(fp, "%d", i_indata);
    end
  end

  d = $fscanf(fp, "%d\n%d\n", true_ncliques, true_maxsize);
  
  read_ptr = 0;
  while (read_ptr < (true_ncliques * (true_maxsize+1))) begin
    d = $fscanf(fp, "%d\n", true_v);
    read_ptr++;
  end
endtask


// Main
initial begin
  problem_no = 0;
  set_no = 0;
  i_indata_have = 1'b0;
  i_outdata_want = 1'b0;
  i_dbg_indata_have = 1'b0;
  
  fp = $fopen("tb_data.txt", "r");
  if (fp == 0) begin
    $display ("Unable to open file\n");
    $stop;
  end
  
  wait(reset_n == 1'b1);
  @(posedge clk150);
  
  while (!$feof(fp)) begin
    $display("Set %d", set_no);
  
    if (set_no < MIN_SET) begin
      skip_set();
    end
    else begin
      read_input();
      verify_output();
    end
  
    set_no++;
    problem_no = 0;
  end
  $fclose(fp);
  $finish;
end



endmodule
