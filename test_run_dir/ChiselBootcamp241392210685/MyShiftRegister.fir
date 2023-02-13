;buildInfoPackage: chisel3, version: 3.1.2, scalaVersion: 2.11.12, sbtVersion: 1.1.1, builtAtString: 2018-07-25 16:52:17.431, builtAtMillis: 1532537537431
circuit MyShiftRegister : 
  module MyShiftRegister : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : UInt<1>, out : UInt<4>}
    
    reg state : UInt<4>, clock with : (reset => (reset, UInt<1>("h01"))) @[ChiselBootcamp24.scala 54:24]
    node _T_11 = shl(state, 1) @[ChiselBootcamp24.scala 55:28]
    node nextState = or(_T_11, io.in) @[ChiselBootcamp24.scala 55:34]
    state <= nextState @[ChiselBootcamp24.scala 56:11]
    io.out <= state @[ChiselBootcamp24.scala 57:12]
    
