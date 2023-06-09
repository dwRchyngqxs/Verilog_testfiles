// Citation https://github.com/ZipCPU/dspfilters/blob/master/rtl/fastfir.v
module fastfir_dynamictaps(i_clk, i_reset, i_tap_wr, i_tap, i_ce, i_sample, o_result);
  wire [30:0] _00_;
  wire [23:0] _01_;
  wire [11:0] _02_;
  wire [30:0] _03_;
  wire [23:0] _04_;
  wire [30:0] _05_;
  wire [23:0] _06_;
  wire [30:0] _07_;
  wire [23:0] _08_;
  wire [11:0] _09_;
  wire [30:0] _10_;
  wire [23:0] _11_;
  wire [30:0] _12_;
  wire [23:0] _13_;
  wire [11:0] \fir.FILTER[0].tapk.delayed_sample ;
  reg [30:0] \fir.FILTER[0].tapk.o_acc  = 31'h00000000;
  wire [11:0] \fir.FILTER[0].tapk.o_sample ;
  reg [23:0] \fir.FILTER[0].tapk.product ;
  reg [11:0] \fir.FILTER[0].tapk.tap  = 12'h000;
  wire [11:0] \fir.FILTER[1].tapk.delayed_sample ;
  wire [30:0] \fir.FILTER[1].tapk.o_acc ;
  wire [11:0] \fir.FILTER[1].tapk.o_sample ;
  reg [23:0] \fir.FILTER[1].tapk.product ;
  reg [11:0] \fir.FILTER[1].tapk.tap  = 12'h000;
  input i_ce;
  input i_clk;
  input i_reset;
  input [11:0] i_sample;
  input [11:0] i_tap;
  input i_tap_wr;
  output [30:0] o_result;
  reg [30:0] o_result;
  assign _03_ = 31'h00000000 + { \fir.FILTER[0].tapk.product [23], \fir.FILTER[0].tapk.product [23], \fir.FILTER[0].tapk.product [23], \fir.FILTER[0].tapk.product [23], \fir.FILTER[0].tapk.product [23], \fir.FILTER[0].tapk.product [23], \fir.FILTER[0].tapk.product [23], \fir.FILTER[0].tapk.product  };
  assign _04_ = $signed(\fir.FILTER[0].tapk.tap ) * $signed(i_sample);
  always @(posedge i_clk)
      \fir.FILTER[0].tapk.tap  <= _02_;
  always @(posedge i_clk)
      \fir.FILTER[0].tapk.o_acc  <= _00_;
  always @(posedge i_clk)
      \fir.FILTER[0].tapk.product  <= _01_;
  assign _02_ = i_tap_wr ? i_tap : \fir.FILTER[0].tapk.tap ;
  assign _05_ = i_ce ? _03_ : \fir.FILTER[0].tapk.o_acc ;
  assign _00_ = i_reset ? 31'h00000000 : _05_;
  assign _06_ = i_ce ? _04_ : \fir.FILTER[0].tapk.product ;
  assign _01_ = i_reset ? 24'h000000 : _06_;
  assign _10_ = \fir.FILTER[0].tapk.o_acc  + { \fir.FILTER[1].tapk.product [23], \fir.FILTER[1].tapk.product [23], \fir.FILTER[1].tapk.product [23], \fir.FILTER[1].tapk.product [23], \fir.FILTER[1].tapk.product [23], \fir.FILTER[1].tapk.product [23], \fir.FILTER[1].tapk.product [23], \fir.FILTER[1].tapk.product  };
  assign _11_ = $signed(\fir.FILTER[1].tapk.tap ) * $signed(i_sample);
  always @(posedge i_clk)
      \fir.FILTER[1].tapk.tap  <= _09_;
  always @(posedge i_clk)
      o_result <= _07_;
  always @(posedge i_clk)
      \fir.FILTER[1].tapk.product  <= _08_;
  assign _09_ = i_tap_wr ? \fir.FILTER[0].tapk.tap  : \fir.FILTER[1].tapk.tap ;
  assign _12_ = i_ce ? _10_ : o_result;
  assign _07_ = i_reset ? 31'h00000000 : _12_;
  assign _13_ = i_ce ? _11_ : \fir.FILTER[1].tapk.product ;
  assign _08_ = i_reset ? 24'h000000 : _13_;
  assign \fir.FILTER[1].tapk.o_acc  = o_result;
endmodule
