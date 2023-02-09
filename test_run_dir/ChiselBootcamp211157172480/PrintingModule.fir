;buildInfoPackage: chisel3, version: 3.1.2, scalaVersion: 2.11.12, sbtVersion: 1.1.1, builtAtString: 2018-07-25 16:52:17.431, builtAtMillis: 1532537537431
circuit PrintingModule : 
  module PrintingModule : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : UInt<4>, out : UInt<4>}
    
    io.out <= io.in @[ChiselBootcamp21.scala 24:12]
    node _T_9 = bits(reset, 0, 0) @[ChiselBootcamp21.scala 25:11]
    node _T_11 = eq(_T_9, UInt<1>("h00")) @[ChiselBootcamp21.scala 25:11]
    when _T_11 : @[ChiselBootcamp21.scala 25:11]
      printf(clock, UInt<1>(1), "Print during simulation: Input is %d\n", io.in) @[ChiselBootcamp21.scala 25:11]
      skip @[ChiselBootcamp21.scala 25:11]
    node _T_12 = bits(reset, 0, 0) @[ChiselBootcamp21.scala 26:11]
    node _T_14 = eq(_T_12, UInt<1>("h00")) @[ChiselBootcamp21.scala 26:11]
    when _T_14 : @[ChiselBootcamp21.scala 26:11]
      printf(clock, UInt<1>(1), "Print during simulation: IO is Bundle(in -> %d, out -> %d)\n", io.in, io.out) @[ChiselBootcamp21.scala 26:11]
      skip @[ChiselBootcamp21.scala 26:11]
    
