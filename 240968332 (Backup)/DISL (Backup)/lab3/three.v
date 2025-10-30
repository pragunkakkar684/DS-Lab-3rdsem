module three(a,b,c,d,f);
	input a,b,c,d;
	output f;
	wire f1,f2;
	assign f1 = ~(c|(~(d|d)));
	assign f2 = ~(a|(~(d|d)));
	assign f = ~((~(f1|f2))|(~(f1|f2)));
endmodule
