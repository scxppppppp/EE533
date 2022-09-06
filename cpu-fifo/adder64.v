////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____ 
//  /   /\/   / 
// /___/  \  /    Vendor: Xilinx 
// \   \   \/     Version : 10.1.03
//  \   \         Application : sch2verilog
//  /   /         Filename : adder64.vf
// /___/   /\     Timestamp : 03/12/2022 23:59:55
// \   \  /  \ 
//  \___\/\___\ 
//
//Command: /opt/Xilinx/10.1/ISE/bin/lin/unwrapped/sch2verilog -intstyle ise -family virtex2p -w /home/ise/sf/ee533_cpu/alu/adder64.sch adder64.vf
//Design Name: adder64
//Device: virtex2p
//Purpose:
//    This verilog netlist is translated from an ECS schematic.It can be 
//    synthesized and simulated, but it should not be modified. 
//
`timescale 1ns / 1ps

module adder64(A, 
               B, 
               Cin, 
               Cout, 
               S);

    input [63:0] A;
    input [63:0] B;
    input Cin;
   output Cout;
   output [63:0] S;
   
   wire XLXN_1;
   
   adder32 XLXI_1 (.A(A[63:32]), 
                   .B(B[63:32]), 
                   .Cin(XLXN_1), 
                   .Cout(Cout), 
                   .S(S[63:32]));
   adder32 XLXI_2 (.A(A[31:0]), 
                   .B(B[31:0]), 
                   .Cin(Cin), 
                   .Cout(XLXN_1), 
                   .S(S[31:0]));
endmodule
