module jk_ff_sync_reset (
    input wire clk,     
    input wire reset,  
    input wire j,     
    input wire k,       
    output reg q       
);

always @(posedge clk) begin
    if (reset)
        q <= 1'b0;               
    else if (j && !k)
        q <= 1'b1;              
    else if (!j && k)
        q <= 1'b0;           
    else if (j && k)
        q <= ~q;                 
end

endmodule
0.
