`timescale 1ns/1ns
`include "async_up_counter.v"

module async_up_counter_tb;
    reg clk, reset;
    wire [3:0] Q;

    async_up_counter uut (.clk(clk), .reset(reset), .Q(Q));
    always #5 clk = ~clk;

    initial begin
        $dumpfile("async_up_counter_tb.vcd");
        $dumpvars(0, async_up_counter_tb);

        clk = 0;
        reset = 1;
        #10 reset = 0;
        #90;
        $display("Test Complete");
        $finish;
    end
endmodule

