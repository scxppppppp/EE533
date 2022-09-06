////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____ 
//  /   /\/   / 
// /___/  \  /    Vendor: Xilinx 
// \   \   \/     Version : 10.1.03
//  \   \         Application : sch2verilog
//  /   /         Filename : mux9bit_2_to_1.vf
// /___/   /\     Timestamp : 03/13/2022 00:00:34
// \   \  /  \ 
//  \___\/\___\ 
//
//Command: /opt/Xilinx/10.1/ISE/bin/lin/unwrapped/sch2verilog -intstyle ise -family virtex2p -w /home/ise/sf/ee533_cpu/cpu/mux9bit_2_to_1.sch mux9bit_2_to_1.vf
//Design Name: mux9bit_2_to_1
//Device: virtex2p
//Purpose:
//    This verilog netlist is translated from an ECS schematic.It can be 
//    synthesized and simulated, but it should not be modified. 
//
`timescale 1ns / 1ps

module M2_1_MXILINX_mux9bit_2_to_1(D0, 
                                   D1, 
                                   S0, 
                                   O);

    input D0;
    input D1;
    input S0;
   output O;
   
   wire M0;
   wire M1;
   
   AND2B1 I_36_7 (.I0(S0), 
                  .I1(D0), 
                  .O(M0));
   OR2 I_36_8 (.I0(M1), 
               .I1(M0), 
               .O(O));
   AND2 I_36_9 (.I0(D1), 
                .I1(S0), 
                .O(M1));
endmodule
`timescale 1ns / 1ps

module mux9bit_2_to_1(branch, 
                      br_ins, 
                      inc_ins, 
                      ins_out);

    input branch;
    input [8:0] br_ins;
    input [8:0] inc_ins;
   output [8:0] ins_out;
   
   
   M2_1_MXILINX_mux9bit_2_to_1 XLXI_1 (.D0(inc_ins[8]), 
                                       .D1(br_ins[8]), 
                                       .S0(branch), 
                                       .O(ins_out[8]));
   // synthesis attribute HU_SET of XLXI_1 is "XLXI_1_0"
   M2_1_MXILINX_mux9bit_2_to_1 XLXI_2 (.D0(inc_ins[7]), 
                                       .D1(br_ins[7]), 
                                       .S0(branch), 
                                       .O(ins_out[7]));
   // synthesis attribute HU_SET of XLXI_2 is "XLXI_2_1"
   M2_1_MXILINX_mux9bit_2_to_1 XLXI_3 (.D0(inc_ins[6]), 
                                       .D1(br_ins[6]), 
                                       .S0(branch), 
                                       .O(ins_out[6]));
   // synthesis attribute HU_SET of XLXI_3 is "XLXI_3_2"
   M2_1_MXILINX_mux9bit_2_to_1 XLXI_4 (.D0(inc_ins[5]), 
                                       .D1(br_ins[5]), 
                                       .S0(branch), 
                                       .O(ins_out[5]));
   // synthesis attribute HU_SET of XLXI_4 is "XLXI_4_3"
   M2_1_MXILINX_mux9bit_2_to_1 XLXI_5 (.D0(inc_ins[4]), 
                                       .D1(br_ins[4]), 
                                       .S0(branch), 
                                       .O(ins_out[4]));
   // synthesis attribute HU_SET of XLXI_5 is "XLXI_5_4"
   M2_1_MXILINX_mux9bit_2_to_1 XLXI_6 (.D0(inc_ins[3]), 
                                       .D1(br_ins[3]), 
                                       .S0(branch), 
                                       .O(ins_out[3]));
   // synthesis attribute HU_SET of XLXI_6 is "XLXI_6_5"
   M2_1_MXILINX_mux9bit_2_to_1 XLXI_7 (.D0(inc_ins[2]), 
                                       .D1(br_ins[2]), 
                                       .S0(branch), 
                                       .O(ins_out[2]));
   // synthesis attribute HU_SET of XLXI_7 is "XLXI_7_6"
   M2_1_MXILINX_mux9bit_2_to_1 XLXI_8 (.D0(inc_ins[1]), 
                                       .D1(br_ins[1]), 
                                       .S0(branch), 
                                       .O(ins_out[1]));
   // synthesis attribute HU_SET of XLXI_8 is "XLXI_8_7"
   M2_1_MXILINX_mux9bit_2_to_1 XLXI_17 (.D0(inc_ins[0]), 
                                        .D1(br_ins[0]), 
                                        .S0(branch), 
                                        .O(ins_out[0]));
   // synthesis attribute HU_SET of XLXI_17 is "XLXI_17_8"
endmodule
