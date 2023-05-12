module obuf (input i, (* iopad_external_pin *) output o); endmodule
module obuft (input i, input oe, (* iopad_external_pin *) output o); endmodule
module iobuf (input i, input oe, output o, (* iopad_external_pin *) inout io); endmodule
module sub(input i, output o); endmodule

module a(input i, (* init=1'b1 *) output o);
sub s(.i(i), .o(o));
endmodule

module b(input [1:0] i, oe, (* init=2'b1x *) output [1:0] o);
wire [1:0] w;
sub s1(.i(i[0]), .o(w[0]));
sub s2(.i(i[1]), .o(w[1]));
assign o = oe ? w : 2'bz;
endmodule

module c(input i, oe, (* init=1'b0 *) inout io, output o1, o2);
assign io = oe ? i : 1'bz;
assign {o1,o2} = {io,io};
endmodule
