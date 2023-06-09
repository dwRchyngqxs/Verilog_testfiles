// ==============================================================
// RTL generated by AutoESL - High-Level Synthesis System (C, C++, SystemC)
// Version: 2011.1
// Copyright (C) 2011 Xilinx Inc. All rights reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module rand4_syn (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ce,
        idum,
        idums,
        ap_return
);

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
input   ap_ce;
input  [63:0] idum;
input  [63:0] idums;
output  [31:0] ap_return;

reg ap_done;
reg ap_idle;
reg   [1:0] ap_CS_fsm;
reg   [63:0] idums_read_reg_489;
reg    ap_reg_ppiten_pp0_it0;
reg    ap_reg_ppiten_pp0_it1;
reg    ap_reg_ppiten_pp0_it2;
reg    ap_reg_ppiten_pp0_it3;
reg    ap_reg_ppiten_pp0_it4;
reg    ap_reg_ppiten_pp0_it5;
reg    ap_reg_ppiten_pp0_it6;
reg    ap_reg_ppiten_pp0_it7;
reg    ap_reg_ppiten_pp0_it8;
reg    ap_reg_ppiten_pp0_it9;
reg    ap_reg_ppiten_pp0_it10;
reg   [63:0] ap_reg_ppstg_idums_read_reg_489_pp0_it1;
reg   [63:0] idum_read_reg_494;
reg   [63:0] ap_reg_ppstg_idum_read_reg_494_pp0_it1;
reg   [63:0] ap_reg_ppstg_idum_read_reg_494_pp0_it2;
reg   [63:0] ap_reg_ppstg_idum_read_reg_494_pp0_it3;
wire   [15:0] ia_assign_i_cast_fu_60_p1;
reg   [15:0] ia_assign_i_cast_reg_499;
wire   [63:0] itmph_assign_i_fu_68_p2;
wire   [63:0] grp_fu_74_p2;
reg   [63:0] tmp_1_i_reg_516;
wire   [63:0] grp_fu_80_p2;
reg   [63:0] tmp_6_i_reg_521;
reg   [31:0] ib_assign_7_i_cast_reg_526;
reg   [47:0] tmp_reg_531;
reg   [63:0] iswap_assign_5_i_reg_536;
reg   [63:0] ap_reg_ppstg_iswap_assign_5_i_reg_536_pp0_it2;
reg   [63:0] ap_reg_ppstg_iswap_assign_5_i_reg_536_pp0_it3;
reg   [63:0] ap_reg_ppstg_iswap_assign_5_i_reg_536_pp0_it4;
reg   [63:0] ap_reg_ppstg_iswap_assign_5_i_reg_536_pp0_it5;
wire   [15:0] ia_assign_8_i_cast_fu_163_p1;
reg   [15:0] ia_assign_8_i_cast_reg_542;
wire   [63:0] itmph_assign_8_i_fu_171_p2;
wire   [63:0] grp_fu_177_p2;
reg   [63:0] tmp_9_i_reg_559;
wire   [63:0] grp_fu_183_p2;
reg   [63:0] tmp_13_i_reg_564;
reg   [31:0] ib_assign_5_i_cast_reg_569;
reg   [47:0] tmp_1_reg_574;
reg   [63:0] iswap_assign_3_i_reg_579;
reg   [63:0] ap_reg_ppstg_iswap_assign_3_i_reg_579_pp0_it4;
reg   [63:0] ap_reg_ppstg_iswap_assign_3_i_reg_579_pp0_it5;
reg   [63:0] ap_reg_ppstg_iswap_assign_3_i_reg_579_pp0_it6;
reg   [63:0] ap_reg_ppstg_iswap_assign_3_i_reg_579_pp0_it7;
wire   [15:0] ia_assign_5_i_cast_fu_266_p1;
reg   [15:0] ia_assign_5_i_cast_reg_585;
wire   [63:0] itmph_assign_5_i_fu_274_p2;
wire   [63:0] grp_fu_280_p2;
reg   [63:0] tmp_16_i_reg_602;
wire   [63:0] grp_fu_286_p2;
reg   [63:0] tmp_21_i_reg_607;
reg   [31:0] ib_assign_3_i_cast_reg_612;
reg   [47:0] tmp_2_reg_617;
reg   [63:0] lword_0_i_reg_622;
wire   [15:0] ia_assign_2_i_cast_fu_369_p1;
reg   [15:0] ia_assign_2_i_cast_reg_627;
wire   [63:0] itmph_assign_2_i_fu_377_p2;
wire   [63:0] grp_fu_383_p2;
reg   [63:0] tmp_24_i_reg_644;
wire   [63:0] grp_fu_389_p2;
reg   [63:0] tmp_29_i_reg_649;
reg   [31:0] ib_assign_1_i_cast_reg_654;
reg   [47:0] tmp_3_reg_659;
reg   [22:0] tmp_cast_reg_664;
wire   [31:0] grp_fu_49_p0;
wire   [31:0] grp_fu_49_p1;
wire   [63:0] ia_assign_i_fu_54_p2;
wire   [63:0] grp_fu_74_p0;
wire   [63:0] grp_fu_74_p1;
wire   [15:0] grp_fu_80_p0;
wire   [63:0] grp_fu_80_p1;
wire   [15:0] tmp_i_fu_89_p0;
wire   [31:0] itmpl_assign_i_cast_fu_86_p1;
wire   [15:0] tmp_i_fu_89_p1;
wire   [31:0] tmp_i_fu_89_p2;
wire   [63:0] tmp_i_cast_fu_95_p1;
wire   [63:0] not_i_fu_99_p2;
wire   [63:0] ib_assign_7_i_fu_104_p2;
wire   [31:0] tmp_3_i_fu_124_p2;
wire   [47:0] tmp_4_i_cast_fu_129_p1;
wire   [47:0] ia_assign_9_i_fu_133_p2;
wire   [47:0] tmp_5_i_fu_138_p2;
wire   [63:0] tmp_5_i_cast_fu_144_p1;
wire   [63:0] tmp_7_i_fu_148_p2;
wire   [63:0] ia_assign_8_i_fu_158_p2;
wire   [63:0] grp_fu_177_p0;
wire   [63:0] grp_fu_177_p1;
wire   [15:0] grp_fu_183_p0;
wire   [63:0] grp_fu_183_p1;
wire   [15:0] tmp_8_i_fu_192_p0;
wire   [31:0] itmpl_assign_8_i_cast_fu_189_p1;
wire   [15:0] tmp_8_i_fu_192_p1;
wire   [31:0] tmp_8_i_fu_192_p2;
wire   [63:0] tmp_8_i_cast_fu_198_p1;
wire   [63:0] not2_i_fu_202_p2;
wire   [63:0] ib_assign_5_i_fu_207_p2;
wire   [31:0] tmp_10_i_fu_227_p2;
wire   [47:0] tmp_11_i_cast_fu_232_p1;
wire   [47:0] ia_assign_6_i_fu_236_p2;
wire   [47:0] tmp_12_i_fu_241_p2;
wire   [63:0] tmp_12_i_cast_fu_247_p1;
wire   [63:0] tmp_14_i_fu_251_p2;
wire   [63:0] ia_assign_5_i_fu_261_p2;
wire   [63:0] grp_fu_280_p0;
wire   [63:0] grp_fu_280_p1;
wire   [15:0] grp_fu_286_p0;
wire   [63:0] grp_fu_286_p1;
wire   [15:0] tmp_15_i_fu_295_p0;
wire   [31:0] itmpl_assign_5_i_cast_fu_292_p1;
wire   [15:0] tmp_15_i_fu_295_p1;
wire   [31:0] tmp_15_i_fu_295_p2;
wire   [63:0] tmp_15_i_cast_fu_301_p1;
wire   [63:0] not4_i_fu_305_p2;
wire   [63:0] ib_assign_3_i_fu_310_p2;
wire   [31:0] tmp_18_i_fu_330_p2;
wire   [47:0] tmp_19_i_cast_fu_335_p1;
wire   [47:0] ia_assign_3_i_fu_339_p2;
wire   [47:0] tmp_20_i_fu_344_p2;
wire   [63:0] tmp_20_i_cast_fu_350_p1;
wire   [63:0] tmp_22_i_fu_354_p2;
wire   [63:0] ia_assign_2_i_fu_364_p2;
wire   [63:0] grp_fu_383_p0;
wire   [63:0] grp_fu_383_p1;
wire   [15:0] grp_fu_389_p0;
wire   [63:0] grp_fu_389_p1;
wire   [15:0] tmp_23_i_fu_398_p0;
wire   [31:0] itmpl_assign_2_i_cast_fu_395_p1;
wire   [15:0] tmp_23_i_fu_398_p1;
wire   [31:0] tmp_23_i_fu_398_p2;
wire   [63:0] tmp_23_i_cast_fu_404_p1;
wire   [63:0] not6_i_fu_408_p2;
wire   [63:0] ib_assign_1_i_fu_413_p2;
wire   [31:0] tmp_26_i_fu_433_p2;
wire   [47:0] tmp_27_i_cast_fu_438_p1;
wire   [47:0] ia_i_fu_442_p2;
wire   [47:0] tmp_28_i_fu_447_p2;
wire   [63:0] tmp_28_i_cast_fu_453_p1;
wire   [63:0] tmp_30_i_fu_457_p2;
wire   [63:0] irword_0_i_fu_462_p2;
wire   [29:0] tmp_1_cast_fu_471_p1;
wire   [29:0] tmp1_fu_474_p2;
wire   [31:0] tmp1_cast_fu_480_p1;
wire   [31:0] grp_fu_49_p2;
reg    grp_fu_49_ce;
reg    grp_fu_74_ce;
reg    grp_fu_80_ce;
reg    grp_fu_177_ce;
reg    grp_fu_183_ce;
reg    grp_fu_280_ce;
reg    grp_fu_286_ce;
reg    grp_fu_383_ce;
reg    grp_fu_389_ce;
reg   [1:0] ap_NS_fsm;
reg    ap_sig_pprstidle_pp0;
wire   [63:0] grp_fu_183_p00;
wire   [63:0] grp_fu_286_p00;
wire   [63:0] grp_fu_389_p00;
wire   [63:0] grp_fu_80_p00;
parameter    ap_const_logic_1 = 1'b1;
parameter    ap_const_logic_0 = 1'b0;
parameter    ap_ST_st0_fsm_0 = 2'b00;
parameter    ap_ST_pp0_stg0_fsm_1 = 2'b01;
parameter    ap_ST_pp0_stg1_fsm_2 = 2'b10;
parameter    ap_const_lv32_BF800000 = 32'b10111111100000000000000000000000;
parameter    ap_const_lv64_BAA96887 = 64'b0000000000000000000000000000000010111010101010010110100010000111;
parameter    ap_const_lv64_10 = 64'b0000000000000000000000000000000000000000000000000000000000010000;
parameter    ap_const_lv64_FFFFFFFFFFFFFFFF = 64'b1111111111111111111111111111111111111111111111111111111111111111;
parameter    ap_const_lv32_10 = 32'b00000000000000000000000000010000;
parameter    ap_const_lv32_3F = 32'b00000000000000000000000000111111;
parameter    ap_const_lv48_4B0F3B58 = 48'b000000000000000001001011000011110011101101011000;
parameter    ap_const_lv64_1E17D32C = 64'b0000000000000000000000000000000000011110000101111101001100101100;
parameter    ap_const_lv48_E874F0C3 = 48'b000000000000000011101000011101001111000011000011;
parameter    ap_const_lv64_3BCDC3C = 64'b0000000000000000000000000000000000000011101111001101110000111100;
parameter    ap_const_lv48_6955C5A6 = 48'b000000000000000001101001010101011100010110100110;
parameter    ap_const_lv64_F33D1B2 = 64'b0000000000000000000000000000000000001111001100111101000110110010;
parameter    ap_const_lv48_27CA46 = 48'b000000000000000000000000001001111100101001000110;
parameter    ap_const_lv30_3F800000 = 30'b111111100000000000000000000000;
parameter    ap_true = 1'b1;


