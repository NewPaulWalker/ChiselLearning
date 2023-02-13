import chisel3._
import chisel3.util._
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}
import chisel3.experimental.{withClock, withReset, withClockAndReset}

class RegisterModule extends Module{
    val io = IO(new Bundle{
        val in = Input(UInt(12.W))
        val out = Output(UInt(12.W))
    })
    /*
    val register = Reg(UInt(12.W))
    register := io.in + 1.U
    io.out := register

     */
    //io.out := RegNext(io.in + 1.U)
    val register = RegInit(UInt(12.W), 0.U)
    register := io.in + 1.U
    io.out := register
}
class RegisterModuleTester(c:RegisterModule) extends PeekPokeTester(c){
    reset(10)
    for(i <- 0 until(100)){
        poke(c.io.in, i)
        step(1)
        expect(c.io.out, i+1)
    }
}
class FindMax extends Module{
    val io = IO(new Bundle{
        val in = Input(UInt(10.W))
        val max = Output(UInt(10.W))
    })
    val max = RegInit(UInt(10.W), 0.U)
    when(io.in > max){
        max := io.in
    }
    io.max := max
}
class Comb extends Module{
    val io = IO(new Bundle {
        val in = Input(SInt(12.W))
        val out = Output(SInt(12.W))
    })
    val delay :SInt = Reg(SInt(12.W))
    delay := io.in
    io.out := io.in - delay
}
class MyShiftRegister(val init: Int = 1) extends Module {
    val io = IO(new Bundle {
        val in  = Input(Bool())
        val out = Output(UInt(4.W))
    })

    val state = RegInit(UInt(4.W), init.U)
    val nextState = (state << 1) | io.in
    state := nextState
    io.out := state


}
class MyShiftRegisterTester(c: MyShiftRegister) extends PeekPokeTester(c) {
    var state = c.init
    for (i <- 0 until 10) {
        // poke in LSB of i (i % 2)
        poke(c.io.in, i % 2)
        // update expected state
        state = ((state * 2) + (i % 2)) & 0xf
        step(1)
        expect(c.io.out, state)
    }
}
// n 是输出信号的宽度 (delay的数目 - 1)
// 初始值为init
class MyOptionalShiftRegister(val n: Int, val init: BigInt = 1) extends Module {
    val io = IO(new Bundle {
        val en  = Input(Bool())
        val in  = Input(Bool())
        val out = Output(UInt(n.W))
    })

    val state = RegInit(init.U(n.W))
    val nextState = (state << 1) | io.in
    when(io.en){
        state := nextState
    }
    io.out := state
}
class MyOptionalShiftRegisterTester(c: MyOptionalShiftRegister) extends PeekPokeTester(c) {
    val inSeq = Seq(0, 1, 1, 1, 0, 1, 1, 0, 0, 1)
    var state = c.init
    var i = 0
    poke(c.io.en, 1)
    while (i < 10 * c.n) {
        // 重复送入信号 inSeq
        val toPoke = inSeq(i % inSeq.length)
        poke(c.io.in, toPoke)
        // 更新期望的状态
        state = ((state * 2) + toPoke) & BigInt("1"*c.n, 2)
        step(1)
        expect(c.io.out, state)

        i += 1
    }
}
class ClockExamples extends Module{
    val io = IO(new Bundle {
        val in = Input(UInt(10.W))
        val alternateReset = Input(Bool())
        val alternateClock = Input(Clock())
        val outImplicit = Output(UInt())
        val outAlternateReset = Output(UInt())
        val outAlternateClock = Output(UInt())
        val outAlternateBoth = Output(UInt())
    })
    val imp = RegInit(0.U(10.W))
    imp := io.in
    io.outImplicit := imp

    withReset(io.alternateReset) {
        //此范围内都使用 alternateReset 作为复位信号
        val altRst = RegInit(0.U(10.W))
        altRst := io.in
        io.outAlternateReset := altRst
    }

    withClock(io.alternateClock) {
        val altClk = RegInit(0.U(10.W))
        altClk := io.in
        io.outAlternateClock := altClk
    }

    withClockAndReset(io.alternateClock, io.alternateReset) {
        val alt = RegInit(0.U(10.W))
        alt := io.in
        io.outAlternateBoth := alt
    }
}
object ChiselBootcamp24 {
    def main(args:Array[String]) :Unit = {
        /*
        chisel3.Driver.execute(args, ()=>new RegisterModule())
        val testResult = Driver(() => new RegisterModule) { c => new RegisterModuleTester(c) }
        assert(testResult)


        assert(Driver(()=>new FindMax){
            c => new PeekPokeTester(c) {
                expect(c.io.max, 0)
                poke(c.io.in, 1)
                step(1)
                expect(c.io.max, 1)
                poke(c.io.in, 3)
                step(1)
                expect(c.io.max, 3)
                poke(c.io.in, 2)
                step(1)
                expect(c.io.max, 3)
                poke(c.io.in, 24)
                step(1)
                expect(c.io.max, 24)
            }
        })


        chisel3.Driver.execute(args, ()=>new Comb())


        assert(chisel3.iotesters.Driver(() => new MyShiftRegister()) {
            c => new MyShiftRegisterTester(c)
        })


        for (i <- Seq(3, 4, 8, 24, 65)) {
            println(s"Testing n=$i")
            assert(chisel3.iotesters.Driver(() => new MyOptionalShiftRegister(n = i)) {
                c => new MyOptionalShiftRegisterTester(c)
            })
        }

         */
        chisel3.Driver.execute(args, ()=>new ClockExamples())
        println("SUCCESS!!")
    }
}
