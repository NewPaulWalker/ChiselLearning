circuit PrintingModule : @[:@2.0]
  module PrintingModule : @[:@3.2]
    input clock : Clock @[:@4.4]
    input reset : UInt<1> @[:@5.4]
    input io_in : UInt<4> @[:@6.4]
    output io_out : UInt<4> @[:@6.4]
  
    node _T_9 = bits(reset, 0, 0) @[ChiselBootcamp21.scala 25:11:@9.4]
    node _T_11 = eq(_T_9, UInt<1>("h0")) @[ChiselBootcamp21.scala 25:11:@10.4]
    node _T_12 = bits(reset, 0, 0) @[ChiselBootcamp21.scala 26:11:@14.4]
    node _T_14 = eq(_T_12, UInt<1>("h0")) @[ChiselBootcamp21.scala 26:11:@15.4]
    io_out <= io_in @[ChiselBootcamp21.scala 24:12:@8.4]
    printf(clock, and(and(UInt<1>("h1"), _T_11), UInt<1>("h1")), "Print during simulation: Input is %d\n", io_in) @[ChiselBootcamp21.scala 25:11:@12.6]
    printf(clock, and(and(UInt<1>("h1"), _T_14), UInt<1>("h1")), "Print during simulation: IO is Bundle(in -> %d, out -> %d)\n", io_in, io_out) @[ChiselBootcamp21.scala 26:11:@17.6]
