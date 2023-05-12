module ff4();
parameter [0:0] CLK_INV = 1'b0;
parameter [3:0] DATA_INV = 4'b0000;
(* invertible_pin = "CLK_INV" *)
input clk;
(* invertible_pin = "DATA_INV" *)
input [3:0] d;
output [3:0] q;
endmodule

module inv();
output o;
input i;
endmodule

module top();
input d0, d1, d2, d3;
input clk;
output q;
ff4 #(.DATA_INV(4'h5)) ff_inst (.clk(clk), .d({d3, d2, d1, d0}), .q(q));
endmodule
