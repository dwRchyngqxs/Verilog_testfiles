module top(input clk, i, output o, p);
  (* keep *)
  \$_DFF_P_ ffo  (
    .C(clk),
    .D(i),
    .Q(o)
  );
  \$_DFF_P_ ffp  (
    .C(clk),
    .D(i),
    .Q(p)
  );
endmodule
