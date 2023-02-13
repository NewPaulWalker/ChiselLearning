;buildInfoPackage: chisel3, version: 3.1.2, scalaVersion: 2.11.12, sbtVersion: 1.1.1, builtAtString: 2018-07-25 16:52:17.431, builtAtMillis: 1532537537431
circuit RegisterModule : 
  module RegisterModule : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : UInt<12>, out : UInt<12>}
    
    reg register : UInt<12>, clock @[ChiselBootcamp24.scala 9:23]
    node _T_11 = add(io.in, UInt<1>("h01")) @[ChiselBootcamp24.scala 10:23]
    node _T_12 = tail(_T_11, 1) @[ChiselBootcamp24.scala 10:23]
    register <= _T_12 @[ChiselBootcamp24.scala 10:14]
    io.out <= register @[ChiselBootcamp24.scala 11:12]
    
