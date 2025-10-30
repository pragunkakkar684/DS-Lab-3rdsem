module priority_encoder_16to4 (
    input  [15:0] in,
    output reg [3:0] out
);

integer i;
reg found;

always @(*) begin
    out = 4'bxxxx;  // default output if no input is high
    found = 0;
    for (i = 15; i >= 0; i = i - 1) begin
        if (in[i] && !found) begin
            out = i[3:0];
            found = 1;  // flag to indicate highest priority bit found
        end
    end
end

endmodule

