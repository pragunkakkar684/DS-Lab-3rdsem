`timescale 1ns / 1ps

module comparator_gates_tb;

reg  [3:0] A;
reg  [3:0] B;
wire       A_gt_B;
wire       A_eq_B;
wire       A_lt_B;

comparator_4bit_gates uut (
    .A(A),
    .B(B),
    .A_gt_B(A_gt_B),
    .A_eq_B(A_eq_B),
    .A_lt_B(A_lt_B)
);

initial begin
    $dumpfile("comparator_4bit_gates.vcd"); // VCD output file
    $dumpvars(0, comparator_gates_tb);      // Dump all signals

    $display("Time\tA\tB\tA_gt_B\tA_eq_B\tA_lt_B");
    $monitor("%0t\t%b\t%b\t%b\t%b\t%b", $time, A, B, A_gt_B, A_eq_B, A_lt_B);

    // Test cases
    A = 4'b0000; B = 4'b0000; #10;
    A = 4'b1111; B = 4'b1111; #10;
    A = 4'b1010; B = 4'b1001; #10;
    A = 4'b0100; B = 4'b0110; #10;
    A = 4'b1000; B = 4'b0111; #10;
    A = 4'b0011; B = 4'b0100; #10;

    $finish;
end

endmodule

