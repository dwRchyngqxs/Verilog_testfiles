module top(input a, b, output o);
(* keep *) wire w = a & b;
assign o = ~w;
endmodule
