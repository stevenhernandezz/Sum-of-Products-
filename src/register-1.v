/***************************************************************************
***                                                                      ***
*** EE 526 L Experiment #9                 Steven Hernandez, Fall, 2023 ***
***                                                                      ***
*** Experiment #9 Sum of products		                               ***
***                                                                      ***
****************************************************************************
*** Filename: register.v       Created by Steven Hernandez, 11/20/23          ***
***                                                                      ***
****************************************************************************
*** This module is for a register which is used for lowest level         ***
****************************************************************************/

`timescale 1 ns / 1 ns
module register(clk, DATA_IN, DATA_OUT,rst);
	parameter DATA_WIDTH = 4;
	
	input clk;	
	input rst;
	input wire [DATA_WIDTH-1:0] DATA_IN;
	output reg [DATA_WIDTH-1:0] DATA_OUT;

	always@(posedge clk) begin
	 if (rst)begin
		DATA_OUT <= 0;
 	end 
		else begin
		DATA_OUT <= DATA_IN;
	end 
end
endmodule 
