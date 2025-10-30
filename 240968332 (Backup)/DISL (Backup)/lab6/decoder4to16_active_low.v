module decoder2to4_active_low (
    input en,
    input [1:0] a,
    output reg [3:0] y  // active low outputs
);

always @(*) begin
    if (en) begin
        case (a)
            2'b00: y = 4'b1110;
            2'b01: y = 4'b1101;
            2'b10: y = 4'b1011;
            2'b11: y = 4'b0111;
            default: y = 4'b1111;
        endcase
    end else begin
        y = 4'b1111;  // outputs inactive (all high)
    end
end

endmodule


module decoder4to16_active_low (
    input en,
    input [3:0] a,
    output [15:0] y  // active low outputs
);

wire [3:0] en_lines;
wire [3:0] y0, y1, y2, y3;

// Upper 2-to-4 decoder generates enable lines for four lower decoders
decoder2to4_active_low upper_decoder (
    .en(en),
    .a(a[3:2]),
    .y(en_lines)
);

// Four lower 2-to-4 decoders decode the lower bits a[1:0]
decoder2to4_active_low d0 (
    .en(~en_lines[0]),  // active high enable for lower decoders, invert because outputs active low
    .a(a[1:0]),
    .y(y0)
);

decoder2to4_active_low d1 (
    .en(~en_lines[1]),
    .a(a[1:0]),
    .y(y1)
);

decoder2to4_active_low d2 (
    .en(~en_lines[2]),
    .a(a[1:0]),
    .y(y2)
);

decoder2to4_active_low d3 (
    .en(~en_lines[3]),
    .a(a[1:0]),
    .y(y3)
);

// Combine outputs: since outputs are active low, concatenate directly
assign y = {y3, y2, y1, y0};

endmodule

