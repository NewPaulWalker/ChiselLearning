;buildInfoPackage: chisel3, version: 3.1.2, scalaVersion: 2.11.12, sbtVersion: 1.1.1, builtAtString: 2018-07-25 16:52:17.431, builtAtMillis: 1532537537431
circuit RegisterModule : 
  module RegisterModule : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : UInt<12>, out : UInt<12>}
    
    reg register : UInt<12>, clock with : (reset => (reset, UInt<1>("h00"))) @[ChiselBootcamp24.scala 16:27]
    node _T_12 = add(io.in, UInt<1>("h01")) @[ChiselBootcamp24.scala 17:23]
    node _T_13 = tail(_T_12, 1) @[ChiselBootcamp24.scala 17:23]
    register <= _T_13 @[ChiselBootcamp24.scala 17:14]
    io.out <= register @[ChiselBootcamp24.scala 18:12]
    
