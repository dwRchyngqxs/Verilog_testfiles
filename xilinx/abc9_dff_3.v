module top(input C, D, output [7:0] Q);
FDRE   #(.INIT(1)) fd1(.C(C), .CE(1'b0), .D(D), .R(1'b0), .Q(Q[0]));
FDSE   /*#(.INIT(1))*/ fd2(.C(C), .CE(1'b0), .D(D), .S(1'b0), .Q(Q[1]));
FDCE   #(.INIT(1)) fd3(.C(C), .CE(1'b0), .D(D), .CLR(1'b0), .Q(Q[2]));
FDPE   #(.INIT(1)) fd4(.C(C), .CE(1'b0), .D(D), .PRE(1'b0), .Q(Q[3]));
FDRE_1 #(.INIT(1)) fd5(.C(C), .CE(1'b0), .D(D), .R(1'b0), .Q(Q[4]));
FDSE_1 #(.INIT(1)) fd6(.C(C), .CE(1'b0), .D(D), .S(1'b0), .Q(Q[5]));
FDCE_1 /*#(.INIT(1))*/ fd7(.C(C), .CE(1'b0), .D(D), .CLR(1'b0), .Q(Q[6]));
FDPE_1 #(.INIT(1)) fd8(.C(C), .CE(1'b0), .D(D), .PRE(1'b0), .Q(Q[7]));
endmodule
