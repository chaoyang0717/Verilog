/* 4-1 selector (Data Flow Level design)
formula : OUT = /SEL1 * /SEL0 * A + /SEL1 * SEL0 * B + SEL1 * /SEL0 * C + SEL1 * SEL0 * D ;

*/
module SEL_DF (A, B, C, D, SEL, OUT);
input A, B, C, D;
input [1:0] SEL;
output OUT;
       assign OUT = ~SEL[1] & ~SEL[0] & A
	                | ~SEL[1] & SEL[0] & B
					| SEL[1] & ~SEL[0] & C
					| SEL[1] & SEL[0] & D;
end module

/* 4-1 selector Conditional Operator */
module	SEL_CO	( A, B, C, D, SEL, OUT );
input	A, B, C, D;
input	[1:0] SEL;
output	OUT;
    
	/* status 1 : OUT=(SEL[0]==0) ? A:B 
	   status 2 : OUT=(SEL[0]==0) ? C:D
	*/
	assign	OUT = ( SEL[1] == 0 )?             
		          (( SEL[0] == 0 )? A: B ):(( SEL[0] == 0 )? C: D );

endmodule

/* 4-1 selector behavior level if else statement  */
/*	4-1 SELECTOR	*/
module	SEL	( A, B, C, D, SEL, OUT );
input	A, B, C, D;
input	[1:0] SEL;
output	OUT;

	assign	OUT = SEL4_1_FUNC ( A, B, C, D, SEL );

function	SEL4_1_FUNC;
input	A, B, C, D;
input	[1:0] SEL;
	if ( SEL[1] == 0 )
		if ( SEL[0] == 0 )
			SEL4_1_FUNC = A;
		else
			SEL4_1_FUNC = B;
	else
		if ( SEL[0] == 0 )
			SEL4_1_FUNC = C;
		else
			SEL4_1_FUNC = D;
endfunction

endmodule


/* 4-1 selector behavior level case statement  */
module	SEL	( A, B, C, D, SEL, OUT );
input	A, B, C, D;
input	[1:0] SEL;
output	OUT;

	assign	OUT = SEL4_1_FUNC ( A, B, C, D, SEL );

function	SEL4_1_FUNC;
input	A, B, C, D;
input	[1:0] SEL;
	case ( SEL )
		0:SEL4_1_FUNC = A;
		1:SEL4_1_FUNC = B;
		2:SEL4_1_FUNC = C;
		3:SEL4_1_FUNC = D;
	endcase
endfunction

endmodule

