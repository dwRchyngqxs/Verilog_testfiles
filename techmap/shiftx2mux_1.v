module sc1 (i1 ,
            i2 ,
            i3 ,
            i4 ,
            i5 ,
            i6 ,
            i7 ,
            i8 ,
            i9 ,
            i10,
            i11,
            i12,
            i13,
            i14,
            i15,
            binary_out,
            encoder_in,
            enable
);

input [3:0]   i1 ;
input [3:0]   i2 ;
input [3:0]   i3 ;
input [3:0]   i4 ;
input [3:0]   i5 ;
input [3:0]   i6 ;
input [3:0]   i7 ;
input [3:0]   i8 ;
input [3:0]   i9 ;
input [3:0]   i10 ;
input [3:0]   i11 ;
input [3:0]   i12 ;
input [3:0]   i13 ;
input [3:0]   i14 ;
input [3:0]   i15 ;

output reg [3:0] binary_out  ;

input [3:0] encoder_in ;
input  enable ;



always @ (*)
begin
	binary_out = 0;
	if (enable) begin
		case (encoder_in)
			4'h1 : binary_out = i1;
			4'h2 : binary_out = i2;
			4'h3 : binary_out = i3;
			4'h4 : binary_out = i4;
			4'h5 : binary_out = i5;
			4'h6 : binary_out = i6;
			4'h7 : binary_out = i7;
			4'h8 : binary_out = i8;
			4'h9 : binary_out = i9;
			4'ha : binary_out = i10;
			4'hb : binary_out = i11;/*
			4'hc : binary_out = i12;
			4'hd : binary_out = i13;
			4'he : binary_out = i14;
			4'hf : binary_out = i15;*/
	       endcase
       end
end
endmodule
