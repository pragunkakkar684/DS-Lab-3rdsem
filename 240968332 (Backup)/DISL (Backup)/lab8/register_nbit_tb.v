`timescale 1ns / 1ps

module register_nbit_tb;
    // Parameters
    parameter N = 4;

    // Testbench signals
    reg clk;
    reg rst;
    reg en;
    reg [N-1:0] d;
    wire [N-1:0] q;

    // Instantiate the register
    register_nbit #(.N(N)) uut (
        .clk(clk),
        .rst(rst),
        .en(en),
        .d(d),
        .q(q)
    );

    // Clock generation: 10ns period
    initial clk = 0;
    always #5 clk = ~clk;

    // VCD dump for waveform viewing
    initial begin
        $dumpfile("register_nbit_tb.vcd");
        $dumpvars(0, register_nbit_tb);
    end

    // Test sequence
    initial begin
        $display("Time\tRST\tEN\tD\tQ");
        $monitor("%g\t%b\t%b\t%h\t%h", $time, rst, en, d, q);

        // Case 1: Reset active
        rst = 1; en = 0; d = 4'b0000;
        #10;

        // Case 2: Load 1010 with enable
        rst = 0; en = 1; d = 4'b1010;
        #10;

        // Case 3: Hold value (enable low)
        en = 0; d = 4'b1111;
        #10;

        // Case 4: Load 0101
        en = 1; d = 4'b0101;
        #10;

        // Case 5: Reset again
        rst = 1;
        #10;

        // Case 6: Load 1100 after reset
        rst = 0; en = 1; d = 4'b1100;
        #10;

        $finish;
    end
endmodule

