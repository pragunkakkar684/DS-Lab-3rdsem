`timescale 1ns/1ns
`include "two_bit_multiplier.v"

module two_bit_multiplier_tb();
    reg [1:0] a, b;
    wire [3:0] product;

    two_bit_multiplier uut(a, b, product);

    integer i, j;

    initial begin
        $dumpfile("two_bit_multiplier.vcd");
        $dumpvars(0, two_bit_multiplier_tb);

        // Test all combinations of a and b from 0 to 3
        for (i = 0; i < 4; i = i + 1) begin
            for (j = 0; j < 4; j = j + 1) begin
                a = i[1:0];
                b = j[1:0];
                #10;
            end
        end

        $display("All 16 test cases for 2-bit multiplier completed");
        $finish;
    end
endmodule

