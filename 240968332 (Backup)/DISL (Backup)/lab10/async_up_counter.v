module async_up_counter (
    input clk,
    input reset,
    output [3:0] Q
);
    T_ff FF0 (.clk(clk), .reset(reset), .T(1'b1), .Q(Q[0]));
    T_ff FF1 (.clk(Q[0]), .reset(reset), .T(1'b1), .Q(Q[1]));
    T_ff FF2 (.clk(Q[1]), .reset(reset), .T(1'b1), .Q(Q[2]));
    T_ff FF3 (.clk(Q[2]), .reset(reset), .T(1'b1), .Q(Q[3]));
endmodule

module T_ff (
    input clk,
    input reset,
    input T,
    output reg Q
);
    always @(negedge clk or posedge reset) begin
        if (reset)
            Q <= 1'b0;
        else if (T)
            Q <= ~Q;
    end
endmodule

