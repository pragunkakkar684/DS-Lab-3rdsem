module priority_encoder_4to2 (
    input  [3:0] in,
    output reg [1:0] out
);

always @(*) begin
    casex (in)
        4'b1xxx: out = 2'b11;  // Highest priority input is bit 3
        4'b01xx: out = 2'b10;  // Next priority bit 2
        4'b001x: out = 2'b01;  // Next priority bit 1
        4'b0001: out = 2'b00;  // Lowest priority bit 0
        default: out = 2'bxx;  // No inputs active
    endcase
end

endmodule