rand4_syn_grp_fu_49_ACMP_fadd_1 #(
    .ID( 1 ),
    .NUM_STAGE( 5 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 32 ))
rand4_syn_grp_fu_49_ACMP_fadd_1_U(
    .clk( ap_clk ),
    .reset( ap_rst ),
    .din0( grp_fu_49_p0 ),
    .din1( grp_fu_49_p1 ),
    .ce( grp_fu_49_ce ),
    .dout( grp_fu_49_p2 )
);

rand4_syn_grp_fu_74_ACMP_mul_2 #(
    .ID( 2 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 64 ),
    .din1_WIDTH( 64 ),
    .dout_WIDTH( 64 ))
rand4_syn_grp_fu_74_ACMP_mul_2_U(
    .clk( ap_clk ),
    .reset( ap_rst ),
    .din0( grp_fu_74_p0 ),
    .din1( grp_fu_74_p1 ),
    .ce( grp_fu_74_ce ),
    .dout( grp_fu_74_p2 )
);

rand4_syn_grp_fu_80_ACMP_mul_3 #(
    .ID( 3 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 64 ),
    .dout_WIDTH( 64 ))
rand4_syn_grp_fu_80_ACMP_mul_3_U(
    .clk( ap_clk ),
    .reset( ap_rst ),
    .din0( grp_fu_80_p0 ),
    .din1( grp_fu_80_p1 ),
    .ce( grp_fu_80_ce ),
    .dout( grp_fu_80_p2 )
);

