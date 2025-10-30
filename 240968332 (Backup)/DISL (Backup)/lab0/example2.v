module example2 (
    input wire x1,
    input wire x2,
    input wire x3,
    output wire f
);

wire g, h, k;

assign f = (x1&x2) | (~x2&x3);

endmodule

