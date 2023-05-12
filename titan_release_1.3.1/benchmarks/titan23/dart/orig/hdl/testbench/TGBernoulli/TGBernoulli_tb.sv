`timescale 1ns / 1ps
/* Testbench for TGBernoulli
 */
module TGBernoulli_tb;

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
	reg		[ 1: 0][ 7: 0] total_packets_injected;

	// Outputs
	wire    [35: 0] ut0_flit_out;
	wire            ut0_ready;
	wire            ut0_tick_rng;
	wire    [31: 0] ut0_rand_wire;
	wire            ut0_rand_below_threshold;
	
	wire    [35: 0] ut1_flit_out;
	wire            ut1_ready;
	wire            ut1_tick_rng;
	wire    [31: 0] ut1_rand_wire;
	wire            ut1_rand_below_threshold;
	

	// Instantiate the Unit Under Test (UUT)
	TGBernoulli ut0 (
		.clock(clock), 
		.reset(reset), 
		.enable(enable), 
		.sim_time(sim_time), 
		.measure(measure), 
		.psize(psize), 
		.sendto(sendto), 
		.obuf_full(obuf_full), 
		.rand_below_threshold(ut0_rand_below_threshold), 
		.flit_out(ut0_flit_out), 
		.ready(ut0_ready), 
		.tick_rng(ut0_tick_rng)
	);
	
	TGBernoulliFSM ut1 (
		.clock(clock), 
		.reset(reset), 
		.enable(enable), 
		.sim_time(sim_time), 
		.measure(measure), 
		.psize(psize), 
		.sendto(sendto), 
		.obuf_full(obuf_full), 
		.rand_below_threshold(ut1_rand_below_threshold), 
		.flit_out(ut1_flit_out), 
		.ready(ut1_ready), 
		.tick_rng(ut1_tick_rng)
	);
	
	RNG rng0 (
		.clock (clock),
		.reset (reset),
		.enable (ut0_tick_rng),
		.rand_out (ut0_rand_wire),
		.config_in_valid (1'b0),
		.config_in (8'h00),
		.config_out_valid (),
		.config_out ());
	
	RNG rng1 (
		.clock (clock),
		.reset (reset),
		.enable (ut1_tick_rng),
		.rand_out (ut1_rand_wire),
		.config_in_valid (1'b0),
		.config_in (8'h00),
		.config_out_valid (),
		.config_out ());
	
	assign ut0_rand_below_threshold = (ut0_rand_wire < threshold) ? 1'b1 : 1'b0;
	assign ut1_rand_below_threshold = (ut1_rand_wire < threshold) ? 1'b1 : 1'b0;

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
		
		#5 reset = 1;
		
		// Wait 100 ns for global reset to finish
		#92 reset = 0;
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
			total_packets_injected[0] <= 8'h00;
			total_packets_injected[1] <= 8'h00;
		end
		else
		begin
			if (ut0_ready)
				total_packets_injected[0] <= total_packets_injected[0] + 1;
			if (ut1_ready)
				total_packets_injected[1] <= total_packets_injected[1] + 1;
		end
	end
      
endmodule
