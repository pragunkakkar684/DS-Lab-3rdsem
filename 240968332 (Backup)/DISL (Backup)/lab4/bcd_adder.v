module four_bit_adder(a, b, cin, sum, cout);
    input [3:0] a, b;
    input cin;
    output [3:0] sum;
    output cout;

    wire c1, c2, c3;

    full_adder fa0(a[0], b[0], cin,  sum[0], c1);
    full_adder fa1(a[1], b[1], c1,   sum[1], c2);
    full_adder fa2(a[2], b[2], c2,   sum[2], c3);
    full_adder fa3(a[3], b[3], c3,   sum[3], cout);
endmodule

module full_adder(a, b, cin, sum, carry);
    input a, b, cin;
    output sum, carry;

    assign sum = a ^ b ^ cin;
    assign carry = (a & b) | (b & cin) | (a & cin);
endmodule

module bcd_adder(a, b, cin, sum, cout);
    input [3:0] a, b;
    input cin;
    output [3:0] sum;
    output cout;

    wire [3:0] raw_sum, corrected_sum;
    wire carry_out, carry_correction;
    wire correction_needed;

    // Add inputs using 4-bit binary adder
    four_bit_adder add1(a, b, cin, raw_sum, carry_out);

    // Check if correction is needed
    assign correction_needed = carry_out | (raw_sum[3] & (raw_sum[2] | raw_sum[1]));

    // Add 6 (0110) if correction is needed
    four_bit_adder add2(raw_sum, 4'b0110, 1'b0, corrected_sum, carry_correction);

    // Output correct sum and carry
    assign sum = correction_needed ? corrected_sum : raw_sum;
    assign cout = correction_needed ? carry_correction : carry_out;

endmodule

