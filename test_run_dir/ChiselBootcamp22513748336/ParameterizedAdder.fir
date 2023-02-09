;buildInfoPackage: chisel3, version: 3.1.2, scalaVersion: 2.11.12, sbtVersion: 1.1.1, builtAtString: 2018-07-25 16:52:17.431, builtAtMillis: 1532537537431
circuit ParameterizedAdder : 
  module ParameterizedAdder : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in_a : UInt<4>, flip in_b : UInt<4>, out : UInt<4>}
    
    node sum = add(io.in_a, io.in_b) @[ChiselBootcamp22.scala 119:23]
    io.out <= sum @[ChiselBootcamp22.scala 123:16]
    
