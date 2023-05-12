module gold(input clk, output [32:0] o, p, q, r, s, t, u);
assign o = {33{1'bx}};
assign p = {{32{1'b0}}, 1'bx};
assign q = {33{1'bz}};
assign r = {{32{1'b0}}, 1'bz};
assign s = {33{1'b0}};
assign t = {{32{1'b0}}, 1'b1};
assign u = {33{1'b1}};
endmodule
