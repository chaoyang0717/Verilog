/* RSFF_TEST (testbench) */
'timescale 1ns/1ns
module RSFF_TEST;
reg R, S;
wire Q, Q_B;
parameter STEP = 100;
          RSFF RSFF ( R, S, Q, Q_B)
		  
		  initial begin
		                   R=0 ; S=0 ;
				  #STEP	   S=1 ;
				  #STEP	   S=0 ;
				  #STEP	   R=1 ;
				  #STEP	   R=0 ;
				  #STEP	   S=1 ; R=1 ;
				  #STEP	   $finish ;
		  end
endmodule
						   