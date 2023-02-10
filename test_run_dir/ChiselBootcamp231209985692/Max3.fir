;buildInfoPackage: chisel3, version: 3.1.2, scalaVersion: 2.11.12, sbtVersion: 1.1.1, builtAtString: 2018-07-25 16:52:17.431, builtAtMillis: 1532537537431
circuit Max3 : 
  module Max3 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in1 : UInt<16>, flip in2 : UInt<16>, flip in3 : UInt<16>, out : UInt<16>}
    
    node _T_13 = gt(io.in1, io.in2) @[ChiselBootcamp23.scala 24:17]
    node _T_14 = gt(io.in1, io.in3) @[ChiselBootcamp23.scala 24:36]
    node _T_15 = and(_T_13, _T_14) @[ChiselBootcamp23.scala 24:26]
    when _T_15 : @[ChiselBootcamp23.scala 24:45]
      io.out <= io.in1 @[ChiselBootcamp23.scala 25:16]
      skip @[ChiselBootcamp23.scala 24:45]
    else : @[ChiselBootcamp23.scala 26:51]
      node _T_16 = gt(io.in2, io.in3) @[ChiselBootcamp23.scala 26:23]
      node _T_17 = gt(io.in2, io.in1) @[ChiselBootcamp23.scala 26:42]
      node _T_18 = and(_T_16, _T_17) @[ChiselBootcamp23.scala 26:32]
      when _T_18 : @[ChiselBootcamp23.scala 26:51]
        io.out <= io.in2 @[ChiselBootcamp23.scala 27:16]
        skip @[ChiselBootcamp23.scala 26:51]
      else : @[ChiselBootcamp23.scala 28:16]
        io.out <= io.in3 @[ChiselBootcamp23.scala 29:16]
        skip @[ChiselBootcamp23.scala 28:16]
    
