// ==============================================================
// RTL generated by AutoPilot - High-Level Synthesis System (C, C++, SystemC)
// Version: 2010.a.3
// Copyright (C) :2006-2010 AutoESL Design Technologies, Inc.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module write_r (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        index,
        bus_r_req_din,
        bus_r_req_full_n,
        bus_r_req_write,
        bus_r_rsp_dout,
        bus_r_rsp_empty_n,
        bus_r_rsp_read,
        bus_r_address,
        bus_r_datain,
        bus_r_dataout,
        bus_r_size,
        array_r_address0,
        array_r_ce0,
        array_r_q0
);

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
input  [5:0] index;
output   bus_r_req_din;
input   bus_r_req_full_n;
output   bus_r_req_write;
input   bus_r_rsp_dout;
input   bus_r_rsp_empty_n;
output   bus_r_rsp_read;
output  [31:0] bus_r_address;
input  [31:0] bus_r_datain;
output  [31:0] bus_r_dataout;
output  [31:0] bus_r_size;
output  [12:0] array_r_address0;
output   array_r_ce0;
input  [31:0] array_r_q0;

reg ap_done;
reg ap_idle;
reg bus_r_req_din;
reg bus_r_req_write;
reg array_r_ce0;
reg   [1:0] ap_CS_fsm;
reg   [12:0] indvar_flatten_reg_62;
reg   [6:0] i_reg_73;
reg   [6:0] j_reg_84;
wire   [19:0] tmp1_cast_fu_106_p1;
reg   [19:0] tmp1_cast_reg_226;
wire   [0:0] exitcond_fu_110_p2;
reg   [0:0] exitcond_reg_231;
reg    ap_reg_ppiten_pp0_it0;
reg    ap_reg_ppiten_pp0_it1;
reg   [0:0] ap_reg_ppstg_exitcond_reg_231_pp0_it1;
reg    ap_sig_bdd_59;
reg    ap_reg_ppiten_pp0_it2;
reg    ap_reg_ppiten_pp0_it3;
reg   [12:0] indvar_next_reg_235;
wire   [6:0] i_mid_fu_142_p3;
reg   [6:0] i_mid_reg_240;
reg   [20:0] tmp3_reg_245;
reg   [20:0] ap_reg_ppstg_tmp3_reg_245_pp0_it1;
reg   [6:0] indvar_next1_reg_255;
reg   [31:0] array_load_reg_260;
reg   [12:0] indvar_flatten_phi_fu_66_p4;
reg   [6:0] i_phi_fu_77_p4;
reg   [6:0] j_phi_fu_88_p4;
wire   [31:0] array_addr1_cast_fu_205_p1;
wire   [63:0] tmp4_fu_216_p1;
wire   [5:0] tmp_fu_100_p0;
wire   [18:0] tmp_fu_100_p2;
wire   [12:0] exitcond_fu_110_p1;
wire   [6:0] exitcond1_fu_128_p1;
wire   [0:0] exitcond1_fu_128_p2;
wire   [6:0] indvar_next4_dup_fu_122_p2;
wire   [12:0] i_cast4_mid_fu_150_p1;
wire   [12:0] p_shl_fu_154_p2;
wire   [12:0] p_shl1_fu_160_p2;
wire   [12:0] tmp1_fu_166_p2;
wire   [6:0] j_mid_fu_134_p3;
wire   [19:0] j_cast_fu_176_p1;
wire   [19:0] tmp2_fu_180_p2;
wire   [20:0] tmp10_cast_fu_185_p1;
wire   [20:0] tmp9_cast_fu_172_p1;
wire   [12:0] tmp7_trn_cast_fu_195_p1;
wire   [12:0] array_addr_fu_199_p2;
reg   [1:0] ap_NS_fsm;
wire   [18:0] tmp_fu_100_p00;
parameter    ap_const_logic_1 = 1'b1;
parameter    ap_const_logic_0 = 1'b0;
parameter    ap_ST_st0_fsm_0 = 2'b00;
parameter    ap_ST_st1_fsm_1 = 2'b01;
parameter    ap_ST_pp0_stg0_fsm_2 = 2'b10;
parameter    ap_ST_st6_fsm_3 = 2'b11;
parameter    ap_const_lv1_0 = 1'b0;
parameter    ap_const_lv13_0 = 13'b0000000000000;
parameter    ap_const_lv7_0 = 7'b0000000;
parameter    ap_const_lv32_0 = 32'b00000000000000000000000000000000;
parameter    ap_const_lv19_1104 = 19'b0000001000100000100;
parameter    ap_const_lv13_1104 = 13'b1000100000100;
parameter    ap_const_lv13_1 = 13'b0000000000001;
parameter    ap_const_lv7_1 = 7'b0000001;
parameter    ap_const_lv7_42 = 7'b1000010;
parameter    ap_const_lv13_6 = 13'b0000000000110;
parameter    ap_true = 1'b1;




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
        if (((ap_ST_pp0_stg0_fsm_2 == ap_CS_fsm) & ~(ap_sig_bdd_59 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2)) & ~(exitcond_fu_110_p2 == ap_const_lv1_0))) begin
            ap_reg_ppiten_pp0_it0 <= ap_const_logic_0;
        end else if ((ap_ST_st1_fsm_1 == ap_CS_fsm)) begin
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
        if (((ap_ST_pp0_stg0_fsm_2 == ap_CS_fsm) & ~(ap_sig_bdd_59 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2)) & (exitcond_fu_110_p2 == ap_const_lv1_0))) begin
            ap_reg_ppiten_pp0_it1 <= ap_const_logic_1;
        end else if (((ap_ST_st1_fsm_1 == ap_CS_fsm) | ((ap_ST_pp0_stg0_fsm_2 == ap_CS_fsm) & ~(ap_sig_bdd_59 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2)) & ~(exitcond_fu_110_p2 == ap_const_lv1_0)))) begin
            ap_reg_ppiten_pp0_it1 <= ap_const_logic_0;
        end
    end
