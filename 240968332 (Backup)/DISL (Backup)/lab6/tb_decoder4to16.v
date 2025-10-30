`timescale 1ns / 1ps

module tb_decoder4to16;

    reg en;
    reg [3:0] a;
    wire [15:0] y;

    // Instantiate the Unit Under Test (UUT)
    decoder4to16 uut (
        .en(en),
        .a(a),
        .y(y)
    );

    initial begin
        // Waveform output setup
        $dumpfile("decoder4to16_tb.vcd");
        $dumpvars(0, tb_decoder4to16);

        $display("Time\t en a[3:0] | y[15:0]");
        $display("-----------------------------------------");

        // Test case 1: Enable low
        en = 0; a = 4'b0000;
        #10 $display("%0t\t %b  %b | %b", $time, en, a, y);

        // Test case 2: Enable high, a = 0000
        en = 1; a = 4'b0000;
        #10 $display("%0t\t %b  %b | %b", $time, en, a, y);

        // Test case 3: Enable high, a = 0011
        a = 4'b0011;
        #10 $display("%0t\t %b  %b | %b", $time, en, a, y);

        // Test case 4: Enable high, a = 1000
        a = 4'b1000;
        #10 $display("%0t\t %b  %b | %b", $time, en, a, y);

        // Test case 5: Enable high, a = 1111
        a = 4'b1111;
        #10 $display("%0t\t %b  %b | %b", $time, en, a, y);

        // Test case 6: Enable low, a = 0101
        en = 0; a = 4'b0101;
        #10 $display("%0t\t %b  %b | %b", $time, en, a, y);

        $finish;
    end

endmodule

