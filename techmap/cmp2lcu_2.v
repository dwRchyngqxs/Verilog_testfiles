module top(input [8:0] a, b, output gtu, gts, ltu, lts, geu, ges, leu, les);
wire [13:0] c = {a[8:6], 3'b101, a[5:4], 2'b11, a[3:0]};
wire [13:0] d = {b[8], 3'b101, b[7:4], 2'b01, b[3:0]};
assign gtu = c > d;
assign gts = $signed(c) > $signed(d);
assign ltu = c < d;
assign lts = $signed(c) < $signed(d);
assign geu = c >= d;
assign ges = $signed(c) >= $signed(d);
assign leu = c <= d;
assign les = $signed(c) <= $signed(d);
endmodule
