;buildInfoPackage: chisel3, version: 3.1.2, scalaVersion: 2.11.12, sbtVersion: 1.1.1, builtAtString: 2018-07-25 16:52:17.431, builtAtMillis: 1532537537431
circuit MAC : 
  module MAC : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in_a : UInt<4>, flip in_b : UInt<4>, flip in_c : UInt<4>, out : UInt<8>}
    
    node _T_13 = mul(io.in_a, io.in_b) @[ChiselBootcamp22.scala 52:22]
    node _T_14 = add(_T_13, io.in_c) @[ChiselBootcamp22.scala 52:31]
    node _T_15 = tail(_T_14, 1) @[ChiselBootcamp22.scala 52:31]
    io.out <= _T_15 @[ChiselBootcamp22.scala 52:12]
    
