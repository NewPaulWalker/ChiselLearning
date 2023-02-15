;buildInfoPackage: chisel3, version: 3.1.2, scalaVersion: 2.11.12, sbtVersion: 1.1.1, builtAtString: 2018-07-25 16:52:17.431, builtAtMillis: 1532537537431
circuit My4ElementFir : 
  module My4ElementFir : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : UInt<8>, out : UInt<8>}
    
    reg x_n1 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[ChiselBootcamp25.scala 10:23]
    x_n1 <= io.in @[ChiselBootcamp25.scala 10:23]
    reg x_n2 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[ChiselBootcamp25.scala 11:23]
    x_n2 <= x_n1 @[ChiselBootcamp25.scala 11:23]
    reg x_n3 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[ChiselBootcamp25.scala 12:23]
    x_n3 <= x_n2 @[ChiselBootcamp25.scala 12:23]
    node _T_16 = mul(io.in, UInt<8>("h00")) @[ChiselBootcamp25.scala 13:21]
    node _T_18 = mul(x_n1, UInt<8>("h00")) @[ChiselBootcamp25.scala 13:40]
    node _T_19 = add(_T_16, _T_18) @[ChiselBootcamp25.scala 13:33]
    node _T_20 = tail(_T_19, 1) @[ChiselBootcamp25.scala 13:33]
    node _T_22 = mul(x_n2, UInt<8>("h00")) @[ChiselBootcamp25.scala 13:59]
    node _T_23 = add(_T_20, _T_22) @[ChiselBootcamp25.scala 13:52]
    node _T_24 = tail(_T_23, 1) @[ChiselBootcamp25.scala 13:52]
    node _T_26 = mul(x_n3, UInt<8>("h00")) @[ChiselBootcamp25.scala 13:78]
    node _T_27 = add(_T_24, _T_26) @[ChiselBootcamp25.scala 13:71]
    node _T_28 = tail(_T_27, 1) @[ChiselBootcamp25.scala 13:71]
    io.out <= _T_28 @[ChiselBootcamp25.scala 13:12]
    
