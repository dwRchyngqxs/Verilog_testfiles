    module top;
        foo bar();
        foo asdf();
        winnie the_pooh();

        wire [1023:0] _RUNME0 = "select -assert-count 2 t:foo";
        wire [1023:0] _RUNME1 = "select -assert-count 1 t:winnie";
    endmodule

    module other;
        wire [1023:0] _DELETE = "cd; delete c:bar";
    endmodule
