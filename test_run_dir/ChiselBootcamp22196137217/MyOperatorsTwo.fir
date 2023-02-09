;buildInfoPackage: chisel3, version: 3.1.2, scalaVersion: 2.11.12, sbtVersion: 1.1.1, builtAtString: 2018-07-25 16:52:17.431, builtAtMillis: 1532537537431
circuit MyOperatorsTwo : 
  module MyOperatorsTwo : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : UInt<4>, out_mux : UInt<4>, out_cat : UInt<4>}
    
    node _T_13 = mux(UInt<1>("h01"), UInt<2>("h03"), UInt<1>("h00")) @[ChiselBootcamp22.scala 38:22]
    io.out_mux <= _T_13 @[ChiselBootcamp22.scala 38:16]
    node _T_16 = cat(UInt<2>("h02"), UInt<1>("h01")) @[Cat.scala 30:58]
    io.out_cat <= _T_16 @[ChiselBootcamp22.scala 39:16]
    
