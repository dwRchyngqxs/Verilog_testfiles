module test (A, S, Y);
        parameter INPUTS = 6;

        input [INPUTS-1:0] A;
        input [$clog2(INPUTS)-1:0] S;

        wire [15:0] AA = {{(16-INPUTS){1'b0}}, A};
        wire [3:0] SS = {{(4-$clog2(INPUTS)){1'b0}}, S};

        output reg Y = SS[3] ? (SS[2] ? SS[1] ? (SS[0] ? AA[15] : AA[14])
                                          : (SS[0] ? AA[13] : AA[12])
                                  : SS[1] ? (SS[0] ? AA[11] : AA[10])
                                          : (SS[0] ? AA[9] : AA[8]))
                         : (SS[2] ? SS[1] ? (SS[0] ? AA[7] : AA[6])
                                          : (SS[0] ? AA[5] : AA[4])
                                  : SS[1] ? (SS[0] ? AA[3] : AA[2])
                                          : (SS[0] ? AA[1] : AA[0]));
endmodule
