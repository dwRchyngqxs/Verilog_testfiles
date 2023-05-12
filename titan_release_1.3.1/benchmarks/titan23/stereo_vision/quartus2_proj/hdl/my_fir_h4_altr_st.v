module my_fir_h4_altr_st (clk, 
              rst, 
              data_in, 
              rdy_to_ld, 
              done, 
              fir_result); 
parameter DATA_WIDTH  = 16;
parameter COEF_WIDTH  = 9;
parameter ACCUM_WIDTH = 28;

input clk, rst;
input [DATA_WIDTH-1:0] data_in;
output rdy_to_ld;
wire rdy_to_ld;
wire rdy_int;
output done;
wire done;
wire done_int;
assign rdy_to_ld = 1'b1;
assign done = 1'b1;
output [ACCUM_WIDTH-1:0] fir_result;
wire addr_low;
assign addr_low = 1'b0;
wire clk_en;
assign clk_en = 1'b1;


//--- Parallel TDL Storage ---
wire inv_rst;
assign inv_rst = ~rst;
wire [15:0] tdl_0_n;
wire [15:0] tdl_1_n;
wire [15:0] tdl_2_n;
wire [15:0] tdl_3_n;
wire [15:0] tdl_4_n;
wire [15:0] tdl_5_n;
wire [15:0] tdl_6_n;


//--- TDL  ---
tdl_da_lc Utdldalc0n (.clk(clk), .clk_en(inv_rst), .data_in(data_in), .data_out(tdl_0_n) );
defparam Utdldalc0n.WIDTH = DATA_WIDTH;
tdl_da_lc Utdldalc1n (.clk(clk), .clk_en(clk_en), .data_in(tdl_0_n), .data_out(tdl_1_n) );
defparam Utdldalc1n.WIDTH = DATA_WIDTH;
tdl_da_lc Utdldalc2n (.clk(clk), .clk_en(clk_en), .data_in(tdl_1_n), .data_out(tdl_2_n) );
defparam Utdldalc2n.WIDTH = DATA_WIDTH;
tdl_da_lc Utdldalc3n (.clk(clk), .clk_en(clk_en), .data_in(tdl_2_n), .data_out(tdl_3_n) );
defparam Utdldalc3n.WIDTH = DATA_WIDTH;
tdl_da_lc Utdldalc4n (.clk(clk), .clk_en(clk_en), .data_in(tdl_3_n), .data_out(tdl_4_n) );
defparam Utdldalc4n.WIDTH = DATA_WIDTH;
tdl_da_lc Utdldalc5n (.clk(clk), .clk_en(clk_en), .data_in(tdl_4_n), .data_out(tdl_5_n) );
defparam Utdldalc5n.WIDTH = DATA_WIDTH;
tdl_da_lc Utdldalc6n (.clk(clk), .clk_en(clk_en), .data_in(tdl_5_n), .data_out(tdl_6_n) );
defparam Utdldalc6n.WIDTH = DATA_WIDTH;


