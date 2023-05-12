module inverter(input a, output y);

   assign y = (a == 1'b0? 1'b1 : 1'b0);
   
endmodule // inverter
