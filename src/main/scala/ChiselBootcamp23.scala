import chisel3._
import chisel3.util._
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}
class LastConnect extends Module{
    val io = IO(new Bundle{
        val in = Input(UInt(4.W))
        val out = Output(UInt(4.W))
    })
    io.out := 1.U
    io.out := 2.U
    io.out := 3.U
    io.out := 4.U
}
class LastConnectTester(c:LastConnect) extends PeekPokeTester(c){
    expect(c.io.out, 4)
}
class Max3 extends Module{
    val io = IO(new Bundle{
        val in1 = Input(UInt(16.W))
        val in2 = Input(UInt(16.W))
        val in3 = Input(UInt(16.W))
        val out = Output(UInt(16.W))
    })
    when(io.in1 > io.in2 && io.in1 > io.in3){
        io.out := io.in1
    }.elsewhen(io.in2 > io.in3 && io.in2 > io.in1){
        io.out := io.in2
    }.otherwise{
        io.out := io.in3
    }
}
class Max3Tester(c:Max3) extends PeekPokeTester(c){
    poke(c.io.in1, 6)
    poke(c.io.in2, 4)
    poke(c.io.in3, 2)
    expect(c.io.out, 6) // 第一个输入应该是最大的
    poke(c.io.in2, 7)
    expect(c.io.out, 7) // 第二个输入应该是最大的
    poke(c.io.in3, 11)
    expect(c.io.out, 11) // 第三个输入应该是最大的
    poke(c.io.in3, 3)
    expect(c.io.out, 7) // 测试递减序列
}
class Sort4 extends Module{
    val io = IO(new Bundle {
        val in0 = Input(UInt(16.W))
        val in1 = Input(UInt(16.W))
        val in2 = Input(UInt(16.W))
        val in3 = Input(UInt(16.W))
        val out0 = Output(UInt(16.W))
        val out1 = Output(UInt(16.W))
        val out2 = Output(UInt(16.W))
        val out3 = Output(UInt(16.W))
    })
    val row10 = Wire(UInt(16.W))
    val row11 = Wire(UInt(16.W))
    val row12 = Wire(UInt(16.W))
    val row13 = Wire(UInt(16.W))

    when(io.in0 < io.in1){
        row10 := io.in0
        row11 := io.in1
    }.otherwise{
        row10 := io.in1
        row11 := io.in0
    }
    when(io.in2 < io.in3) {
        row12 := io.in2
        row13 := io.in3
    }.otherwise {
        row12 := io.in3
        row13 := io.in2
    }
    val row21 = Wire(UInt(16.W))
    val row22 = Wire(UInt(16.W))

    when(row11 < row12) {
        row21 := row11 // 保留中间两个元素
        row22 := row12
    }.otherwise {
        row21 := row12 // 交换中间两个元素
        row22 := row11
    }

    val row20 = Wire(UInt(16.W))
    val row23 = Wire(UInt(16.W))
    when(row10 < row13) {
        row20 := row10 // 保留中间两个元素
        row23 := row13
    }.otherwise {
        row20 := row13 // 交换中间两个元素
        row23 := row10
    }
    when(row20 < row21) {
        io.out0 := row20 // 保留头两个元素
        io.out1 := row21
    }.otherwise {
        io.out0 := row21 // 交换头两个元素
        io.out1 := row20
    }

    when(row22 < row23) {
        io.out2 := row22 // 保留头两个元素
        io.out3 := row23
    }.otherwise {
        io.out2 := row23 // 交换头两个元素
        io.out3 := row22
    }
}
class Sort4Tester(c: Sort4) extends PeekPokeTester(c) {
    poke(c.io.in0, 3)
    poke(c.io.in1, 6)
    poke(c.io.in2, 9)
    poke(c.io.in3, 12)
    expect(c.io.out0, 3)
    expect(c.io.out1, 6)
    expect(c.io.out2, 9)
    expect(c.io.out3, 12)

    poke(c.io.in0, 13)
    poke(c.io.in1, 4)
    poke(c.io.in2, 6)
    poke(c.io.in3, 1)
    expect(c.io.out0, 1)
    expect(c.io.out1, 4)
    expect(c.io.out2, 6)
    expect(c.io.out3, 13)

    poke(c.io.in0, 13)
    poke(c.io.in1, 6)
    poke(c.io.in2, 4)
    poke(c.io.in3, 1)
    expect(c.io.out0, 1)
    expect(c.io.out1, 4)
    expect(c.io.out2, 6)
    expect(c.io.out3, 13)
}
class BetterSort4Tester(c:Sort4) extends PeekPokeTester(c){
    List(1,2,3,4).permutations.foreach{
        case i0 :: i1:: i2 :: i3 ::Nil =>
            println(s"Sorting $i0 $i1 $i2 $i3")
            poke(c.io.in0, i0)
            poke(c.io.in1, i1)
            poke(c.io.in2, i2)
            poke(c.io.in3, i3)
            expect(c.io.out0, 1)
            expect(c.io.out1, 2)
            expect(c.io.out2, 3)
            expect(c.io.out3, 4)
    }
}
class Polynomial extends Module {
    val io = IO(new Bundle {
        val select = Input(UInt(2.W))
        val x = Input(SInt(32.W))
        val fOfX = Output(SInt(32.W))
    })

