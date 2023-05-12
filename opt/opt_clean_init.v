module top();

input [1:0] D;
input C;
output O;
reg [1:0] Q;

initial Q = 0;

always @(posedge C)
        Q <= D;

assign O = Q[1];

endmodule
