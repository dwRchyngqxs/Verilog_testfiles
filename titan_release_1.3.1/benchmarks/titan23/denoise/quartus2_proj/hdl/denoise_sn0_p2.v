// ==============================================================
// File generated by AutoPilot - High-Level Synthesis System (C, C++, SystemC)
// Version: 2010.a.3
// Copyright (C) :2006-2010 AutoESL Design Technologies, Inc.
// 
// ==============================================================



`timescale 1 ns / 1 ps




`celldefine
module denoise_sn0_p2_core (q, ra, ce, clk, d, wa, we);
   parameter READ_PORT_COUNT=32'd1;
   parameter WRITE_PORT_COUNT=32'd1;
   parameter DATA_WIDTH=32'd32;
   parameter ADDRESS_WIDTH=32'd8;
   parameter WORD_COUNT=32'd225;

   output [READ_PORT_COUNT*DATA_WIDTH-1:0] q;
   input [READ_PORT_COUNT*ADDRESS_WIDTH-1:0]  ra;
   input [READ_PORT_COUNT-1:0]  ce;
   input [WRITE_PORT_COUNT*DATA_WIDTH-1:0] d;
   input [WRITE_PORT_COUNT*ADDRESS_WIDTH-1:0] wa;
   input [WRITE_PORT_COUNT-1:0]               we;
   input                                      clk;

   integer                                    i,j,k;

   reg [DATA_WIDTH-1:0]                       mem [0:WORD_COUNT-1];
   reg [ADDRESS_WIDTH-1:0]                    rat;
   reg [ADDRESS_WIDTH-1:0]                    rai [READ_PORT_COUNT-1:0];
   reg [ADDRESS_WIDTH-1:0]                    rai_reg [READ_PORT_COUNT-1:0];
   reg [READ_PORT_COUNT*DATA_WIDTH-1:0]       qi;
   reg [DATA_WIDTH-1:0]                       qt;
   reg [DATA_WIDTH-1:0]                       di [WRITE_PORT_COUNT-1:0];
   reg [DATA_WIDTH-1:0]                       dt;
   reg [ADDRESS_WIDTH-1:0]                    wat;
   reg [ADDRESS_WIDTH-1:0]                    wai [WRITE_PORT_COUNT-1:0];




   // Split input data
   always @ (d) begin
      for (i=0;i<WRITE_PORT_COUNT;i=i+1) begin
         for (j=0;j<DATA_WIDTH;j=j+1) begin
            dt[j]=d[i*DATA_WIDTH+j];
         end
         di[i]=dt;
      end
   end

   // Split write addresses
   always @ (wa) begin
      for (i=0;i<WRITE_PORT_COUNT;i=i+1) begin
         for (j=0;j<ADDRESS_WIDTH;j=j+1) begin
            wat[j]=wa[i*ADDRESS_WIDTH+j];
         end
         wai[i]=wat;
      end
   end

   // Write memory
   always @ (posedge clk) begin
     for (j=0;j<WRITE_PORT_COUNT;j=j+1) begin
        if (we[j]) begin
           mem[wai[j]] <= di[j];
        end
     end
   end

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
   always @ (rai_reg[0] or clk) begin
      for (i=0;i<READ_PORT_COUNT;i=i+1) begin
         if (rai_reg[i] >= WORD_COUNT) begin
            qt={DATA_WIDTH {1'b0}};
         end else begin
            qt=mem[rai_reg[i]];
         end
         for (j=0;j<DATA_WIDTH;j=j+1) begin
            qi[i*DATA_WIDTH+j]=qt[j];
         end
      end
   end

   assign q=qi;

endmodule
`endcelldefine


module denoise_sn0_p2 (
    address0,
    ce0,
    q0,
    we0,
    d0,


    clk);


parameter DataWidth = 32'd32;
parameter AddressRange = 32'd225;
parameter AddressWidth = 32'd8;

input[AddressWidth-1:0] address0;
input ce0;
output[DataWidth-1:0] q0;
input we0;
input[DataWidth-1:0] d0;
input clk;


reg[DataWidth-1:0] q0;
wire[1 * DataWidth - 1:0] mem_q;
wire[DataWidth - 1:0] mem_q0;
wire[1 - 1:0] mem_we;
wire[1 * DataWidth - 1:0] mem_d;
wire[1 * AddressWidth - 1:0] mem_wa;
wire[1 * AddressWidth - 1:0]  mem_ra;
wire[1 - 1:0]  mem_ce;


denoise_sn0_p2_core #(
    .READ_PORT_COUNT( 1 ),
    .WRITE_PORT_COUNT( 1 ),
    .DATA_WIDTH( DataWidth ),
    .ADDRESS_WIDTH( AddressWidth ),
    .WORD_COUNT( AddressRange ))
core_inst (
    .q( mem_q ),
    .ra( mem_ra ),
    .ce( mem_ce ),
    .d( mem_d ),
    .wa( mem_wa ),
    .we( mem_we ),
    .clk( clk ));


assign mem_q0 =  mem_q[1 * DataWidth - 1 : 0 * DataWidth];

always @ (mem_q0) begin
        q0 = mem_q0;
end

assign mem_ra = {address0};
assign mem_ce = {ce0};

assign mem_we[0] = we0;

assign mem_d = {d0};

assign mem_wa = {address0};

endmodule