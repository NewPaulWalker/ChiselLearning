;buildInfoPackage: chisel3, version: 3.1.2, scalaVersion: 2.11.12, sbtVersion: 1.1.1, builtAtString: 2018-07-25 16:52:17.431, builtAtMillis: 1532537537431
circuit FindMax : 
  module FindMax : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : UInt<10>, max : UInt<10>}
    
    reg max : UInt<10>, clock with : (reset => (reset, UInt<1>("h00"))) @[ChiselBootcamp24.scala 33:22]
    node _T_11 = gt(io.in, max) @[ChiselBootcamp24.scala 34:16]
    when _T_11 : @[ChiselBootcamp24.scala 34:22]
      max <= io.in @[ChiselBootcamp24.scala 35:13]
      skip @[ChiselBootcamp24.scala 34:22]
    io.max <= max @[ChiselBootcamp24.scala 37:12]
    