end

/// ap_reg_ppiten_pp0_it2 assign process. ///
always @ (posedge ap_rst or posedge ap_clk)
begin : ap_ret_ap_reg_ppiten_pp0_it2
    if (ap_rst == 1'b1) begin
        ap_reg_ppiten_pp0_it2 <= ap_const_logic_0;
    end else begin
        if (((ap_ST_pp0_stg0_fsm_2 == ap_CS_fsm) & ~(ap_sig_bdd_59 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2)))) begin
            ap_reg_ppiten_pp0_it2 <= ap_reg_ppiten_pp0_it1;
        end else if ((ap_ST_st1_fsm_1 == ap_CS_fsm)) begin
            ap_reg_ppiten_pp0_it2 <= ap_const_logic_0;
        end
    end
end

/// ap_reg_ppiten_pp0_it3 assign process. ///
always @ (posedge ap_rst or posedge ap_clk)
begin : ap_ret_ap_reg_ppiten_pp0_it3
    if (ap_rst == 1'b1) begin
        ap_reg_ppiten_pp0_it3 <= ap_const_logic_0;
    end else begin
        if (((ap_ST_pp0_stg0_fsm_2 == ap_CS_fsm) & ~(ap_sig_bdd_59 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2)))) begin
            ap_reg_ppiten_pp0_it3 <= ap_reg_ppiten_pp0_it2;
        end else if ((ap_ST_st1_fsm_1 == ap_CS_fsm)) begin
            ap_reg_ppiten_pp0_it3 <= ap_const_logic_0;
        end
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_ST_pp0_stg0_fsm_2 == ap_CS_fsm) & ~(ap_sig_bdd_59 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2)))) begin
        ap_reg_ppstg_exitcond_reg_231_pp0_it1 <= exitcond_reg_231;
    end
    if (((ap_ST_pp0_stg0_fsm_2 == ap_CS_fsm) & ~(ap_sig_bdd_59 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2)))) begin
        ap_reg_ppstg_tmp3_reg_245_pp0_it1 <= tmp3_reg_245;
    end
    if (((ap_ST_pp0_stg0_fsm_2 == ap_CS_fsm) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1) & ~(ap_sig_bdd_59 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2)) & (exitcond_reg_231 == ap_const_lv1_0))) begin
        array_load_reg_260 <= array_r_q0;
    end
    if (((ap_ST_pp0_stg0_fsm_2 == ap_CS_fsm) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~(ap_sig_bdd_59 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2)))) begin
        exitcond_reg_231 <= (indvar_flatten_phi_fu_66_p4 == exitcond_fu_110_p1? 1'b1: 1'b0);
    end
    if (((ap_ST_pp0_stg0_fsm_2 == ap_CS_fsm) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~(ap_sig_bdd_59 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2)) & (exitcond_fu_110_p2 == ap_const_lv1_0))) begin
        if (exitcond1_fu_128_p2) begin
            i_mid_reg_240 <= indvar_next4_dup_fu_122_p2;
        end else begin
            i_mid_reg_240 <= i_phi_fu_77_p4;
        end

    end
    if (((ap_ST_pp0_stg0_fsm_2 == ap_CS_fsm) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1) & ~(ap_sig_bdd_59 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2)) & (exitcond_reg_231 == ap_const_lv1_0))) begin
        i_reg_73 <= i_mid_reg_240;
    end else if ((ap_ST_st1_fsm_1 == ap_CS_fsm)) begin
        i_reg_73 <= ap_const_lv7_0;
    end
    if (((ap_ST_pp0_stg0_fsm_2 == ap_CS_fsm) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1) & ~(ap_sig_bdd_59 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2)) & (exitcond_reg_231 == ap_const_lv1_0))) begin
        indvar_flatten_reg_62 <= indvar_next_reg_235;
    end else if ((ap_ST_st1_fsm_1 == ap_CS_fsm)) begin
        indvar_flatten_reg_62 <= ap_const_lv13_0;
    end
    if (((ap_ST_pp0_stg0_fsm_2 == ap_CS_fsm) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~(ap_sig_bdd_59 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2)) & (exitcond_fu_110_p2 == ap_const_lv1_0))) begin
        indvar_next1_reg_255 <= (j_mid_fu_134_p3 + ap_const_lv7_1);
    end
    if (((ap_ST_pp0_stg0_fsm_2 == ap_CS_fsm) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~(ap_sig_bdd_59 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2)))) begin
        indvar_next_reg_235 <= (indvar_flatten_phi_fu_66_p4 + ap_const_lv13_1);
    end
    if (((ap_ST_pp0_stg0_fsm_2 == ap_CS_fsm) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1) & ~(ap_sig_bdd_59 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2)) & (exitcond_reg_231 == ap_const_lv1_0))) begin
        j_reg_84 <= indvar_next1_reg_255;
    end else if ((ap_ST_st1_fsm_1 == ap_CS_fsm)) begin
        j_reg_84 <= ap_const_lv7_0;
    end
    if ((ap_ST_st1_fsm_1 == ap_CS_fsm)) begin
        tmp1_cast_reg_226[2] <= tmp1_cast_fu_106_p1[2];
        tmp1_cast_reg_226[3] <= tmp1_cast_fu_106_p1[3];
        tmp1_cast_reg_226[4] <= tmp1_cast_fu_106_p1[4];
        tmp1_cast_reg_226[5] <= tmp1_cast_fu_106_p1[5];
        tmp1_cast_reg_226[6] <= tmp1_cast_fu_106_p1[6];
        tmp1_cast_reg_226[7] <= tmp1_cast_fu_106_p1[7];
        tmp1_cast_reg_226[8] <= tmp1_cast_fu_106_p1[8];
        tmp1_cast_reg_226[9] <= tmp1_cast_fu_106_p1[9];
        tmp1_cast_reg_226[10] <= tmp1_cast_fu_106_p1[10];
        tmp1_cast_reg_226[11] <= tmp1_cast_fu_106_p1[11];
        tmp1_cast_reg_226[12] <= tmp1_cast_fu_106_p1[12];
        tmp1_cast_reg_226[13] <= tmp1_cast_fu_106_p1[13];
        tmp1_cast_reg_226[14] <= tmp1_cast_fu_106_p1[14];
        tmp1_cast_reg_226[15] <= tmp1_cast_fu_106_p1[15];
        tmp1_cast_reg_226[16] <= tmp1_cast_fu_106_p1[16];
        tmp1_cast_reg_226[17] <= tmp1_cast_fu_106_p1[17];
        tmp1_cast_reg_226[18] <= tmp1_cast_fu_106_p1[18];
    end
    if (((ap_ST_pp0_stg0_fsm_2 == ap_CS_fsm) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~(ap_sig_bdd_59 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2)) & (exitcond_fu_110_p2 == ap_const_lv1_0))) begin
        tmp3_reg_245 <= (tmp10_cast_fu_185_p1 + tmp9_cast_fu_172_p1);
    end
