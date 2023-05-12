(* abc9_lut=1, blackbox *)
module LUT2(input [1:0] i, output o);
parameter [3:0] mask = 0;
assign o = i[0] ? (i[1] ? mask[3] : mask[2])
                : (i[1] ? mask[1] : mask[0]);
specify
  (i *> o) = 1;
endspecify
endmodule

module abc9_test037(input [1:0] i, output o);
LUT2 #(.mask(4'b0)) lut (.i(i), .o(o));
endmodule
