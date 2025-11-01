module jk_seq(
    input wire clk,
    input wire E,
    input wire x,
    output reg A,
    output reg B
);

wire J_A, K_A, J_B, K_B;

assign J_A = E & (~x & ~B | x & B);
assign K_A = J_A;

assign J_B = E;
assign K_B = E;

initial begin
	A=0;
	B=0;
end

always @(posedge clk) begin
    case ({J_A, K_A, A})
        3'b000, 3'b001: A <= A;
        3'b010, 3'b011: A <= 0;
        3'b100, 3'b101: A <= 1;
        3'b110, 3'b111: A <= ~A;
        default: A <= A;
    endcase

    case ({J_B, K_B, B})
        3'b000, 3'b001: B <= B;
        3'b010, 3'b011: B <= 0;
        3'b100, 3'b101: B <= 1;
        3'b110, 3'b111: B <= ~B;
        default: B <= B;
    endcase
end
endmodule

