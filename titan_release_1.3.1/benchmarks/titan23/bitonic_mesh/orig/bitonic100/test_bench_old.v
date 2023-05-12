`define NO_PLI 1
`define TEST_BENCH 1

`timescale 1ns / 1ns
`define POWER_POSTSYNTHESIS

`ifdef POWER_POSTSYNTHESIS 
   //Deepak Error system is already defined here
   //`include "system.vo"
`else   
   // Module system cannot be declared more than once
   //`include "system.v"
  //`include "C:/altera/61/modelsim_ae/altera/verilog/src/altera_mf.v"
  //`include "C:/altera/61/modelsim_ae/altera/verilog/src/220model.v"
`endif


module test_bench ;



/*Deepak Since these parameters are not supported by Modelsim, commenting them
Also they are not used at all*/

parameter I_DATAWIDTH=32;
parameter I_ADDRESSWIDTH=16;
parameter I_SIZE=65536;
parameter D_DATAWIDTH=32;
parameter D_BYTEENAWIDTH=4;             // usually should be D_DATAWIDTH/8
parameter D_ADDRESSWIDTH=16;
parameter D_SIZE=65536;


    reg              clk;
    reg              resetn;
    wire [31:0]      d_writedataout;

`ifdef POWER_POSTSYNTHESIS 
    reg [13:0] boot_iaddr;
    wire [31:0] boot_idata;
    wire boot_iwe;
    reg [13:0] boot_daddr;
    wire [31:0] boot_ddata; 
    wire boot_dwe;   
    reg [31:0] imem [16383:0];
    reg [31:0] dmem [16383:0];
`endif

    integer trace;
    integer store_trace;
    integer exception_trace;

    system p
      (
      .clk     (clk),
      .resetn (resetn),

      `ifdef POWER_POSTSYNTHESIS 
      .boot_iaddr(boot_iaddr),
      .boot_idata(boot_idata),
      .boot_iwe(boot_iwe),
      .boot_daddr(boot_daddr),
      .boot_ddata(boot_ddata),
      .boot_dwe(boot_dwe),
      `endif

      .reg_file_b_readdataout (d_writedataout));

`ifdef POWER_POSTSYNTHESIS 
`else
      // Requires data_mem.d_write signal to be present
    wire [32-1:0] pc;
    wire [32-1:0] instr;
    wire reg_file_we;
    wire [5-1:0] reg_file_dst;
    wire [32-1:0] reg_file_data;
    wire data_mem_we;
    wire data_mem_write;
    wire [32-1:0] data_mem_addr;
    wire [32-1:0] data_mem_data;

    /*Deepak: All these statements are invalid since we can't signals within 
      another module from this module*/

    //assign pc=p.ifetch_next_pc ;
    assign pc=ifetch_next_pc ;
    
    //assign instr= p.ifetch_instr ;
	assign instr= ifetch_instr ;
       
    //assign reg_file_we= p.ctrl_reg_file_c_we ;
    assign reg_file_we= ctrl_reg_file_c_we ;
    
    //assign reg_file_dst= p.pipereg5_q ;
    assign reg_file_dst= pipereg5_q ;
    
    //assign reg_file_data= p.mux7to1_reg_file_c_writedatain_out ;
    assign reg_file_data= mux7to1_reg_file_c_writedatain_out ;
    
    //assign data_mem_we= p.ctrl_data_mem_en ;
    assign data_mem_we= ctrl_data_mem_en ;
    
    //assign data_mem_write= p.data_mem.d_write ;
    assign data_mem_write= dwrite ; //Changed from data_mem.d_write to data_mem_d_write
    
    //assign data_mem_addr= p.addersub_result ;
    assign data_mem_addr= addersub_result ;
    
    //assign data_mem_data= p.reg_file_b_readdataout ;
    assign data_mem_data= d_writedataout ;
`endif


    /**************** Reset and stimulate clock ********************/

    initial
      clk = 1'b1;
    always
      #10000 clk <= ~clk;
    
    initial 
      begin
        resetn <= 0;
        `ifdef POWER_POSTSYNTHESIS 
          #327690000 resetn <= 1;
        `else
          #50000 resetn <= 1;
        `endif
      end

    `ifdef POWER_POSTSYNTHESIS 
      initial           // NEW
      begin
        $readmemh("C:/streamit/spree2/pipe3_serialshift/instr.rif",imem);
        $readmemh("C:/streamit/spree2/pipe3_serialshift/data.rif",dmem);
        boot_iaddr=0;
        boot_daddr=0;
      end
    `endif

`ifdef POWER_POSTSYNTHESIS 
`else
    /**************** Trace of Write Backs ********************/
    initial
    begin
        ;
        //Deepak : fopen and fwrite are not supported here!
        //trace=$fopen("/tmp/modelsim_trace.txt","w");
        //store_trace=$fopen("/tmp/modelsim_store_trace.txt","w");
    end

    always@(posedge clk)
    begin
        if (reg_file_we && (|reg_file_dst) && resetn)
        ;
		//Deepak : fopen and fwrite are not supported here!
             /*$fwrite(trace,"%d | PC=%h | IR=%h | %h: %h\n",
                    $time,
                    pc,
                    instr,
                    reg_file_dst,
                    reg_file_data);
             */
    end

    /**************** Trace of Stores to Memory ********************/

    always@(posedge clk)
      begin
    if (data_mem_we && data_mem_write && resetn)
      ;
      //Deepak fopen and fwrite not supported here! 
      /*$fwrite(store_trace,"%d | PC=%h | IR=%h | %h: %h\n",
          $time,
          pc,
          instr,
          data_mem_addr,
          data_mem_data);
      */
    end

    /**************** Clean up & close files ********************/

    always@(data_mem_data && data_mem_we )
      if (data_mem_data==32'hdeaddead && data_mem_we)
      begin
      $fclose(trace);
      $fclose(store_trace);
      end
`endif