rand4_syn_grp_fu_177_ACMP_mul_4 #(
    .ID( 4 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 64 ),
    .din1_WIDTH( 64 ),
    .dout_WIDTH( 64 ))
rand4_syn_grp_fu_177_ACMP_mul_4_U(
    .clk( ap_clk ),
    .reset( ap_rst ),
    .din0( grp_fu_177_p0 ),
    .din1( grp_fu_177_p1 ),
    .ce( grp_fu_177_ce ),
    .dout( grp_fu_177_p2 )
);

rand4_syn_grp_fu_183_ACMP_mul_5 #(
    .ID( 5 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 64 ),
    .dout_WIDTH( 64 ))
rand4_syn_grp_fu_183_ACMP_mul_5_U(
    .clk( ap_clk ),
    .reset( ap_rst ),
    .din0( grp_fu_183_p0 ),
    .din1( grp_fu_183_p1 ),
    .ce( grp_fu_183_ce ),
    .dout( grp_fu_183_p2 )
);

rand4_syn_grp_fu_280_ACMP_mul_6 #(
    .ID( 6 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 64 ),
    .din1_WIDTH( 64 ),
    .dout_WIDTH( 64 ))
rand4_syn_grp_fu_280_ACMP_mul_6_U(
    .clk( ap_clk ),
    .reset( ap_rst ),
    .din0( grp_fu_280_p0 ),
    .din1( grp_fu_280_p1 ),
    .ce( grp_fu_280_ce ),
    .dout( grp_fu_280_p2 )
);

rand4_syn_grp_fu_286_ACMP_mul_7 #(
    .ID( 7 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 64 ),
    .dout_WIDTH( 64 ))
rand4_syn_grp_fu_286_ACMP_mul_7_U(
    .clk( ap_clk ),
    .reset( ap_rst ),
    .din0( grp_fu_286_p0 ),
    .din1( grp_fu_286_p1 ),
    .ce( grp_fu_286_ce ),
    .dout( grp_fu_286_p2 )
);

rand4_syn_grp_fu_383_ACMP_mul_8 #(
    .ID( 8 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 64 ),
    .din1_WIDTH( 64 ),
    .dout_WIDTH( 64 ))
rand4_syn_grp_fu_383_ACMP_mul_8_U(
    .clk( ap_clk ),
    .reset( ap_rst ),
    .din0( grp_fu_383_p0 ),
    .din1( grp_fu_383_p1 ),
    .ce( grp_fu_383_ce ),
    .dout( grp_fu_383_p2 )
);

rand4_syn_grp_fu_389_ACMP_mul_9 #(
    .ID( 9 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 64 ),
    .dout_WIDTH( 64 ))
rand4_syn_grp_fu_389_ACMP_mul_9_U(
    .clk( ap_clk ),
    .reset( ap_rst ),
    .din0( grp_fu_389_p0 ),
    .din1( grp_fu_389_p1 ),
    .ce( grp_fu_389_ce ),
    .dout( grp_fu_389_p2 )
);



/// ap_CS_fsm assign process. ///
always @ (posedge ap_rst or posedge ap_clk)
begin : ap_ret_ap_CS_fsm
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_st0_fsm_0;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

