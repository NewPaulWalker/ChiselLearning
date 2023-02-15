import chisel3._
import chisel3.util._
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}

class My4ElementFir(b0: Int, b1: Int, b2: Int, b3: Int) extends Module {
    val io = IO(new Bundle {
        val in = Input(UInt(8.W))
        val out = Output(UInt(8.W))
    })
    val x_n1 = RegNext(io.in, 0.U)
    val x_n2 = RegNext(x_n1, 0.U)
    val x_n3 = RegNext(x_n2, 0.U)
    io.out := io.in * b0.U(8.W) + x_n1 * b1.U(8.W) + x_n2 * b2.U(8.W) + x_n3 * b3.U(8.W)
}
class MyManyDynamicElementVecFir(length: Int) extends Module {
    val io = IO(new Bundle {
        val in = Input(UInt(8.W))
        val valid = Input(Bool())
        val out = Output(UInt(8.W))
        val consts = Input(Vec(length, UInt(8.W)))
    })

    // 非常紧凑的代码！您将在之后学习
    val taps = Seq(io.in) ++ Seq.fill(io.consts.length - 1)(RegInit(0.U(8.W)))
    taps.zip(taps.tail).foreach { case (a, b) => when (io.valid) { b := a } }

    io.out := taps.zip(io.consts).map { case (a, b) => a * b }.reduce(_ + _)
}
object ChiselBootcamp25 {
    def main(args:Array[String]) :Unit = {
        val t1 = Driver(() => new My4ElementFir(0, 0, 0, 0)) {
            c => new PeekPokeTester(c) {
                poke(c.io.in, 0)
                expect(c.io.out, 0)
                step(1)
                poke(c.io.in, 4)
                expect(c.io.out, 0)
                step(1)
                poke(c.io.in, 5)
                expect(c.io.out, 0)
                step(1)
                poke(c.io.in, 2)
                expect(c.io.out, 0)
            }
        }
        val t2 = Driver(() => new My4ElementFir(1, 1, 1, 1)) {
            c =>
                new PeekPokeTester(c) {
                    poke(c.io.in, 1)
                    expect(c.io.out, 1) // 1, 0, 0, 0
                    step(1)
                    poke(c.io.in, 4)
                    expect(c.io.out, 5) // 4, 1, 0, 0
                    step(1)
                    poke(c.io.in, 3)
                    expect(c.io.out, 8) // 3, 4, 1, 0
                    step(1)
                    poke(c.io.in, 2)
                    expect(c.io.out, 10) // 2, 3, 4, 1
                    step(1)
                    poke(c.io.in, 7)
                    expect(c.io.out, 16) // 7, 2, 3, 4
                    step(1)
                    poke(c.io.in, 0)
                    expect(c.io.out, 12) // 0, 7, 2, 3
                }
        }
        val t3 = Driver(() => new My4ElementFir(1, 2, 3, 4)) {
            c => new PeekPokeTester(c) {
                poke(c.io.in, 1)
                expect(c.io.out, 1)  // 1*1, 0*2, 0*3, 0*4
                step(1)
                poke(c.io.in, 4)
                expect(c.io.out, 6)  // 4*1, 1*2, 0*3, 0*4
                step(1)
                poke(c.io.in, 3)
                expect(c.io.out, 14)  // 3*1, 4*2, 1*3, 0*4
                step(1)
                poke(c.io.in, 2)
                expect(c.io.out, 24)  // 2*1, 3*2, 4*3, 1*4
                step(1)
                poke(c.io.in, 7)
                expect(c.io.out, 36)  // 7*1, 2*2, 3*3, 4*4
                step(1)
                poke(c.io.in, 0)
                expect(c.io.out, 32)  // 0*1, 7*2, 2*3, 3*4
            }
        }
        assert(t1 && t2 && t3)
        println("SUCCESS!")
    }
}
