module mux16to1 (
    input wire [3:0] sel,
    input wire [15:0] d,
    output wire y
);

wire y0, y1, y2, y3;
                                    
mux4to1_conditional mux0 (
    .sel(sel[1:0]),
    .d0(d[0]),
    .d1(d[1]),
    .d2(d[2]),
    .d3(d[3]),
    .y(y0)
);

mux4to1_conditional mux1 (
    .sel(sel[1:0]),
    .d0(d[4]),
    .d1(d[5]),
    .d2(d[6]),
    .d3(d[7]),               
    .y(y1)
);

mux4to1_conditional mux2 (
    .sel(sel[1:0]),
    .d0(d[8]),
    .d1(d[9]),
    .d2(d[10]),
    .d3(d[11]),
    .y(y2)
);

mux4to1_conditional mux3 (
    .sel(sel[1:0]),
    .d0(d[12]),
    .d1(d[13]),
    .d2(d[14]),
    .d3(d[15]),
    .y(y3)
);

// Final layer: select among y0 to y3
mux4to1_conditional mux_final (
    .sel(sel[3:2]),
    .d0(y0),
    .d1(y1),
    .d2(y2),
    .d3(y3),
    .y(y)
);

endmodule

