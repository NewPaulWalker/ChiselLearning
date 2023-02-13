module ClockExamples( // @[:@3.2]
  input        clock, // @[:@4.4]
  input        reset, // @[:@5.4]
  input  [9:0] io_in, // @[:@6.4]
  input        io_alternateReset, // @[:@6.4]
  input        io_alternateClock, // @[:@6.4]
  output [9:0] io_outImplicit, // @[:@6.4]
  output [9:0] io_outAlternateReset, // @[:@6.4]
  output [9:0] io_outAlternateClock, // @[:@6.4]
  output [9:0] io_outAlternateBoth // @[:@6.4]
);
  reg [9:0] imp; // @[ChiselBootcamp24.scala 117:22:@8.4]
  reg [31:0] _RAND_0;
  reg [9:0] _T_23; // @[ChiselBootcamp24.scala 123:29:@11.4]
  reg [31:0] _RAND_1;
  reg [9:0] _T_26; // @[ChiselBootcamp24.scala 129:29:@14.4]
  reg [31:0] _RAND_2;
  reg [9:0] _T_29; // @[ChiselBootcamp24.scala 135:26:@17.4]
  reg [31:0] _RAND_3;
  assign io_outImplicit = imp; // @[ChiselBootcamp24.scala 119:20:@10.4]
  assign io_outAlternateReset = _T_23; // @[ChiselBootcamp24.scala 125:30:@13.4]
  assign io_outAlternateClock = _T_26; // @[ChiselBootcamp24.scala 131:30:@16.4]
  assign io_outAlternateBoth = _T_29; // @[ChiselBootcamp24.scala 137:29:@19.4]
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
  imp = _RAND_0[9:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{$random}};
  _T_23 = _RAND_1[9:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{$random}};
  _T_26 = _RAND_2[9:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{$random}};
  _T_29 = _RAND_3[9:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      imp <= 10'h0;
    end else begin
      imp <= io_in;
    end
    if (io_alternateReset) begin
      _T_23 <= 10'h0;
    end else begin
      _T_23 <= io_in;
    end
  end
  always @(posedge io_alternateClock) begin
    if (reset) begin
      _T_26 <= 10'h0;
    end else begin
      _T_26 <= io_in;
    end
    if (io_alternateReset) begin
      _T_29 <= 10'h0;
    end else begin
      _T_29 <= io_in;
    end
  end
endmodule
