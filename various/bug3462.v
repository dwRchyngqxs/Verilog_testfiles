module top();
    wire array[0:0];
    wire out;
    sub #(.d(1)) inst(
        .in(array[0]),
        .out(out)
    );
endmodule
