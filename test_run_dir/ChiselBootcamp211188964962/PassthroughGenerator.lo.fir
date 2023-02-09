circuit PassthroughGenerator : @[:@2.0]
  module PassthroughGenerator : @[:@3.2]
    input clock : Clock @[:@4.4]
    input reset : UInt<1> @[:@5.4]
    input io_in : UInt<10> @[:@6.4]
    output io_out : UInt<10> @[:@6.4]
  
    io_out <= io_in @[ChiselBootcamp21.scala 17:12:@8.4]
