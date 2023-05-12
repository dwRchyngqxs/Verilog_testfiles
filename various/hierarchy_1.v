    module TOP(a, y);
      input a;
      output [31:0] y;

      aoi12 p [31:0] (a, y);
    endmodule

    module aoi12(a, y);
      input a;
      output y;
      assign y = ~a;
    endmodule
