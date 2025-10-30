`timescale 1ns / 1ps

// ----------------------
// JK Flip-Flop Module
// ----------------------
module jk_ff_sync_reset (
    input wire clk,     // Clock input (positive edge triggered)
    input wire reset,   // Synchronous active-high reset
    input wire j,       // J input
    input wire k,       // K input
    output reg q        // Output
);

always @(posedge clk) begin
    if (reset)
        q <= 1'b0;               // Reset output to 0
    else if (j && !k)
        q <= 1'b1;               // Set
    else if (!j && k)
        q <= 1'b0;               // Reset
    else if (j && k)
        q <= ~q;                 // Toggle
    // else: j = 0, k = 0 → Hold current value
end

endmodule

// ----------------------
// Testbench
// ----------------------
module tb_jk_ff_sync_reset;

reg clk;
reg reset;
reg j;
reg k;
wire q;

// Instantiate the JK flip-flop
jk_ff_sync_reset uut (
    .clk(clk),
    .reset(reset),
    .j(j),
    .k(k),
    .q(q)
);

// Clock generation: 10ns period
initial begin
    clk = 0;
    forever #5 clk = ~clk; // Rising edge every 10ns
end

// VCD dump setup
initial begin
    $dumpfile("jk_ff_sync_reset.vcd");
    $dumpvars(0, tb_jk_ff_sync_reset);
end

// Test sequence
initial begin
    $display("Time\tReset\tJ\tK\tQ");
    $monitor("%g\t%b\t%b\t%b\t%b", $time, reset, j, k, q);

    // Test Case 1: Initial state, no reset
    reset = 0; j = 0; k = 0; #10;

    // Test Case 2: Apply synchronous reset
    reset = 1; j = 1; k = 1; #10;

    // Test Case 3: Release reset, J=1, K=0 → Set
    reset = 0; j = 1; k = 0; #10;

    // Test Case 4: J=0, K=1 → Reset
    j = 0; k = 1; #10;

    // Test Case 5: J=1, K=1 → Toggle
    j = 1; k = 1; #10;

    // Test Case 6: J=0, K=0 → Hold
    j = 0; k = 0; #10;

    $finish;
end

endmodule