/// ap_reg_ppiten_pp0_it0 assign process. ///
always @ (posedge ap_rst or posedge ap_clk)
begin : ap_ret_ap_reg_ppiten_pp0_it0
    if (ap_rst == 1'b1) begin
        ap_reg_ppiten_pp0_it0 <= ap_const_logic_0;
    end else begin
        if (((ap_const_logic_1 == ap_ce) & (ap_ST_pp0_stg1_fsm_2 == ap_CS_fsm) & (ap_const_logic_0 == ap_start))) begin
            ap_reg_ppiten_pp0_it0 <= ap_const_logic_0;
        end else if ((((ap_ST_st0_fsm_0 == ap_CS_fsm) & (ap_const_logic_1 == ap_start)) | ((ap_const_logic_1 == ap_ce) & (ap_ST_pp0_stg1_fsm_2 == ap_CS_fsm) & (ap_const_logic_1 == ap_start)) | ((ap_const_logic_1 == ap_ce) & (ap_ST_pp0_stg1_fsm_2 == ap_CS_fsm) & (ap_const_logic_1 == ap_start) & (ap_const_logic_0 == ap_reg_ppiten_pp0_it0) & (ap_const_logic_0 == ap_reg_ppiten_pp0_it1) & (ap_const_logic_0 == ap_reg_ppiten_pp0_it2) & (ap_const_logic_0 == ap_reg_ppiten_pp0_it3) & (ap_const_logic_0 == ap_reg_ppiten_pp0_it4) & (ap_const_logic_0 == ap_reg_ppiten_pp0_it5) & (ap_const_logic_0 == ap_reg_ppiten_pp0_it6) & (ap_const_logic_0 == ap_reg_ppiten_pp0_it7) & (ap_const_logic_0 == ap_reg_ppiten_pp0_it8) & (ap_const_logic_0 == ap_reg_ppiten_pp0_it9)))) begin
            ap_reg_ppiten_pp0_it0 <= ap_const_logic_1;
        end
    end
end

/// ap_reg_ppiten_pp0_it1 assign process. ///
always @ (posedge ap_rst or posedge ap_clk)
begin : ap_ret_ap_reg_ppiten_pp0_it1
    if (ap_rst == 1'b1) begin
        ap_reg_ppiten_pp0_it1 <= ap_const_logic_0;
    end else begin
        if (((ap_const_logic_1 == ap_ce) & (ap_ST_pp0_stg1_fsm_2 == ap_CS_fsm))) begin
            ap_reg_ppiten_pp0_it1 <= ap_reg_ppiten_pp0_it0;
        end
    end
end

/// ap_reg_ppiten_pp0_it10 assign process. ///
always @ (posedge ap_rst or posedge ap_clk)
begin : ap_ret_ap_reg_ppiten_pp0_it10
    if (ap_rst == 1'b1) begin
        ap_reg_ppiten_pp0_it10 <= ap_const_logic_0;
    end else begin
        if (((ap_const_logic_1 == ap_ce) & (ap_ST_pp0_stg1_fsm_2 == ap_CS_fsm))) begin
            ap_reg_ppiten_pp0_it10 <= ap_reg_ppiten_pp0_it9;
        end
    end
end

/// ap_reg_ppiten_pp0_it2 assign process. ///
always @ (posedge ap_rst or posedge ap_clk)
begin : ap_ret_ap_reg_ppiten_pp0_it2
    if (ap_rst == 1'b1) begin
        ap_reg_ppiten_pp0_it2 <= ap_const_logic_0;
    end else begin
        if (((ap_const_logic_1 == ap_ce) & (ap_ST_pp0_stg1_fsm_2 == ap_CS_fsm))) begin
            ap_reg_ppiten_pp0_it2 <= ap_reg_ppiten_pp0_it1;
        end
    end
end

/// ap_reg_ppiten_pp0_it3 assign process. ///
always @ (posedge ap_rst or posedge ap_clk)
begin : ap_ret_ap_reg_ppiten_pp0_it3
    if (ap_rst == 1'b1) begin
        ap_reg_ppiten_pp0_it3 <= ap_const_logic_0;
    end else begin
        if (((ap_const_logic_1 == ap_ce) & (ap_ST_pp0_stg1_fsm_2 == ap_CS_fsm))) begin
            ap_reg_ppiten_pp0_it3 <= ap_reg_ppiten_pp0_it2;
        end
    end
end

/// ap_reg_ppiten_pp0_it4 assign process. ///
always @ (posedge ap_rst or posedge ap_clk)
begin : ap_ret_ap_reg_ppiten_pp0_it4
    if (ap_rst == 1'b1) begin
        ap_reg_ppiten_pp0_it4 <= ap_const_logic_0;
    end else begin
        if (((ap_const_logic_1 == ap_ce) & (ap_ST_pp0_stg1_fsm_2 == ap_CS_fsm))) begin
            ap_reg_ppiten_pp0_it4 <= ap_reg_ppiten_pp0_it3;
        end
    end
end

/// ap_reg_ppiten_pp0_it5 assign process. ///
always @ (posedge ap_rst or posedge ap_clk)
begin : ap_ret_ap_reg_ppiten_pp0_it5
    if (ap_rst == 1'b1) begin
        ap_reg_ppiten_pp0_it5 <= ap_const_logic_0;
    end else begin
        if (((ap_const_logic_1 == ap_ce) & (ap_ST_pp0_stg1_fsm_2 == ap_CS_fsm))) begin
            ap_reg_ppiten_pp0_it5 <= ap_reg_ppiten_pp0_it4;
        end
    end
end

/// ap_reg_ppiten_pp0_it6 assign process. ///
always @ (posedge ap_rst or posedge ap_clk)
begin : ap_ret_ap_reg_ppiten_pp0_it6
    if (ap_rst == 1'b1) begin
        ap_reg_ppiten_pp0_it6 <= ap_const_logic_0;
    end else begin
        if (((ap_const_logic_1 == ap_ce) & (ap_ST_pp0_stg1_fsm_2 == ap_CS_fsm))) begin
            ap_reg_ppiten_pp0_it6 <= ap_reg_ppiten_pp0_it5;
        end
    end
end

/// ap_reg_ppiten_pp0_it7 assign process. ///
always @ (posedge ap_rst or posedge ap_clk)
begin : ap_ret_ap_reg_ppiten_pp0_it7
    if (ap_rst == 1'b1) begin
        ap_reg_ppiten_pp0_it7 <= ap_const_logic_0;
    end else begin
        if (((ap_const_logic_1 == ap_ce) & (ap_ST_pp0_stg1_fsm_2 == ap_CS_fsm))) begin
            ap_reg_ppiten_pp0_it7 <= ap_reg_ppiten_pp0_it6;
        end
    end
end

/// ap_reg_ppiten_pp0_it8 assign process. ///
always @ (posedge ap_rst or posedge ap_clk)
begin : ap_ret_ap_reg_ppiten_pp0_it8
    if (ap_rst == 1'b1) begin
        ap_reg_ppiten_pp0_it8 <= ap_const_logic_0;
    end else begin
        if (((ap_const_logic_1 == ap_ce) & (ap_ST_pp0_stg1_fsm_2 == ap_CS_fsm))) begin
            ap_reg_ppiten_pp0_it8 <= ap_reg_ppiten_pp0_it7;
        end
    end
end

/// ap_reg_ppiten_pp0_it9 assign process. ///
always @ (posedge ap_rst or posedge ap_clk)
begin : ap_ret_ap_reg_ppiten_pp0_it9
    if (ap_rst == 1'b1) begin
        ap_reg_ppiten_pp0_it9 <= ap_const_logic_0;
    end else begin
        if (((ap_const_logic_1 == ap_ce) & (ap_ST_pp0_stg1_fsm_2 == ap_CS_fsm))) begin
            ap_reg_ppiten_pp0_it9 <= ap_reg_ppiten_pp0_it8;
        end
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_const_logic_1 == ap_ce) & (ap_ST_pp0_stg0_fsm_1 == ap_CS_fsm))) begin
        ap_reg_ppstg_idum_read_reg_494_pp0_it1 <= idum_read_reg_494;
    end
    if (((ap_const_logic_1 == ap_ce) & (ap_ST_pp0_stg0_fsm_1 == ap_CS_fsm))) begin
        ap_reg_ppstg_idum_read_reg_494_pp0_it2 <= ap_reg_ppstg_idum_read_reg_494_pp0_it1;
    end
    if (((ap_const_logic_1 == ap_ce) & (ap_ST_pp0_stg0_fsm_1 == ap_CS_fsm))) begin
        ap_reg_ppstg_idum_read_reg_494_pp0_it3 <= ap_reg_ppstg_idum_read_reg_494_pp0_it2;
    end
    if (((ap_const_logic_1 == ap_ce) & (ap_ST_pp0_stg0_fsm_1 == ap_CS_fsm))) begin
        ap_reg_ppstg_idums_read_reg_489_pp0_it1 <= idums_read_reg_489;
    end
    if (((ap_const_logic_1 == ap_ce) & (ap_ST_pp0_stg1_fsm_2 == ap_CS_fsm))) begin
        ap_reg_ppstg_iswap_assign_3_i_reg_579_pp0_it4 <= iswap_assign_3_i_reg_579;
    end
    if (((ap_const_logic_1 == ap_ce) & (ap_ST_pp0_stg1_fsm_2 == ap_CS_fsm))) begin
        ap_reg_ppstg_iswap_assign_3_i_reg_579_pp0_it5 <= ap_reg_ppstg_iswap_assign_3_i_reg_579_pp0_it4;
    end
    if (((ap_const_logic_1 == ap_ce) & (ap_ST_pp0_stg1_fsm_2 == ap_CS_fsm))) begin
        ap_reg_ppstg_iswap_assign_3_i_reg_579_pp0_it6 <= ap_reg_ppstg_iswap_assign_3_i_reg_579_pp0_it5;
    end
    if (((ap_const_logic_1 == ap_ce) & (ap_ST_pp0_stg1_fsm_2 == ap_CS_fsm))) begin
        ap_reg_ppstg_iswap_assign_3_i_reg_579_pp0_it7 <= ap_reg_ppstg_iswap_assign_3_i_reg_579_pp0_it6;
    end
    if (((ap_const_logic_1 == ap_ce) & (ap_ST_pp0_stg1_fsm_2 == ap_CS_fsm))) begin
        ap_reg_ppstg_iswap_assign_5_i_reg_536_pp0_it2 <= iswap_assign_5_i_reg_536;
    end
    if (((ap_const_logic_1 == ap_ce) & (ap_ST_pp0_stg1_fsm_2 == ap_CS_fsm))) begin
        ap_reg_ppstg_iswap_assign_5_i_reg_536_pp0_it3 <= ap_reg_ppstg_iswap_assign_5_i_reg_536_pp0_it2;
    end
    if (((ap_const_logic_1 == ap_ce) & (ap_ST_pp0_stg1_fsm_2 == ap_CS_fsm))) begin
        ap_reg_ppstg_iswap_assign_5_i_reg_536_pp0_it4 <= ap_reg_ppstg_iswap_assign_5_i_reg_536_pp0_it3;
    end
    if (((ap_const_logic_1 == ap_ce) & (ap_ST_pp0_stg1_fsm_2 == ap_CS_fsm))) begin
        ap_reg_ppstg_iswap_assign_5_i_reg_536_pp0_it5 <= ap_reg_ppstg_iswap_assign_5_i_reg_536_pp0_it4;
    end
    if (((ap_const_logic_1 == ap_ce) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it6) & (ap_ST_pp0_stg1_fsm_2 == ap_CS_fsm))) begin
        ia_assign_2_i_cast_reg_627 <= ia_assign_2_i_fu_364_p2[15:0];
    end
    if (((ap_const_logic_1 == ap_ce) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it4) & (ap_ST_pp0_stg1_fsm_2 == ap_CS_fsm))) begin
        ia_assign_5_i_cast_reg_585 <= ia_assign_5_i_fu_261_p2[15:0];
    end
    if (((ap_const_logic_1 == ap_ce) & (ap_ST_pp0_stg0_fsm_1 == ap_CS_fsm) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2))) begin
        ia_assign_8_i_cast_reg_542 <= ia_assign_8_i_fu_158_p2[15:0];
    end
    if (((ap_const_logic_1 == ap_ce) & (ap_ST_pp0_stg0_fsm_1 == ap_CS_fsm) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0))) begin
        ia_assign_i_cast_reg_499 <= ia_assign_i_fu_54_p2[15:0];
    end
    if (((ap_const_logic_1 == ap_ce) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it7) & (ap_ST_pp0_stg1_fsm_2 == ap_CS_fsm))) begin
        ib_assign_1_i_cast_reg_654 <= ib_assign_1_i_fu_413_p2[31:0];
    end
    if (((ap_const_logic_1 == ap_ce) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it5) & (ap_ST_pp0_stg1_fsm_2 == ap_CS_fsm))) begin
        ib_assign_3_i_cast_reg_612 <= ib_assign_3_i_fu_310_p2[31:0];
    end
    if (((ap_const_logic_1 == ap_ce) & (ap_ST_pp0_stg0_fsm_1 == ap_CS_fsm) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it3))) begin
        ib_assign_5_i_cast_reg_569 <= ib_assign_5_i_fu_207_p2[31:0];
    end
    if (((ap_const_logic_1 == ap_ce) & (ap_ST_pp0_stg0_fsm_1 == ap_CS_fsm) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1))) begin
        ib_assign_7_i_cast_reg_526 <= ib_assign_7_i_fu_104_p2[31:0];
    end
    if (((ap_const_logic_1 == ap_ce) & (ap_ST_pp0_stg0_fsm_1 == ap_CS_fsm) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0))) begin
        idum_read_reg_494 <= idum;
    end
    if (((ap_const_logic_1 == ap_ce) & (ap_ST_pp0_stg0_fsm_1 == ap_CS_fsm) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0))) begin
        idums_read_reg_489 <= idums;
    end
    if (((ap_const_logic_1 == ap_ce) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it3) & (ap_ST_pp0_stg1_fsm_2 == ap_CS_fsm))) begin
        iswap_assign_3_i_reg_579 <= (tmp_14_i_fu_251_p2 ^ ap_reg_ppstg_idum_read_reg_494_pp0_it3);
    end
    if (((ap_const_logic_1 == ap_ce) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1) & (ap_ST_pp0_stg1_fsm_2 == ap_CS_fsm))) begin
        iswap_assign_5_i_reg_536 <= (tmp_7_i_fu_148_p2 ^ ap_reg_ppstg_idums_read_reg_489_pp0_it1);
    end
    if (((ap_const_logic_1 == ap_ce) & (ap_ST_pp0_stg0_fsm_1 == ap_CS_fsm) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it6))) begin
        lword_0_i_reg_622 <= (tmp_22_i_fu_354_p2 ^ ap_reg_ppstg_iswap_assign_5_i_reg_536_pp0_it5);
    end
    if (((ap_const_logic_1 == ap_ce) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2) & (ap_ST_pp0_stg1_fsm_2 == ap_CS_fsm))) begin
        tmp_13_i_reg_564 <= grp_fu_183_p2;
    end
    if (((ap_const_logic_1 == ap_ce) & (ap_ST_pp0_stg0_fsm_1 == ap_CS_fsm) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it5))) begin
        tmp_16_i_reg_602 <= grp_fu_280_p2;
    end
    if (((ap_const_logic_1 == ap_ce) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & (ap_ST_pp0_stg1_fsm_2 == ap_CS_fsm))) begin
        tmp_1_i_reg_516 <= grp_fu_74_p2;
    end
    if (((ap_const_logic_1 == ap_ce) & (ap_ST_pp0_stg0_fsm_1 == ap_CS_fsm) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it3))) begin
        tmp_1_reg_574 <= {{ib_assign_5_i_fu_207_p2[ap_const_lv32_3F : ap_const_lv32_10]}};
    end
    if (((ap_const_logic_1 == ap_ce) & (ap_ST_pp0_stg0_fsm_1 == ap_CS_fsm) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it5))) begin
        tmp_21_i_reg_607 <= grp_fu_286_p2;
    end
    if (((ap_const_logic_1 == ap_ce) & (ap_ST_pp0_stg0_fsm_1 == ap_CS_fsm) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it7))) begin
        tmp_24_i_reg_644 <= grp_fu_383_p2;
    end
    if (((ap_const_logic_1 == ap_ce) & (ap_ST_pp0_stg0_fsm_1 == ap_CS_fsm) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it7))) begin
        tmp_29_i_reg_649 <= grp_fu_389_p2;
    end
    if (((ap_const_logic_1 == ap_ce) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it5) & (ap_ST_pp0_stg1_fsm_2 == ap_CS_fsm))) begin
        tmp_2_reg_617 <= {{ib_assign_3_i_fu_310_p2[ap_const_lv32_3F : ap_const_lv32_10]}};
    end
    if (((ap_const_logic_1 == ap_ce) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it7) & (ap_ST_pp0_stg1_fsm_2 == ap_CS_fsm))) begin
        tmp_3_reg_659 <= {{ib_assign_1_i_fu_413_p2[ap_const_lv32_3F : ap_const_lv32_10]}};
    end
    if (((ap_const_logic_1 == ap_ce) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & (ap_ST_pp0_stg1_fsm_2 == ap_CS_fsm))) begin
        tmp_6_i_reg_521 <= grp_fu_80_p2;
    end
    if (((ap_const_logic_1 == ap_ce) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2) & (ap_ST_pp0_stg1_fsm_2 == ap_CS_fsm))) begin
        tmp_9_i_reg_559 <= grp_fu_177_p2;
    end
    if (((ap_const_logic_1 == ap_ce) & (ap_ST_pp0_stg0_fsm_1 == ap_CS_fsm) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it8))) begin
        tmp_cast_reg_664 <= irword_0_i_fu_462_p2[22:0];
    end
    if (((ap_const_logic_1 == ap_ce) & (ap_ST_pp0_stg0_fsm_1 == ap_CS_fsm) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1))) begin
        tmp_reg_531 <= {{ib_assign_7_i_fu_104_p2[ap_const_lv32_3F : ap_const_lv32_10]}};
    end