end

/// ap_NS_fsm assign process. ///
always @ (ap_start or ap_CS_fsm or exitcond_fu_110_p2 or ap_reg_ppiten_pp0_it0 or ap_reg_ppiten_pp0_it1 or ap_sig_bdd_59 or ap_reg_ppiten_pp0_it2 or ap_reg_ppiten_pp0_it3)
begin
    if ((((ap_ST_pp0_stg0_fsm_2 == ap_CS_fsm) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it3) & ~(ap_sig_bdd_59 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2)) & ~(ap_const_logic_1 == ap_reg_ppiten_pp0_it2)) | ((ap_ST_pp0_stg0_fsm_2 == ap_CS_fsm) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~(ap_sig_bdd_59 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2)) & ~(exitcond_fu_110_p2 == ap_const_lv1_0) & ~(ap_const_logic_1 == ap_reg_ppiten_pp0_it1)))) begin
        ap_NS_fsm = ap_ST_st6_fsm_3;
    end else if ((~(ap_const_logic_1 == ap_start) & (ap_ST_st6_fsm_3 == ap_CS_fsm))) begin
        ap_NS_fsm = ap_ST_st0_fsm_0;
    end else if ((ap_ST_st1_fsm_1 == ap_CS_fsm)) begin
        ap_NS_fsm = ap_ST_pp0_stg0_fsm_2;
    end else if ((((ap_ST_st0_fsm_0 == ap_CS_fsm) & (ap_const_logic_1 == ap_start)) | ((ap_const_logic_1 == ap_start) & (ap_ST_st6_fsm_3 == ap_CS_fsm)))) begin
        ap_NS_fsm = ap_ST_st1_fsm_1;
    end else begin
        ap_NS_fsm = ap_CS_fsm;
    end
