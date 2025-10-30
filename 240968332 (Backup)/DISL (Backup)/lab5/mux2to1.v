module mux2to1 (
    input wire sel,
    input wire a,
    input wire b,
    output reg y
);

always @(*) begin
    if (sel == 0)
        y = a;
    else
        y = b;
end

endmodule

