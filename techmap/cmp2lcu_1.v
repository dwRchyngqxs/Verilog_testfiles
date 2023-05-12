module top(input [12:0] a, b, output gtu, gts, ltu, lts, geu, ges, leu, les);
assign gtu = a > b;
assign gts = $signed(a) > $signed(b);
assign ltu = a < b;
assign lts = $signed(a) < $signed(b);
assign geu = a >= b;
assign ges = $signed(a) >= $signed(b);
assign leu = a <= b;
assign les = $signed(a) <= $signed(b);
endmodule
