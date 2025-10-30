module two(a,b,c,d,f);
	input a,b,c,d;
	output f;
	assign f = ((~c)&(~d)&b)|(d&(~b))|(c&(~b));
endmodule
