;buildInfoPackage: chisel3, version: 3.1.2, scalaVersion: 2.11.12, sbtVersion: 1.1.1, builtAtString: 2018-07-25 16:52:17.431, builtAtMillis: 1532537537431
circuit MyOperators : 
  module MyOperators : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : UInt<4>, out_add : UInt<4>, out_sub : UInt<4>, out_mul : UInt<4>}
    
    node _T_15 = add(UInt<1>("h01"), UInt<3>("h04")) @[ChiselBootcamp22.scala 22:23]
    node _T_16 = tail(_T_15, 1) @[ChiselBootcamp22.scala 22:23]
    io.out_add <= _T_16 @[ChiselBootcamp22.scala 22:16]
    node _T_19 = sub(UInt<2>("h02"), UInt<1>("h01")) @[ChiselBootcamp22.scala 23:23]
    node _T_20 = asUInt(_T_19) @[ChiselBootcamp22.scala 23:23]
    node _T_21 = tail(_T_20, 1) @[ChiselBootcamp22.scala 23:23]
    io.out_sub <= _T_21 @[ChiselBootcamp22.scala 23:16]
    node _T_24 = mul(UInt<3>("h04"), UInt<2>("h02")) @[ChiselBootcamp22.scala 24:23]
    io.out_mul <= _T_24 @[ChiselBootcamp22.scala 24:16]
    