end

/// ap_NS_fsm assign process. ///
always @ (ap_start or ap_CS_fsm or ap_ce or ap_sig_pprstidle_pp0)
begin
    if (((ap_const_logic_1 == ap_ce) & (ap_ST_pp0_stg1_fsm_2 == ap_CS_fsm) & (ap_const_logic_1 == ap_sig_pprstidle_pp0))) begin
        ap_NS_fsm = ap_ST_st0_fsm_0;
    end else if (((ap_const_logic_1 == ap_ce) & (ap_ST_pp0_stg0_fsm_1 == ap_CS_fsm))) begin
        ap_NS_fsm = ap_ST_pp0_stg1_fsm_2;
    end else if ((((ap_ST_st0_fsm_0 == ap_CS_fsm) & (ap_const_logic_1 == ap_start)) | ((ap_const_logic_1 == ap_ce) & (ap_ST_pp0_stg1_fsm_2 == ap_CS_fsm) & ~((ap_const_logic_1 == ap_ce) & (ap_const_logic_1 == ap_sig_pprstidle_pp0))))) begin
        ap_NS_fsm = ap_ST_pp0_stg0_fsm_1;
    end else begin
        ap_NS_fsm = ap_CS_fsm;
    end
end

/// ap_done assign process. ///
always @ (ap_CS_fsm or ap_ce or ap_reg_ppiten_pp0_it10)
begin
    if (((ap_ST_st0_fsm_0 == ap_CS_fsm) | ((ap_const_logic_1 == ap_ce) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it10) & (ap_ST_pp0_stg1_fsm_2 == ap_CS_fsm)))) begin
        ap_done = ap_const_logic_1;
    end else begin
        ap_done = ap_const_logic_0;
    end
