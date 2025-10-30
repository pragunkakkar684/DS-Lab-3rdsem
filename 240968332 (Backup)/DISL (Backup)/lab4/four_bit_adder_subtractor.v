`include "four_bit_adder.v"
module four_bit_adder_subtractor(a, b, mode, result, cout);
    input [3:0] a, b;
    input mode; 
    output [3:0] result;
    output cout;

    wire [3:0] b_xor;
    wire cin;

    assign b_xor = b ^ {4{mode}}; 
    assign cin = mode;          

    four_bit_adder adder(a, b_xor, cin, result, cout);

endmodule

