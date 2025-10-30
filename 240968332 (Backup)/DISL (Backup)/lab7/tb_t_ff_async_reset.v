`timescale 1ns / 1ps
module tb_t_ff_async_reset;
reg clk;
reg reset_n;
reg t;
wire q;
t_ff_async_reset uut (
    .clk(clk),
    .reset_n(reset_n),
    .t(t),
    .q(q)
);
initial begin
    clk = 1;
    forever #5 clk = ~clk; 
end
initial begin
    $dumpfile("t_ff_async_reset.vcd");
    $dumpvars(0, tb_t_ff_async_reset);
end
initial begin
    $display("Time\tReset_n\tT\tQ");
    $monitor("%g\t%b\t%b\t%b", $time, reset_n, t, q);
    reset_n = 1; t = 0; #10;
    reset_n = 0; #10;
    reset_n = 1; t = 1; #10;
    t = 0; #10;
    t = 1; #10;
    reset_n = 0; #2; reset_n = 1; #8;

    $finish;
end

endmodule

