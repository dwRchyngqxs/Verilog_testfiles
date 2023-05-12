module buffer(input i, output o);
specify
(i => o) = 10;
endspecify
endmodule
module const0(output o);
endmodule

module top(input i, output o, p);
buffer b(.i(i), .o(o));
const0 c(.o(p));
endmodule
