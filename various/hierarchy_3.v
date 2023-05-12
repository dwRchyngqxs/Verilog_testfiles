    module aoi12(a, y);
      input a;
      output y;
      assign y = ~a;
    endmodule

    module noTop(a, y);
      input a;
      output [31:0] y;
      assign y = a;
    endmodule
