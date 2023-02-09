circuit Passthrough : @[:@2.0]
  module Passthrough : @[:@3.2]
    input clock : Clock @[:@4.4]
    input reset : UInt<1> @[:@5.4]
    input io_in : UInt<4> @[:@6.4]
    output io_out : UInt<4> @[:@6.4]
  
    io_out <= io_in @[ChiselBootcamp21.scala 10:12:@8.4]
