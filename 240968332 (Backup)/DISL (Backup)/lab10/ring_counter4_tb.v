`timescale 1ns/1ns
`include "ring_counter4.v"

module ring_counter4_tb;
    reg clk, resetn;
    wire [3:0] q;

    ring_counter4 uut (.clk(clk), .resetn(resetn), .q(q));

    initial begin
        clk = 0;
        forever #10 clk = ~clk;
    end

    initial begin
        $dumpfile("ring_counter4_tb.vcd");
        $dumpvars(0, ring_counter4_tb);

        resetn = 0;  #25;
        resetn = 1;

        #100;
        $finish;
    end
endmodule

