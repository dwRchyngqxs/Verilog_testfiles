`timescale 1ns / 1ps
/* Testbench for FQCtrl
 */
`include "../../const.v"

module FQCtrl_tb;

	// Inputs
	reg             clock;
	reg             reset;
	reg             enable;
	reg     [ 9: 0] sim_time;
	reg             measure;
	reg     [ 9: 0] psize;
	reg     [ 7: 0] sendto;
	reg             obuf_full;
	
	reg     [31: 0] threshold;
	reg		[ 7: 0] total_packets_injected;
    reg     [15: 0] config_in;
    reg             config_in_valid;

	// Outputs
	wire            [35: 0] tg_flit_out;
	wire                    tg_ready;
	wire                    tg_tick_rng;
	wire            [31: 0] tg_rand_wire;
	wire                    tg_rand_below_threshold;
	wire	[`TS_WIDTH-1:0] fq_ts_out;
    wire            [15: 0] config_out;
    wire                    config_out_valid;

	FQCtrl fq_ctrl (
		.clock (clock),
		.reset (reset),
    	.in_ready (tg_ready),
    	.in_timestamp (tg_flit_out[32:23]),
    	.out_timestamp (fq_ts_out),
    	.config_in (config_in),
    	.config_in_valid (config_in_valid),
    	.config_out (config_out),
    	.config_out_valid (config_out_valid));
	
	// TGBernoulli to generate traffic for the FQ
	TGBernoulliFSM tg (
		.clock(clock), 
		.reset(reset), 
		.enable(enable), 
		.sim_time(sim_time), 
		.measure(measure), 
		.psize(psize), 
		.sendto(sendto), 
		.obuf_full(obuf_full), 
		.rand_below_threshold(tg_rand_below_threshold), 
		.flit_out(tg_flit_out), 
		.ready(tg_ready), 
		.tick_rng(tg_tick_rng)
	);
	
	RNG rng (
		.clock (clock),
		.reset (reset),
		.enable (tg_tick_rng),
		.rand_out (tg_rand_wire),
		.config_in_valid (1'b0),
		.config_in (8'h00),
		.config_out_valid (),
		.config_out ());
		
	assign tg_rand_below_threshold = (tg_rand_wire < threshold) ? 1'b1 : 1'b0;

	integer i, j, z;
	initial begin
		// Initialize Inputs
		clock = 0;
		reset = 0;
		enable = 0;
		sim_time = 0;
		measure = 0;
		psize = 3;
		sendto = 8'hCA;
		obuf_full = 0;
		threshold = 32'h1999_9999;
        config_in = 16'h0104;
        config_in_valid = 0;
		
		#5 reset = 1;
		
		// Wait 100 ns for global reset to finish
		#92 reset = 0;
        #10 config_in_valid = 1;
        #10 config_in_valid = 0;
        
		#10 enable = 1;
		measure = 1;
        
		// Add stimulus here
		for (z = 0; z < 5; z = z + 1)
		begin
			for (i = 0; i < 30; i = i + 1)
			begin
				if (z > 3 && i > 20) measure = 1'b0;
				for (j = 0; j < 3; j = j + 1)
					#10;
				sim_time = sim_time + 1;
			end
			obuf_full = ~obuf_full;
		end
	end
	
	always #5 clock = ~clock;
	
	always @(posedge clock or posedge reset)
	begin
		if (reset)
		begin
			total_packets_injected <= 8'h00;
		end
		else
		begin
			if (tg_ready & tg_flit_out[35])
				total_packets_injected <= total_packets_injected + 1;
		end
	end
      
endmodule
