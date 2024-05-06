# Sum-of-Products-
 This Verilog project consists of a Sum of Products which is a method of digital filtering.
 
## Description 
This project implements a device with three levels of hierarchy, featuring scalable data paths and modules. The design is structured into multiple levels of abstraction for modularity and scalability.

Lowest Level Modules:
 - Register Module: A scalable register module capable of handling configurable data widths.
 - Multiplier Module: A scalable multiplier module designed for configurable coefficient widths and data inputs.
 - Adder Module: A scalable adder module capable of performing addition operations on scalable data paths.
   
Second Level Modules:
 - One instance of the Adder Module
 - Two instances of the Multiplier Module
 - Two instances of the Register Module

The top-level design includes:
 - Two instances of the second-level module
 - One additional instance of the Adder Module

Input Parameters:
 - Coefficient (Cx): Primary input parameter determining the width of coefficients.
 - Data_In: Primary input parameter determining the width of data inputs.
 - Default values for both Coefficient (Cx) and Data_In widths are set to four bits.


## Dependencies
### Software
* https://mobaxterm.mobatek.net/

### Author
* Steven Hernandez
  - www.linkedin.com/in/steven-hernandez-a55a11300
  - https://github.com/stevenhernandezz
