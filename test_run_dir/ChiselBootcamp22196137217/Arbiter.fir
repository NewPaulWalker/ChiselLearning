;buildInfoPackage: chisel3, version: 3.1.2, scalaVersion: 2.11.12, sbtVersion: 1.1.1, builtAtString: 2018-07-25 16:52:17.431, builtAtMillis: 1532537537431
circuit Arbiter : 
  module Arbiter : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip fifo_valid : UInt<1>, fifo_ready : UInt<1>, flip fifo_data : UInt<16>, pe0_valid : UInt<1>, flip pe0_ready : UInt<1>, pe0_data : UInt<16>, pe1_valid : UInt<1>, flip pe1_ready : UInt<1>, pe1_data : UInt<16>}
    
    node _T_23 = or(io.pe0_ready, io.pe1_ready) @[ChiselBootcamp22.scala 85:35]
    io.fifo_ready <= _T_23 @[ChiselBootcamp22.scala 85:19]
    node _T_24 = and(io.fifo_valid, io.pe0_ready) @[ChiselBootcamp22.scala 86:35]
    io.pe0_valid <= _T_24 @[ChiselBootcamp22.scala 86:18]
    node _T_25 = and(io.fifo_valid, io.pe1_ready) @[ChiselBootcamp22.scala 87:35]
    node _T_27 = eq(io.pe0_ready, UInt<1>("h00")) @[ChiselBootcamp22.scala 87:54]
    node _T_28 = and(_T_25, _T_27) @[ChiselBootcamp22.scala 87:51]
    io.pe1_valid <= _T_28 @[ChiselBootcamp22.scala 87:18]
    io.pe0_data <= io.fifo_data @[ChiselBootcamp22.scala 88:17]
    io.pe1_data <= io.fifo_data @[ChiselBootcamp22.scala 89:17]
    
