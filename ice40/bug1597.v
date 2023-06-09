module top (
    input CLK, PIN_1, PIN_2, PIN_3, PIN_4, PIN_5,
        PIN_6, PIN_7, PIN_8, PIN_9, PIN_10, PIN_11, PIN_12, PIN_13, PIN_25,
    output USBPU, PIN_14, PIN_15, PIN_16, PIN_17, PIN_18,
        PIN_19
);
    assign USBPU = 0;

    wire[5:0] parOut;
    wire[5:0] chrg;

    assign PIN_14 = parOut[0];
    assign PIN_15 = parOut[1];
    assign PIN_16 = parOut[2];
    assign PIN_17 = parOut[3];
    assign PIN_18 = parOut[4];
    assign PIN_19 = parOut[5];
    assign chrg[0] = PIN_3;
    assign chrg[1] = PIN_4;
    assign chrg[2] = PIN_5;
    assign chrg[3] = PIN_6;
    assign chrg[4] = PIN_7;
    assign chrg[5] = PIN_8;

    SSCounter6o sc6(PIN_1, CLK, PIN_2, PIN_9, chrg, parOut);

endmodule

module SSCounter6 (input wire rst, clk, adv, jmp, input wire [5:0] in, output reg[5:0] out);
    always @(posedge clk, posedge rst)
        if (rst) out <= 0;
        else if (adv || jmp) out <= jmp ? in : out + 1;
endmodule

// Optimized 6 bit counter, it should takes 7 cells.
/* b[5:1]                       /* b[0]
1010101010101010 in             1010101010101010 in
1100110011001100 jmp            1100110011001100 jmp
1111000011110000 loop           1111000011110000 loop
1111111100000000 carry          1111111100000000 -
----------------------          ----------------------
1000101110111000 out            1000101110001011 out
   8   B   B   8                   8   B   8   B
*/
module SSCounter6o (input wire rst, clk, adv, jmp, input wire [5:0] in, output wire[5:0] out);
    wire[4:0] co;
    wire[5:0] lo;
    wire ien;
    SB_LUT4 #(.LUT_INIT(16'hFFF0)) lien (ien, 0, 0, adv, jmp);
    SB_CARRY c0 (co[0], jmp, out[0], 1),
             c1 (co[1], jmp, out[1], co[0]),
             c2 (co[2], jmp, out[2], co[1]),
             c3 (co[3], jmp, out[3], co[2]),
             c4 (co[4], jmp, out[4], co[3]);
    SB_DFFER d0 (out[0], clk, ien, rst, lo[0]),
             d1 (out[1], clk, ien, rst, lo[1]),
             d2 (out[2], clk, ien, rst, lo[2]),
             d3 (out[3], clk, ien, rst, lo[3]),
             d4 (out[4], clk, ien, rst, lo[4]),
             d5 (out[5], clk, ien, rst, lo[5]);
    SB_LUT4 #(.LUT_INIT(16'h8B8B)) l0 (lo[0], in[0], jmp, out[0], 0);
    SB_LUT4 #(.LUT_INIT(16'h8BB8)) l1 (lo[1], in[1], jmp, out[1], co[0]);
    SB_LUT4 #(.LUT_INIT(16'h8BB8)) l2 (lo[2], in[2], jmp, out[2], co[1]);
    SB_LUT4 #(.LUT_INIT(16'h8BB8)) l3 (lo[3], in[3], jmp, out[3], co[2]);
    SB_LUT4 #(.LUT_INIT(16'h8BB8)) l4 (lo[4], in[4], jmp, out[4], co[3]);
    SB_LUT4 #(.LUT_INIT(16'h8BB8)) l5 (lo[5], in[5], jmp, out[5], co[4]);
endmodule
