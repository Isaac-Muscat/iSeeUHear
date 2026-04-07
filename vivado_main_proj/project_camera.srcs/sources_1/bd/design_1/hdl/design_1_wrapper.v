//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
//Date        : Sun Mar 29 20:58:04 2026
//Host        : Sebs_Vivobook running 64-bit major release  (build 9200)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (DDR2_0_addr,
    DDR2_0_ba,
    DDR2_0_cas_n,
    DDR2_0_ck_n,
    DDR2_0_ck_p,
    DDR2_0_cke,
    DDR2_0_cs_n,
    DDR2_0_dm,
    DDR2_0_dq,
    DDR2_0_dqs_n,
    DDR2_0_dqs_p,
    DDR2_0_odt,
    DDR2_0_ras_n,
    DDR2_0_we_n,
    OV2_D,
    OV2_HREF,
    OV2_PCLK,
    OV2_PWDN,
    OV2_RESET,
    OV2_VSYNC,
    OV2_XCLK,
    OV7670_D,
    OV7670_HREF,
    OV7670_PCLK,
    OV7670_PWDN,
    OV7670_RESET,
    OV7670_VSYNC,
    OV7670_XCLK,
    ad_lrclk,
    ad_mclk,
    ad_sclk,
    btn,
    da_lrclk,
    da_mclk,
    da_sclk,
    da_sdin,
    dual_seven_seg,
    iic_rtl2_scl_io,
    iic_rtl2_sda_io,
    iic_rtl_scl_io,
    iic_rtl_sda_io,
    led,
    reset,
    sw,
    sys_clock,
    usb_uart_rxd,
    usb_uart_txd,
    vga_b,
    vga_g,
    vga_hsync,
    vga_r,
    vga_vsync);
  output [12:0]DDR2_0_addr;
  output [2:0]DDR2_0_ba;
  output DDR2_0_cas_n;
  output [0:0]DDR2_0_ck_n;
  output [0:0]DDR2_0_ck_p;
  output [0:0]DDR2_0_cke;
  output [0:0]DDR2_0_cs_n;
  output [1:0]DDR2_0_dm;
  inout [15:0]DDR2_0_dq;
  inout [1:0]DDR2_0_dqs_n;
  inout [1:0]DDR2_0_dqs_p;
  output [0:0]DDR2_0_odt;
  output DDR2_0_ras_n;
  output DDR2_0_we_n;
  input [7:0]OV2_D;
  input OV2_HREF;
  input OV2_PCLK;
  output [0:0]OV2_PWDN;
  output [0:0]OV2_RESET;
  input OV2_VSYNC;
  output OV2_XCLK;
  input [7:0]OV7670_D;
  input OV7670_HREF;
  input OV7670_PCLK;
  output [0:0]OV7670_PWDN;
  output [0:0]OV7670_RESET;
  input OV7670_VSYNC;
  output OV7670_XCLK;
  output ad_lrclk;
  output ad_mclk;
  output ad_sclk;
  input [4:0]btn;
  output da_lrclk;
  output da_mclk;
  output da_sclk;
  output da_sdin;
  output [7:0]dual_seven_seg;
  inout iic_rtl2_scl_io;
  inout iic_rtl2_sda_io;
  inout iic_rtl_scl_io;
  inout iic_rtl_sda_io;
  output [15:0]led;
  input reset;
  input [15:0]sw;
  input sys_clock;
  input usb_uart_rxd;
  output usb_uart_txd;
  output [3:0]vga_b;
  output [3:0]vga_g;
  output vga_hsync;
  output [3:0]vga_r;
  output vga_vsync;

  wire [12:0]DDR2_0_addr;
  wire [2:0]DDR2_0_ba;
  wire DDR2_0_cas_n;
  wire [0:0]DDR2_0_ck_n;
  wire [0:0]DDR2_0_ck_p;
  wire [0:0]DDR2_0_cke;
  wire [0:0]DDR2_0_cs_n;
  wire [1:0]DDR2_0_dm;
  wire [15:0]DDR2_0_dq;
  wire [1:0]DDR2_0_dqs_n;
  wire [1:0]DDR2_0_dqs_p;
  wire [0:0]DDR2_0_odt;
  wire DDR2_0_ras_n;
  wire DDR2_0_we_n;
  wire [7:0]OV2_D;
  wire OV2_HREF;
  wire OV2_PCLK;
  wire [0:0]OV2_PWDN;
  wire [0:0]OV2_RESET;
  wire OV2_VSYNC;
  wire OV2_XCLK;
  wire [7:0]OV7670_D;
  wire OV7670_HREF;
  wire OV7670_PCLK;
  wire [0:0]OV7670_PWDN;
  wire [0:0]OV7670_RESET;
  wire OV7670_VSYNC;
  wire OV7670_XCLK;
  wire ad_lrclk;
  wire ad_mclk;
  wire ad_sclk;
  wire [4:0]btn;
  wire da_lrclk;
  wire da_mclk;
  wire da_sclk;
  wire da_sdin;
  wire [7:0]dual_seven_seg;
  wire iic_rtl2_scl_i;
  wire iic_rtl2_scl_io;
  wire iic_rtl2_scl_o;
  wire iic_rtl2_scl_t;
  wire iic_rtl2_sda_i;
  wire iic_rtl2_sda_io;
  wire iic_rtl2_sda_o;
  wire iic_rtl2_sda_t;
  wire iic_rtl_scl_i;
  wire iic_rtl_scl_io;
  wire iic_rtl_scl_o;
  wire iic_rtl_scl_t;
  wire iic_rtl_sda_i;
  wire iic_rtl_sda_io;
  wire iic_rtl_sda_o;
  wire iic_rtl_sda_t;
  wire [15:0]led;
  wire reset;
  wire [15:0]sw;
  wire sys_clock;
  wire usb_uart_rxd;
  wire usb_uart_txd;
  wire [3:0]vga_b;
  wire [3:0]vga_g;
  wire vga_hsync;
  wire [3:0]vga_r;
  wire vga_vsync;

  design_1 design_1_i
       (.DDR2_0_addr(DDR2_0_addr),
        .DDR2_0_ba(DDR2_0_ba),
        .DDR2_0_cas_n(DDR2_0_cas_n),
        .DDR2_0_ck_n(DDR2_0_ck_n),
        .DDR2_0_ck_p(DDR2_0_ck_p),
        .DDR2_0_cke(DDR2_0_cke),
        .DDR2_0_cs_n(DDR2_0_cs_n),
        .DDR2_0_dm(DDR2_0_dm),
        .DDR2_0_dq(DDR2_0_dq),
        .DDR2_0_dqs_n(DDR2_0_dqs_n),
        .DDR2_0_dqs_p(DDR2_0_dqs_p),
        .DDR2_0_odt(DDR2_0_odt),
        .DDR2_0_ras_n(DDR2_0_ras_n),
        .DDR2_0_we_n(DDR2_0_we_n),
        .OV2_D(OV2_D),
        .OV2_HREF(OV2_HREF),
        .OV2_PCLK(OV2_PCLK),
        .OV2_PWDN(OV2_PWDN),
        .OV2_RESET(OV2_RESET),
        .OV2_VSYNC(OV2_VSYNC),
        .OV2_XCLK(OV2_XCLK),
        .OV7670_D(OV7670_D),
        .OV7670_HREF(OV7670_HREF),
        .OV7670_PCLK(OV7670_PCLK),
        .OV7670_PWDN(OV7670_PWDN),
        .OV7670_RESET(OV7670_RESET),
        .OV7670_VSYNC(OV7670_VSYNC),
        .OV7670_XCLK(OV7670_XCLK),
        .ad_lrclk(ad_lrclk),
        .ad_mclk(ad_mclk),
        .ad_sclk(ad_sclk),
        .btn(btn),
        .da_lrclk(da_lrclk),
        .da_mclk(da_mclk),
        .da_sclk(da_sclk),
        .da_sdin(da_sdin),
        .dual_seven_seg(dual_seven_seg),
        .iic_rtl2_scl_i(iic_rtl2_scl_i),
        .iic_rtl2_scl_o(iic_rtl2_scl_o),
        .iic_rtl2_scl_t(iic_rtl2_scl_t),
        .iic_rtl2_sda_i(iic_rtl2_sda_i),
        .iic_rtl2_sda_o(iic_rtl2_sda_o),
        .iic_rtl2_sda_t(iic_rtl2_sda_t),
        .iic_rtl_scl_i(iic_rtl_scl_i),
        .iic_rtl_scl_o(iic_rtl_scl_o),
        .iic_rtl_scl_t(iic_rtl_scl_t),
        .iic_rtl_sda_i(iic_rtl_sda_i),
        .iic_rtl_sda_o(iic_rtl_sda_o),
        .iic_rtl_sda_t(iic_rtl_sda_t),
        .led(led),
        .reset(reset),
        .sw(sw),
        .sys_clock(sys_clock),
        .usb_uart_rxd(usb_uart_rxd),
        .usb_uart_txd(usb_uart_txd),
        .vga_b(vga_b),
        .vga_g(vga_g),
        .vga_hsync(vga_hsync),
        .vga_r(vga_r),
        .vga_vsync(vga_vsync));
  IOBUF iic_rtl2_scl_iobuf
       (.I(iic_rtl2_scl_o),
        .IO(iic_rtl2_scl_io),
        .O(iic_rtl2_scl_i),
        .T(iic_rtl2_scl_t));
  IOBUF iic_rtl2_sda_iobuf
       (.I(iic_rtl2_sda_o),
        .IO(iic_rtl2_sda_io),
        .O(iic_rtl2_sda_i),
        .T(iic_rtl2_sda_t));
  IOBUF iic_rtl_scl_iobuf
       (.I(iic_rtl_scl_o),
        .IO(iic_rtl_scl_io),
        .O(iic_rtl_scl_i),
        .T(iic_rtl_scl_t));
  IOBUF iic_rtl_sda_iobuf
       (.I(iic_rtl_sda_o),
        .IO(iic_rtl_sda_io),
        .O(iic_rtl_sda_i),
        .T(iic_rtl_sda_t));
endmodule
