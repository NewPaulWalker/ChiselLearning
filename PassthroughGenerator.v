module PassthroughGenerator( // @[:@3.2]
  input        clock, // @[:@4.4]
  input        reset, // @[:@5.4]
  input  [9:0] io_in, // @[:@6.4]
  output [9:0] io_out // @[:@6.4]
);
  assign io_out = io_in; // @[ChiselBootcamp21.scala 17:12:@8.4]
endmodule
