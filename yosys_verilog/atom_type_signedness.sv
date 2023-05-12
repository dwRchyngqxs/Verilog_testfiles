module dut();

enum integer  { uInteger  = -10 } a;
enum int      { uInt      = -11 } b;
enum shortint { uShortInt = -12 } c;
enum byte     { uByte     = -13 } d;

always_comb begin
  assert(-10 == uInteger);
  assert(-11 == uInt);
  assert(-12 == uShortInt);
  assert(-13 == uByte);
end
endmodule
