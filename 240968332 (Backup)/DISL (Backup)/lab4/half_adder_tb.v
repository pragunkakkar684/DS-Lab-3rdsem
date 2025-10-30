`timescale 1ns/1ns
`include "half_adder.v"

module half_adder_tb();
    reg a, b;
    wire sum, carry;

    half_adder ha(a, b, sum, carry);

    initial begin
        $dumpfile("half_adder.vcd");
        $dumpvars(0, half_adder_tb);

        a=0; b=0; #20;
        a=0; b=1; #20;
        a=1; b=0; #20;
        a=1; b=1; #20;

        $display("Half Adder Test Complete");
        $finish;
    end
endmodule

