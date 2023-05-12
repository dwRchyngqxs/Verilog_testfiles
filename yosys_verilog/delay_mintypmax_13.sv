module test;
    reg clk;
    initial clk = 1'b0;
    always clk = #(100:180:230) ~clk;
    task t_test;
        sig_036_A <= #(2: 4: 5.5) 0;
        sig_036_B <= #(1.3) 0;
        sig_036_S <= #(2) 0;
        #(100 : 200 : 300);
        sig_036_A <= #(1.5:2.5:3.0) ~0;
        sig_036_B <= #(4:6:6) ~0;
        sig_036_S <= #(1.5:2.5:3.0) ~0;
        #100;
    endtask
endmodule
