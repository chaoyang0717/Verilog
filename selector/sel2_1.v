/* 2 to 1 selector
formula : OUT = /SEL * A + SEL * B ;
SEL is select signal.
Gate Level design */
module SEL_GL( A, B, SEL, OUT);
input A, B, SEL;
output OUT;
wire SEL_NOT, AND1, AND2;
     not U1 (SEL_NOT, SEL);
	 and U2 (AND1, B, SEL);
	     U3 (AND2, A, SEL_NOT);
	 or U4 (OUT, AND1, AND2);
endmodule

/* data flow level design */

module SEL_DF (A, B, SEL, OUT);
input A, B, SEL;
output OUT;
       assign OUT = ~SEL & A | SEL & B;
endmodule

/* Conditional Operator design */
module	SEL_CO	( A, B, SEL, OUT );
input	A, B, SEL;
output	OUT;

	assign	OUT = ( SEL == 0 )? A: B;

endmodule

/* Behavior Level design	*/
module	SEL_BL	( A, B, SEL, OUT );
input	A, B, SEL;
output	OUT;

	assign	OUT = SEL2_1_FUNC ( A, B, SEL );

function	SEL2_1_FUNC;
input	A, B, SEL;
	if ( SEL == 0 )
			SEL2_1_FUNC = A;
		else
			SEL2_1_FUNC = B;
endfunction

endmodule
