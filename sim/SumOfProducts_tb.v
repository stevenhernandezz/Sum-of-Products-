/***************************************************************************
***                                                                      ***
*** EE 526 L Experiment #9                 Steven Hernandez, Fall, 2023 ***
***                                                                      ***
*** Experiment #9 Sum of products		                               ***
***                                                                      ***
****************************************************************************
*** Filename: SumOfProducts_tb.v       Created by Steven Hernandez, 11/20/23          ***
***                                                                      ***
****************************************************************************
*** This module is a testbench for my SOP which will:               ***
*** show non exhaustive and exhaustive tests as well as use ifdef, endif, ***
*** monotior on, monitoroff.                                              ***
*** Here i be comparing the two tests and implementing it into a waveform ***
****************************************************************************/

`timescale 1 ns / 1 ns
`define ERROR
`define MONITOR_STR_1  "%d: DATA_IN = %d, C0 = %d, C1 = %d,C2 = %d, C3 = %d, H_OUT = %d, NH_OUT = %d" 
module SumOfProducts_tb;

        //parameter init
      parameter WIDTH = 4;
      
      reg clk,rst, forced;	
      integer i, j, k, l, m, n;
    	reg [WIDTH-1:0] C0, C1, C2, C3;
	    reg [WIDTH-1:0] DATA_IN, H_OUTPUT;
         
       wire [WIDTH+1:0] H_OUTPUT, NH_OUT, OUT;
      
      top uut(.clk(clk), .rst(rst), .DATA_IN(DATA_IN), .C0(C0), .C1(C1), .C2(C2), .C3(C3), .SUM_OUT(OUT));
      
      //clock init
      initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
      // monitoring I/O
      initial begin
        $monitor(`MONITOR_STR_1, $time, DATA_IN, C0, C1, C2, C3, H_OUTPUT, NH_OUT);
      end 
        
        //non-hierarchical 
        assign NH_OUT = (DATA_IN * C0) + (DATA_IN * C1) + (DATA_IN * C2) + (DATA_IN * C3); 

  
        //monitor off and monitor on show first dozen
always @* begin 
      if (DATA_IN == 0 & C0 == 0 & C1 == 0 & C2 == 0 & C3 == 0)
          #10 $monitoroff;
          else begin 
      if(DATA_IN == 12 & C0 == 1 & C1 == 1 & C2 == 1 & C3 == 1)
          #10 $monitoron;
      end
      end
              
   
initial begin
$vcdpluson;
$vcdplusmemon;
    //non-exhaustive
    rst = 0;
    clk = 0;
          //zero input test
      #10 rst = 1; DATA_IN = 0; 
            C0 = 1; C1 = 2; C2 = 3; C3 = 4;
            //zero test
      #10 rst = 1; DATA_IN = 7;
            C0 = 0; C1 = 0; C2 = 0; C3 = 0;
            //equal coeff
      #10 rst = 1; DATA_IN = 5;
            C0 = 2; C1 = 2; C2 = 2; C3 = 2;
          
    #10 rst = 0; 
         clk = 0;
    #10 rst = 1; 
          DATA_IN = 0; C0 = 0; C1 = 0; C2 = 0; C3 = 0;
        for (i = 0; i < 16; i = i+1) begin
          DATA_IN = i;
            for (j = 0; j < 16; j = j+1) begin
              C0 = j; 
                for (k = 0; k < 16; k = k+1) begin
                  C1 = k;
                    for (l = 0; l < 16; l = l+1) begin
                      C2 = l;
                        for (m = 0; m < 16; m = m+1) begin
                            C3 = m;
                            #10 clk = 1;
                            #10 clk = 0;
                            
                            //3/4 vector 
                            if (i > 12 && j > 12 && k > 12 && l > 12 && m > 12 && !forced) begin
                                `ifdef ERROR
                                    force uut.SUM_OUT = OUT + 1;
                                    forced = 1;
                                    #10 release uut.SUM_OUT;
                                `endif
                        end
                    end 
                end
            end
        end
    end
    $finish;
    end
endmodule 


