module RegisterModule( // @[:@3.2]
  input         clock, // @[:@4.4]
  input         reset, // @[:@5.4]
  input  [11:0] io_in, // @[:@6.4]
  output [11:0] io_out // @[:@6.4]
);
  reg [11:0] register; // @[ChiselBootcamp24.scala 16:27:@8.4]
  reg [31:0] _RAND_0;
  wire [12:0] _T_12; // @[ChiselBootcamp24.scala 17:23:@9.4]
  wire [11:0] _T_13; // @[ChiselBootcamp24.scala 17:23:@10.4]
  assign _T_12 = io_in + 12'h1; // @[ChiselBootcamp24.scala 17:23:@9.4]
  assign _T_13 = _T_12[11:0]; // @[ChiselBootcamp24.scala 17:23:@10.4]
  assign io_out = register; // @[ChiselBootcamp24.scala 18:12:@12.4]
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
  register = _RAND_0[11:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      register <= 12'h0;
    end else begin
      register <= _T_13;
    end
  end
endmodule
