module sequential_circuit(
    input clk,
    input x,
    output A,
    output B
);

    wire T_A, T_B;
    wire A_wire, B_wire;

    assign A = A_wire;
    assign B = B_wire;

    assign T_A = (~x & B_wire) | (~A_wire & B_wire);
    assign T_B = (x & ~A_wire & B_wire) | (~x & A_wire) | (~x & ~B_wire);

    T_FF ff_A(
        .clk(clk),
        .T(T_A),
        .Q(A_wire)
    );

    T_FF ff_B(
        .clk(clk),
        .T(T_B),
        .Q(B_wire)
    );

endmodule

module T_FF(
    input clk,
    input T,
    output reg Q
);
    initial Q=0;
    always @(posedge clk) begin
        Q <= Q ^ T;
    end
endmodule

