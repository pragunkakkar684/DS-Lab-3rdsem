module decoder2to4 (
    input en,
    input [1:0] a,
    output reg [3:0] y
);

always @(*) begin
    if (en) begin
        if (a == 2'b00)
            y = 4'b0001;
        else if (a == 2'b01)
            y = 4'b0010;
        else if (a == 2'b10)
            y = 4'b0100;
        else if (a == 2'b11)
            y = 4'b1000;
        else
            y = 4'b0000;  // optional default
    end else begin
        y = 4'b0000;  // Outputs are 0 when not enabled
    end
end

endmodule

module decoder3to8 (
    input en,
    input [2:0] a,
    output [7:0] y
);

wire [3:0] y0, y1;

// Instantiate lower 2-to-4 decoder (when a[2] = 0)
decoder2to4 d0 (
    .en(en & ~a[2]),
    .a(a[1:0]),
    .y(y0)
);

// Instantiate upper 2-to-4 decoder (when a[2] = 1)
decoder2to4 d1 (
    .en(en & a[2]),
    .a(a[1:0]),
    .y(y1)
);

// Combine outputs
assign y = {y1, y0};  // y[7:4] from d1, y[3:0] from d0

endmodule

