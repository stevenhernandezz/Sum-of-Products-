/***************************************************************************
***                                                                      ***
*** EE 526 L Experiment #9                 Steven Hernandez, Fall, 2023 ***
***                                                                      ***
*** Experiment #9 Sum of products		                               ***
***                                                                      ***
****************************************************************************
*** Filename: top.v       Created by Steven Hernandez, 11/20/23          ***
***                                                                      ***
****************************************************************************
*** This module is for my top file s which is the highest level        ***
*** this level instantiates 2 sop's and 1 additional adder               ***
****************************************************************************/

`timescale 1 ns / 1 ns
module top(clk, rst, C0, C1, C2, C3, DATA_IN, SUM_OUT);
	parameter WIDTH = 4;
   parameter OUT_WIDTH = 8;
	
	input clk,rst;	
	input [WIDTH-1:0] C0, C1, C2, C3;
	input [WIDTH-1:0] DATA_IN;
 output [OUT_WIDTH-1:0] SUM_OUT;
 
	wire [WIDTH*2:0] S1, S2;
	
	SumOfProducts #(WIDTH) SOP1(.clk(clk), .rst(rst), .DATA_IN(DATA_IN), .C0(C0), .C1(C1), .SUM_OUT(S0));
  SumOfProducts #(WIDTH) SOP2(.clk(clk), .rst(rst), .DATA_IN(DATA_IN), .C0(C2), .C1(C3), .SUM_OUT(S1));


	adder #(WIDTH) TOP_ADD(.in1(S0), .in2(S1), .SUM(SUM_OUT));
 
endmodule