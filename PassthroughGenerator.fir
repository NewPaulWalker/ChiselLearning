;buildInfoPackage: chisel3, version: 3.1.2, scalaVersion: 2.11.12, sbtVersion: 1.1.1, builtAtString: 2018-07-25 16:52:17.431, builtAtMillis: 1532537537431
circuit PassthroughGenerator : 
  module PassthroughGenerator : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : UInt<10>, out : UInt<10>}
    
    io.out <= io.in @[ChiselBootcamp21.scala 17:12]
    
