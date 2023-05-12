module top(inout io);
    wire in;
    wire t;
    wire o;

    IOBUF IOBUF(
      .I(in),
      .T(t),
      .IO(io),
      .O(o)
    );
endmodule
