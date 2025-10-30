`timescale 1ns / 1ps

// ----------------------
// T Flip-Flop Module
// ----------------------
module t_ff_sync_reset (
    input wire clk,     // Clock input (negative edge triggered)
    input wire reset,   // Synchronous active-high reset
    input wire t,       // Toggle input
    output reg q        // Output
);

always @(negedge clk) begin
    if (reset)
        q <= 1'b0;       // Reset output to 0
    else if (t)
        q <= ~q;         // Toggle output when T is high
    // else: retain previous value of q
end

endmodule

// ----------------------
// Testbench
// ----------------------
module tb_t_ff_sync_reset;

reg clk;
reg reset;
reg t;
wire q;

// Instantiate the T flip-flop
t_ff_sync_reset uut (
    .clk(clk),
    .reset(reset),
    .t(t),
    .q(q)
);

// Clock generation: 10ns period
initial begin
    clk = 1;
    forever #5 clk = ~clk; // Negative edge every 10ns
end

// VCD dump setup
initial begin
    $dumpfile("t_ff_sync_reset.vcd");
    $dumpvars(0, tb_t_ff_sync_reset);
end

// Test sequence
initial begin
    $display("Time\tReset\tT\tQ");
    $monitor("%g\t%b\t%b\t%b", $time, reset, t, q);

    // Test Case 1: Initial state
    reset = 0; t = 0; #10;

    // Test Case 2: Apply synchronous reset
    reset = 1; t = 1; #10;

    // Test Case 3: Release reset, T = 1 → Toggle
    reset = 0; t = 1; #10;

    // Test Case 4: T = 0 → Hold
    t = 0; #10;

    // Test Case 5: T = 1 → Toggle again
    t = 1; #10;

    // Test Case 6: Reset during toggle
    reset = 1; #10;

    $finish;
end

endmodule

