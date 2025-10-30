module muxx16to1 (
    input wire [3:0] sel,
    input wire [15:0] d,
    output wire y
);

wire y_low, y_high;

// Lower half: d[0] to d[7]
mux8to1_case mux_low (
    .sel(sel[2:0]),
    .d(d[7:0]),
    .y(y_low)
);

// Upper half: d[8] to d[15]
mux8to1_case mux_high (
    .sel(sel[2:0]),
    .d(d[15:8]),
    .y(y_high)
);

// Final selection between lower and upper halves
mux2to1 mux_final (
    .sel(sel[3]),
    .a(y_low),
    .b(y_high),
    .y(y)
);

endmodule

