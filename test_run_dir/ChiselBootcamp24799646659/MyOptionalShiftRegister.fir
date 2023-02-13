;buildInfoPackage: chisel3, version: 3.1.2, scalaVersion: 2.11.12, sbtVersion: 1.1.1, builtAtString: 2018-07-25 16:52:17.431, builtAtMillis: 1532537537431
circuit MyOptionalShiftRegister : 
  module MyOptionalShiftRegister : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip en : UInt<1>, flip in : UInt<1>, out : UInt<65>}
    
    reg state : UInt<65>, clock with : (reset => (reset, UInt<65>("h01"))) @[ChiselBootcamp24.scala 81:24]
    node _T_13 = shl(state, 1) @[ChiselBootcamp24.scala 82:28]
    node nextState = or(_T_13, io.in) @[ChiselBootcamp24.scala 82:34]
    when io.en : @[ChiselBootcamp24.scala 83:16]
      state <= nextState @[ChiselBootcamp24.scala 84:15]
      skip @[ChiselBootcamp24.scala 83:16]
    io.out <= state @[ChiselBootcamp24.scala 86:12]
    
