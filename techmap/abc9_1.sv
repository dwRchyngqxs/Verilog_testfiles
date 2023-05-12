`define N 256
module top(input [`N-1:0] a, output o);
wire [`N-2:0] w;
assign w[0] = a[0] & a[1];
genvar i;
generate for (i = 1; i < `N-1; i++)
assign w[i] = w[i-1] & a[i+1];
endgenerate
assign o = w[`N-2];
endmodule
