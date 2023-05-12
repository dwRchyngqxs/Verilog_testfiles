    module aoi12(a, y);
      input a;
      output y;
      assign y = ~a;
    endmodule

    module TOP(a, y);
      input a;
      output [31:0] y;

      aoi12 foo (a, y);
    endmodule
