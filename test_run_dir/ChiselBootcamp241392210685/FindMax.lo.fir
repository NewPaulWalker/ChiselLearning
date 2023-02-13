circuit FindMax : @[:@2.0]
  module FindMax : @[:@3.2]
    input clock : Clock @[:@4.4]
    input reset : UInt<1> @[:@5.4]
    input io_in : UInt<10> @[:@6.4]
    output io_max : UInt<10> @[:@6.4]
  
    reg max : UInt<10>, clock with :
      reset => (UInt<1>("h0"), max) @[ChiselBootcamp24.scala 33:22:@8.4]
    node _T_11 = gt(io_in, max) @[ChiselBootcamp24.scala 34:16:@9.4]
    node _GEN_0 = mux(_T_11, io_in, max) @[ChiselBootcamp24.scala 34:22:@10.4]
    io_max <= max @[ChiselBootcamp24.scala 37:12:@13.4]
    max <= mux(reset, UInt<1>("h0"), _GEN_0) @[ChiselBootcamp24.scala 35:13:@11.6]
