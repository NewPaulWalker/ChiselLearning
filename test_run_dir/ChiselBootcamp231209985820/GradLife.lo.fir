circuit GradLife : @[:@2.0]
  module GradLife : @[:@3.2]
    input clock : Clock @[:@4.4]
    input reset : UInt<1> @[:@5.4]
    input io_state : UInt<2> @[:@6.4]
    input io_coffee : UInt<1> @[:@6.4]
    input io_idea : UInt<1> @[:@6.4]
    input io_pressure : UInt<1> @[:@6.4]
    output io_nextState : UInt<2> @[:@6.4]
  
    node _T_15 = eq(io_state, UInt<2>("h0")) @[ChiselBootcamp23.scala 211:19:@9.4]
    node _GEN_0 = mux(io_pressure, UInt<2>("h2"), UInt<2>("h0")) @[ChiselBootcamp23.scala 216:32:@19.10]
    node _GEN_1 = mux(io_idea, UInt<2>("h0"), _GEN_0) @[ChiselBootcamp23.scala 214:28:@15.8]
    node _GEN_2 = mux(io_coffee, UInt<2>("h1"), _GEN_1) @[ChiselBootcamp23.scala 212:24:@11.6]
    node _T_16 = eq(io_state, UInt<2>("h1")) @[ChiselBootcamp23.scala 219:25:@24.6]
    node _T_17 = or(io_idea, io_pressure) @[ChiselBootcamp23.scala 222:28:@30.10]
    node _GEN_3 = mux(_T_17, UInt<2>("h2"), UInt<2>("h0")) @[ChiselBootcamp23.scala 222:43:@31.10]
    node _GEN_4 = mux(io_coffee, UInt<2>("h1"), _GEN_3) @[ChiselBootcamp23.scala 220:24:@26.8]
    node _T_18 = eq(io_state, UInt<2>("h2")) @[ChiselBootcamp23.scala 225:25:@36.8]
    node _T_19 = or(io_coffee, io_idea) @[ChiselBootcamp23.scala 226:24:@38.10]
    node _GEN_5 = mux(io_pressure, UInt<2>("h3"), UInt<2>("h0")) @[ChiselBootcamp23.scala 228:33:@43.12]
    node _GEN_6 = mux(_T_19, UInt<2>("h2"), _GEN_5) @[ChiselBootcamp23.scala 226:36:@39.10]
    node _GEN_7 = mux(_T_18, _GEN_6, UInt<2>("h0")) @[ChiselBootcamp23.scala 225:38:@37.8]
    node _GEN_8 = mux(_T_16, _GEN_4, _GEN_7) @[ChiselBootcamp23.scala 219:36:@25.6]
    node _GEN_9 = mux(_T_15, _GEN_2, _GEN_8) @[ChiselBootcamp23.scala 211:28:@10.4]
    io_nextState <= _GEN_9 @[ChiselBootcamp23.scala 209:18:@8.4 ChiselBootcamp23.scala 213:26:@12.8 ChiselBootcamp23.scala 215:26:@16.10 ChiselBootcamp23.scala 217:26:@20.12 ChiselBootcamp23.scala 221:26:@27.10 ChiselBootcamp23.scala 223:26:@32.12 ChiselBootcamp23.scala 227:26:@40.12 ChiselBootcamp23.scala 229:26:@44.14]
