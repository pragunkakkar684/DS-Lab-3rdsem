`include "counter2.v"
`include "decoder2to4.v"
module ring_counter4 (input clk, input resetn, output [3:0] q);
    wire [1:0] count;

    counter2 c1 (.clk(clk), .resetn(resetn), .count(count));

    decoder2to4 d1 (.in(count), .out(q));
endmodule

