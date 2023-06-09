// ==============================================================
// File generated by AutoESL - High-Level Synthesis System (C, C++, SystemC)
// Version: 2011.1
// Copyright (C) 2011 Xilinx Inc. All rights reserved.
// 
// ==============================================================



`timescale 1 ns / 1 ps




module SURFdescriptor_patch_wts_core (q, ra, ce, clk
);
   parameter READ_PORT_COUNT=32'd1;
   parameter WRITE_PORT_COUNT=32'd1;
   parameter DATA_WIDTH=32'd32;
   parameter ADDRESS_WIDTH=32'd7;
   parameter WORD_COUNT=32'd100;

   output [READ_PORT_COUNT*DATA_WIDTH-1:0] q;
   input [READ_PORT_COUNT*ADDRESS_WIDTH-1:0]  ra;
   input [READ_PORT_COUNT-1:0]  ce;
   input                                      clk;

   integer                                    i,j,k;

   wire [DATA_WIDTH-1:0]                       mem [0:WORD_COUNT-1];
   reg [ADDRESS_WIDTH-1:0]                    rat;
   reg [ADDRESS_WIDTH-1:0]                    rai [READ_PORT_COUNT-1:0];
   reg [ADDRESS_WIDTH-1:0]                    rai_reg [READ_PORT_COUNT-1:0];
   reg [READ_PORT_COUNT*DATA_WIDTH-1:0]       qi;
   reg [DATA_WIDTH-1:0]                       qt;


    assign mem[0] = 32'b00110110011101111111110110100001;
    assign mem[1] = 32'b00110111000011011010110100100111;
    assign mem[2] = 32'b00110111100100111010110011110010;
    assign mem[3] = 32'b00111000000011000110110001010111;
    assign mem[4] = 32'b00111000011100111001111110100110;
    assign mem[5] = 32'b00111000110000001100101011011101;
    assign mem[6] = 32'b00111001000010110010111000111110;
    assign mem[7] = 32'b00111001001101110101001100011100;
    assign mem[8] = 32'b00111001010111000100100001100010;
    assign mem[9] = 32'b00111001011100010111100001100100;
    assign mem[10] = 32'b00110111000011011010110100100111;
    assign mem[11] = 32'b00110111101000011110000011011010;
    assign mem[12] = 32'b00111000001010001011101110001111;
    assign mem[13] = 32'b00111000101000000111001001000111;
    assign mem[14] = 32'b00111001000010110010111010000011;
    assign mem[15] = 32'b00111001010111000100100010100111;
    assign mem[16] = 32'b00111001100111110000011011101100;
    assign mem[17] = 32'b00111001110100010111011100110100;
    assign mem[18] = 32'b00111001111110111011000110000001;
    assign mem[19] = 32'b00111010000010011111001101110000;
    assign mem[20] = 32'b00110111100100111010110011110010;
    assign mem[21] = 32'b00111000001010001011101110001111;
    assign mem[22] = 32'b00111000101011111110000010010010;
    assign mem[23] = 32'b00111001001001110011110110010100;
    assign mem[24] = 32'b00111001100100010001001100011110;
    assign mem[25] = 32'b00111001111001011001110001000000;
    assign mem[26] = 32'b00111010001001011100001011010000;
    assign mem[27] = 32'b00111010010110100101010110110011;
    assign mem[28] = 32'b00111010100000110010110011110001;
    assign mem[29] = 32'b00111010100011111100101011100100;
    assign mem[30] = 32'b00111000000011000110110001010111;
    assign mem[31] = 32'b00111000101000000111001001000111;
    assign mem[32] = 32'b00111001001001110011110110010100;
    assign mem[33] = 32'b00111001100111110000011100001110;
    assign mem[34] = 32'b00111010000010011111001100111100;
    assign mem[35] = 32'b00111010010110100101010110110011;
    assign mem[36] = 32'b00111010100111011001111011100010;
    assign mem[37] = 32'b00111010110011111001110011100001;
    assign mem[38] = 32'b00111010111110010111011101111011;
    assign mem[39] = 32'b00111011000010001011101011111010;
    assign mem[40] = 32'b00111000011100111001111110100110;
    assign mem[41] = 32'b00111001000010110010111010000011;
    assign mem[42] = 32'b00111001100100010001001100011110;
    assign mem[43] = 32'b00111010000010011111001100111100;
    assign mem[44] = 32'b00111010011011110101010101000001;
    assign mem[45] = 32'b00111010101111010110010111010010;
    assign mem[46] = 32'b00111011000010001011101011001111;
    assign mem[47] = 32'b00111011001101000001100010100001;
    assign mem[48] = 32'b00111011010110000110011100110101;
    assign mem[49] = 32'b00111011011011010011011110100110;
    assign mem[50] = 32'b00111000110000001100101011011101;
    assign mem[51] = 32'b00111001010111000100100010100111;
    assign mem[52] = 32'b00111001111001011001110001000000;
    assign mem[53] = 32'b00111010010110100101010110110011;
    assign mem[54] = 32'b00111010101111010110010111010010;
    assign mem[55] = 32'b00111011000101011110000101010011;
    assign mem[56] = 32'b00111011010110000110011101100000;
    assign mem[57] = 32'b00111011100011101000010100010011;
    assign mem[58] = 32'b00111011101010110100000001110110;
    assign mem[59] = 32'b00111011101110111011100100010100;
    assign mem[60] = 32'b00111001000010110010111000111110;
    assign mem[61] = 32'b00111001100111110000011011101100;
    assign mem[62] = 32'b00111010001001011100001011010000;
    assign mem[63] = 32'b00111010100111011001111011100010;
    assign mem[64] = 32'b00111011000010001011101011001111;
    assign mem[65] = 32'b00111011010110000110011101100000;
    assign mem[66] = 32'b00111011100111000011100111110010;
    assign mem[67] = 32'b00111011110011011100011011001000;
    assign mem[68] = 32'b00111011111101110100001010101101;
    assign mem[69] = 32'b00111100000001111000010101110000;
    assign mem[70] = 32'b00111001001101110101001100011100;
    assign mem[71] = 32'b00111001110100010111011100110100;
    assign mem[72] = 32'b00111010010110100101010110110011;
    assign mem[73] = 32'b00111010110011111001110011100001;
    assign mem[74] = 32'b00111011001101000001100010100001;
    assign mem[75] = 32'b00111011100011101000010100010011;
    assign mem[76] = 32'b00111011110011011100011011001000;
    assign mem[77] = 32'b00111100000001111000010101011010;
    assign mem[78] = 32'b00111100001000101101011101111011;
    assign mem[79] = 32'b00111100001100101000000011110001;
    assign mem[80] = 32'b00111001010111000100100001100010;
    assign mem[81] = 32'b00111001111110111011000110000001;
    assign mem[82] = 32'b00111010100000110010110011110001;
    assign mem[83] = 32'b00111010111110010111011101111011;
    assign mem[84] = 32'b00111011010110000110011100110101;
    assign mem[85] = 32'b00111011101010110100000001110110;
    assign mem[86] = 32'b00111011111101110100001010101101;
    assign mem[87] = 32'b00111100001000101101011101111011;
    assign mem[88] = 32'b00111100010000111010101110111100;
    assign mem[89] = 32'b00111100010101100111110101010000;
    assign mem[90] = 32'b00111001011100010111100001100100;
    assign mem[91] = 32'b00111010000010011111001101110000;
    assign mem[92] = 32'b00111010100011111100101011100100;
    assign mem[93] = 32'b00111011000010001011101011111010;
    assign mem[94] = 32'b00111011011011010011011110100110;
    assign mem[95] = 32'b00111011101110111011100100010100;
    assign mem[96] = 32'b00111100000001111000010101110000;
    assign mem[97] = 32'b00111100001100101000000011110001;
    assign mem[98] = 32'b00111100010101100111110101010000;
    assign mem[99] = 32'b00111100011010110001111011000111;


   // Split read addresses
   always @ (ra) begin
      for (i=0;i<READ_PORT_COUNT;i=i+1) begin
         for (j=0;j<ADDRESS_WIDTH;j=j+1) begin
            rat[j]=ra[i*ADDRESS_WIDTH+j];
         end
         rai[i]=rat;
      end
   end

   // guide read addresses using CE
   always @ (posedge clk) begin
      for (i=0;i<READ_PORT_COUNT;i=i+1) begin
         if ( ce[i] ) begin
            rai_reg[i] <= rai[i];
         end
      end
   end


   // Memory read
    genvar x;
    generate
        for (x = 0; x < READ_PORT_COUNT; x = x + 1) begin : gen_q
            assign q[x*DATA_WIDTH+DATA_WIDTH-1:x*DATA_WIDTH] = (rai_reg[x]<WORD_COUNT)?
                mem[rai_reg[x]] : {DATA_WIDTH{1'b0}};
        end
    endgenerate

endmodule


module SURFdescriptor_patch_wts (
    address0,
    ce0,
    q0,


    clk);


parameter DataWidth = 32'd32;
parameter AddressRange = 32'd100;
parameter AddressWidth = 32'd7;

input[AddressWidth-1:0] address0;
input ce0;
output[DataWidth-1:0] q0;
input clk;


reg[DataWidth-1:0] q0;
wire[1 * DataWidth - 1:0] mem_q;
wire[DataWidth - 1:0] mem_q0;
wire[1 * AddressWidth - 1:0]  mem_ra;
wire[1 - 1:0]  mem_ce;


SURFdescriptor_patch_wts_core #(
    .READ_PORT_COUNT( 1 ),
    .WRITE_PORT_COUNT( 1 ),
    .DATA_WIDTH( DataWidth ),
    .ADDRESS_WIDTH( AddressWidth ),
    .WORD_COUNT( AddressRange ))
core_inst (
    .q( mem_q ),
    .ra( mem_ra ),
    .ce( mem_ce ),
    .clk( clk ));


assign mem_q0 =  mem_q[1 * DataWidth - 1 : 0 * DataWidth];

always @ (mem_q0) begin
        q0 = mem_q0;
end

assign mem_ra = {address0};
assign mem_ce = {ce0};

endmodule
