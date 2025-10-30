`timescale 1ns/1ns
`include "sequence.v"

module sequence_tb;

    reg clk;
    reg reset;
    wire [2:0] Q;

    sequence uut (.clk(clk), .reset(reset), .Q(Q));

    always #10 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;

        $dumpfile("sequence_tb.vcd");
        $dumpvars(0, sequence_tb);

        #10 reset = 0;

        #100;
        $display("Simulation complete.");
        $finish;
    end
endmodule

