module buffer(input i, output o);
specify
(i => o) = 10;
endspecify
endmodule

module top(input i);
wire w;
buffer b(.i(i), .o(w));
endmodule
