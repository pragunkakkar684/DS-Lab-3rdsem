module decoder3to8 (
    input en,
    input [2:0] a,
    output reg [7:0] y
);

integer i;

always @(*) begin
    if (en) begin
        // Set only one bit high based on input 'a'
        for (i = 0; i < 8; i = i + 1)
            y[i] = (i == a) ? 1'b1 : 1'b0;
    end else begin
        y = 8'b00000000;
    end
end

endmodule


module decoder4to16 (
    input en,
    input [3:0] a,
    output [15:0] y
);

wire [7:0] y_low, y_high;

// Lower 3-to-8 decoder (for a[3] = 0)
decoder3to8 d0 (
    .en(en & ~a[3]),
    .a(a[2:0]),
    .y(y_low)
);

// Upper 3-to-8 decoder (for a[3] = 1)
decoder3to8 d1 (
    .en(en & a[3]),
    .a(a[2:0]),
    .y(y_high)
);

// Combine outputs
assign y = {y_high, y_low};

endmodule

