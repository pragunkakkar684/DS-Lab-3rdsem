`timescale 1ns/1ns
`include "sequential_circuit.v"

module sequential_circuit_tb;

reg clk;
reg x;
wire A;
wire B;

sequential_circuit uut(
    .clk(clk),
    .x(x),
    .A(A),
    .B(B)
);

initial begin
    $dumpfile("sequential_circuit.vcd");
    $dumpvars(0, sequential_circuit_tb);
end

initial begin
    clk = 0;
    forever #10 clk = ~clk;
end

initial begin
    x = 0;
    #20 x = 1;
    #30 x = 0;
    #40 x = 1;
    #50 x = 0;
    #60 
    $display("Test Complete");
    $stop;
    
end
endmodule

