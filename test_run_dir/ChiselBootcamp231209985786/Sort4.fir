;buildInfoPackage: chisel3, version: 3.1.2, scalaVersion: 2.11.12, sbtVersion: 1.1.1, builtAtString: 2018-07-25 16:52:17.431, builtAtMillis: 1532537537431
circuit Sort4 : 
  module Sort4 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in0 : UInt<16>, flip in1 : UInt<16>, flip in2 : UInt<16>, flip in3 : UInt<16>, out0 : UInt<16>, out1 : UInt<16>, out2 : UInt<16>, out3 : UInt<16>}
    
    wire row10 : UInt<16> @[ChiselBootcamp23.scala 55:21]
    wire row11 : UInt<16> @[ChiselBootcamp23.scala 56:21]
    wire row12 : UInt<16> @[ChiselBootcamp23.scala 57:21]
    wire row13 : UInt<16> @[ChiselBootcamp23.scala 58:21]
    node _T_25 = lt(io.in0, io.in1) @[ChiselBootcamp23.scala 60:17]
    when _T_25 : @[ChiselBootcamp23.scala 60:26]
      row10 <= io.in0 @[ChiselBootcamp23.scala 61:15]
      row11 <= io.in1 @[ChiselBootcamp23.scala 62:15]
      skip @[ChiselBootcamp23.scala 60:26]
    else : @[ChiselBootcamp23.scala 63:16]
      row10 <= io.in1 @[ChiselBootcamp23.scala 64:15]
      row11 <= io.in0 @[ChiselBootcamp23.scala 65:15]
      skip @[ChiselBootcamp23.scala 63:16]
    node _T_26 = lt(io.in2, io.in3) @[ChiselBootcamp23.scala 67:17]
    when _T_26 : @[ChiselBootcamp23.scala 67:27]
      row12 <= io.in2 @[ChiselBootcamp23.scala 68:15]
      row13 <= io.in3 @[ChiselBootcamp23.scala 69:15]
      skip @[ChiselBootcamp23.scala 67:27]
    else : @[ChiselBootcamp23.scala 70:17]
      row12 <= io.in3 @[ChiselBootcamp23.scala 71:15]
      row13 <= io.in2 @[ChiselBootcamp23.scala 72:15]
      skip @[ChiselBootcamp23.scala 70:17]
    wire row21 : UInt<16> @[ChiselBootcamp23.scala 74:21]
    wire row22 : UInt<16> @[ChiselBootcamp23.scala 75:21]
    node _T_29 = lt(row11, row12) @[ChiselBootcamp23.scala 77:16]
    when _T_29 : @[ChiselBootcamp23.scala 77:25]
      row21 <= row11 @[ChiselBootcamp23.scala 78:15]
      row22 <= row12 @[ChiselBootcamp23.scala 79:15]
      skip @[ChiselBootcamp23.scala 77:25]
    else : @[ChiselBootcamp23.scala 80:17]
      row21 <= row12 @[ChiselBootcamp23.scala 81:15]
      row22 <= row11 @[ChiselBootcamp23.scala 82:15]
      skip @[ChiselBootcamp23.scala 80:17]
    wire row20 : UInt<16> @[ChiselBootcamp23.scala 85:21]
    wire row23 : UInt<16> @[ChiselBootcamp23.scala 86:21]
    node _T_32 = lt(row10, row13) @[ChiselBootcamp23.scala 87:16]
    when _T_32 : @[ChiselBootcamp23.scala 87:25]
      row20 <= row10 @[ChiselBootcamp23.scala 88:15]
      row23 <= row13 @[ChiselBootcamp23.scala 89:15]
      skip @[ChiselBootcamp23.scala 87:25]
    else : @[ChiselBootcamp23.scala 90:17]
      row20 <= row13 @[ChiselBootcamp23.scala 91:15]
      row23 <= row10 @[ChiselBootcamp23.scala 92:15]
      skip @[ChiselBootcamp23.scala 90:17]
    node _T_33 = lt(row20, row21) @[ChiselBootcamp23.scala 94:16]
    when _T_33 : @[ChiselBootcamp23.scala 94:25]
      io.out0 <= row20 @[ChiselBootcamp23.scala 95:17]
      io.out1 <= row21 @[ChiselBootcamp23.scala 96:17]
      skip @[ChiselBootcamp23.scala 94:25]
    else : @[ChiselBootcamp23.scala 97:17]
      io.out0 <= row21 @[ChiselBootcamp23.scala 98:17]
      io.out1 <= row20 @[ChiselBootcamp23.scala 99:17]
      skip @[ChiselBootcamp23.scala 97:17]
    node _T_34 = lt(row22, row23) @[ChiselBootcamp23.scala 102:16]
    when _T_34 : @[ChiselBootcamp23.scala 102:25]
      io.out2 <= row22 @[ChiselBootcamp23.scala 103:17]
      io.out3 <= row23 @[ChiselBootcamp23.scala 104:17]
      skip @[ChiselBootcamp23.scala 102:25]
    else : @[ChiselBootcamp23.scala 105:17]
      io.out2 <= row23 @[ChiselBootcamp23.scala 106:17]
      io.out3 <= row22 @[ChiselBootcamp23.scala 107:17]
      skip @[ChiselBootcamp23.scala 105:17]
    
