module register_nbit #(
    parameter N = 4  // You can change this to any desired bit-width
)(
    input wire clk,
    input wire rst,
    input wire en,
    input wire [N-1:0] d,
    output wire [N-1:0] q
);
    reg [N-1:0] q_reg;

    always @(posedge clk) begin
        if (rst)
            q_reg <= {N{1'b0}};  // Reset all bits to 0
        else if (en)
            q_reg <= d;          // Load input vector
    end

    assign q = q_reg;
endmodule

