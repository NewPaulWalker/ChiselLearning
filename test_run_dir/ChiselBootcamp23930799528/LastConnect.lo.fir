circuit LastConnect : @[:@2.0]
  module LastConnect : @[:@3.2]
    input clock : Clock @[:@4.4]
    input reset : UInt<1> @[:@5.4]
    input io_in : UInt<4> @[:@6.4]
    output io_out : UInt<4> @[:@6.4]
  
    io_out <= UInt<3>("h4") @[ChiselBootcamp23.scala 9:12:@8.4 ChiselBootcamp23.scala 10:12:@9.4 ChiselBootcamp23.scala 11:12:@10.4 ChiselBootcamp23.scala 12:12:@11.4]
