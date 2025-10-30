`timescale 1ns / 1ps

module tb_priority_encoder_16to4;

    reg [15:0] in;
    wire [3:0] out;

    // Instantiate the priority encoder
    priority_encoder_16to4 uut (
        .in(in),
        .out(out)
    );

    initial begin
        $dumpfile("priority_encoder_16to4_tb.vcd");
        $dumpvars(0, tb_priority_encoder_16to4);

        $display("Time\t      in                 | out");
        $display("-------------------------------------------");

        in = 16'b0;           #10 $display("%0t\t %b | %b", $time, in, out);
        in = 16'b1;           #10 $display("%0t\t %b | %b", $time, in, out);
        in = 16'b10;          #10 $display("%0t\t %b | %b", $time, in, out);
        in = 16'b1000_0000;   #10 $display("%0t\t %b | %b", $time, in, out);
        in = 16'b0001_0000_0000_0000; #10 $display("%0t\t %b | %b", $time, in, out);
        in = 16'b1111_1111_1111_1111; #10 $display("%0t\t %b | %b", $time, in, out);

        $finish;
    end

endmodule

