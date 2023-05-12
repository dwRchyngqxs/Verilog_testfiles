module cascade(input clk, input [4:0] a, input [4:0] b, output reg [9:0] o);
reg [4:0] ar1, ar2, ar3, br1, br2, br3;
reg [9:0] m;
always @(posedge clk) begin
ar1 <= a;
ar2 <= ar1;
ar3 <= ar2;
br1 <= b;
br2 <= br1;
br3 <= br2;
m <= ar2 * br2;
o <= ar3 * br3 + m;
end
endmodule
