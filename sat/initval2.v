module top(input clk, i, output [1:0] o);
(* init = 2'bx0 *)
wire [1:0] o;
assign o[1] = o[0];
\$_DFF_P_ dff (.C(clk), .D(i), .Q(o[0]));
endmodule
