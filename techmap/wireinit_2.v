(* techmap_celltype = "$_DFF_P_" *)
module ffmap();
input D;
input C;
output Q;
parameter [0:0] _TECHMAP_WIREINIT_Q_ = 1'bx;

ffbb #(.INIT(_TECHMAP_WIREINIT_Q_)) _TECHMAP_REPLACE_(.D(D), .Q(Q), .C(C));

wire _TECHMAP_FAIL_ = _TECHMAP_WIREINIT_Q_ === 1'b1;

wire _TECHMAP_REMOVEINIT_Q_ = 1'b0;

endmodule
