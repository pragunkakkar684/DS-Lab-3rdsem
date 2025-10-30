module four(a,b,c,d,f);
	input a,b,c,d;
	output f;
	wire f1,f2,f3;
	assign f1 = ~(b&(~(c&c)));
	assign f2 = ~(a&b);
	assign f3 = ~(d&a);
	assign f = ~((~(f1&f2&f3))&(~(f1&f2&f3)));
endmodule