    val result = Wire(SInt(32.W))
    val square = Wire(SInt(32.W))

    square := io.x * io.x
    when(io.select === 0.U){
        result := square - 2.S * io.x + 1.S
    }.elsewhen(io.select === 1.U){
        result := 2.S * square + 6.S * io.x + 3.S
    }otherwise{
        result := 4.S * square - 10.S * io.x - 5.S
    }

    io.fOfX := result
}
class PolynomialTester(c: Polynomial) extends PeekPokeTester(c) {
    for(x <- 0 to 20) {
        for(select <- 0 to 2) {
            poke(c.io.select, select)
            poke(c.io.x, x)
            expect(c.io.fOfX, poly(select, x))
        }
    }

    def poly0(x: Int): Int = x * x - 2 * x + 1

    def poly1(x: Int): Int = 2 * x * x + 6 * x + 3

    def poly2(x: Int): Int = 4 * x * x - 10 * x - 5

    def poly(select: Int, x: Int): Int = {
        if (select == 0) {
            poly0(x)
        } else if (select == 1) {
            poly1(x)
        } else {
            poly2(x)
        }
    }
}
class GradLife extends Module {
    val io = IO(new Bundle {
        val state = Input(UInt(2.W))
        val coffee = Input(Bool())
        val idea = Input(Bool())
        val pressure = Input(Bool())
        val nextState = Output(UInt(2.W))
    })

    val idle :: coding :: writing :: grad :: Nil = Enum(4)

    io.nextState := idle

    when(io.state === idle){
        when(io.coffee){
            io.nextState := coding
        }.elsewhen(io.idea){
            io.nextState := idle
        }.elsewhen(io.pressure){
            io.nextState := writing
        }
    }.elsewhen(io.state === coding){
        when(io.coffee){
            io.nextState := coding
        }.elsewhen(io.idea || io.pressure){
            io.nextState := writing
        }
    }.elsewhen(io.state === writing) {
        when(io.coffee || io.idea) {
            io.nextState := writing
        }.elsewhen(io.pressure) {
            io.nextState := grad
        }
    }
}
class GradLifeSim(c: GradLife) extends PeekPokeTester(c) {
    for (state <- 0 to 3) {
        for (coffee <- List(true, false)) {
            for (idea <- List(true, false)) {
                for (pressure <- List(true, false)) {
                    poke(c.io.state, state)
                    poke(c.io.coffee, coffee)
                    poke(c.io.idea, idea)
                    poke(c.io.pressure, pressure)
                    expect(c.io.nextState, gradLife(state, coffee, idea, pressure))
                }
            }
        }
    }

    def states = Map("idle" -> 0, "coding" -> 1, "writing" -> 2, "grad" -> 3)

    def gradLife(state: Int, coffee: Boolean, idea: Boolean, pressure: Boolean): Int = {
        var nextState = states("idle")
        if (state == states("idle")) {
            if (coffee) {
                nextState = states("coding")
            }
            else if (idea) {
                nextState = states("idle")
            }
            else if (pressure) {
                nextState = states("writing")
            }
        } else if (state == states("coding")) {
            if (coffee) {
                nextState = states("coding")
            }
            else if (pressure || idea) {
                nextState = states("writing")
            }
        } else if (state == states("writing")) {
            if (coffee || idea) {
                nextState = states("writing")
            }
            else if (pressure) {
                nextState = states("grad")
            }
        }
        nextState
    }
}
object ChiselBootcamp23 {
    def main(args:Array[String]):Unit={
        /*
        val work = Driver(()=>new LastConnect){
            c=>new LastConnectTester(c)
        }
        assert(work)


        val work3 = Driver(()=>new Max3){
            c => new Max3Tester(c)
        }
        assert(work3)


        val works = iotesters.Driver(() => new Sort4) {
            c => new Sort4Tester(c)
        }
        assert(works)


        val works = iotesters.Driver(() => new Sort4) {
            c => new BetterSort4Tester(c)
        }
        assert(works)


        assert(poly0(0) == 1)
        assert(poly1(0) == 3)
        assert(poly2(0) == -5)

        assert(poly0(1) == 0)
        assert(poly1(1) == 11)
        assert(poly2(1) == -11)

        assert(poly(1, 0) == 3)
        assert(poly(1, 1) == 11)
        assert(poly(2, 1) == -11)


        val workp = Driver(() => new Polynomial) {
            c => new PolynomialTester(c)
        }
        assert(workp)


        (0 until states.size).foreach { state => assert(gradLife(state, false, false, false) == states("idle")) }
        assert(gradLife(states("writing"), true, false, true) == states("writing"))
        assert(gradLife(states("idle"), true, true, true) == states("coding"))
        assert(gradLife(states("idle"), false, true, true) == states("idle"))
        assert(gradLife(states("grad"), false, false, false) == states("idle"))

         */
        val worksf = Driver(() => new GradLife) { c => new GradLifeSim(c) }
        assert(worksf)
        println("SUCCESS!")
    }
}
