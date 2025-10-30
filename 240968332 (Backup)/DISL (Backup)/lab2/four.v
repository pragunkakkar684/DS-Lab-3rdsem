module four(a,b,c,d,f);
	input a,b,c,d;
	output f;
	assign f = (c|d|(~b))&(a|(~b)|(~c))&((~a)|b|(~d))&((~a)|b|(~c));
endmodule
