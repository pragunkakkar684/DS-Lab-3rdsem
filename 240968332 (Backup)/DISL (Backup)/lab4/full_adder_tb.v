`timescale 1ns/1ns
`include "full_adder.v"

module full_adder_tb();
    reg a, b, cin;
    wire sum, carry;

    full_adder fa(a, b, cin, sum, carry);

    initial begin
        $dumpfile("full_adder.vcd");
        $dumpvars(0, full_adder_tb);

        a=0; b=0; cin=0; #20;
        a=0; b=0; cin=1; #20;
        a=0; b=1; cin=0; #20;
        a=0; b=1; cin=1; #20;
        a=1; b=0; cin=0; #20;
        a=1; b=0; cin=1; #20;
        a=1; b=1; cin=0; #20;
        a=1; b=1; cin=1; #20;

        $display("Full Adder Test Complete");
        $finish;
    end
endmodule

