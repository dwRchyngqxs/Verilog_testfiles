(* abc9_box, blackbox *)
module mux_with_param(input I0, I1, S, output O);
parameter P = 0;
specify
    (I0 => O) = P;
    (I1 => O) = P;
    (S => O) = P;
endspecify
endmodule

module abc9_test039(output O);
  mux_with_param #(.P(1)) m (
    .I0(1'b1),
    .I1(1'b1),
    .O(O),
    .S(1'b0)
  );
endmodule
