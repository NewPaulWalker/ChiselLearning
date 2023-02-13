circuit RegisterModule : @[:@2.0]
  module RegisterModule : @[:@3.2]
    input clock : Clock @[:@4.4]
    input reset : UInt<1> @[:@5.4]
    input io_in : UInt<12> @[:@6.4]
    output io_out : UInt<12> @[:@6.4]
  
    reg register : UInt<12>, clock with :
      reset => (UInt<1>("h0"), register) @[ChiselBootcamp24.scala 16:27:@8.4]
    node _T_12 = add(io_in, UInt<1>("h1")) @[ChiselBootcamp24.scala 17:23:@9.4]
    node _T_13 = tail(_T_12, 1) @[ChiselBootcamp24.scala 17:23:@10.4]
    io_out <= register @[ChiselBootcamp24.scala 18:12:@12.4]
    register <= mux(reset, UInt<1>("h0"), _T_13) @[ChiselBootcamp24.scala 17:14:@11.4]
