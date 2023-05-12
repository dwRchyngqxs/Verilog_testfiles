interface intf;
    logic x;
    assign x = 1;
    modport m(input x);
endinterface
module mod(intf.m i);
    wire x;
    assign x = i.x;
    wire i;
endmodule
module top;
    intf i();
    mod m(i);
endmodule
