/* TFF 非同步T型正反器 */

module RSFF ( R, T, Q, Q_B);
input  R, T;
output Q, Q_B;
reg    Q; // 用reg只單獨宣告Q，Q與Q_B一定會反轉所以只宣告Q 
assign Q_B = ~Q ; //用assign將Q_B的值代入

       /* 當R或T正緣時會執行狀態。當R ON時會重置Q，要不然(T為ON時)Q會反轉。
	      當R為負緣，因跟非同步RS FF不同所以不用另外執行狀態。 */
	   always @(posedge R or posedge T )
              Q <= ( R )? 0: ~Q; // if (R) Q<=0;else Q<=~Q;
	   
endmodule
						   