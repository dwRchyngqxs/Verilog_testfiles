module top;
    task foo;
    endtask

    always @*
        foo (* foo *);
endmodule
