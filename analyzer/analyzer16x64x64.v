`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    07:50:20 03/02/2022 
// Design Name: 
// Module Name:    analyzer16x64x64 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module analyzer16x64x64
    #(
    parameter DATA_WIDTH = 64,
    parameter CTRL_WIDTH = DATA_WIDTH/8,
    parameter UDP_REG_SRC_WIDTH = 2
    )
    (
    input [63:0] din0,
    input [63:0] din1,
    input [63:0] din2,
    input [63:0] din3,
    input [63:0] din4,
    input [63:0] din5,
    input [63:0] din6,
    input [63:0] din7,
    input [63:0] din8,
    input [63:0] din9,
    input [63:0] din10,
    input [63:0] din11,
    input [63:0] din12,
    input [63:0] din13,
    input [63:0] din14,
    input [63:0] din15,
    input trigger,
    input [31:0] dut_imem_in,
    input [63:0] dut_dmem_in,

    output dut_en,
    output dut_rst,
    output [63:0] dut_data_out,
    output [11:0] dut_addr_out,
    output dut_imem_wen,
    output dut_dmem_wen,


    // --- Register interface
    input                               reg_req_in,
    input                               reg_ack_in,
    input                               reg_rd_wr_L_in,
    input  [`UDP_REG_ADDR_WIDTH-1:0]    reg_addr_in,
    input  [`CPCI_NF2_DATA_WIDTH-1:0]   reg_data_in,
    input  [UDP_REG_SRC_WIDTH-1:0]      reg_src_in,

    output                              reg_req_out,
    output                              reg_ack_out,
    output                              reg_rd_wr_L_out,
    output  [`UDP_REG_ADDR_WIDTH-1:0]   reg_addr_out,
    output  [`CPCI_NF2_DATA_WIDTH-1:0]  reg_data_out,
    output  [UDP_REG_SRC_WIDTH-1:0]     reg_src_out,

    input clk,
    input rdclk,
    input rst
    );

    wire [63:0] dout0;
    wire [63:0] dout1;
    wire [63:0] dout2;
    wire [63:0] dout3;
    wire [63:0] dout4;
    wire [63:0] dout5;
    wire [63:0] dout6;
    wire [63:0] dout7;
    wire [63:0] dout8;
    wire [63:0] dout9;
    wire [63:0] dout10;
    wire [63:0] dout11;
    wire [63:0] dout12;
    wire [63:0] dout13;
    wire [63:0] dout14;
    wire [63:0] dout15;

    reg wr_en;
    wire [15:0] full;
    wire trig_done;
    assign trig_done = | full[15:0];

    // Software Registers -> Written by Control Node, read by NetFPGA
    // | Register | 31 30 29 28 27 26 25 24 23 22 21 20 19 18 17 16 15 14 13 12 11 10  9  8  7  6  5  4  3  2  1  0 |
    // | Control  |den|rst|----------------------------------------------------------------------------|md|wr|rd|clr|
    // | Address  |   chip_sel |-----------------------|              wr_addr              |        rd_addr         |
    // |Data_in_hi|                                         dut_dout[63:32]                                         |
    // |Data_in_lo|                                         dut_dout[31:0]                                          |
    wire [31:0] control_reg;
    wire [31:0] addr_reg;
    wire [63:0] data_in_reg;

    reg clear;
    wire clear_next;
    assign clear_next = control_reg[0];

    reg rd_en;
    wire rd_en_next;
    assign rd_en_next = control_reg[1];

    reg dut_wr_en;
    reg dut_wr_en_after;
    reg dut_wr_en_after_after;
    wire dut_wr_en_next;
    assign dut_wr_en_next = control_reg[2];

    reg trig_mode;
    wire trig_mode_next;
    assign trig_mode_next = control_reg[3];

    reg den;
    assign dut_en = den;
    wire den_next;
    assign den_next = control_reg[31];

    reg drst;
    assign dut_rst = drst;
    wire drst_next;
    assign drst_next = control_reg[30];

    reg rdy;
    wire rdy_next;
    assign rdy_next = rd_en;

    reg [7:0] rd_addr;
    wire [7:0] rd_addr_next;
    assign rd_addr_next[7:0] = addr_reg[7:0];

    reg [11:0] wr_addr;
    assign dut_addr_out = wr_addr;
    wire [11:0] wr_addr_next;
    assign wr_addr_next = addr_reg[19:8];

    reg [3:0] chip_sel;
    wire [3:0] chip_sel_next;
    assign chip_sel_next[3:0] = addr_reg[31:28];

    reg [63:0] dut_dout;
    assign dut_data_out = dut_dout;
    wire [63:0] dut_dout_next;
    assign dut_dout_next = data_in_reg;


    assign dut_imem_wen = (dut_wr_en & ~dut_wr_en_after_after) & ~chip_sel[0];
    assign dut_dmem_wen = (dut_wr_en & ~dut_wr_en_after_after) & chip_sel[0];

    // Hardware Registers -> Written by NetFPGA, read by Control Node
    // | Register | 31 30 29 28 27 26 25 24 23 22 21 20 19 18 17 16 15 14 13 12 11 10  9  8  7  6  5  4  3  2  1  0 |
    // | Data_Hi  |                                         dout_reg[63:32]                                         |
    // | Data_Lo  |                                          dout_reg[31:0]                                         |
    // |  Dut_Hi  |                                          dut_reg[63:32]                                         |
    // |  Dut_Lo  |                                           dut_reg[31:0]                                         |
    // |  Status  |   chip_sel |-----------------------|                   full[15:0]                  |--------|rdy|
    reg [63:0] dout_reg;
    reg [31:0] status_reg;
    reg [63:0] dut_reg;

    always @(posedge clk)
    begin
        if (rst)
        begin
            wr_en <= 0;
            clear <= 1;
            rd_en <= 0;
            trig_mode <= 0;
            rdy <= 0;
            rd_addr <= 0;
            chip_sel <= 0;
            den <= 0;
            drst <= 1;
            wr_addr <= 0;
            dut_wr_en <= 0;
            dut_wr_en_after <= 0;
            dut_wr_en_after_after <= 0;
            dut_dout <= 0;
        end
        else
        begin
            clear <= clear_next;
            rd_en <= rd_en_next;
            trig_mode <= trig_mode_next;
            rdy <= rdy_next;
            rd_addr <= rd_addr_next;
            chip_sel <= chip_sel_next;

            den <= den_next;
            drst <= drst_next;
            wr_addr <= wr_addr_next;
            dut_wr_en <= dut_wr_en_next;
            dut_wr_en_after <= dut_wr_en;
            dut_wr_en_after_after <= dut_wr_en_after;
            dut_dout <= dut_dout_next;

            // Write logic
            if (wr_en)
            begin
                if (trig_done | (trig_mode & ~trigger))
                begin
                    wr_en <= 0;
                end
            end
            else
            begin
                if (trigger && ~trig_done)
                begin
                    wr_en <= 1;
                end
            end
        end
    end

    always @(posedge clk)
    begin
        // Assign status_reg
        status_reg[31:0] <= {chip_sel[3:0], 8'd0, full[15:0], 3'b000, rdy};
        // Assign dout_reg based on chip_sel
        case (chip_sel)
            4'd0:   dout_reg[63:0] <= dout0[63:0];
            4'd1:   dout_reg[63:0] <= dout1[63:0];
            4'd2:   dout_reg[63:0] <= dout2[63:0];
            4'd3:   dout_reg[63:0] <= dout3[63:0];
            4'd4:   dout_reg[63:0] <= dout4[63:0];
            4'd5:   dout_reg[63:0] <= dout5[63:0];
            4'd6:   dout_reg[63:0] <= dout6[63:0];
            4'd7:   dout_reg[63:0] <= dout7[63:0];
            4'd8:   dout_reg[63:0] <= dout8[63:0];
            4'd9:   dout_reg[63:0] <= dout9[63:0];
            4'd10:  dout_reg[63:0] <= dout10[63:0];
            4'd11:  dout_reg[63:0] <= dout11[63:0];
            4'd12:  dout_reg[63:0] <= dout12[63:0];
            4'd13:  dout_reg[63:0] <= dout13[63:0];
            4'd14:  dout_reg[63:0] <= dout14[63:0];
            4'd15:  dout_reg[63:0] <= dout15[63:0];
        endcase
        // Assign dut_reg based on chip_sel
        case (chip_sel[0])
            1'b0:   dut_reg[63:0] <= {32'd0, dut_imem_in[31:0]};
            1'b1:   dut_reg[63:0] <= dut_dmem_in[63:0];
        endcase
    end

    // Signal Memories
    sig_mem64x64 sig_mem0(
    .din(din0),
    .rd_addr(rd_addr),
    .rd_en(rd_en),
    .wr_en(wr_en),
    .clk(rdclk),
    .rst(clear),
    .dout(dout0),
    .full(full[0])
    );
    sig_mem64x64 sig_mem1(
    .din(din1),
    .rd_addr(rd_addr),
    .rd_en(rd_en),
    .wr_en(wr_en),
    .clk(rdclk),
    .rst(clear),
    .dout(dout1),
    .full(full[1])
    );
    sig_mem64x64 sig_mem2(
    .din(din2),
    .rd_addr(rd_addr),
    .rd_en(rd_en),
    .wr_en(wr_en),
    .clk(rdclk),
    .rst(clear),
    .dout(dout2),
    .full(full[2])
    );
    sig_mem64x64 sig_mem3(
    .din(din3),
    .rd_addr(rd_addr),
    .rd_en(rd_en),
    .wr_en(wr_en),
    .clk(rdclk),
    .rst(clear),
    .dout(dout3),
    .full(full[3])
    );
    sig_mem64x64 sig_mem4(
    .din(din4),
    .rd_addr(rd_addr),
    .rd_en(rd_en),
    .wr_en(wr_en),
    .clk(rdclk),
    .rst(clear),
    .dout(dout4),
    .full(full[4])
    );
    sig_mem64x64 sig_mem5(
    .din(din5),
    .rd_addr(rd_addr),
    .rd_en(rd_en),
    .wr_en(wr_en),
    .clk(rdclk),
    .rst(clear),
    .dout(dout5),
    .full(full[5])
    );
    sig_mem64x64 sig_mem6(
    .din(din6),
    .rd_addr(rd_addr),
    .rd_en(rd_en),
    .wr_en(wr_en),
    .clk(rdclk),
    .rst(clear),
    .dout(dout6),
    .full(full[6])
    );
    sig_mem64x64 sig_mem7(
    .din(din7),
    .rd_addr(rd_addr),
    .rd_en(rd_en),
    .wr_en(wr_en),
    .clk(rdclk),
    .rst(clear),
    .dout(dout7),
    .full(full[7])
    );
    sig_mem64x64 sig_mem8(
    .din(din8),
    .rd_addr(rd_addr),
    .rd_en(rd_en),
    .wr_en(wr_en),
    .clk(rdclk),
    .rst(clear),
    .dout(dout8),
    .full(full[8])
    );
    sig_mem64x64 sig_mem9(
    .din(din9),
    .rd_addr(rd_addr),
    .rd_en(rd_en),
    .wr_en(wr_en),
    .clk(rdclk),
    .rst(clear),
    .dout(dout9),
    .full(full[9])
    );
    sig_mem64x64 sig_mem10(
    .din(din10),
    .rd_addr(rd_addr),
    .rd_en(rd_en),
    .wr_en(wr_en),
    .clk(rdclk),
    .rst(clear),
    .dout(dout10),
    .full(full[10])
    );
    sig_mem64x64 sig_mem11(
    .din(din11),
    .rd_addr(rd_addr),
    .rd_en(rd_en),
    .wr_en(wr_en),
    .clk(rdclk),
    .rst(clear),
    .dout(dout11),
    .full(full[11])
    );
    sig_mem64x64 sig_mem12(
    .din(din12),
    .rd_addr(rd_addr),
    .rd_en(rd_en),
    .wr_en(wr_en),
    .clk(rdclk),
    .rst(clear),
    .dout(dout12),
    .full(full[12])
    );
    sig_mem64x64 sig_mem13(
    .din(din13),
    .rd_addr(rd_addr),
    .rd_en(rd_en),
    .wr_en(wr_en),
    .clk(rdclk),
    .rst(clear),
    .dout(dout13),
    .full(full[13])
    );
    sig_mem64x64 sig_mem14(
    .din(din14),
    .rd_addr(rd_addr),
    .rd_en(rd_en),
    .wr_en(wr_en),
    .clk(rdclk),
    .rst(clear),
    .dout(dout14),
    .full(full[14])
    );
    sig_mem64x64 sig_mem15(
    .din(din15),
    .rd_addr(rd_addr),
    .rd_en(rd_en),
    .wr_en(wr_en),
    .clk(rdclk),
    .rst(clear),
    .dout(dout15),
    .full(full[15])
    );
	

    // NetFPGA Register Interface
    generic_regs
   #( 
      .UDP_REG_SRC_WIDTH   (UDP_REG_SRC_WIDTH),
      .TAG                 (`ANA_BLOCK_ADDR),          // Tag -- eg. MODULE_TAG
      .REG_ADDR_WIDTH      (`ANA_REG_ADDR_WIDTH),     // Width of block addresses -- eg. MODULE_REG_ADDR_WIDTH
      .NUM_COUNTERS        (0),                 // Number of counters
      .NUM_SOFTWARE_REGS   (4),                 // Number of sw regs
      .NUM_HARDWARE_REGS   (5)                  // Number of hw regs
   ) module_regs (
      .reg_req_in       (reg_req_in),
      .reg_ack_in       (reg_ack_in),
      .reg_rd_wr_L_in   (reg_rd_wr_L_in),
      .reg_addr_in      (reg_addr_in),
      .reg_data_in      (reg_data_in),
      .reg_src_in       (reg_src_in),

      .reg_req_out      (reg_req_out),
      .reg_ack_out      (reg_ack_out),
      .reg_rd_wr_L_out  (reg_rd_wr_L_out),
      .reg_addr_out     (reg_addr_out),
      .reg_data_out     (reg_data_out),
      .reg_src_out      (reg_src_out),

      // --- counters interface
      .counter_updates  (),
      .counter_decrement(),

      // --- SW regs interface
      .software_regs    ({data_in_reg[63:32], data_in_reg[31:0], addr_reg, control_reg}),

      // --- HW regs interface
      .hardware_regs    ({dut_reg[63:32], dut_reg[31:0], dout_reg[63:32], dout_reg[31:0], status_reg}),

      .clk              (clk),
      .reset            (reset)
    );


endmodule
