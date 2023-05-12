module test;
    reg q;
    initial begin
        q = 1;
        #(1:2:2) q = 0;
    end
endmodule
