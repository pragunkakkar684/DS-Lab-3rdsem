module dff_async_reset (
    input clk,       // Clock input
    input reset,     // Asynchronous active high reset
    input d,         // Data input
    output reg q     // Output
);

always @(posedge clk or posedge reset) begin
    if (reset)
        q <= 1'b0;
    else
        q <= d;
end

endmodule

