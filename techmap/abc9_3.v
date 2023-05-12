module top(input a, b, output o);
wire w;
(* keep *) \$_AND_ gate (.Y(w), .A(a), .B(b));
assign o = ~w;
endmodule
