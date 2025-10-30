`timescale 1ns / 1ps

module muxx16to1_tb;

reg [3:0] sel;
reg [15:0] d;
wire y;

muxx16to1 uut (
    .sel(sel),
    .d(d),
    .y(y)
);

initial begin
    $dumpfile("muxx16to1.vcd");
    $dumpvars(0, muxx16to1_tb);
    $display("Time\tSel\t\tInputs\t\t\t\t\tY");
    $monitor("%0t\t%h\t%b\t%b", $time, sel, d, y);

    // Case 1: Select d[0]
    sel = 4'b0000; d = 16'b0000_0000_0000_0001; #10;

    // Case 2: Select d[3]
    sel = 4'b0011; d = 16'b0000_0000_0000_1000; #10;

    // Case 3: Select d[7]
    sel = 4'b0111; d = 16'b0000_0000_1000_0000; #10;

    // Case 4: Select d[8]
    sel = 4'b1000; d = 16'b0000_0001_0000_0000; #10;

    // Case 5: Select d[12]
    sel = 4'b1100; d = 16'b0001_0000_0000_0000; #10;

    // Case 6: Select d[15]
    sel = 4'b1111; d = 16'b1000_0000_0000_0000; #10;

    $finish;
end

endmodule

