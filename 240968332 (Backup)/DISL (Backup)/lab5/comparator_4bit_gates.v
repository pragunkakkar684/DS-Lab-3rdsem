module comparator_4bit_gates(
    input  [3:0] A,
    input  [3:0] B,
    output       A_gt_B,
    output       A_eq_B,
    output       A_lt_B
);

wire [3:0] eq;        // bitwise equality (1 if Ai == Bi)
wire eq_3, eq_2, eq_1;

// Equality for each bit using XNOR (basic gates)
assign eq = ~(A ^ B);

assign eq_3 = eq[3];
assign eq_2 = eq[2];
assign eq_1 = eq[1];

// Greater than bits: bit i is greater if A[i]=1, B[i]=0, and all higher bits equal
assign A_gt_B = 
    (A[3] & ~B[3]) |
    (A[2] & ~B[2] & eq_3) |
    (A[1] & ~B[1] & eq_3 & eq_2) |
    (A[0] & ~B[0] & eq_3 & eq_2 & eq_1);

// Less than bits: bit i is less if A[i]=0, B[i]=1, and all higher bits equal
assign A_lt_B = 
    (~A[3] & B[3]) |
    (~A[2] & B[2] & eq_3) |
    (~A[1] & B[1] & eq_3 & eq_2) |
    (~A[0] & B[0] & eq_3 & eq_2 & eq_1);

// Equality is true if all bits are equal
assign A_eq_B = eq[3] & eq[2] & eq[1] & eq[0];

endmodule

