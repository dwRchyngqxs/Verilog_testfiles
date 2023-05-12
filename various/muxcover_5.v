module mux_if_bal_9_1 #(parameter N=9, parameter W=1) (input [N*W-1:0] i, input [$clog2(N)-1:0] s, output reg [W-1:0] o);
always @* begin
    o <= {{W{{1'bx}}}};
    if (s[0] == 1'b0)
     if (s[1] == 1'b0)
      if (s[2] == 1'b0)
       if (s[3] == 1'b0)
        o <= i[0*W+:W];
       else
        o <= i[1*W+:W];
      else
       if (s[3] == 1'b0)
        o <= i[2*W+:W];
       else
        o <= i[3*W+:W];
     else
      if (s[2] == 1'b0)
       if (s[3] == 1'b0)
        o <= i[4*W+:W];
       else
        o <= i[5*W+:W];
      else
       if (s[3] == 1'b0)
        o <= i[6*W+:W];
       else
        o <= i[7*W+:W];
    else
     if (s[1] == 1'b0)
      if (s[2] == 1'b0)
       if (s[3] == 1'b0)
        o <= i[8*W+:W];
end
endmodule
