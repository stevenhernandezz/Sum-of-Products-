/***************************************************************************
***                                                                      ***
*** EE 526 L Experiment #9                 Steven Hernandez, Fall, 2023 ***
***                                                                      ***
*** Experiment #9 Sum of products		                               ***
***                                                                      ***
****************************************************************************
*** Filename: multiplier.v       Created by Steven Hernandez, 11/20/23          ***
***                                                                      ***
****************************************************************************
*** This module is for a multiplier which is used for lowest level         ***
****************************************************************************/

`timescale 1 ns / 1 ns
module multiplier(A,C, M_OUT);
	parameter DATA_WIDTH = 4;
	parameter C_WIDTH = 4;
	
  input [DATA_WIDTH- 1:0] A;
	input  [C_WIDTH-1:0] C;
	output reg [2*DATA_WIDTH-1:0] M_OUT;	
	
	always @*
	 M_OUT = A * C;
endmodule 

