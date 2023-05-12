`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:41:50 10/20/2009 
// Design Name: 
// Module Name:    test_out_inf 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
`include "const.v"

module test_out_inf(
    clock,
    reset,
    flit_ts,
    flit_valid,
    sim_time,
    ready
);
    parameter nVCs = 2;
    
    input                       clock;
    input                       reset;
    input   [nVCs*`TS_WIDTH-1:0] flit_ts;
    input            [nVCs-1:0] flit_valid;
    input        [`TS_WIDTH-1:0] sim_time;
    
    output                      ready;


endmodule
