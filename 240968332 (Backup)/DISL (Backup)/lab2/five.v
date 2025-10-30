module five(a,b,c,d,f);
	input a,b,c,d;
	output f;
	assign f = (a&b&d)|(c&d&a)|(a&b&c)|(b&c&d);
endmodule
