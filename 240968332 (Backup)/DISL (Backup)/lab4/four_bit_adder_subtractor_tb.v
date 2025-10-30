`timescale 1ns/1ns
`include "four_bit_adder_subtractor.v"

module four_bit_adder_subtractor_tb();
    reg [3:0] a, b;
    reg mode;
    wire [3:0] result;
    wire cout;

    four_bit_adder_subtractor uut(a, b, mode, result, cout);

    initial begin
        $dumpfile("four_bit_adder_subtractor.vcd");
        $dumpvars(0, four_bit_adder_subtractor_tb);

        // Test Addition
        a = 4'b0011; b = 4'b0001; mode = 0; #20; // 3 + 1 = 4
        a = 4'b0110; b = 4'b0010; mode = 0; #20; // 6 + 2 = 8

        // Test Subtraction
        a = 4'b0101; b = 4'b0011; mode = 1; #20; // 5 - 3 = 2
        a = 4'b1000; b = 4'b0100; mode = 1; #20; // 8 - 4 = 4

        // Test edge cases
        a = 4'b0000; b = 4'b0001; mode = 1; #20; // 0 - 1 = -1 (two's complement)
        a = 4'b1111; b = 4'b1111; mode = 0; #20; // 15 + 15 = 30 (overflow test)

        $display("Four-bit Adder/Subtractor Test Complete");
        $finish;
    end
endmodule

