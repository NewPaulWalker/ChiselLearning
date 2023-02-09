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

object ChiselBootcamp21{
    def main(args :Array[String]):Unit ={
        chisel3.Driver.execute(args, ()=>new Passthrough())
    }
}