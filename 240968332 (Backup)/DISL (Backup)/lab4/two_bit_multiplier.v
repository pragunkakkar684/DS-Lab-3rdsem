module half_adder(a, b, sum, carry);
    input a, b;
    output sum, carry;

    assign sum = a ^ b;
    assign carry = a & b;
endmodule

module two_bit_multiplier(a, b, product);
    input [1:0] a, b;
    output [3:0] product;

    wire p0, p1_temp1, p1_temp2;
    wire s1, c1;
    wire s2, c2;

    // Partial products
    assign product[0] = a[0] & b[0];

    assign p1_temp1 = a[1] & b[0];
    assign p1_temp2 = a[0] & b[1];
    half_adder ha1(p1_temp1, p1_temp2, s1, c1);
    assign product[1] = s1;

    assign s2 = a[1] & b[1];
    half_adder ha2(s2, c1, product[2], c2);

    assign product[3] = c2;
endmodule

