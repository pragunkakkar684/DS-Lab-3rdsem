`timescale 1ns/1ns
`include "five.v"

module five_tb();
    reg a, b, c, d;
    wire f;
    five ques1(a, b, c, d, f);

    initial begin
        $dumpfile("five.vcd");
        $dumpvars(0, five_tb);

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

