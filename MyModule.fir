;buildInfoPackage: chisel3, version: 3.1.2, scalaVersion: 2.11.12, sbtVersion: 1.1.1, builtAtString: 2018-07-25 16:52:17.431, builtAtMillis: 1532537537431
circuit MyModule : 
  module MyModule : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : UInt<4>, out : UInt<4>}
    
    node _T_11 = add(UInt<1>("h01"), UInt<1>("h01")) @[ChiselBootcamp22.scala 11:20]
    node utwo = tail(_T_11, 1) @[ChiselBootcamp22.scala 11:20]
    io.out <= io.in @[ChiselBootcamp22.scala 13:12]
    
