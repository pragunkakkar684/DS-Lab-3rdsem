`timescale 1ns/1ns
`include "jk_seq.v"

module jk_seq_tb();

reg clk;
reg E;
reg x;
wire A, B;

jk_seq dut (
    .clk(clk),
    .E(E),
    .x(x),
    .A(A),
    .B(B)
);

initial clk = 0;
always #10 clk = ~clk;

initial begin

    $dumpfile("jk_seq_tb.vcd");
    $dumpvars(0, jk_seq_tb);

    E = 0;
    x = 0;

    #10;

    E = 0; x = 0;
    #40;

    E = 1; x = 1;
    #80;

    E = 1; x = 0;
    #80;

    E = 0;
    #40;

    $display("Test complete");
    $stop;
end
endmodule


