module top();
input wire [31:0] A;
output wire [31:0] P;

assign P = A * 32'h12300000;

endmodule
