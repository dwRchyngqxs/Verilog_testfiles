module top(input [24:0] A, input [17:0] B, output [47:0] P);
DSP48E1 #(.PREG(0)) dsp(.A(A), .B(B), .P(P));
endmodule
