module top;
    task foo;
    endtask

    always @*
        (* foo *) foo;

    initial
        if (0) $info("bar");
endmodule
