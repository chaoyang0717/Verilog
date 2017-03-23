/* TFF_TEST 非同步T型正反器測試平台*/
'timescale 1ns/1ns
module TFF_TEST;
reg    R, T;
wire   Q, Q_B;
parameter         STEP = 100;
           RSFF   RSFF  ( R, T, Q, Q_B );
		   
		   initial begin
		                            R = 0; T = 0;
						 #(STEP/5)  R = 1;
						 #(STEP/5)  R = 0;
						 #STEP      T = 1;
						 #(STEP/2)  T = 0;
						 #(2*STEP)  T = 1; 
						 #STEP      T = 0;
						 #STEP      $finish;
		    end
			
endmodule
						   