`ifdef POWER_POSTSYNTHESIS 
    /**************** Boot loader ********************/
      //NEW
    always@(posedge clk)
      begin
        if (~resetn)
          boot_iaddr<=boot_iaddr+1;

        if (~resetn)
          boot_daddr<=boot_daddr+1;
      end

    assign boot_iwe=~resetn;
    assign boot_dwe=~resetn;
    assign boot_idata=imem[boot_iaddr];
    assign boot_ddata=dmem[boot_daddr];

`endif

/**************** User inserted code ********************/
`ifdef POWER_POSTSYNTHESIS 
`else
wire [6:0] D_pipe1_instr;
wire D_pipe1_stall;
wire D_pipe1_squash;
wire [6:0] D_pipe2_instr;
wire D_pipe2_stall;
wire D_pipe2_squash;

/*Deepak : Any of these things are not supported coz of referencing .. so Rewriting the same*/
/*
assign D_pipe1_instr = {!(|p.ifetch_opcode), (|p.ifetch_opcode) ? p.ifetch_opcode : p.ifetch_func};
assign D_pipe1_stall = p.stall_out_stage1;
assign D_pipe1_squash = p.squash_stage1;

assign D_pipe2_instr = {!(|p.pipereg8_q), (|p.pipereg8_q) ? p.pipereg8_q : p.pipereg9_q};
assign D_pipe2_stall = p.stall_out_stage2;
assign D_pipe2_squash = p.squash_stage2;
*/
assign D_pipe1_instr = {!(|ifetch_opcode), (|ifetch_opcode) ? ifetch_opcode : ifetch_func};
assign D_pipe1_stall = stall_out_stage1;
assign D_pipe1_squash = squash_stage1;

assign D_pipe2_instr = {!(|pipereg8_q), (|pipereg8_q) ? pipereg8_q : pipereg9_q};
assign D_pipe2_stall = stall_out_stage2;
assign D_pipe2_squash = squash_stage2;



`endif

endmodule

