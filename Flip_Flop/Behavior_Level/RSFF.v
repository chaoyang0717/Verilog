/* RSFF */

module RSFF ( R, S, Q, Q_B);
input  R, S;
output Q, Q_B;
reg    Q, Q_B;  /* 用reg宣告為正反器的輸出 ; 一般正反器輸出只需用reg宣告 reg Q , Q_B用wire宣告,再用assign 代入Q的反相值。
                   但此方法，禁止輸入的Q與Q_B值,不能同時為'0',所以各自獨立使用reg宣告*/
       always @( R or S ) 
	   /*always與事件，因為事件依據 R or S, 所以狀態是根據R或S來執行。 
	     posedge R or posedge S 是指當R或S的電位由低變高(正緣)
		 或
		 negedge R or negedge S 是指當R或S的電位由高電低(負緣)*/
	   
	   case ({ R , S }) /*always裡狀態用case描述，用連接運算子{}將R與S連結在一起 */
	        1:begin Q <= 1; Q_B <= 0; end //case item沒有描述到'0'因為當R='0',S='0'的時候Q與Q_B沒有變化
			2:begin Q <= 0; Q_B <= 1; end
			3:begin Q <= 0; Q_B <= 0; end
	   endcase
endmodule
						   