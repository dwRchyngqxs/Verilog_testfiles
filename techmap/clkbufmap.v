module clkbuf (input i, (* clkbuf_driver *) output o); endmodule
module inbuf (input i, output o); endmodule
module clkinbuf (input i, (* clkbuf_driver *) output o); endmodule
module dff ((* clkbuf_sink *) input clk, input d, output q); endmodule
module dffe ((* clkbuf_sink *) input c, input d, e, output q); endmodule
module latch (input e, d, output q); endmodule
module clkgen (output o); endmodule
module inv ((* clkbuf_inv = "i" *) output o, input i); endmodule

module top(input clk1, clk2, clk3, d, e, output [4:0] q);
wire clk4, clk5, clk6;
dff s0 (.clk(clk1), .d(d), .q(q[0]));
dffe s1 (.c(clk2), .d(d), .e(e), .q(q[1]));
latch s2 (.e(clk3), .d(d), .q(q[2]));
sub s3 (.sclk4(clk4), .sclk5(clk5), .sclk6(clk6), .sd(d), .sq(q[3]));
dff s4 (.clk(clk4), .d(d), .q(q[4]));
dff s5 (.clk(clk5), .d(d), .q(q[4]));
dff s6 (.clk(clk6), .d(d), .q(q[4]));
endmodule

module sub(output sclk4, output sclk5, output sclk6, input sd, output sq);
wire sclk7, sclk8, sclk9;
wire siq;
wire tmp;
clkgen s7(.o(sclk4));
clkgen s8(.o(sclk5));
clkgen s9(.o(tmp));
clkbuf s10(.i(tmp), .o(sclk7));
dff s11(.clk(sclk4), .d(sd), .q(siq));
inv s15(.i(sclk7), .o(sclk6));
clkgen s12(.o(sclk8));
inv s13(.o(sclk9), .i(sclk8));
dff s14(.clk(sclk9), .d(siq), .q(sq));
endmodule
