module doubleslash
  (input  logic   a,
   input  logic   b,
   output logic   z);

  logic \a//b ;

  assign \a//b = a & b;
  assign z = ~\a//b ;

endmodule : doubleslash
