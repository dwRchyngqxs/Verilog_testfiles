// ==============================================================
// File generated by AutoESL - High-Level Synthesis System (C, C++, SystemC)
// Version: 2011.1
// Copyright (C) 2011 Xilinx Inc. All rights reserved.
// 
// ==============================================================

`timescale 1 ns / 1 ps
module fastAtan2_grp_fu_109_ACMP_fcmp_64(
    clk,
    reset,
    ce,
    din0,
    din1,
    opcode,
    dout);

parameter ID = 32'd1;
parameter NUM_STAGE = 32'd1;
parameter din0_WIDTH = 32'd1;
parameter din1_WIDTH = 32'd1;
parameter dout_WIDTH = 32'd1;
input clk;
input reset;
input ce;
input[din0_WIDTH - 1:0] din0;
input[din1_WIDTH - 1:0] din1;
input[5 - 1:0] opcode;
output[dout_WIDTH - 1:0] dout;



ACMP_fcmp #(
.ID( ID ),
.NUM_STAGE( 3 ),
.din0_WIDTH( din0_WIDTH ),
.din1_WIDTH( din1_WIDTH ),
.dout_WIDTH( dout_WIDTH ))
ACMP_fcmp_U(
    .clk( clk ),
    .reset( reset ),
    .ce( ce ),
    .din0( din0 ),
    .din1( din1 ),
    .dout( dout ),
    .opcode( opcode ));

endmodule
