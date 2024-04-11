/***************************************************************************
***                                                                      ***
*** EE 526 L Experiment #9                 Steven Hernandez, Fall, 2023 ***
***                                                                      ***
*** Experiment #9 Sum of products		                               ***
***                                                                      ***
****************************************************************************
*** Filename: SumOfProducts.v       Created by Steven Hernandez, 11/20/23          ***
***                                                                      ***
****************************************************************************
*** This module is for my sum of products which is the second levl        ***
*** this level instantiates 2 registers, 2 mulipliers, an 2 adders         ***
****************************************************************************/

`timescale 1 ns / 1 ns
 
module SumOfProducts(clk, rst, DATA_IN, C0, C1, SUM_OUT);
    parameter WIDTH = 4;    
    
    input clk, rst;
    input[WIDTH-1:0] DATA_IN;
    input[WIDTH-1:0] C0,C1;
    output[WIDTH+1:0] SUM_OUT;    
    
    wire [WIDTH-1:0] R_OUT1, R_OUT2;
    wire [(2*WIDTH)-1:0] P_OUT1, P_OUT2;
    wire [WIDTH:0] A_OUT;

  // 2 registers 
      register R1(.clk(clk), .rst(rst), .DATA_IN(DATA_IN), .DATA_OUT(R_OUT1));    
      register R2(.clk(clk), .rst(rst), .DATA_IN(DATA_IN), .DATA_OUT(R_OUT2));
     
  // 2 multipliers 
      multiplier M1(.A(C0), .C(R_OUT1), .M_OUT(P_OUT1)); 
      multiplier M2(.A(C1), .C(R_OUT2), .M_OUT(P_OUT2));  
    
  //1 adder
    adder A1(.in1(P_OUT1), .in2(P_OUT2), .SUM(A_OUT));    

    assign SUM_OUT = {P_OUT1[2*WIDTH-1], P_OUT2[2*WIDTH-1], A_OUT}; 

endmodule