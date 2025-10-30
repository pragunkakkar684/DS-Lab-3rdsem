`timescale 1ns/1ns
`include "bcd_adder.v"

module bcd_adder_tb();
    reg [3:0] a, b;
    reg cin;
    wire [3:0] sum;
    wire cout;

    bcd_adder uut(a, b, cin, sum, cout);

    initial begin
        $dumpfile("bcd_adder.vcd");
        $dumpvars(0, bcd_adder_tb);

        // 6 test cases covering key BCD adder scenarios

        a = 4'd4; b = 4'd5; cin = 0; #20; // 4 + 5 = 9, no carry, no correction
        a = 4'd5; b = 4'd7; cin = 0; #20; // 5 + 7 = 12, correction needed, carry out
        a = 4'd9; b = 4'd9; cin = 0; #20; // 9 + 9 = 18, correction needed, carry out
        a = 4'd4; b = 4'd3; cin = 1; #20; // 4 + 3 + 1 = 8, with carry-in, no correction
        a = 4'd9; b = 4'd0; cin = 1; #20; // 9 + 0 + 1 = 10, carry-in causing correction
        a = 4'd7; b = 4'd2; cin = 1; #20; // 7 + 2 + 1 = 10, carry-in causing correction

        $display("6 Test cases for BCD Adder completed");
        $finish;
    end
endmodule