end

/// ap_idle assign process. ///
always @ (ap_CS_fsm or ap_ce)
begin
    if (((ap_ST_st0_fsm_0 == ap_CS_fsm) & (ap_const_logic_1 == ap_ce))) begin
        ap_idle = ap_const_logic_1;
    end else begin
        ap_idle = ap_const_logic_0;
    end
end

/// ap_sig_pprstidle_pp0 assign process. ///
always @ (ap_start or ap_reg_ppiten_pp0_it0 or ap_reg_ppiten_pp0_it1 or ap_reg_ppiten_pp0_it2 or ap_reg_ppiten_pp0_it3 or ap_reg_ppiten_pp0_it4 or ap_reg_ppiten_pp0_it5 or ap_reg_ppiten_pp0_it6 or ap_reg_ppiten_pp0_it7 or ap_reg_ppiten_pp0_it8 or ap_reg_ppiten_pp0_it9)
begin
    if (((ap_const_logic_0 == ap_reg_ppiten_pp0_it0) & (ap_const_logic_0 == ap_reg_ppiten_pp0_it1) & (ap_const_logic_0 == ap_reg_ppiten_pp0_it2) & (ap_const_logic_0 == ap_reg_ppiten_pp0_it3) & (ap_const_logic_0 == ap_reg_ppiten_pp0_it4) & (ap_const_logic_0 == ap_reg_ppiten_pp0_it5) & (ap_const_logic_0 == ap_reg_ppiten_pp0_it6) & (ap_const_logic_0 == ap_reg_ppiten_pp0_it7) & (ap_const_logic_0 == ap_reg_ppiten_pp0_it8) & (ap_const_logic_0 == ap_reg_ppiten_pp0_it9) & (ap_const_logic_0 == ap_start))) begin
        ap_sig_pprstidle_pp0 = ap_const_logic_1;
    end else begin
        ap_sig_pprstidle_pp0 = ap_const_logic_0;
    end
end

/// grp_fu_177_ce assign process. ///
always @ (ap_CS_fsm or ap_ce)
begin
    if (((ap_ST_st0_fsm_0 == ap_CS_fsm) | ~(ap_const_logic_1 == ap_ce))) begin
        grp_fu_177_ce = ap_const_logic_0;
    end else begin
        grp_fu_177_ce = ap_const_logic_1;
    end
end

/// grp_fu_183_ce assign process. ///
always @ (ap_CS_fsm or ap_ce)
begin
    if (((ap_ST_st0_fsm_0 == ap_CS_fsm) | ~(ap_const_logic_1 == ap_ce))) begin
        grp_fu_183_ce = ap_const_logic_0;
    end else begin
        grp_fu_183_ce = ap_const_logic_1;
    end
end