end

/// ap_done assign process. ///
always @ (ap_CS_fsm)
begin
    if (((ap_ST_st0_fsm_0 == ap_CS_fsm) | (ap_ST_st6_fsm_3 == ap_CS_fsm))) begin
        ap_done = ap_const_logic_1;
    end else begin
        ap_done = ap_const_logic_0;
    end
end

/// ap_idle assign process. ///
always @ (ap_CS_fsm)
begin
    if ((ap_ST_st0_fsm_0 == ap_CS_fsm)) begin
        ap_idle = ap_const_logic_1;
    end else begin
        ap_idle = ap_const_logic_0;
    end
end

/// array_r_ce0 assign process. ///
always @ (ap_CS_fsm or exitcond_fu_110_p2 or ap_reg_ppiten_pp0_it0 or ap_sig_bdd_59 or ap_reg_ppiten_pp0_it2)
begin
    if (((ap_ST_pp0_stg0_fsm_2 == ap_CS_fsm) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~(ap_sig_bdd_59 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2)) & (exitcond_fu_110_p2 == ap_const_lv1_0))) begin
        array_r_ce0 = ap_const_logic_1;
    end else begin
        array_r_ce0 = ap_const_logic_0;
    end
end

/// bus_r_req_din assign process. ///
always @ (ap_CS_fsm or ap_reg_ppstg_exitcond_reg_231_pp0_it1 or ap_sig_bdd_59 or ap_reg_ppiten_pp0_it2)
begin
    if (((ap_ST_pp0_stg0_fsm_2 == ap_CS_fsm) & (ap_reg_ppstg_exitcond_reg_231_pp0_it1 == ap_const_lv1_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2) & ~(ap_sig_bdd_59 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2)))) begin
        bus_r_req_din = ap_const_logic_1;
    end else begin
        bus_r_req_din = ap_const_logic_0;
    end
end

/// bus_r_req_write assign process. ///
always @ (ap_CS_fsm or ap_reg_ppstg_exitcond_reg_231_pp0_it1 or ap_sig_bdd_59 or ap_reg_ppiten_pp0_it2)
begin
    if (((ap_ST_pp0_stg0_fsm_2 == ap_CS_fsm) & (ap_reg_ppstg_exitcond_reg_231_pp0_it1 == ap_const_lv1_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2) & ~(ap_sig_bdd_59 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2)))) begin
        bus_r_req_write = ap_const_logic_1;
    end else begin
        bus_r_req_write = ap_const_logic_0;
    end
end

/// i_phi_fu_77_p4 assign process. ///
always @ (ap_CS_fsm or i_reg_73 or exitcond_reg_231 or ap_reg_ppiten_pp0_it1 or i_mid_reg_240)
begin
    if (((ap_ST_pp0_stg0_fsm_2 == ap_CS_fsm) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1) & (exitcond_reg_231 == ap_const_lv1_0))) begin
        i_phi_fu_77_p4 = i_mid_reg_240;
    end else begin
        i_phi_fu_77_p4 = i_reg_73;
    end
end

