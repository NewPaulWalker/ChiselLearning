circuit MyShiftRegister : @[:@2.0]
  module MyShiftRegister : @[:@3.2]
    input clock : Clock @[:@4.4]
    input reset : UInt<1> @[:@5.4]
    input io_in : UInt<1> @[:@6.4]
    output io_out : UInt<4> @[:@6.4]
  
    reg state : UInt<4>, clock with :
      reset => (UInt<1>("h0"), state) @[ChiselBootcamp24.scala 54:24:@8.4]
    node _T_11 = shl(state, 1) @[ChiselBootcamp24.scala 55:28:@9.4]
    node nextState = or(_T_11, io_in) @[ChiselBootcamp24.scala 55:34:@10.4]
    io_out <= state @[ChiselBootcamp24.scala 57:12:@12.4]
    state <= mux(reset, UInt<1>("h1"), bits(nextState, 3, 0)) @[ChiselBootcamp24.scala 56:11:@11.4]
