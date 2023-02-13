module Comb( // @[:@3.2]
  input         clock, // @[:@4.4]
  input         reset, // @[:@5.4]
  input  [11:0] io_in, // @[:@6.4]
  output [11:0] io_out // @[:@6.4]
);
  reg [11:0] delay; // @[ChiselBootcamp24.scala 44:26:@8.4]
  reg [31:0] _RAND_0;
  wire [12:0] _T_10; // @[ChiselBootcamp24.scala 46:21:@10.4]
  wire [11:0] _T_11; // @[ChiselBootcamp24.scala 46:21:@11.4]
  assign _T_10 = $signed(io_in) - $signed(delay); // @[ChiselBootcamp24.scala 46:21:@10.4]
  assign _T_11 = _T_10[11:0]; // @[ChiselBootcamp24.scala 46:21:@11.4]
  assign io_out = $signed(_T_11); // @[ChiselBootcamp24.scala 46:12:@13.4]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{$random}};
  delay = _RAND_0[11:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    delay <= io_in;
  end
endmodule
