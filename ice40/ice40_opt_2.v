module delay_element (input wire clk, input wire reset, input wire enable,
                      input wire chainin,  output wire chainout, output reg latch);


   reg                           const_zero = 0;
   reg                           const_one = 1;

    wire                         delay_tap;


   //carry logic
   (* keep *) SB_CARRY carry ( .CO(chainout), .I0(const_zero),
                    .I1(const_one), .CI(chainin));


   //flip flop latch
   (* keep *) SB_DFFER flipflop( .Q(latch), .C(clk), .E(enable),
                      .D(delay_tap), .R(reset));


   //LUT table
   // the LUT should just echo the carry in (I3)
   // carry I0 = LUT I1
   // carry I1 = LUT I2
   // carry in = LUT I3
   // LUT_INIT[0] = 0
   // LUT_INIT[1] = 0
   // LUT_INIT[2] = 0
   // LUT_INIT[3] = 0
   // LUT_INIT[4] = 0
   // LUT_INIT[5] = 0
   // LUT_INIT[6] = 0
   // LUT_INIT[7] = 0
   // LUT_INIT[8] = 1
   // LUT_INIT[9] = 1
   // LUT_INIT[10] = 1
   // LUT_INIT[11] = 1
   // LUT_INIT[12] = 1
   // LUT_INIT[13] = 1
   // LUT_INIT[14] = 1
   // LUT_INIT[15] = 1

   (* keep *) SB_LUT4 lut( .O(delay_tap), .I0(const_zero), .I1(const_zero),
                .I2(const_one), .I3(chainin));

   //TODO: is this the right way round??
   defparam lut.LUT_INIT=16'hFF00;


endmodule // delay_element
