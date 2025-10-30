`timescale 1ns / 1ps

module tb_jk_ff_sync_reset;

reg clk;
reg reset;
reg j;
reg k;
wire q;

jk_ff_sync_reset uut (
    .clk(clk),
    .reset(reset),
    .j(j),
    .k(k),
    .q(q)
);


initial begin
    clk = 0;
    forever #5 clk = ~clk; 
end


initial begin
    $dumpfile("jk_ff_sync_reset.vcd");
    $dumpvars(0, tb_jk_ff_sync_reset);
end


initial begin
    $display("Time\tReset\tJ\tK\tQ");
    $monitor("%g\t%b\t%b\t%b\t%b", $time, reset, j, k, q);
    reset = 0; j = 0; k = 0; #10;
    reset = 1; j = 1; k = 1; #10;
    reset = 0; j = 1; k = 0; #10;
    j = 0; k = 1; #10;
    j = 1; k = 1; #10;
    j = 0; k = 0; #10;

    $finish;
end

endmodule

