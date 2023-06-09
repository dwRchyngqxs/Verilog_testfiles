`define one_arg(x)                           123+x
`define opt_arg(x = 1)                       123+x
`define two_args(x, y = (1+23))              x+y
`define nested_comma(x = {31'b0, 1'b1}, y=3) x+y

module top;
  localparam b = `one_arg(10);
  localparam c = `opt_arg(10);
  localparam d = `opt_arg();
  localparam e = `two_args(1,2);
  localparam f = `two_args(1);
  localparam g = `nested_comma(1, 2);
  localparam h = `nested_comma({31'b0, (1'b0)});
  localparam i = `nested_comma(, 1);

  generate
    if (b != 133) $error("b bad");
    if (c != 133) $error("c bad");
    if (d != 124) $error("d bad");
    if (e != 3)   $error("e bad");
    if (f != 25)  $error("f bad");
    if (g != 3)   $error("g bad");
    if (h != 3)   $error("h bad");
    if (i != 2)   $error("i bad");
  endgenerate
endmodule
