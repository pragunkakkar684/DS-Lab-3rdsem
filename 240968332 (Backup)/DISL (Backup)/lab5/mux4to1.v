module mux4to1 (
    input wire [1:0] sel,
    input wire d0,
    input wire d1,
    input wire d2,
    input wire d3,
    output wire y
);

wire y0, y1;

mux2to1 mux_low (
    .sel(sel[0]),
    .a(d0),
    .b(d1),
    .y(y0)
);

mux2to1 mux_high (
    .sel(sel[0]),
    .a(d2),
    .b(d3),
    .y(y1)
);

mux2to1 mux_final (
    .sel(sel[1]),
    .a(y0),
    .b(y1),
    .y(y)
);

endmodule

