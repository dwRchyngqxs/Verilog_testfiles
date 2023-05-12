`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:21:10 05/28/2010
// Design Name:   Control
// Module Name:   D:/School/thesis/icsim/hdl/Control/Control_tb.v
// Project Name:  Control
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Control
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Control_tb;

	// Inputs
	reg clock;
	reg reset;
	reg [15:0] rx_word;
	reg rx_word_valid;
    reg tx_ack;
	reg [9:0] sim_time;
	reg sim_time_tick;
	reg sim_error_in;
	reg sim_quiescent;
	reg [15:0] stats_word;

	// Outputs
	wire control_error;
	wire sim_error;
	wire [15:0] tx_word;
	wire tx_word_valid;
	wire sim_reset;
	wire sim_enable;
	wire stop_injection;
	wire measure;
	wire [15:0] config_word;
	wire config_valid;
	wire stats_shift;
    
    
    reg [63:0] data_word;

	// Instantiate the Unit Under Test (UUT)
	Control uut (
		.clock(clock), 
		.reset(reset), 
		.control_error(control_error), 
		.sim_error(sim_error), 
		.rx_word(rx_word), 
		.rx_word_valid(rx_word_valid), 
		.tx_word(tx_word), 
		.tx_word_valid(tx_word_valid), 
		.tx_ack(tx_ack), 
		.sim_reset(sim_reset), 
		.sim_enable(sim_enable), 
		.stop_injection(stop_injection), 
		.measure(measure), 
		.sim_time(sim_time), 
		.sim_time_tick(sim_time_tick), 
		.sim_error_in(sim_error_in), 
		.sim_quiescent(sim_quiescent), 
		.config_word(config_word), 
		.config_valid(config_valid), 
		.stats_shift(stats_shift), 
		.stats_word(data_word[15:0])
	);

	initial begin
		// Initialize Inputs
		clock = 0;
		reset = 0;
		rx_word = 0;
		rx_word_valid = 0;
        tx_ack = 0;
		sim_time = 0;
		sim_time_tick = 0;
		sim_error_in = 0;
		sim_quiescent = 0;
		stats_word = 0;

		// Wait 100 ns for global reset to finish
        #2 reset = 1;
		#100 reset = 0;
        #100;
        
		// Add stimulus here
        rx_word = 16'h0000;     // Reset
        rx_word_valid = 1;
        
        #10;
        rx_word_valid = 0;
        
        #10;
        rx_word = 16'h2004;     // Set timer
        rx_word_valid = 1;
        
        #10;
        rx_word_valid = 0;
        
        #10;
        rx_word = 16'h3BEF;     // Send config words
        rx_word_valid = 1;
        
        #10;
        rx_word_valid = 0;
        
        #10;
        rx_word = 16'h0005;     // 5 Config words
        rx_word_valid = 1;
        
        #10;
        rx_word = 16'hCA01;     // Config 1
        
        #10;
        rx_word_valid = 0;
        
        #10;
        rx_word = 16'hBE02;     // Config 2
        rx_word_valid = 1;
        
        #10;
        rx_word_valid = 0;
        
        #20;
        rx_word = 16'hDF03;     // Config 3
        rx_word_valid = 1;
        
        #10;
        rx_word = 16'hEC04;     // Config 4
        
        #10;
        rx_word = 16'hDB35;     // Config 5
        
        #10;
        rx_word_valid = 0;
        
        // Request data words
        #10;
        rx_word = 16'h4779;
        rx_word_valid = 1;
        
        #10;
        rx_word = 16'h003;
        
        #10;
        rx_word_valid = 0;
        
        #10 tx_ack = tx_word_valid;
        #10 tx_ack = 0;
        #10 tx_ack = tx_word_valid;
        #10 tx_ack = 0;
        #20 tx_ack = tx_word_valid;
        #10 tx_ack = 0;
        
        // Request states
        #10;
        rx_word = 16'h5864;
        rx_word_valid = 1;
        sim_time = 16'hEACB;
        
        #10 rx_word_valid = 0;
        #10 tx_ack = tx_word_valid;
        #10 tx_ack = 0;
        #10 tx_ack = tx_word_valid;
        #10 tx_ack = 0;
        #10 tx_ack = tx_word_valid;
        #10 tx_ack = 0;
        #10 tx_ack = tx_word_valid;
        #10 tx_ack = 0;
        
        
        // Write regular command
        #10;
        rx_word = 16'h100B;     // LSB = 4'b1011 (timer_enable, stop_injection, measure, sim_enable}
        rx_word_valid = 1;
        
        #10;
        rx_word_valid = 0;
        sim_time_tick = 1;
        
        #10 sim_time_tick = 0;
        #10 sim_time_tick = 1;
        #10 sim_time_tick = 0;
        #10 sim_time_tick = 1;
        #10 sim_time_tick = 0;
        #10 sim_time_tick = 1;
        #10 sim_time_tick = 0;
        #10 sim_time_tick = 1;
        #10 sim_time_tick = 0;
        #10 sim_time_tick = 1;
        #10 sim_time_tick = 0;
        #10 sim_time_tick = 1;
        #10 sim_time_tick = 0;
        
        
        #10;
        rx_word = 16'h100F;     // Enable stop_injection
        rx_word_valid = 1;
	end
    
    always #5 clock = ~clock;
    
    always @(posedge clock)
    begin
        if (reset)
            data_word <= 64'h1234_ABCD_5678_EF90;
        else if (stats_shift)
            data_word <= {data_word[15:0], data_word[63:16]};
    end
      
endmodule

