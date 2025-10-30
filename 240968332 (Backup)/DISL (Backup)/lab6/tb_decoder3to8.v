`timescale 1ns / 1ps

module tb_decoder3to8;

    reg en;
    reg [2:0] a;
    wire [7:0] y;

    // Instantiate the Unit Under Test (UUT)
    decoder3to8 uut (
        .en(en),
        .a(a),
        .y(y)
    );

    integer i;

    initial begin
        // Dumpfile and dumpvars for waveform viewing
        $dumpfile("decoder3to8_tb.vcd");  // Output VCD file
        $dumpvars(0, tb_decoder3to8);     // Dump everything in this module

        $display("Time\t en a[2:0] | y[7:0]");
        $display("--------------------------------");

        // Test when enable is low — output should be 0
        en = 0;
        a = 3'b000;
        #10 $display("%0t\t %b  %b | %b", $time, en, a, y);

        // Test all input combinations when enable is high
        en = 1;
        for (i = 0; i < 8; i = i + 1) begin
            a = i[2:0];
            #10 $display("%0t\t %b  %b | %b", $time, en, a, y);
        end

        // Disable again
        en = 0;
        a = 3'b101;
        #10 $display("%0t\t %b  %b | %b", $time, en, a, y);

        $finish;
    end

endmodule

