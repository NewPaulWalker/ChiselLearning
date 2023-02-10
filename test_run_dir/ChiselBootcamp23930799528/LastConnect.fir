;buildInfoPackage: chisel3, version: 3.1.2, scalaVersion: 2.11.12, sbtVersion: 1.1.1, builtAtString: 2018-07-25 16:52:17.431, builtAtMillis: 1532537537431
circuit LastConnect : 
  module LastConnect : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : UInt<4>, out : UInt<4>}
    
    io.out <= UInt<1>("h01") @[ChiselBootcamp23.scala 9:12]
    io.out <= UInt<2>("h02") @[ChiselBootcamp23.scala 10:12]
    io.out <= UInt<2>("h03") @[ChiselBootcamp23.scala 11:12]
    io.out <= UInt<3>("h04") @[ChiselBootcamp23.scala 12:12]
    
