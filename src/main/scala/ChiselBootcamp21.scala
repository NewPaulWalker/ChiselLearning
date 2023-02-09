import chisel3._
import chisel3.util._
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}

class Passthrough extends Module{
    val io = IO(new Bundle{
        val in = Input(UInt(4.W))
        val out = Output(UInt(4.W))
    })
    io.out := io.in
}
class PassthroughGenerator(width: Int) extends Module{
    val io = IO(new Bundle{
        val in = Input(UInt(width.W))
        val out = Output(UInt(width.W))
    })
    io.out := io.in
}
class PrintingModule extends Module{
    val io = IO(new Bundle{
        val in = Input(UInt(4.W))
        val out = Output(UInt(4.W))
    })
    io.out := io.in
    printf("Print during simulation: Input is %d\n", io.in)
    printf(p"Print during simulation: IO is $io\n")
    println(s"Print during generation: Input is ${io.in}")
}
class PrintModuleTest(c:PrintingModule) extends PeekPokeTester(c){
    poke(c.io.in,3)
    step(3)
    println(s"Print during testing: Input is ${peek(c.io.in)}")
}
object ChiselBootcamp21{
    def main(args :Array[String]):Unit ={
        /*
        chisel3.Driver.execute(args, ()=>new Passthrough())
        val testResult = Driver(()=>new Passthrough()){
            c => new PeekPokeTester(c) {
                poke(c.io.in,0)
                expect(c.io.out,0)
                poke(c.io.in,1)
                expect(c.io.out,1)
                poke(c.io.in,2)
                expect(c.io.out,2)
            }
        }
        assert(testResult)
        println("SUCCESS")
        chisel3.Driver.execute(args, ()=>new PassthroughGenerator(10))
        val testResult10 = Driver(()=>new PassthroughGenerator(10)){
            c => new PeekPokeTester(c) {
                poke(c.io.in, 1023)
                expect(c.io.out, 1023)
            }
        }
        assert(testResult10)
        println("SUCCESS1!")
         */
        chisel3.iotesters.Driver(()=>new PrintingModule){
            c => new PrintModuleTest(c)
        }
    }
}