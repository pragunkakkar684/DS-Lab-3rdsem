module t_ff_async_reset (
    input wire clk,     
    input wire reset_n, 
    input wire t,       
    output reg q        
);

always @(negedge clk or negedge reset_n) begin
    if (!reset_n)
        q <= 1'b0;       
    else if (t)
        q <= ~q;         
end

endmodule

