/* NOR_RSFF */

module RSFF ( R, S, Q, Q_B);
input  R, S;
output Q, Q_B;
       nor ( R, S, Q, Q_B);
	   nor ( Q_B, S, Q );
endmodule
						   