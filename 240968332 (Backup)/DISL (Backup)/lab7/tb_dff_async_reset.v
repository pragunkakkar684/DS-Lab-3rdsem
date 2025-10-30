`timescale 1ns / 1ps

module tb_dff_async_reset;
reg clk;
reg reset;
reg d;
wire q;
dff_async_reset uut (
    .clk(clk),
    .reset(reset),
    .d(d),
    .q(q)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end
initial begin
    $dumpfile("dff_async_reset.vcd"); 
    $dumpvars(0, tb_dff_async_reset); 
end
initial begin
    $display("Time\tReset\tD\tQ");
    $monitor("%g\t%b\t%b\t%b", $time, reset, d, q);
    reset = 0; d = 0; #10;
    reset = 1; #10;
    reset = 0; d = 1; #10;
    d = 0; #10;
    reset = 1; #5;
    reset = 0; #5;
    d = 1; #10;

    $finish;
end

endmodule

