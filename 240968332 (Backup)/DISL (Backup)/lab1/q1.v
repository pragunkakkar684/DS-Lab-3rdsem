module q1(a,b,c,d,f);
	input a,b,c,d;
	wire p,q,r,s,t,u,v;
	output f;
	and(p,a,b);
	or(q,p,c);
	not(r,q);
	and(s,r,d);
	and(t,a,b);
	or(u,t,c);
	or(v,u,d);
	and(f,s,v);
endmodule


	