/// indvar_flatten_phi_fu_66_p4 assign process. ///
always @ (ap_CS_fsm or indvar_flatten_reg_62 or exitcond_reg_231 or ap_reg_ppiten_pp0_it1 or indvar_next_reg_235)
begin
    if (((ap_ST_pp0_stg0_fsm_2 == ap_CS_fsm) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1) & (exitcond_reg_231 == ap_const_lv1_0))) begin
        indvar_flatten_phi_fu_66_p4 = indvar_next_reg_235;
    end else begin
        indvar_flatten_phi_fu_66_p4 = indvar_flatten_reg_62;
    end
end

/// j_phi_fu_88_p4 assign process. ///
always @ (ap_CS_fsm or j_reg_84 or exitcond_reg_231 or ap_reg_ppiten_pp0_it1 or indvar_next1_reg_255)
begin
    if (((ap_ST_pp0_stg0_fsm_2 == ap_CS_fsm) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1) & (exitcond_reg_231 == ap_const_lv1_0))) begin
        j_phi_fu_88_p4 = indvar_next1_reg_255;
    end else begin
        j_phi_fu_88_p4 = j_reg_84;
    end
end

/// ap_sig_bdd_59 assign process. ///
always @ (bus_r_req_full_n or ap_reg_ppstg_exitcond_reg_231_pp0_it1)
begin
    ap_sig_bdd_59 = ((bus_r_req_full_n == ap_const_logic_0) & (ap_reg_ppstg_exitcond_reg_231_pp0_it1 == ap_const_lv1_0));
end
assign array_addr1_cast_fu_205_p1 = {{19{1'b0}}, {array_addr_fu_199_p2}};
assign array_addr_fu_199_p2 = (tmp1_fu_166_p2 + tmp7_trn_cast_fu_195_p1);
assign array_r_address0 = array_addr1_cast_fu_205_p1;
assign bus_r_address = tmp4_fu_216_p1;
assign bus_r_dataout = array_load_reg_260;
assign bus_r_rsp_read = ap_const_logic_0;
assign bus_r_size = ap_const_lv32_0;
assign exitcond1_fu_128_p1 = ap_const_lv7_42;
assign exitcond1_fu_128_p2 = (j_phi_fu_88_p4 == exitcond1_fu_128_p1? 1'b1: 1'b0);
assign exitcond_fu_110_p1 = ap_const_lv13_1104;
assign exitcond_fu_110_p2 = (indvar_flatten_phi_fu_66_p4 == exitcond_fu_110_p1? 1'b1: 1'b0);
assign i_cast4_mid_fu_150_p1 = {{6{1'b0}}, {i_mid_fu_142_p3}};
assign i_mid_fu_142_p3 = ((exitcond1_fu_128_p2)? indvar_next4_dup_fu_122_p2: i_phi_fu_77_p4);
assign indvar_next4_dup_fu_122_p2 = (i_phi_fu_77_p4 + ap_const_lv7_1);
assign j_cast_fu_176_p1 = {{13{1'b0}}, {j_mid_fu_134_p3}};
assign j_mid_fu_134_p3 = ((exitcond1_fu_128_p2)? ap_const_lv7_0: j_phi_fu_88_p4);
assign p_shl1_fu_160_p2 = i_cast4_mid_fu_150_p1 << ap_const_lv13_1;
assign p_shl_fu_154_p2 = i_cast4_mid_fu_150_p1 << ap_const_lv13_6;
assign tmp10_cast_fu_185_p1 = {{1{1'b0}}, {tmp2_fu_180_p2}};
assign tmp1_cast_fu_106_p1 = {{1{1'b0}}, {tmp_fu_100_p2}};
assign tmp1_fu_166_p2 = (p_shl_fu_154_p2 + p_shl1_fu_160_p2);
assign tmp2_fu_180_p2 = (tmp1_cast_reg_226 + j_cast_fu_176_p1);
assign tmp4_fu_216_p1 = {{43{1'b0}}, {ap_reg_ppstg_tmp3_reg_245_pp0_it1}};
assign tmp7_trn_cast_fu_195_p1 = {{6{1'b0}}, {j_mid_fu_134_p3}};
assign tmp9_cast_fu_172_p1 = {{8{1'b0}}, {tmp1_fu_166_p2}};
assign tmp_fu_100_p0 = tmp_fu_100_p00;
assign tmp_fu_100_p00 = {{13{1'b0}}, {index}};
assign tmp_fu_100_p2 = (tmp_fu_100_p0 * $signed('h1104));
always @ (ap_clk)
begin
    tmp1_cast_reg_226[0] <= 1'b0;
    tmp1_cast_reg_226[1] <= 1'b0;
    tmp1_cast_reg_226[19] <= 1'b0;
end



endmodule //write_r