// --- ROM LUTs ---- 
// symmetrical adders ...
wire [16:0] sym_res_0_n;
sadd U_0_sym_add (.clk(clk), .ain(tdl_0_n), .bin(tdl_6_n), .res(sym_res_0_n) );
defparam U_0_sym_add.IN_WIDTH = 16;
defparam U_0_sym_add.PIPE_DEPTH = 1;
wire [16:0] sym_res_1_n;
sadd U_1_sym_add (.clk(clk), .ain(tdl_1_n), .bin(tdl_5_n), .res(sym_res_1_n) );
defparam U_1_sym_add.IN_WIDTH = 16;
defparam U_1_sym_add.PIPE_DEPTH = 1;
wire [16:0] sym_res_2_n;
sadd U_2_sym_add (.clk(clk), .ain(tdl_2_n), .bin(tdl_4_n), .res(sym_res_2_n) );
defparam U_2_sym_add.IN_WIDTH = 16;
defparam U_2_sym_add.PIPE_DEPTH = 1;
wire [16:0] sym_res_3_n;
sadd U_3_sym_add (.clk(clk), .ain(tdl_3_n), .bin(16'd0), .res(sym_res_3_n) );
defparam U_3_sym_add.IN_WIDTH = 16;
defparam U_3_sym_add.PIPE_DEPTH = 1;


wire [8:0] lut_val_0_n_0_pp;
rom_lut Ur0_n_0_pp (.addr_in( {sym_res_3_n[0],sym_res_2_n[0],sym_res_1_n[0],sym_res_0_n[0] } ), .data_out( lut_val_0_n_0_pp[8:0]) ) ;
 defparam Ur0_n_0_pp.DATA_WIDTH = 9;
defparam Ur0_n_0_pp.C0 = 0;
defparam Ur0_n_0_pp.C1 = 14;
defparam Ur0_n_0_pp.C2 = 43;
defparam Ur0_n_0_pp.C3 = 57;
defparam Ur0_n_0_pp.C4 = 464;
defparam Ur0_n_0_pp.C5 = 478;
defparam Ur0_n_0_pp.C6 = 507;
defparam Ur0_n_0_pp.C7 = 9;
defparam Ur0_n_0_pp.C8 = 324;
defparam Ur0_n_0_pp.C9 = 338;
defparam Ur0_n_0_pp.CA = 367;
defparam Ur0_n_0_pp.CB = 381;
defparam Ur0_n_0_pp.CC = 276;
defparam Ur0_n_0_pp.CD = 290;
defparam Ur0_n_0_pp.CE = 319;
defparam Ur0_n_0_pp.CF = 333;
wire [8:0] lut_val_0_n_1_pp;
rom_lut Ur0_n_1_pp (.addr_in( {sym_res_3_n[1],sym_res_2_n[1],sym_res_1_n[1],sym_res_0_n[1] } ), .data_out( lut_val_0_n_1_pp[8:0]) ) ;
 defparam Ur0_n_1_pp.DATA_WIDTH = 9;
defparam Ur0_n_1_pp.C0 = 0;
defparam Ur0_n_1_pp.C1 = 14;
defparam Ur0_n_1_pp.C2 = 43;
defparam Ur0_n_1_pp.C3 = 57;
defparam Ur0_n_1_pp.C4 = 464;
defparam Ur0_n_1_pp.C5 = 478;
defparam Ur0_n_1_pp.C6 = 507;
defparam Ur0_n_1_pp.C7 = 9;
defparam Ur0_n_1_pp.C8 = 324;
defparam Ur0_n_1_pp.C9 = 338;
defparam Ur0_n_1_pp.CA = 367;
defparam Ur0_n_1_pp.CB = 381;
defparam Ur0_n_1_pp.CC = 276;
defparam Ur0_n_1_pp.CD = 290;
defparam Ur0_n_1_pp.CE = 319;
defparam Ur0_n_1_pp.CF = 333;
wire [8:0] lut_val_0_n_2_pp;
rom_lut Ur0_n_2_pp (.addr_in( {sym_res_3_n[2],sym_res_2_n[2],sym_res_1_n[2],sym_res_0_n[2] } ), .data_out( lut_val_0_n_2_pp[8:0]) ) ;
 defparam Ur0_n_2_pp.DATA_WIDTH = 9;
defparam Ur0_n_2_pp.C0 = 0;
defparam Ur0_n_2_pp.C1 = 14;
defparam Ur0_n_2_pp.C2 = 43;
defparam Ur0_n_2_pp.C3 = 57;
defparam Ur0_n_2_pp.C4 = 464;
defparam Ur0_n_2_pp.C5 = 478;
defparam Ur0_n_2_pp.C6 = 507;
defparam Ur0_n_2_pp.C7 = 9;
defparam Ur0_n_2_pp.C8 = 324;
defparam Ur0_n_2_pp.C9 = 338;
defparam Ur0_n_2_pp.CA = 367;
defparam Ur0_n_2_pp.CB = 381;
defparam Ur0_n_2_pp.CC = 276;
defparam Ur0_n_2_pp.CD = 290;
defparam Ur0_n_2_pp.CE = 319;
defparam Ur0_n_2_pp.CF = 333;
wire [8:0] lut_val_0_n_3_pp;
rom_lut Ur0_n_3_pp (.addr_in( {sym_res_3_n[3],sym_res_2_n[3],sym_res_1_n[3],sym_res_0_n[3] } ), .data_out( lut_val_0_n_3_pp[8:0]) ) ;
 defparam Ur0_n_3_pp.DATA_WIDTH = 9;
defparam Ur0_n_3_pp.C0 = 0;
defparam Ur0_n_3_pp.C1 = 14;
defparam Ur0_n_3_pp.C2 = 43;
defparam Ur0_n_3_pp.C3 = 57;
defparam Ur0_n_3_pp.C4 = 464;
defparam Ur0_n_3_pp.C5 = 478;
defparam Ur0_n_3_pp.C6 = 507;
defparam Ur0_n_3_pp.C7 = 9;
defparam Ur0_n_3_pp.C8 = 324;
defparam Ur0_n_3_pp.C9 = 338;
defparam Ur0_n_3_pp.CA = 367;
defparam Ur0_n_3_pp.CB = 381;
defparam Ur0_n_3_pp.CC = 276;
defparam Ur0_n_3_pp.CD = 290;
defparam Ur0_n_3_pp.CE = 319;
defparam Ur0_n_3_pp.CF = 333;
wire [8:0] lut_val_0_n_4_pp;
rom_lut Ur0_n_4_pp (.addr_in( {sym_res_3_n[4],sym_res_2_n[4],sym_res_1_n[4],sym_res_0_n[4] } ), .data_out( lut_val_0_n_4_pp[8:0]) ) ;
 defparam Ur0_n_4_pp.DATA_WIDTH = 9;
defparam Ur0_n_4_pp.C0 = 0;
defparam Ur0_n_4_pp.C1 = 14;
defparam Ur0_n_4_pp.C2 = 43;
defparam Ur0_n_4_pp.C3 = 57;
defparam Ur0_n_4_pp.C4 = 464;
defparam Ur0_n_4_pp.C5 = 478;
defparam Ur0_n_4_pp.C6 = 507;
defparam Ur0_n_4_pp.C7 = 9;
defparam Ur0_n_4_pp.C8 = 324;
defparam Ur0_n_4_pp.C9 = 338;
defparam Ur0_n_4_pp.CA = 367;
defparam Ur0_n_4_pp.CB = 381;
defparam Ur0_n_4_pp.CC = 276;
defparam Ur0_n_4_pp.CD = 290;
defparam Ur0_n_4_pp.CE = 319;
defparam Ur0_n_4_pp.CF = 333;
wire [8:0] lut_val_0_n_5_pp;
rom_lut Ur0_n_5_pp (.addr_in( {sym_res_3_n[5],sym_res_2_n[5],sym_res_1_n[5],sym_res_0_n[5] } ), .data_out( lut_val_0_n_5_pp[8:0]) ) ;
 defparam Ur0_n_5_pp.DATA_WIDTH = 9;
defparam Ur0_n_5_pp.C0 = 0;
defparam Ur0_n_5_pp.C1 = 14;
defparam Ur0_n_5_pp.C2 = 43;
defparam Ur0_n_5_pp.C3 = 57;
defparam Ur0_n_5_pp.C4 = 464;
defparam Ur0_n_5_pp.C5 = 478;
defparam Ur0_n_5_pp.C6 = 507;
defparam Ur0_n_5_pp.C7 = 9;
defparam Ur0_n_5_pp.C8 = 324;
defparam Ur0_n_5_pp.C9 = 338;
defparam Ur0_n_5_pp.CA = 367;
defparam Ur0_n_5_pp.CB = 381;
defparam Ur0_n_5_pp.CC = 276;
defparam Ur0_n_5_pp.CD = 290;
defparam Ur0_n_5_pp.CE = 319;
defparam Ur0_n_5_pp.CF = 333;
wire [8:0] lut_val_0_n_6_pp;
rom_lut Ur0_n_6_pp (.addr_in( {sym_res_3_n[6],sym_res_2_n[6],sym_res_1_n[6],sym_res_0_n[6] } ), .data_out( lut_val_0_n_6_pp[8:0]) ) ;
 defparam Ur0_n_6_pp.DATA_WIDTH = 9;
defparam Ur0_n_6_pp.C0 = 0;
defparam Ur0_n_6_pp.C1 = 14;
defparam Ur0_n_6_pp.C2 = 43;
defparam Ur0_n_6_pp.C3 = 57;
defparam Ur0_n_6_pp.C4 = 464;
defparam Ur0_n_6_pp.C5 = 478;
defparam Ur0_n_6_pp.C6 = 507;
defparam Ur0_n_6_pp.C7 = 9;
defparam Ur0_n_6_pp.C8 = 324;
defparam Ur0_n_6_pp.C9 = 338;
defparam Ur0_n_6_pp.CA = 367;
defparam Ur0_n_6_pp.CB = 381;
defparam Ur0_n_6_pp.CC = 276;
defparam Ur0_n_6_pp.CD = 290;
defparam Ur0_n_6_pp.CE = 319;
defparam Ur0_n_6_pp.CF = 333;
wire [8:0] lut_val_0_n_7_pp;
rom_lut Ur0_n_7_pp (.addr_in( {sym_res_3_n[7],sym_res_2_n[7],sym_res_1_n[7],sym_res_0_n[7] } ), .data_out( lut_val_0_n_7_pp[8:0]) ) ;
 defparam Ur0_n_7_pp.DATA_WIDTH = 9;
defparam Ur0_n_7_pp.C0 = 0;
defparam Ur0_n_7_pp.C1 = 14;
defparam Ur0_n_7_pp.C2 = 43;
defparam Ur0_n_7_pp.C3 = 57;
defparam Ur0_n_7_pp.C4 = 464;
defparam Ur0_n_7_pp.C5 = 478;
defparam Ur0_n_7_pp.C6 = 507;
defparam Ur0_n_7_pp.C7 = 9;
defparam Ur0_n_7_pp.C8 = 324;
defparam Ur0_n_7_pp.C9 = 338;
defparam Ur0_n_7_pp.CA = 367;
defparam Ur0_n_7_pp.CB = 381;
defparam Ur0_n_7_pp.CC = 276;
defparam Ur0_n_7_pp.CD = 290;
defparam Ur0_n_7_pp.CE = 319;
defparam Ur0_n_7_pp.CF = 333;
wire [8:0] lut_val_0_n_8_pp;
rom_lut Ur0_n_8_pp (.addr_in( {sym_res_3_n[8],sym_res_2_n[8],sym_res_1_n[8],sym_res_0_n[8] } ), .data_out( lut_val_0_n_8_pp[8:0]) ) ;
 defparam Ur0_n_8_pp.DATA_WIDTH = 9;
defparam Ur0_n_8_pp.C0 = 0;
defparam Ur0_n_8_pp.C1 = 14;
defparam Ur0_n_8_pp.C2 = 43;
defparam Ur0_n_8_pp.C3 = 57;
defparam Ur0_n_8_pp.C4 = 464;
defparam Ur0_n_8_pp.C5 = 478;
defparam Ur0_n_8_pp.C6 = 507;
defparam Ur0_n_8_pp.C7 = 9;
defparam Ur0_n_8_pp.C8 = 324;
defparam Ur0_n_8_pp.C9 = 338;
defparam Ur0_n_8_pp.CA = 367;
defparam Ur0_n_8_pp.CB = 381;
defparam Ur0_n_8_pp.CC = 276;
defparam Ur0_n_8_pp.CD = 290;
defparam Ur0_n_8_pp.CE = 319;
defparam Ur0_n_8_pp.CF = 333;
wire [8:0] lut_val_0_n_9_pp;
rom_lut Ur0_n_9_pp (.addr_in( {sym_res_3_n[9],sym_res_2_n[9],sym_res_1_n[9],sym_res_0_n[9] } ), .data_out( lut_val_0_n_9_pp[8:0]) ) ;
 defparam Ur0_n_9_pp.DATA_WIDTH = 9;
defparam Ur0_n_9_pp.C0 = 0;
defparam Ur0_n_9_pp.C1 = 14;
defparam Ur0_n_9_pp.C2 = 43;
defparam Ur0_n_9_pp.C3 = 57;
defparam Ur0_n_9_pp.C4 = 464;
defparam Ur0_n_9_pp.C5 = 478;
defparam Ur0_n_9_pp.C6 = 507;
defparam Ur0_n_9_pp.C7 = 9;
defparam Ur0_n_9_pp.C8 = 324;
defparam Ur0_n_9_pp.C9 = 338;
defparam Ur0_n_9_pp.CA = 367;
defparam Ur0_n_9_pp.CB = 381;
defparam Ur0_n_9_pp.CC = 276;
defparam Ur0_n_9_pp.CD = 290;
defparam Ur0_n_9_pp.CE = 319;
defparam Ur0_n_9_pp.CF = 333;
wire [8:0] lut_val_0_n_10_pp;
rom_lut Ur0_n_10_pp (.addr_in( {sym_res_3_n[10],sym_res_2_n[10],sym_res_1_n[10],sym_res_0_n[10] } ), .data_out( lut_val_0_n_10_pp[8:0]) ) ;
 defparam Ur0_n_10_pp.DATA_WIDTH = 9;
defparam Ur0_n_10_pp.C0 = 0;
defparam Ur0_n_10_pp.C1 = 14;
defparam Ur0_n_10_pp.C2 = 43;
defparam Ur0_n_10_pp.C3 = 57;
defparam Ur0_n_10_pp.C4 = 464;
defparam Ur0_n_10_pp.C5 = 478;
defparam Ur0_n_10_pp.C6 = 507;
defparam Ur0_n_10_pp.C7 = 9;
defparam Ur0_n_10_pp.C8 = 324;
defparam Ur0_n_10_pp.C9 = 338;
defparam Ur0_n_10_pp.CA = 367;
defparam Ur0_n_10_pp.CB = 381;
defparam Ur0_n_10_pp.CC = 276;
defparam Ur0_n_10_pp.CD = 290;
defparam Ur0_n_10_pp.CE = 319;
defparam Ur0_n_10_pp.CF = 333;
wire [8:0] lut_val_0_n_11_pp;
rom_lut Ur0_n_11_pp (.addr_in( {sym_res_3_n[11],sym_res_2_n[11],sym_res_1_n[11],sym_res_0_n[11] } ), .data_out( lut_val_0_n_11_pp[8:0]) ) ;
 defparam Ur0_n_11_pp.DATA_WIDTH = 9;
defparam Ur0_n_11_pp.C0 = 0;
defparam Ur0_n_11_pp.C1 = 14;
defparam Ur0_n_11_pp.C2 = 43;
defparam Ur0_n_11_pp.C3 = 57;
defparam Ur0_n_11_pp.C4 = 464;
defparam Ur0_n_11_pp.C5 = 478;
defparam Ur0_n_11_pp.C6 = 507;
defparam Ur0_n_11_pp.C7 = 9;
defparam Ur0_n_11_pp.C8 = 324;
defparam Ur0_n_11_pp.C9 = 338;
defparam Ur0_n_11_pp.CA = 367;
defparam Ur0_n_11_pp.CB = 381;
defparam Ur0_n_11_pp.CC = 276;
defparam Ur0_n_11_pp.CD = 290;
defparam Ur0_n_11_pp.CE = 319;
defparam Ur0_n_11_pp.CF = 333;
wire [8:0] lut_val_0_n_12_pp;
rom_lut Ur0_n_12_pp (.addr_in( {sym_res_3_n[12],sym_res_2_n[12],sym_res_1_n[12],sym_res_0_n[12] } ), .data_out( lut_val_0_n_12_pp[8:0]) ) ;
 defparam Ur0_n_12_pp.DATA_WIDTH = 9;
defparam Ur0_n_12_pp.C0 = 0;
defparam Ur0_n_12_pp.C1 = 14;
defparam Ur0_n_12_pp.C2 = 43;
defparam Ur0_n_12_pp.C3 = 57;
defparam Ur0_n_12_pp.C4 = 464;
defparam Ur0_n_12_pp.C5 = 478;
defparam Ur0_n_12_pp.C6 = 507;
defparam Ur0_n_12_pp.C7 = 9;
defparam Ur0_n_12_pp.C8 = 324;
defparam Ur0_n_12_pp.C9 = 338;
defparam Ur0_n_12_pp.CA = 367;
defparam Ur0_n_12_pp.CB = 381;
defparam Ur0_n_12_pp.CC = 276;
defparam Ur0_n_12_pp.CD = 290;
defparam Ur0_n_12_pp.CE = 319;
defparam Ur0_n_12_pp.CF = 333;
wire [8:0] lut_val_0_n_13_pp;
rom_lut Ur0_n_13_pp (.addr_in( {sym_res_3_n[13],sym_res_2_n[13],sym_res_1_n[13],sym_res_0_n[13] } ), .data_out( lut_val_0_n_13_pp[8:0]) ) ;
 defparam Ur0_n_13_pp.DATA_WIDTH = 9;
defparam Ur0_n_13_pp.C0 = 0;
defparam Ur0_n_13_pp.C1 = 14;
defparam Ur0_n_13_pp.C2 = 43;
defparam Ur0_n_13_pp.C3 = 57;
defparam Ur0_n_13_pp.C4 = 464;
defparam Ur0_n_13_pp.C5 = 478;
defparam Ur0_n_13_pp.C6 = 507;
defparam Ur0_n_13_pp.C7 = 9;
defparam Ur0_n_13_pp.C8 = 324;
defparam Ur0_n_13_pp.C9 = 338;
defparam Ur0_n_13_pp.CA = 367;
defparam Ur0_n_13_pp.CB = 381;
defparam Ur0_n_13_pp.CC = 276;
defparam Ur0_n_13_pp.CD = 290;
defparam Ur0_n_13_pp.CE = 319;
defparam Ur0_n_13_pp.CF = 333;
wire [8:0] lut_val_0_n_14_pp;
rom_lut Ur0_n_14_pp (.addr_in( {sym_res_3_n[14],sym_res_2_n[14],sym_res_1_n[14],sym_res_0_n[14] } ), .data_out( lut_val_0_n_14_pp[8:0]) ) ;
 defparam Ur0_n_14_pp.DATA_WIDTH = 9;
defparam Ur0_n_14_pp.C0 = 0;
defparam Ur0_n_14_pp.C1 = 14;
defparam Ur0_n_14_pp.C2 = 43;
defparam Ur0_n_14_pp.C3 = 57;
defparam Ur0_n_14_pp.C4 = 464;
defparam Ur0_n_14_pp.C5 = 478;
defparam Ur0_n_14_pp.C6 = 507;
defparam Ur0_n_14_pp.C7 = 9;
defparam Ur0_n_14_pp.C8 = 324;
defparam Ur0_n_14_pp.C9 = 338;
defparam Ur0_n_14_pp.CA = 367;
defparam Ur0_n_14_pp.CB = 381;
defparam Ur0_n_14_pp.CC = 276;
defparam Ur0_n_14_pp.CD = 290;
defparam Ur0_n_14_pp.CE = 319;
defparam Ur0_n_14_pp.CF = 333;
wire [8:0] lut_val_0_n_15_pp;
rom_lut Ur0_n_15_pp (.addr_in( {sym_res_3_n[15],sym_res_2_n[15],sym_res_1_n[15],sym_res_0_n[15] } ), .data_out( lut_val_0_n_15_pp[8:0]) ) ;
 defparam Ur0_n_15_pp.DATA_WIDTH = 9;
defparam Ur0_n_15_pp.C0 = 0;
defparam Ur0_n_15_pp.C1 = 14;
defparam Ur0_n_15_pp.C2 = 43;
defparam Ur0_n_15_pp.C3 = 57;
defparam Ur0_n_15_pp.C4 = 464;
defparam Ur0_n_15_pp.C5 = 478;
defparam Ur0_n_15_pp.C6 = 507;
defparam Ur0_n_15_pp.C7 = 9;
defparam Ur0_n_15_pp.C8 = 324;
defparam Ur0_n_15_pp.C9 = 338;
defparam Ur0_n_15_pp.CA = 367;
defparam Ur0_n_15_pp.CB = 381;
defparam Ur0_n_15_pp.CC = 276;
defparam Ur0_n_15_pp.CD = 290;
defparam Ur0_n_15_pp.CE = 319;
defparam Ur0_n_15_pp.CF = 333;
wire [8:0] lut_val_0_n_16_pp;
rom_lut Ur0_n_16_pp (.addr_in( {sym_res_3_n[16],sym_res_2_n[16],sym_res_1_n[16],sym_res_0_n[16] } ), .data_out( lut_val_0_n_16_pp[8:0]) ) ;
 defparam Ur0_n_16_pp.DATA_WIDTH = 9;
defparam Ur0_n_16_pp.C0 = 0;
defparam Ur0_n_16_pp.C1 = 498;
defparam Ur0_n_16_pp.C2 = 469;
defparam Ur0_n_16_pp.C3 = 455;
defparam Ur0_n_16_pp.C4 = 48;
defparam Ur0_n_16_pp.C5 = 34;
defparam Ur0_n_16_pp.C6 = 5;
defparam Ur0_n_16_pp.C7 = 503;
defparam Ur0_n_16_pp.C8 = 188;
defparam Ur0_n_16_pp.C9 = 174;
defparam Ur0_n_16_pp.CA = 145;
defparam Ur0_n_16_pp.CB = 131;
defparam Ur0_n_16_pp.CC = 236;
defparam Ur0_n_16_pp.CD = 222;
defparam Ur0_n_16_pp.CE = 193;
defparam Ur0_n_16_pp.CF = 179;


// ---- partial product adder tree ----

wire [24:0] lut_0_bit_0_fill;
wire [24:0] lut_0_bit_1_fill;
wire [24:0] lut_0_bit_2_fill;
wire [24:0] lut_0_bit_3_fill;
wire [24:0] lut_0_bit_4_fill;
wire [24:0] lut_0_bit_5_fill;
wire [24:0] lut_0_bit_6_fill;
wire [24:0] lut_0_bit_7_fill;
wire [24:0] lut_0_bit_8_fill;
wire [24:0] lut_0_bit_9_fill;
wire [24:0] lut_0_bit_10_fill;
wire [24:0] lut_0_bit_11_fill;
wire [24:0] lut_0_bit_12_fill;
wire [24:0] lut_0_bit_13_fill;
wire [24:0] lut_0_bit_14_fill;
wire [24:0] lut_0_bit_15_fill;
wire [24:0] lut_0_bit_16_fill;
assign lut_0_bit_0_fill = {lut_val_0_n_0_pp[8], lut_val_0_n_0_pp[8], lut_val_0_n_0_pp[8], lut_val_0_n_0_pp[8], lut_val_0_n_0_pp[8], lut_val_0_n_0_pp[8], lut_val_0_n_0_pp[8], lut_val_0_n_0_pp[8], lut_val_0_n_0_pp[8], lut_val_0_n_0_pp[8], lut_val_0_n_0_pp[8], lut_val_0_n_0_pp[8], lut_val_0_n_0_pp[8], lut_val_0_n_0_pp[8], lut_val_0_n_0_pp[8], lut_val_0_n_0_pp[8],  lut_val_0_n_0_pp };
assign lut_0_bit_1_fill = {lut_val_0_n_1_pp[8], lut_val_0_n_1_pp[8], lut_val_0_n_1_pp[8], lut_val_0_n_1_pp[8], lut_val_0_n_1_pp[8], lut_val_0_n_1_pp[8], lut_val_0_n_1_pp[8], lut_val_0_n_1_pp[8], lut_val_0_n_1_pp[8], lut_val_0_n_1_pp[8], lut_val_0_n_1_pp[8], lut_val_0_n_1_pp[8], lut_val_0_n_1_pp[8], lut_val_0_n_1_pp[8], lut_val_0_n_1_pp[8],  lut_val_0_n_1_pp, 1'd0 };
assign lut_0_bit_2_fill = {lut_val_0_n_2_pp[8], lut_val_0_n_2_pp[8], lut_val_0_n_2_pp[8], lut_val_0_n_2_pp[8], lut_val_0_n_2_pp[8], lut_val_0_n_2_pp[8], lut_val_0_n_2_pp[8], lut_val_0_n_2_pp[8], lut_val_0_n_2_pp[8], lut_val_0_n_2_pp[8], lut_val_0_n_2_pp[8], lut_val_0_n_2_pp[8], lut_val_0_n_2_pp[8], lut_val_0_n_2_pp[8],  lut_val_0_n_2_pp, 2'd0 };
assign lut_0_bit_3_fill = {lut_val_0_n_3_pp[8], lut_val_0_n_3_pp[8], lut_val_0_n_3_pp[8], lut_val_0_n_3_pp[8], lut_val_0_n_3_pp[8], lut_val_0_n_3_pp[8], lut_val_0_n_3_pp[8], lut_val_0_n_3_pp[8], lut_val_0_n_3_pp[8], lut_val_0_n_3_pp[8], lut_val_0_n_3_pp[8], lut_val_0_n_3_pp[8], lut_val_0_n_3_pp[8],  lut_val_0_n_3_pp, 3'd0 };
assign lut_0_bit_4_fill = {lut_val_0_n_4_pp[8], lut_val_0_n_4_pp[8], lut_val_0_n_4_pp[8], lut_val_0_n_4_pp[8], lut_val_0_n_4_pp[8], lut_val_0_n_4_pp[8], lut_val_0_n_4_pp[8], lut_val_0_n_4_pp[8], lut_val_0_n_4_pp[8], lut_val_0_n_4_pp[8], lut_val_0_n_4_pp[8], lut_val_0_n_4_pp[8],  lut_val_0_n_4_pp, 4'd0 };
assign lut_0_bit_5_fill = {lut_val_0_n_5_pp[8], lut_val_0_n_5_pp[8], lut_val_0_n_5_pp[8], lut_val_0_n_5_pp[8], lut_val_0_n_5_pp[8], lut_val_0_n_5_pp[8], lut_val_0_n_5_pp[8], lut_val_0_n_5_pp[8], lut_val_0_n_5_pp[8], lut_val_0_n_5_pp[8], lut_val_0_n_5_pp[8],  lut_val_0_n_5_pp, 5'd0 };
assign lut_0_bit_6_fill = {lut_val_0_n_6_pp[8], lut_val_0_n_6_pp[8], lut_val_0_n_6_pp[8], lut_val_0_n_6_pp[8], lut_val_0_n_6_pp[8], lut_val_0_n_6_pp[8], lut_val_0_n_6_pp[8], lut_val_0_n_6_pp[8], lut_val_0_n_6_pp[8], lut_val_0_n_6_pp[8],  lut_val_0_n_6_pp, 6'd0 };
assign lut_0_bit_7_fill = {lut_val_0_n_7_pp[8], lut_val_0_n_7_pp[8], lut_val_0_n_7_pp[8], lut_val_0_n_7_pp[8], lut_val_0_n_7_pp[8], lut_val_0_n_7_pp[8], lut_val_0_n_7_pp[8], lut_val_0_n_7_pp[8], lut_val_0_n_7_pp[8],  lut_val_0_n_7_pp, 7'd0 };
assign lut_0_bit_8_fill = {lut_val_0_n_8_pp[8], lut_val_0_n_8_pp[8], lut_val_0_n_8_pp[8], lut_val_0_n_8_pp[8], lut_val_0_n_8_pp[8], lut_val_0_n_8_pp[8], lut_val_0_n_8_pp[8], lut_val_0_n_8_pp[8],  lut_val_0_n_8_pp, 8'd0 };
assign lut_0_bit_9_fill = {lut_val_0_n_9_pp[8], lut_val_0_n_9_pp[8], lut_val_0_n_9_pp[8], lut_val_0_n_9_pp[8], lut_val_0_n_9_pp[8], lut_val_0_n_9_pp[8], lut_val_0_n_9_pp[8],  lut_val_0_n_9_pp, 9'd0 };
assign lut_0_bit_10_fill = {lut_val_0_n_10_pp[8], lut_val_0_n_10_pp[8], lut_val_0_n_10_pp[8], lut_val_0_n_10_pp[8], lut_val_0_n_10_pp[8], lut_val_0_n_10_pp[8],  lut_val_0_n_10_pp, 10'd0 };
assign lut_0_bit_11_fill = {lut_val_0_n_11_pp[8], lut_val_0_n_11_pp[8], lut_val_0_n_11_pp[8], lut_val_0_n_11_pp[8], lut_val_0_n_11_pp[8],  lut_val_0_n_11_pp, 11'd0 };
assign lut_0_bit_12_fill = {lut_val_0_n_12_pp[8], lut_val_0_n_12_pp[8], lut_val_0_n_12_pp[8], lut_val_0_n_12_pp[8],  lut_val_0_n_12_pp, 12'd0 };
assign lut_0_bit_13_fill = {lut_val_0_n_13_pp[8], lut_val_0_n_13_pp[8], lut_val_0_n_13_pp[8],  lut_val_0_n_13_pp, 13'd0 };
assign lut_0_bit_14_fill = {lut_val_0_n_14_pp[8], lut_val_0_n_14_pp[8],  lut_val_0_n_14_pp, 14'd0 };
assign lut_0_bit_15_fill = {lut_val_0_n_15_pp[8],  lut_val_0_n_15_pp, 15'd0 };
assign lut_0_bit_16_fill = { lut_val_0_n_16_pp, 16'd0 };
wire [25:0] tree_0_pp_l_0_n_0_n;
sadd_lpm Uadd_0_lut_l_0_n_0_n (.clk(clk), .ain(lut_0_bit_0_fill), .bin(lut_0_bit_1_fill), .res(tree_0_pp_l_0_n_0_n) );
defparam Uadd_0_lut_l_0_n_0_n.IN_WIDTH = 25;
defparam Uadd_0_lut_l_0_n_0_n.PIPE_DEPTH = 1;
wire [25:0] tree_0_pp_l_0_n_1_n;
sadd_lpm Uadd_0_lut_l_0_n_1_n (.clk(clk), .ain(lut_0_bit_2_fill), .bin(lut_0_bit_3_fill), .res(tree_0_pp_l_0_n_1_n) );
defparam Uadd_0_lut_l_0_n_1_n.IN_WIDTH = 25;
defparam Uadd_0_lut_l_0_n_1_n.PIPE_DEPTH = 1;
wire [25:0] tree_0_pp_l_0_n_2_n;
sadd_lpm Uadd_0_lut_l_0_n_2_n (.clk(clk), .ain(lut_0_bit_4_fill), .bin(lut_0_bit_5_fill), .res(tree_0_pp_l_0_n_2_n) );
defparam Uadd_0_lut_l_0_n_2_n.IN_WIDTH = 25;
defparam Uadd_0_lut_l_0_n_2_n.PIPE_DEPTH = 1;
wire [25:0] tree_0_pp_l_0_n_3_n;
sadd_lpm Uadd_0_lut_l_0_n_3_n (.clk(clk), .ain(lut_0_bit_6_fill), .bin(lut_0_bit_7_fill), .res(tree_0_pp_l_0_n_3_n) );
defparam Uadd_0_lut_l_0_n_3_n.IN_WIDTH = 25;
defparam Uadd_0_lut_l_0_n_3_n.PIPE_DEPTH = 1;
wire [25:0] tree_0_pp_l_0_n_4_n;
sadd_lpm Uadd_0_lut_l_0_n_4_n (.clk(clk), .ain(lut_0_bit_8_fill), .bin(lut_0_bit_9_fill), .res(tree_0_pp_l_0_n_4_n) );
defparam Uadd_0_lut_l_0_n_4_n.IN_WIDTH = 25;
defparam Uadd_0_lut_l_0_n_4_n.PIPE_DEPTH = 1;
wire [25:0] tree_0_pp_l_0_n_5_n;
sadd_lpm Uadd_0_lut_l_0_n_5_n (.clk(clk), .ain(lut_0_bit_10_fill), .bin(lut_0_bit_11_fill), .res(tree_0_pp_l_0_n_5_n) );
defparam Uadd_0_lut_l_0_n_5_n.IN_WIDTH = 25;
defparam Uadd_0_lut_l_0_n_5_n.PIPE_DEPTH = 1;
wire [25:0] tree_0_pp_l_0_n_6_n;
sadd_lpm Uadd_0_lut_l_0_n_6_n (.clk(clk), .ain(lut_0_bit_12_fill), .bin(lut_0_bit_13_fill), .res(tree_0_pp_l_0_n_6_n) );
defparam Uadd_0_lut_l_0_n_6_n.IN_WIDTH = 25;
defparam Uadd_0_lut_l_0_n_6_n.PIPE_DEPTH = 1;
wire [25:0] tree_0_pp_l_0_n_7_n;
sadd_lpm Uadd_0_lut_l_0_n_7_n (.clk(clk), .ain(lut_0_bit_14_fill), .bin(lut_0_bit_15_fill), .res(tree_0_pp_l_0_n_7_n) );
defparam Uadd_0_lut_l_0_n_7_n.IN_WIDTH = 25;
defparam Uadd_0_lut_l_0_n_7_n.PIPE_DEPTH = 1;
wire [25:0] tree_0_pp_l_0_n_8_n;
sadd_lpm Uadd_0_lut_l_0_n_8_n (.clk(clk), .ain(lut_0_bit_16_fill), .bin(25'd0), .res(tree_0_pp_l_0_n_8_n) );
defparam Uadd_0_lut_l_0_n_8_n.IN_WIDTH = 25;
defparam Uadd_0_lut_l_0_n_8_n.PIPE_DEPTH = 1;

wire [26:0] tree_0_pp_l_1_n_0_n;
sadd_lpm Uadd_0_lut_l_1_n_0_n (.clk(clk), .ain(tree_0_pp_l_0_n_0_n), .bin(tree_0_pp_l_0_n_1_n), .res(tree_0_pp_l_1_n_0_n) );
defparam Uadd_0_lut_l_1_n_0_n.IN_WIDTH = 26;
defparam Uadd_0_lut_l_1_n_0_n.PIPE_DEPTH = 1;
wire [26:0] tree_0_pp_l_1_n_1_n;
sadd_lpm Uadd_0_lut_l_1_n_1_n (.clk(clk), .ain(tree_0_pp_l_0_n_2_n), .bin(tree_0_pp_l_0_n_3_n), .res(tree_0_pp_l_1_n_1_n) );
defparam Uadd_0_lut_l_1_n_1_n.IN_WIDTH = 26;
defparam Uadd_0_lut_l_1_n_1_n.PIPE_DEPTH = 1;
wire [26:0] tree_0_pp_l_1_n_2_n;
sadd_lpm Uadd_0_lut_l_1_n_2_n (.clk(clk), .ain(tree_0_pp_l_0_n_4_n), .bin(tree_0_pp_l_0_n_5_n), .res(tree_0_pp_l_1_n_2_n) );
defparam Uadd_0_lut_l_1_n_2_n.IN_WIDTH = 26;
defparam Uadd_0_lut_l_1_n_2_n.PIPE_DEPTH = 1;
wire [26:0] tree_0_pp_l_1_n_3_n;
sadd_lpm Uadd_0_lut_l_1_n_3_n (.clk(clk), .ain(tree_0_pp_l_0_n_6_n), .bin(tree_0_pp_l_0_n_7_n), .res(tree_0_pp_l_1_n_3_n) );
defparam Uadd_0_lut_l_1_n_3_n.IN_WIDTH = 26;
defparam Uadd_0_lut_l_1_n_3_n.PIPE_DEPTH = 1;
wire [26:0] tree_0_pp_l_1_n_4_n;
sadd_lpm Uadd_0_lut_l_1_n_4_n (.clk(clk), .ain(tree_0_pp_l_0_n_8_n), .bin(26'd0), .res(tree_0_pp_l_1_n_4_n) );
defparam Uadd_0_lut_l_1_n_4_n.IN_WIDTH = 26;
defparam Uadd_0_lut_l_1_n_4_n.PIPE_DEPTH = 1;

wire [27:0] tree_0_pp_l_2_n_0_n;
sadd_lpm Uadd_0_lut_l_2_n_0_n (.clk(clk), .ain(tree_0_pp_l_1_n_0_n), .bin(tree_0_pp_l_1_n_1_n), .res(tree_0_pp_l_2_n_0_n) );
defparam Uadd_0_lut_l_2_n_0_n.IN_WIDTH = 27;
defparam Uadd_0_lut_l_2_n_0_n.PIPE_DEPTH = 1;
wire [27:0] tree_0_pp_l_2_n_1_n;
sadd_lpm Uadd_0_lut_l_2_n_1_n (.clk(clk), .ain(tree_0_pp_l_1_n_2_n), .bin(tree_0_pp_l_1_n_3_n), .res(tree_0_pp_l_2_n_1_n) );
defparam Uadd_0_lut_l_2_n_1_n.IN_WIDTH = 27;
defparam Uadd_0_lut_l_2_n_1_n.PIPE_DEPTH = 1;
wire [27:0] tree_0_pp_l_2_n_2_n;
sadd_lpm Uadd_0_lut_l_2_n_2_n (.clk(clk), .ain(tree_0_pp_l_1_n_4_n), .bin(27'd0), .res(tree_0_pp_l_2_n_2_n) );
defparam Uadd_0_lut_l_2_n_2_n.IN_WIDTH = 27;
defparam Uadd_0_lut_l_2_n_2_n.PIPE_DEPTH = 1;

wire [28:0] tree_0_pp_l_3_n_0_n;
sadd_lpm Uadd_0_lut_l_3_n_0_n (.clk(clk), .ain(tree_0_pp_l_2_n_0_n), .bin(tree_0_pp_l_2_n_1_n), .res(tree_0_pp_l_3_n_0_n) );
defparam Uadd_0_lut_l_3_n_0_n.IN_WIDTH = 28;
defparam Uadd_0_lut_l_3_n_0_n.PIPE_DEPTH = 1;
wire [28:0] tree_0_pp_l_3_n_1_n;
sadd_lpm Uadd_0_lut_l_3_n_1_n (.clk(clk), .ain(tree_0_pp_l_2_n_2_n), .bin(28'd0), .res(tree_0_pp_l_3_n_1_n) );
defparam Uadd_0_lut_l_3_n_1_n.IN_WIDTH = 28;
defparam Uadd_0_lut_l_3_n_1_n.PIPE_DEPTH = 1;

wire [29:0] tree_0_pp_l_4_n_0_n;
sadd_lpm Uadd_0_lut_l_4_n_0_n (.clk(clk), .ain(tree_0_pp_l_3_n_0_n), .bin(tree_0_pp_l_3_n_1_n), .res(tree_0_pp_l_4_n_0_n) );
defparam Uadd_0_lut_l_4_n_0_n.IN_WIDTH = 29;
defparam Uadd_0_lut_l_4_n_0_n.PIPE_DEPTH = 1;

wire [29:0] lut_val_0_n;
assign lut_val_0_n=tree_0_pp_l_4_n_0_n;


// ---- final adder tree ----

wire [30:0] fin_atree_l_0_n_0_n;
sadd_lpm Uadd_l_0_n_0_n (.clk(clk), .ain(lut_val_0_n), .bin(30'd0), .res(fin_atree_l_0_n_0_n) );
defparam Uadd_l_0_n_0_n.IN_WIDTH = 30;
defparam Uadd_l_0_n_0_n.PIPE_DEPTH = 1;

wire [30:0] mac_res;
assign mac_res=fin_atree_l_0_n_0_n;
wire [30:0] atree_res;
mac_tl Umtl (.clk(clk), 
             .data_in(mac_res),
             .data_out(atree_res));
defparam Umtl.DATA_WIDTH = 31;

// ---- Adder Tree Complete ---- 
wire [30:0] fir_int_res;
assign fir_int_res = atree_res;

assign fir_result = fir_int_res[ACCUM_WIDTH-1:0];
endmodule
