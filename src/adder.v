/***************************************************************************
***                                                                      ***
*** EE 526 L Experiment #9                 Steven Hernandez, Fall, 2023 ***
***                                                                      ***
*** Experiment #9 Sum of products		                               ***
***                                                                      ***
****************************************************************************
*** Filename: adder.v       Created by Steven Hernandez, 11/20/23          ***
***                                                                      ***
****************************************************************************
*** This module is for a adder which is used for lowest level         ***
****************************************************************************/

`timescale 1 ns / 1 ns
module adder( in1, in2, SUM);
	parameter DATA_WIDTH = 8;
 
	input wire [DATA_WIDTH-1:0] in1;
	input wire [DATA_WIDTH-1:0] in2;
	output reg [DATA_WIDTH-1:0] SUM;
	
	always @(in1 or in2) begin
	SUM = in1+in2;
     end 
endmodule 

