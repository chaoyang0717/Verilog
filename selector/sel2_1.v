/* 2 to 1 selector
formula : OUT = /SEL * A + SEL * B ;
SEL is select signal.
Gate Level design */
module sel( A, B, SEL, OUT);
input A, B, SEL;
output OUT;
wire SEL_NOT, AND1, AND2;
     not U1 (SEL_NOT, SEL);
	 and U2 (AND1, B, SEL);
	     U3 (AND2, A, SEL_NOT);
	 or U4 (OUT, AND1, AND2);
endmodule

/* data flow level design 

module SEL (A, B, SEL, OUT);
input A, B, SEL;
output OUT;
       assign OUT = ~SEL & A | SEL & B;
endmodule

*/