/// grp_fu_280_ce assign process. ///
always @ (ap_CS_fsm or ap_ce)
begin
    if (((ap_ST_st0_fsm_0 == ap_CS_fsm) | ~(ap_const_logic_1 == ap_ce))) begin
        grp_fu_280_ce = ap_const_logic_0;
    end else begin
        grp_fu_280_ce = ap_const_logic_1;
    end
end

/// grp_fu_286_ce assign process. ///
always @ (ap_CS_fsm or ap_ce)
begin
    if (((ap_ST_st0_fsm_0 == ap_CS_fsm) | ~(ap_const_logic_1 == ap_ce))) begin
        grp_fu_286_ce = ap_const_logic_0;
    end else begin
        grp_fu_286_ce = ap_const_logic_1;
    end
end

/// grp_fu_383_ce assign process. ///
always @ (ap_CS_fsm or ap_ce)
begin
    if (((ap_ST_st0_fsm_0 == ap_CS_fsm) | ~(ap_const_logic_1 == ap_ce))) begin
        grp_fu_383_ce = ap_const_logic_0;
    end else begin
        grp_fu_383_ce = ap_const_logic_1;
    end
end

/// grp_fu_389_ce assign process. ///
always @ (ap_CS_fsm or ap_ce)
begin
    if (((ap_ST_st0_fsm_0 == ap_CS_fsm) | ~(ap_const_logic_1 == ap_ce))) begin
        grp_fu_389_ce = ap_const_logic_0;
    end else begin
        grp_fu_389_ce = ap_const_logic_1;
    end
end

/// grp_fu_49_ce assign process. ///
always @ (ap_CS_fsm or ap_ce)
begin
    if (((ap_ST_st0_fsm_0 == ap_CS_fsm) | ~(ap_const_logic_1 == ap_ce))) begin
        grp_fu_49_ce = ap_const_logic_0;
    end else begin
        grp_fu_49_ce = ap_const_logic_1;
    end
end

/// grp_fu_74_ce assign process. ///
always @ (ap_CS_fsm or ap_ce)
begin
    if (((ap_ST_st0_fsm_0 == ap_CS_fsm) | ~(ap_const_logic_1 == ap_ce))) begin
        grp_fu_74_ce = ap_const_logic_0;
    end else begin
        grp_fu_74_ce = ap_const_logic_1;
    end
end

/// grp_fu_80_ce assign process. ///
always @ (ap_CS_fsm or ap_ce)
begin
    if (((ap_ST_st0_fsm_0 == ap_CS_fsm) | ~(ap_const_logic_1 == ap_ce))) begin
        grp_fu_80_ce = ap_const_logic_0;
    end else begin
        grp_fu_80_ce = ap_const_logic_1;
    end
