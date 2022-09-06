////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____ 
//  /   /\/   / 
// /___/  \  /    Vendor: Xilinx 
// \   \   \/     Version : 10.1.03
//  \   \         Application : sch2verilog
//  /   /         Filename : mux4bit8to1.vf
// /___/   /\     Timestamp : 03/13/2022 00:00:31
// \   \  /  \ 
//  \___\/\___\ 
//
//Command: /opt/Xilinx/10.1/ISE/bin/lin/unwrapped/sch2verilog -intstyle ise -family virtex2p -w /home/ise/sf/ee533_cpu/cpu/mux4bit8to1.sch mux4bit8to1.vf
//Design Name: mux4bit8to1
//Device: virtex2p
//Purpose:
//    This verilog netlist is translated from an ECS schematic.It can be 
//    synthesized and simulated, but it should not be modified. 
//
`timescale 1ns / 1ps

module M2_1E_MXILINX_mux4bit8to1(D0, 
                                 D1, 
                                 E, 
                                 S0, 
                                 O);

    input D0;
    input D1;
    input E;
    input S0;
   output O;
   
   wire M0;
   wire M1;
   
   AND3 I_36_30 (.I0(D1), 
                 .I1(E), 
                 .I2(S0), 
                 .O(M1));
   AND3B1 I_36_31 (.I0(S0), 
                   .I1(E), 
                   .I2(D0), 
                   .O(M0));
   OR2 I_36_38 (.I0(M1), 
                .I1(M0), 
                .O(O));
endmodule
`timescale 1ns / 1ps

module M8_1E_MXILINX_mux4bit8to1(D0, 
                                 D1, 
                                 D2, 
                                 D3, 
                                 D4, 
                                 D5, 
                                 D6, 
                                 D7, 
                                 E, 
                                 S0, 
                                 S1, 
                                 S2, 
                                 O);

    input D0;
    input D1;
    input D2;
    input D3;
    input D4;
    input D5;
    input D6;
    input D7;
    input E;
    input S0;
    input S1;
    input S2;
   output O;
   
   wire M01;
   wire M03;
   wire M23;
   wire M45;
   wire M47;
   wire M67;
   
   M2_1E_MXILINX_mux4bit8to1 I_M01 (.D0(D0), 
                                    .D1(D1), 
                                    .E(E), 
                                    .S0(S0), 
                                    .O(M01));
   // synthesis attribute HU_SET of I_M01 is "I_M01_3"
   MUXF5_L I_M03 (.I0(M01), 
                  .I1(M23), 
                  .S(S1), 
                  .LO(M03));
   M2_1E_MXILINX_mux4bit8to1 I_M23 (.D0(D2), 
                                    .D1(D3), 
                                    .E(E), 
                                    .S0(S0), 
                                    .O(M23));
   // synthesis attribute HU_SET of I_M23 is "I_M23_2"
   M2_1E_MXILINX_mux4bit8to1 I_M45 (.D0(D4), 
                                    .D1(D5), 
                                    .E(E), 
                                    .S0(S0), 
                                    .O(M45));
   // synthesis attribute HU_SET of I_M45 is "I_M45_1"
   MUXF5_L I_M47 (.I0(M45), 
                  .I1(M67), 
                  .S(S1), 
                  .LO(M47));
   M2_1E_MXILINX_mux4bit8to1 I_M67 (.D0(D6), 
                                    .D1(D7), 
                                    .E(E), 
                                    .S0(S0), 
                                    .O(M67));
   // synthesis attribute HU_SET of I_M67 is "I_M67_0"
   MUXF6 I_O (.I0(M03), 
              .I1(M47), 
              .S(S2), 
              .O(O));
endmodule
`timescale 1ns / 1ps

module mux4bit8to1(A, 
                   B, 
                   C, 
                   D, 
                   E, 
                   en, 
                   F, 
                   G, 
                   H, 
                   S, 
                   O);

    input [3:0] A;
    input [3:0] B;
    input [3:0] C;
    input [3:0] D;
    input [3:0] E;
    input en;
    input [3:0] F;
    input [3:0] G;
    input [3:0] H;
    input [2:0] S;
   output [3:0] O;
   
   
   M8_1E_MXILINX_mux4bit8to1 XLXI_3 (.D0(A[0]), 
                                     .D1(B[0]), 
                                     .D2(C[0]), 
                                     .D3(D[0]), 
                                     .D4(E[0]), 
                                     .D5(F[0]), 
                                     .D6(G[0]), 
                                     .D7(H[0]), 
                                     .E(en), 
                                     .S0(S[0]), 
                                     .S1(S[1]), 
                                     .S2(S[2]), 
                                     .O(O[0]));
   // synthesis attribute HU_SET of XLXI_3 is "XLXI_3_4"
   M8_1E_MXILINX_mux4bit8to1 XLXI_12 (.D0(A[1]), 
                                      .D1(B[1]), 
                                      .D2(C[1]), 
                                      .D3(D[1]), 
                                      .D4(E[1]), 
                                      .D5(F[1]), 
                                      .D6(G[1]), 
                                      .D7(H[1]), 
                                      .E(en), 
                                      .S0(S[0]), 
                                      .S1(S[1]), 
                                      .S2(S[2]), 
                                      .O(O[1]));
   // synthesis attribute HU_SET of XLXI_12 is "XLXI_12_5"
   M8_1E_MXILINX_mux4bit8to1 XLXI_13 (.D0(A[2]), 
                                      .D1(B[2]), 
                                      .D2(C[2]), 
                                      .D3(D[2]), 
                                      .D4(E[2]), 
                                      .D5(F[2]), 
                                      .D6(G[2]), 
                                      .D7(H[2]), 
                                      .E(en), 
                                      .S0(S[0]), 
                                      .S1(S[1]), 
                                      .S2(S[2]), 
                                      .O(O[2]));
   // synthesis attribute HU_SET of XLXI_13 is "XLXI_13_6"
   M8_1E_MXILINX_mux4bit8to1 XLXI_14 (.D0(A[3]), 
                                      .D1(B[3]), 
                                      .D2(C[3]), 
                                      .D3(D[3]), 
                                      .D4(E[3]), 
                                      .D5(F[3]), 
                                      .D6(G[3]), 
                                      .D7(H[3]), 
                                      .E(en), 
                                      .S0(S[0]), 
                                      .S1(S[1]), 
                                      .S2(S[2]), 
                                      .O(O[3]));
   // synthesis attribute HU_SET of XLXI_14 is "XLXI_14_7"
endmodule
