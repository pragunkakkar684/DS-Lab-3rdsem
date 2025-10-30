module two(a,b,c,d,f);
	input a,b,c,d;
	output f;
	wire f1,f2,f3;
	assign f1 = ~(b|c);
	assign f2 = ~(a|c|~(d|d));
	assign f3 = ~(b|d);
	assign f = ~((~(f1|f2|f3))|~(f1|f2|f3));
endmodule
