module one(a,b,c,d,f);
	input a,b,c,d;
	output f;
	wire f1,f2;
	assign f1 = (~(~(b&b)&a));
	assign f2 = (~(~(d&d)&c));
	assign f = (~(f1&f2));
endmodule

