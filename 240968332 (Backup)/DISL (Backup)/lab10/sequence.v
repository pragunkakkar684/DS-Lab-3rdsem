module sequence(input clk, input reset, output [2:0] Q);
    wire T2, T1, T0;

    assign T2 = Q[1];
    assign T1 = Q[0];
    assign T0 = ~Q[0]|(Q[1] & Q[2]);

    T_ff FF0 (.clk(clk), .reset(reset), .T(T0), .Q(Q[0]));
    T_ff FF1 (.clk(clk), .reset(reset), .T(T1), .Q(Q[1]));
    T_ff FF2 (.clk(clk), .reset(reset), .T(T2), .Q(Q[2]));
endmodule


module T_ff (input clk, input reset, input T, output reg Q);
    always @(posedge clk or posedge reset) begin
        if (reset)
            Q <= 1'b0;
        else if (T)
            Q <= ~Q;
    end
endmodule

