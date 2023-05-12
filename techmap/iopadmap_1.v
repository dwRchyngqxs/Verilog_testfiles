module ibuf ((* iopad_external_pin *) input i, output o); endmodule
module obuf (input i, (* iopad_external_pin *) output o); endmodule
module obuft (input i, input oe, (* iopad_external_pin *) output o); endmodule
module iobuf (input i, input oe, output o, (* iopad_external_pin *) inout io); endmodule

module buf_inside (input i, output o);
obuf b (.i(i), .o(o));
endmodule

module a(input i, output o);
assign o = i;
endmodule

module b(input i, output o);
ibuf b (.i(i), .o(o));
endmodule

module c(input i, output o);
obuf b (.i(i), .o(o));
endmodule

module d(input i, oe, output o, o2, o3);
assign o = oe ? i : 1'bz;
assign o2 = o;
assign o3 = ~o;
endmodule

module e(input i, oe, inout io, output o2, o3);
assign io = oe ? i : 1'bz;
assign o2 = io;
assign o3 = ~io;
endmodule

module f(output o, o2);
assign o = 1'bz;
endmodule

module g(inout io, output o);
assign o = io;
endmodule

module h(inout io, output o, input i);
assign io = i;
assign o = io;
endmodule

module i(input i, output o);
buf_inside b (.i(i), .o(o));
endmodule

module j(input i, output o);
wire tmp;
obuf b (.i(i), .o(tmp));
assign o = tmp;
endmodule

module k(inout o, o2);
assign o = 1'bz;
endmodule
