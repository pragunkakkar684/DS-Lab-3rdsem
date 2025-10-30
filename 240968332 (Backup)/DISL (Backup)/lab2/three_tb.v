`timescale 1ns/1ns
`include "three.v"

module three_tb();
    reg a, b, c, d;
    wire f;
    three ques1(a, b, c, d, f);

    initial begin
        $dumpfile("three.vcd");
        $dumpvars(0, three_tb);

        a=1'b0; b=1'b0; c=1'b0; d=1'b0; #20;
        a=1'b0; b=1'b0; c=1'b0; d=1'b1; #20;
        a=1'b0; b=1'b0; c=1'b1; d=1'b0; #20;
        a=1'b0; b=1'b0; c=1'b1; d=1'b1; #20;
        a=1'b0; b=1'b1; c=1'b0; d=1'b0; #20;
        a=1'b0; b=1'b1; c=1'b0; d=1'b1; #20;
        a=1'b0; b=1'b1; c=1'b1; d=1'b0; #20;
        a=1'b0; b=1'b1; c=1'b1; d=1'b1; #20;
        a=1'b1; b=1'b0; c=1'b0; d=1'b0; #20;
        a=1'b1; b=1'b0; c=1'b0; d=1'b1; #20;
        a=1'b1; b=1'b0; c=1'b1; d=1'b0; #20;
        a=1'b1; b=1'b0; c=1'b1; d=1'b1; #20;
        a=1'b1; b=1'b1; c=1'b0; d=1'b0; #20;
        a=1'b1; b=1'b1; c=1'b0; d=1'b1; #20;
        a=1'b1; b=1'b1; c=1'b1; d=1'b0; #20;
        a=1'b1; b=1'b1; c=1'b1; d=1'b1; #20;

        $display("Test complete");
        $finish;
    end
endmodule

