import chisel3._
import chisel3.util._
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}
class MyModule extends Module{
    val io = IO(new Bundle{
        val in = Input(UInt(4.W))
        val out = Output(UInt(4.W))
    })
    val two = 1+1
    println(two)
    val utwo = 1.U + 1.U
    println(utwo)
    io.out := io.in
}
class MyOperators extends Module{
    val io = IO(new Bundle{
        val in = Input(UInt(4.W))
        val out_add = Output(UInt(4.W))
        val out_sub = Output(UInt(4.W))
        val out_mul = Output(UInt(4.W))
    })
    io.out_add := 1.U + 4.U
    io.out_sub := 2.U - 1.U
    io.out_mul := 4.U * 2.U
}
class MyOperatorsTester(c:MyOperators) extends PeekPokeTester(c){
    expect(c.io.out_add, 5)
    expect(c.io.out_sub, 1)
    expect(c.io.out_mul, 8)
}
class MyOperatorsTwo extends Module{
    val io = IO(new Bundle{
        val in = Input(UInt(4.W))
        val out_mux = Output(UInt(4.W))
        val out_cat = Output(UInt(4.W))
    })
    val s = true.B
    io.out_mux := Mux(s,3.U, 0.U)
    io.out_cat := Cat(2.U, 1.U)
}
class MyOperatorsTwoTester(c:MyOperatorsTwo) extends PeekPokeTester(c){
    expect(c.io.out_mux, 3)
    expect(c.io.out_cat, 5)
}
class MAC extends Module{
    val io = IO(new Bundle{
        val in_a = Input(UInt(4.W))
        val in_b = Input(UInt(4.W))
        val in_c = Input(UInt(4.W))
        val out = Output(UInt(8.W))
    })
    io.out := io.in_a*io.in_b + io.in_c
}
class MACTester(c:MAC) extends PeekPokeTester(c){
    val cycles = 100
    import scala.util.Random
    for(i <- 0 until cycles){
        val in_a = Random.nextInt(16)
        val in_b = Random.nextInt(16)
        val in_c = Random.nextInt(16)
        poke(c.io.in_a, in_a)
        poke(c.io.in_b, in_b)
        poke(c.io.in_c, in_c)
        expect(c.io.out, in_a*in_b+in_c)
    }
}
class Arbiter extends Module {
    val io = IO(new Bundle {
        // FIFO
        val fifo_valid = Input(Bool())
        val fifo_ready = Output(Bool())
        val fifo_data  = Input(UInt(16.W))

        // PE0
        val pe0_valid  = Output(Bool())
        val pe0_ready  = Input(Bool())
        val pe0_data   = Output(UInt(16.W))

        // PE1
        val pe1_valid  = Output(Bool())
        val pe1_ready  = Input(Bool())
        val pe1_data   = Output(UInt(16.W))
    })

    io.fifo_ready := io.pe0_ready || io.pe1_ready
    io.pe0_valid := io.fifo_valid && io.pe0_ready
    io.pe1_valid := io.fifo_valid && io.pe1_ready && !io.pe0_ready
    io.pe0_data := io.fifo_data
    io.pe1_data := io.fifo_data

}
class ArbiterTester(c: Arbiter) extends PeekPokeTester(c) {
    import scala.util.Random
    val data = Random.nextInt(65536)
    poke(c.io.fifo_data, data)

    for (i <- 0 until 8) {
        poke(c.io.fifo_valid, (i>>0)%2)
        poke(c.io.pe0_ready,  (i>>1)%2)
        poke(c.io.pe1_ready,  (i>>2)%2)

        expect(c.io.fifo_ready, i>1)
        expect(c.io.pe0_valid,  i==3 || i==7)
        expect(c.io.pe1_valid,  i==5)

        if (i == 3 || i ==7) {
            expect(c.io.pe0_data, data)
        } else if (i == 5) {
            expect(c.io.pe1_data, data)
        }
    }
}
class ParameterizedAdder(saturate: Boolean) extends Module {
    val io = IO(new Bundle {
        val in_a = Input(UInt(4.W))
        val in_b = Input(UInt(4.W))
        val out  = Output(UInt(4.W))
    })
    val sum = io.in_a +& io.in_b
    if(saturate){
        io.out := Mux(sum > 15.U, 15.U, sum)
    }else{
        io.out := sum
    }
}
class ParameterizedAdderTester(c: ParameterizedAdder, saturate: Boolean) extends PeekPokeTester(c) {
    // 100 random tests
    val cycles = 100
    import scala.util.Random
    import scala.math.min
    for (i <- 0 until cycles) {
        val in_a = Random.nextInt(16)
        val in_b = Random.nextInt(16)
        poke(c.io.in_a, in_a)
        poke(c.io.in_b, in_b)
        if (saturate) {
            expect(c.io.out, min(in_a+in_b, 15))
        } else {
            expect(c.io.out, (in_a+in_b)%16)
        }
    }

    // ensure we test saturation vs. truncation
    poke(c.io.in_a, 15)
    poke(c.io.in_b, 15)
    if (saturate) {
        expect(c.io.out, 15)
    } else {
        expect(c.io.out, 14)
    }
}
object ChiselBootcamp22 {
    def main(args :Array[String]):Unit = {
        //chisel3.Driver.execute(args, ()=>new MyModule)
        //chisel3.Driver.execute(args, ()=>new MyOperators)
        /*
        assert(Driver(()=>new MyOperators){
            c =>new MyOperatorsTester(c)
        })
        println("SUCCESS!")
         */
        /*
        assert(Driver(()=>new MyOperatorsTwo){
            c => new MyOperatorsTwoTester(c)
        })
        println("SUCCESS2!")

         */
        /*
        assert(Driver(()=>new MAC){
            c => new MACTester(c)
        })
        println("SUCCESS MAX!")

         */
        /*
        assert(Driver(() => new Arbiter) { c => new ArbiterTester(c) })
        println("SUCCESSArbiter!!")
        */
        for (saturate <- Seq(true, false)) {
            assert(Driver(() => new ParameterizedAdder(saturate)) {c => new ParameterizedAdderTester(c, saturate)})
        }
        println("SUCCESS!!")
    }
}
