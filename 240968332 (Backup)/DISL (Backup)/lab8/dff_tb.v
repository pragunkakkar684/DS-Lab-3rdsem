`timescale 1ns / 1ps

module dff_tb;
    reg clk;
    reg shift_en;
    reg serial_in;
    wire [5:0] q;

    // Instantiate the shift register
    shift_register_6bit uut (
        .clk(clk),
        .shift_en(shift_en),
        .serial_in(serial_in),
        .q(q)
    );

    // Clock generation: 10ns period
    initial clk = 0;
    always #5 clk = ~clk;

    // VCD dump setup
    initial begin
        $dumpfile("dff_tb.vcd");      // VCD output filename
        $dumpvars(0, dff_tb);         // Dump all variables in this module
    end

    // Test sequence
    initial begin
        $display("Time\tShift_EN\tSerial_IN\tQ[5:0]");
        $monitor("%g\t%b\t\t%b\t\t%b", $time, shift_en, serial_in, q);

        // Case 1: Hold state (shift_en = 0)
        shift_en = 0; serial_in = 0;
        #10;

        // Case 2: Shift in 1
        shift_en = 1; serial_in = 1;
        #10;

        // Case 3: Shift in 0
        shift_en = 1; serial_in = 0;
        #10;

        // Case 4: Shift in 1
        shift_en = 1; serial_in = 1;
        #10;

        // Case 5: Hold state again
        shift_en = 0; serial_in = 0;
        #10;

        // Case 6: Shift in 1
        shift_en = 1; serial_in = 1;
        #10;

        // Final hold
        shift_en = 0;
        #10;

        $finish;
    end
endmodule

