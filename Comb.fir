;buildInfoPackage: chisel3, version: 3.1.2, scalaVersion: 2.11.12, sbtVersion: 1.1.1, builtAtString: 2018-07-25 16:52:17.431, builtAtMillis: 1532537537431
circuit Comb : 
  module Comb : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : SInt<12>, out : SInt<12>}
    
    reg delay : SInt<12>, clock @[ChiselBootcamp24.scala 44:26]
    delay <= io.in @[ChiselBootcamp24.scala 45:11]
    node _T_10 = sub(io.in, delay) @[ChiselBootcamp24.scala 46:21]
    node _T_11 = tail(_T_10, 1) @[ChiselBootcamp24.scala 46:21]
    node _T_12 = asSInt(_T_11) @[ChiselBootcamp24.scala 46:21]
    io.out <= _T_12 @[ChiselBootcamp24.scala 46:12]
    
