module buffer(input i, output o);
specify
(i => o) = 10;
endspecify
endmodule

module top(input i, output o, p);
buffer b(.i(i), .o(o));
endmodule
