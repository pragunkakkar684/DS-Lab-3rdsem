module q2(a, b, c, d, f, g);
    input a, b, c, d;
    output f, g;
    wire a1;

    assign a1 = ~(a & b);
    assign f = a1 ^ c ^ d;
    assign g = ~(b | c | d);
endmodule

