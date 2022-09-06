////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____ 
//  /   /\/   / 
// /___/  \  /    Vendor: Xilinx 
// \   \   \/     Version : 10.1.03
//  \   \         Application : sch2verilog
//  /   /         Filename : DFF133bit.vf
// /___/   /\     Timestamp : 03/13/2022 00:00:09
// \   \  /  \ 
//  \___\/\___\ 
//
//Command: /opt/Xilinx/10.1/ISE/bin/lin/unwrapped/sch2verilog -intstyle ise -family virtex2p -w /home/ise/sf/ee533_cpu/cpu/DFF133bit.sch DFF133bit.vf
//Design Name: DFF133bit
//Device: virtex2p
//Purpose:
//    This verilog netlist is translated from an ECS schematic.It can be 
//    synthesized and simulated, but it should not be modified. 
//
`timescale 1ns / 1ps

module DFF133bit(ALUdata, 
                 clk, 
                 clr, 
                 en, 
                 mem_data, 
                 MEM_MemtoReg, 
                 MEM_Reg_write, 
                 Wregin, 
                 ALUdataout, 
                 mem_dataout, 
                 WB_MetoReg, 
                 WB_Reg_write, 
                 Wregout);

    input [63:0] ALUdata;
    input clk;
    input clr;
    input en;
    input [63:0] mem_data;
    input MEM_MemtoReg;
    input MEM_Reg_write;
    input [2:0] Wregin;
   output [63:0] ALUdataout;
   output [63:0] mem_dataout;
   output WB_MetoReg;
   output WB_Reg_write;
   output [2:0] Wregout;
   
   
   FDCE XLXI_1 (.C(clk), 
                .CE(en), 
                .CLR(clr), 
                .D(MEM_MemtoReg), 
                .Q(WB_MetoReg));
   defparam XLXI_1.INIT = 1'b0;
   FDCE XLXI_10 (.C(clk), 
                 .CE(en), 
                 .CLR(clr), 
                 .D(MEM_Reg_write), 
                 .Q(WB_Reg_write));
   defparam XLXI_10.INIT = 1'b0;
   FDCE XLXI_11 (.C(clk), 
                 .CE(en), 
                 .CLR(clr), 
                 .D(Wregin[2]), 
                 .Q(Wregout[2]));
   defparam XLXI_11.INIT = 1'b0;
   FDCE XLXI_12 (.C(clk), 
                 .CE(en), 
                 .CLR(clr), 
                 .D(Wregin[1]), 
                 .Q(Wregout[1]));
   defparam XLXI_12.INIT = 1'b0;
   FDCE XLXI_13 (.C(clk), 
                 .CE(en), 
                 .CLR(clr), 
                 .D(Wregin[0]), 
                 .Q(Wregout[0]));
   defparam XLXI_13.INIT = 1'b0;
   DFF64bit XLXI_14 (.clk(clk), 
                     .clr(clr), 
                     .en(en), 
                     .i(mem_data[63:0]), 
                     .o(mem_dataout[63:0]));
   DFF64bit XLXI_15 (.clk(clk), 
                     .clr(clr), 
                     .en(en), 
                     .i(ALUdata[63:0]), 
                     .o(ALUdataout[63:0]));
endmodule
