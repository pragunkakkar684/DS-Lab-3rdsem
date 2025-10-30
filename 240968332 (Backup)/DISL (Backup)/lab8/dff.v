module dff (
    input wire clk,
    input wire d,
    output wire q
);
    reg q_reg;
    always @(posedge clk)
        q_reg <= d;
    assign q = q_reg;
endmodule


module shift_register_6bit (
    input wire clk,
    input wire shift_en,
    input wire serial_in,
    output wire [5:0] q
);
    wire [5:0] d;


    assign d[0] = shift_en ? serial_in : q[0];
    assign d[1] = shift_en ? q[0]      : q[1];
    assign d[2] = shift_en ? q[1]      : q[2];
    assign d[3] = shift_en ? q[2]      : q[3];
    assign d[4] = shift_en ? q[3]      : q[4];
    assign d[5] = shift_en ? q[4]      : q[5];


    dff dff0 (.clk(clk), .d(d[0]), .q(q[0]));
    dff dff1 (.clk(clk), .d(d[1]), .q(q[1]));
    dff dff2 (.clk(clk), .d(d[2]), .q(q[2]));
    dff dff3 (.clk(clk), .d(d[3]), .q(q[3]));
    dff dff4 (.clk(clk), .d(d[4]), .q(q[4]));
    dff dff5 (.clk(clk), .d(d[5]), .q(q[5]));
endmodule

