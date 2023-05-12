`timescale 1ns / 1ps
/* Top level module with sim-to-PC control interface and DCM
 */
`include "../const.v"
module top(
    clock_in,
    reset,
    sim_time,
    error,
    quiescent,
    config_in,
    config_in_valid,
    config_out,
    config_out_valid,
    stats_out,
    stats_shift
);
    input                   clock_in;
    input                   reset;
    output  [`TS_WIDTH-1:0] sim_time;
    output                  error;
    output                  quiescent;
    
    input            [15:0] config_in;
    input                   config_in_valid;
    output           [15:0] config_out;
    output                  config_out_valid;
    
    output           [15:0] stats_out;
    input                   stats_shift;

    wire clock;
    wire dcm_locked;

    // DCM: Digital Clock Manager Circuit
    //      Virtex-II/II-Pro and Spartan-3
    // Xilinx HDL Language Template, version 10.1.3

    DCM #(
        .SIM_MODE("SAFE"),  // Simulation: "SAFE" vs. "FAST", see "Synthesis and Simulation Design Guide" for details
        .CLKDV_DIVIDE(2.0), // Divide by: 1.5,2.0,2.5,3.0,3.5,4.0,4.5,5.0,5.5,6.0,6.5
                            //   7.0,7.5,8.0,9.0,10.0,11.0,12.0,13.0,14.0,15.0 or 16.0
        .CLKFX_DIVIDE(1),   // Can be any integer from 1 to 32
        .CLKFX_MULTIPLY(4), // Can be any integer from 2 to 32
        .CLKIN_DIVIDE_BY_2("FALSE"), // TRUE/FALSE to enable CLKIN divide by two feature
        .CLKIN_PERIOD(0.0), // Specify period of input clock
        .CLKOUT_PHASE_SHIFT("NONE"), // Specify phase shift of NONE, FIXED or VARIABLE
        .CLK_FEEDBACK("1X"),// Specify clock feedback of NONE, 1X or 2X
        .DESKEW_ADJUST("SYSTEM_SYNCHRONOUS"), // SOURCE_SYNCHRONOUS, SYSTEM_SYNCHRONOUS or
                                            //   an integer from 0 to 15
        .DFS_FREQUENCY_MODE("LOW"),  // HIGH or LOW frequency mode for frequency synthesis
        .DLL_FREQUENCY_MODE("LOW"),  // HIGH or LOW frequency mode for DLL
        .DUTY_CYCLE_CORRECTION("TRUE"), // Duty cycle correction, TRUE or FALSE
        .FACTORY_JF(16'hC080),   // FACTORY JF values
        .PHASE_SHIFT(0),     // Amount of fixed phase shift from -255 to 255
        .STARTUP_WAIT("FALSE")   // Delay configuration DONE until DCM LOCK, TRUE/FALSE
    ) DCM_inst (
        .CLK0(clock),       // 0 degree DCM CLK output
        .CLK180(),          // 180 degree DCM CLK output
        .CLK270(),          // 270 degree DCM CLK output
        .CLK2X(),           // 2X DCM CLK output
        .CLK2X180(),        // 2X, 180 degree DCM CLK out
        .CLK90(),           // 90 degree DCM CLK output
        .CLKDV(),           // Divided DCM CLK out (CLKDV_DIVIDE)
        .CLKFX(),           // DCM CLK synthesis out (M/D)
        .CLKFX180(),        // 180 degree CLK synthesis out
        .LOCKED(dcm_locked), // DCM LOCK status output
        .PSDONE(),          // Dynamic phase adjust done output
        .STATUS(),          // 8-bit DCM status bits output
        .CLKFB(clock),      // DCM clock feedback
        .CLKIN(clock_in),   // Clock input (from IBUFG, BUFG or DCM)
        .PSCLK(1'b0),       // Dynamic phase adjust clock input
        .PSEN(1'b0),        // Dynamic phase adjust enable input
        .PSINCDEC(0),       // Dynamic phase adjust increment/decrement
        .RST(reset)         // DCM asynchronous reset input
   );
					
    sim9 simulator (
        .clock (clock),
        .reset (reset),
        .enable (dcm_locked),
        .sim_time_tick (),
        .sim_time (sim_time),
        .error (error),
        .quiescent (quiescent),
        .config_in (config_in),
        .config_in_valid (config_in_valid),
        .config_out (config_out),
        .config_out_valid (config_out_valid),
        .stats_out (stats_out),
        .stats_shift (stats_shift));

endmodule
