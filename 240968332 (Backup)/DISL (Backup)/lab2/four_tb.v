`timescale 1ns/1ns
`include "four.v"

module four_tb();
    reg a, b, c, d;
    wire f;
    four ques1(a, b, c, d, f);

    initial begin
        $dumpfile("four.vcd");
        $dumpvars(0, four_tb);

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

