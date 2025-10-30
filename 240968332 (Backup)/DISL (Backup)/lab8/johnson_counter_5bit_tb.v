`timescale 1ns / 1ps

module johnson_counter_5bit_tb;
    reg clk;
    reg rst;
    wire [4:0] q;

    // Instantiate the counter
    johnson_counter_5bit uut (
        .clk(clk),
        .rst(rst),
        .q(q)
    );

    // Clock generation: 10ns period
    initial clk = 0;
    always #5 clk = ~clk;

    // VCD dump for waveform viewing
    initial begin
        $dumpfile("johnson_counter_5bit_tb.vcd");
        $dumpvars(0, johnson_counter_5bit_tb);
    end

    // Test sequence with 6 cases
    initial begin
        $display("Time\tReset\tQ");
        $monitor("%g\t%b\t%b", $time, rst, q);

        // Case 1: Apply reset
        rst = 1; #10;

        // Case 2: Release reset, first clock
        rst = 0; #10;

        // Case 3: Second clock
        #10;

        // Case 4: Third clock
        #10;

        // Case 5: Fourth clock
        #10;

        // Case 6: Fifth clock
        #10;

        $finish;
    end
endmodule

