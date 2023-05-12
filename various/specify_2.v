(* blackbox *)
module test7_sub(input i, output o);
specify
    (i => o) = 1;
endspecify
assign o = ~i;
endmodule

module test7(input i, output o);
    wire w;
    test7_sub unused(i, w);
    test7_sub used(i, o);
endmodule