end
assign ap_return = grp_fu_49_p2;
assign grp_fu_177_p0 = itmph_assign_8_i_fu_171_p2;
assign grp_fu_177_p1 = itmph_assign_8_i_fu_171_p2;
assign grp_fu_183_p0 = grp_fu_183_p00;
assign grp_fu_183_p00 = {{48{1'b0}}, {ia_assign_8_i_cast_fu_163_p1}};
assign grp_fu_183_p1 = itmph_assign_8_i_fu_171_p2;
assign grp_fu_280_p0 = itmph_assign_5_i_fu_274_p2;
assign grp_fu_280_p1 = itmph_assign_5_i_fu_274_p2;
assign grp_fu_286_p0 = grp_fu_286_p00;
assign grp_fu_286_p00 = {{48{1'b0}}, {ia_assign_5_i_cast_fu_266_p1}};
assign grp_fu_286_p1 = itmph_assign_5_i_fu_274_p2;
assign grp_fu_383_p0 = itmph_assign_2_i_fu_377_p2;
assign grp_fu_383_p1 = itmph_assign_2_i_fu_377_p2;
assign grp_fu_389_p0 = grp_fu_389_p00;
assign grp_fu_389_p00 = {{48{1'b0}}, {ia_assign_2_i_cast_fu_369_p1}};
assign grp_fu_389_p1 = itmph_assign_2_i_fu_377_p2;
assign grp_fu_49_p0 = tmp1_cast_fu_480_p1;
assign grp_fu_49_p1 = ap_const_lv32_BF800000;
assign grp_fu_74_p0 = itmph_assign_i_fu_68_p2;
assign grp_fu_74_p1 = itmph_assign_i_fu_68_p2;
assign grp_fu_80_p0 = grp_fu_80_p00;
assign grp_fu_80_p00 = {{48{1'b0}}, {ia_assign_i_cast_fu_60_p1}};
assign grp_fu_80_p1 = itmph_assign_i_fu_68_p2;
assign ia_assign_2_i_cast_fu_369_p1 = ia_assign_2_i_fu_364_p2[15:0];
assign ia_assign_2_i_fu_364_p2 = (lword_0_i_reg_622 ^ ap_const_lv64_F33D1B2);
assign ia_assign_3_i_fu_339_p2 = (tmp_19_i_cast_fu_335_p1 | tmp_2_reg_617);
assign ia_assign_5_i_cast_fu_266_p1 = ia_assign_5_i_fu_261_p2[15:0];
assign ia_assign_5_i_fu_261_p2 = (iswap_assign_3_i_reg_579 ^ ap_const_lv64_3BCDC3C);
assign ia_assign_6_i_fu_236_p2 = (tmp_11_i_cast_fu_232_p1 | tmp_1_reg_574);
assign ia_assign_8_i_cast_fu_163_p1 = ia_assign_8_i_fu_158_p2[15:0];
assign ia_assign_8_i_fu_158_p2 = (iswap_assign_5_i_reg_536 ^ ap_const_lv64_1E17D32C);
assign ia_assign_9_i_fu_133_p2 = (tmp_4_i_cast_fu_129_p1 | tmp_reg_531);
assign ia_assign_i_cast_fu_60_p1 = ia_assign_i_fu_54_p2[15:0];
assign ia_assign_i_fu_54_p2 = (idum ^ ap_const_lv64_BAA96887);
assign ia_i_fu_442_p2 = (tmp_27_i_cast_fu_438_p1 | tmp_3_reg_659);
assign ib_assign_1_i_fu_413_p2 = (tmp_23_i_cast_fu_404_p1 + not6_i_fu_408_p2);
assign ib_assign_3_i_fu_310_p2 = (tmp_15_i_cast_fu_301_p1 + not4_i_fu_305_p2);
assign ib_assign_5_i_fu_207_p2 = (tmp_8_i_cast_fu_198_p1 + not2_i_fu_202_p2);
assign ib_assign_7_i_fu_104_p2 = (tmp_i_cast_fu_95_p1 + not_i_fu_99_p2);
assign irword_0_i_fu_462_p2 = (tmp_30_i_fu_457_p2 ^ ap_reg_ppstg_iswap_assign_3_i_reg_579_pp0_it7);
assign itmph_assign_2_i_fu_377_p2 = ia_assign_2_i_fu_364_p2 >> ap_const_lv64_10;
assign itmph_assign_5_i_fu_274_p2 = ia_assign_5_i_fu_261_p2 >> ap_const_lv64_10;
assign itmph_assign_8_i_fu_171_p2 = ia_assign_8_i_fu_158_p2 >> ap_const_lv64_10;
assign itmph_assign_i_fu_68_p2 = ia_assign_i_fu_54_p2 >> ap_const_lv64_10;
assign itmpl_assign_2_i_cast_fu_395_p1 = {{16{1'b0}}, {ia_assign_2_i_cast_reg_627}};
assign itmpl_assign_5_i_cast_fu_292_p1 = {{16{1'b0}}, {ia_assign_5_i_cast_reg_585}};
assign itmpl_assign_8_i_cast_fu_189_p1 = {{16{1'b0}}, {ia_assign_8_i_cast_reg_542}};
assign itmpl_assign_i_cast_fu_86_p1 = {{16{1'b0}}, {ia_assign_i_cast_reg_499}};
assign not2_i_fu_202_p2 = (tmp_9_i_reg_559 ^ ap_const_lv64_FFFFFFFFFFFFFFFF);
assign not4_i_fu_305_p2 = (tmp_16_i_reg_602 ^ ap_const_lv64_FFFFFFFFFFFFFFFF);
assign not6_i_fu_408_p2 = (tmp_24_i_reg_644 ^ ap_const_lv64_FFFFFFFFFFFFFFFF);
assign not_i_fu_99_p2 = (tmp_1_i_reg_516 ^ ap_const_lv64_FFFFFFFFFFFFFFFF);
assign tmp1_cast_fu_480_p1 = {{2{1'b0}}, {tmp1_fu_474_p2}};
assign tmp1_fu_474_p2 = (tmp_1_cast_fu_471_p1 | ap_const_lv30_3F800000);
assign tmp_10_i_fu_227_p2 = ib_assign_5_i_cast_reg_569 << ap_const_lv32_10;
assign tmp_11_i_cast_fu_232_p1 = {{16{1'b0}}, {tmp_10_i_fu_227_p2}};
assign tmp_12_i_cast_fu_247_p1 = {{16{1'b0}}, {tmp_12_i_fu_241_p2}};
assign tmp_12_i_fu_241_p2 = (ia_assign_6_i_fu_236_p2 ^ ap_const_lv48_E874F0C3);
assign tmp_14_i_fu_251_p2 = (tmp_12_i_cast_fu_247_p1 + tmp_13_i_reg_564);
assign tmp_15_i_cast_fu_301_p1 = {{32{1'b0}}, {tmp_15_i_fu_295_p2}};
assign tmp_15_i_fu_295_p0 = itmpl_assign_5_i_cast_fu_292_p1;
assign tmp_15_i_fu_295_p1 = itmpl_assign_5_i_cast_fu_292_p1;
assign tmp_15_i_fu_295_p2 = (tmp_15_i_fu_295_p0 * tmp_15_i_fu_295_p1);
assign tmp_18_i_fu_330_p2 = ib_assign_3_i_cast_reg_612 << ap_const_lv32_10;
assign tmp_19_i_cast_fu_335_p1 = {{16{1'b0}}, {tmp_18_i_fu_330_p2}};
assign tmp_1_cast_fu_471_p1 = {{7{1'b0}}, {tmp_cast_reg_664}};
assign tmp_20_i_cast_fu_350_p1 = {{16{1'b0}}, {tmp_20_i_fu_344_p2}};
assign tmp_20_i_fu_344_p2 = (ia_assign_3_i_fu_339_p2 ^ ap_const_lv48_6955C5A6);
assign tmp_22_i_fu_354_p2 = (tmp_20_i_cast_fu_350_p1 + tmp_21_i_reg_607);
assign tmp_23_i_cast_fu_404_p1 = {{32{1'b0}}, {tmp_23_i_fu_398_p2}};
assign tmp_23_i_fu_398_p0 = itmpl_assign_2_i_cast_fu_395_p1;
assign tmp_23_i_fu_398_p1 = itmpl_assign_2_i_cast_fu_395_p1;
assign tmp_23_i_fu_398_p2 = (tmp_23_i_fu_398_p0 * tmp_23_i_fu_398_p1);
assign tmp_26_i_fu_433_p2 = ib_assign_1_i_cast_reg_654 << ap_const_lv32_10;
assign tmp_27_i_cast_fu_438_p1 = {{16{1'b0}}, {tmp_26_i_fu_433_p2}};
assign tmp_28_i_cast_fu_453_p1 = {{16{1'b0}}, {tmp_28_i_fu_447_p2}};
assign tmp_28_i_fu_447_p2 = (ia_i_fu_442_p2 ^ ap_const_lv48_27CA46);
assign tmp_30_i_fu_457_p2 = (tmp_28_i_cast_fu_453_p1 + tmp_29_i_reg_649);
assign tmp_3_i_fu_124_p2 = ib_assign_7_i_cast_reg_526 << ap_const_lv32_10;
assign tmp_4_i_cast_fu_129_p1 = {{16{1'b0}}, {tmp_3_i_fu_124_p2}};
assign tmp_5_i_cast_fu_144_p1 = {{16{1'b0}}, {tmp_5_i_fu_138_p2}};
assign tmp_5_i_fu_138_p2 = (ia_assign_9_i_fu_133_p2 ^ ap_const_lv48_4B0F3B58);
assign tmp_7_i_fu_148_p2 = (tmp_5_i_cast_fu_144_p1 + tmp_6_i_reg_521);
assign tmp_8_i_cast_fu_198_p1 = {{32{1'b0}}, {tmp_8_i_fu_192_p2}};
assign tmp_8_i_fu_192_p0 = itmpl_assign_8_i_cast_fu_189_p1;
assign tmp_8_i_fu_192_p1 = itmpl_assign_8_i_cast_fu_189_p1;
assign tmp_8_i_fu_192_p2 = (tmp_8_i_fu_192_p0 * tmp_8_i_fu_192_p1);
assign tmp_i_cast_fu_95_p1 = {{32{1'b0}}, {tmp_i_fu_89_p2}};
assign tmp_i_fu_89_p0 = itmpl_assign_i_cast_fu_86_p1;
assign tmp_i_fu_89_p1 = itmpl_assign_i_cast_fu_86_p1;
assign tmp_i_fu_89_p2 = (tmp_i_fu_89_p0 * tmp_i_fu_89_p1);


endmodule //rand4_syn

