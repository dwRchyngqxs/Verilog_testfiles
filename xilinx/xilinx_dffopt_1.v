// FDRE, mergeable CE and R.

module t0 ();
input wire clk;
input wire [7:0] i;
output wire [0:0] o;

wire [7:0] tmp ;

LUT2 #(.INIT(4'h6)) lut0 (.I0(i[0]), .I1(i[1]), .O(tmp[0]));
LUT2 #(.INIT(4'h6)) lut1 (.I0(i[1]), .I1(i[2]), .O(tmp[1]));
LUT2 #(.INIT(4'h6)) lut2 (.I0(i[3]), .I1(i[4]), .O(tmp[2]));

FDRE ff (.D(tmp[0]), .CE(tmp[1]), .R(tmp[2]), .Q(o[0]));

endmodule
