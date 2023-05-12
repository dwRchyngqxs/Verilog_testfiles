module top();
input A1, A2, B, S;
output O;

assign O = S ? (A1 & B) : (A2 & B);

endmodule
