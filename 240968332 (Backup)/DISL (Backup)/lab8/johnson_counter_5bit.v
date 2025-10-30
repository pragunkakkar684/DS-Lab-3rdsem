// D Flip-Flop Module
module dff (
    input wire clk,
    input wire rst,
    input wire d,
    output wire q
);
    reg q_reg;
    always @(posedge clk or posedge rst) begin
        if (rst)
            q_reg <= 1'b0;
        else
            q_reg <= d;
    end
    assign q = q_reg;
endmodule

// 5-bit Johnson Counter (Structural)
module johnson_counter_5bit (
    input wire clk,
    input wire rst,
    output wire [4:0] q
);
    wire [4:0] d;

    // Feedback: inverted output of last flip-flop
    assign d[0] = ~q[4];
    assign d[1] = q[0];
    assign d[2] = q[1];
    assign d[3] = q[2];
    assign d[4] = q[3];

    // Instantiate D flip-flops
    dff dff0 (.clk(clk), .rst(rst), .d(d[0]), .q(q[0]));
    dff dff1 (.clk(clk), .rst(rst), .d(d[1]), .q(q[1]));
    dff dff2 (.clk(clk), .rst(rst), .d(d[2]), .q(q[2]));
    dff dff3 (.clk(clk), .rst(rst), .d(d[3]), .q(q[3]));
    dff dff4 (.clk(clk), .rst(rst), .d(d[4]), .q(q[4]));
endmodule

