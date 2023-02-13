;buildInfoPackage: chisel3, version: 3.1.2, scalaVersion: 2.11.12, sbtVersion: 1.1.1, builtAtString: 2018-07-25 16:52:17.431, builtAtMillis: 1532537537431
circuit ClockExamples : 
  module ClockExamples : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : UInt<10>, flip alternateReset : UInt<1>, flip alternateClock : Clock, outImplicit : UInt, outAlternateReset : UInt, outAlternateClock : UInt, outAlternateBoth : UInt}
    
    reg imp : UInt<10>, clock with : (reset => (reset, UInt<10>("h00"))) @[ChiselBootcamp24.scala 117:22]
    imp <= io.in @[ChiselBootcamp24.scala 118:9]
    io.outImplicit <= imp @[ChiselBootcamp24.scala 119:20]
    reg _T_23 : UInt<10>, clock with : (reset => (io.alternateReset, UInt<10>("h00"))) @[ChiselBootcamp24.scala 123:29]
    _T_23 <= io.in @[ChiselBootcamp24.scala 124:16]
    io.outAlternateReset <= _T_23 @[ChiselBootcamp24.scala 125:30]
    reg _T_26 : UInt<10>, io.alternateClock with : (reset => (reset, UInt<10>("h00"))) @[ChiselBootcamp24.scala 129:29]
    _T_26 <= io.in @[ChiselBootcamp24.scala 130:16]
    io.outAlternateClock <= _T_26 @[ChiselBootcamp24.scala 131:30]
    reg _T_29 : UInt<10>, io.alternateClock with : (reset => (io.alternateReset, UInt<10>("h00"))) @[ChiselBootcamp24.scala 135:26]
    _T_29 <= io.in @[ChiselBootcamp24.scala 136:13]
    io.outAlternateBoth <= _T_29 @[ChiselBootcamp24.scala 137:29]
    
