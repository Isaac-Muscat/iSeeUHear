#Nexys 4 ddr board
## Clock
set_property -dict {PACKAGE_PIN E3 IOSTANDARD LVCMOS33} [get_ports clk]
create_clock -name clk -period 10.000 -waveform {0 5} [get_ports clk]

## Reset
set_property -dict {PACKAGE_PIN C12 IOSTANDARD LVCMOS33} [get_ports resetn]

################################ Camera Constraints Begin ########################################
# OV7670 mapped to Pmod JA
set_property -dict {PACKAGE_PIN C17 IOSTANDARD LVCMOS33} [get_ports {iic_rtl_scl_io}];# JA1
set_property -dict {PACKAGE_PIN D18 IOSTANDARD LVCMOS33} [get_ports {iic_rtl_sda_io}];# JA2
set_property -dict {PACKAGE_PIN E18 IOSTANDARD LVCMOS33} [get_ports OV7670_XCLK]   ;# JA3
set_property -dict {PACKAGE_PIN G17 IOSTANDARD LVCMOS33} [get_ports OV7670_RESET]  ;# JA4
set_property -dict {PACKAGE_PIN D17 IOSTANDARD LVCMOS33} [get_ports OV7670_PWDN]   ;# JA5
set_property -dict {PACKAGE_PIN H16 IOSTANDARD LVCMOS33} [get_ports OV7670_PCLK]   ;# JA6 # JB8
set_property -dict {PACKAGE_PIN F18 IOSTANDARD LVCMOS33} [get_ports OV7670_VSYNC]  ;# JA7
set_property -dict {PACKAGE_PIN G18 IOSTANDARD LVCMOS33} [get_ports OV7670_HREF]   ;# JA8
 set_property PULLUP true [get_ports {iic_rtl_scl_io}]
 set_property PULLUP true [get_ports {iic_rtl_sda_io}]

# OV7670 8 bit data mapping to JB
set_property -dict {PACKAGE_PIN D14 IOSTANDARD LVCMOS33} [get_ports {OV7670_D[0]}]   ;# JB1
set_property -dict {PACKAGE_PIN F16 IOSTANDARD LVCMOS33} [get_ports {OV7670_D[1]}]   ;# JB2
set_property -dict {PACKAGE_PIN G16 IOSTANDARD LVCMOS33} [get_ports {OV7670_D[2]}]   ;# JB3
set_property -dict {PACKAGE_PIN H14 IOSTANDARD LVCMOS33} [get_ports {OV7670_D[3]}]   ;# JB4
set_property -dict {PACKAGE_PIN E16 IOSTANDARD LVCMOS33} [get_ports {OV7670_D[4]}]   ;# JB5
set_property -dict {PACKAGE_PIN F13 IOSTANDARD LVCMOS33} [get_ports {OV7670_D[5]}]   ;# JB6
set_property -dict {PACKAGE_PIN G13 IOSTANDARD LVCMOS33} [get_ports {OV7670_D[6]}]   ;# JB7
set_property -dict {PACKAGE_PIN E17 IOSTANDARD LVCMOS33} [get_ports {OV7670_D[7]}]   ;# JB8 # JA6

#OV2 config pins
set_property -dict {PACKAGE_PIN K1 IOSTANDARD LVCMOS33} [get_ports {iic_rtl2_scl_io}];# JC1
set_property -dict {PACKAGE_PIN F6 IOSTANDARD LVCMOS33} [get_ports {iic_rtl2_sda_io}];# JC2
set_property -dict {PACKAGE_PIN J4 IOSTANDARD LVCMOS33} [get_ports OV2_XCLK]   ;# JC9
set_property -dict {PACKAGE_PIN J2 IOSTANDARD LVCMOS33} [get_ports OV2_RESET]  ;# JC3
set_property -dict {PACKAGE_PIN E6 IOSTANDARD LVCMOS33} [get_ports OV2_PWDN]   ;# JC10
set_property -dict {PACKAGE_PIN F3 IOSTANDARD LVCMOS33} [get_ports OV2_PCLK]   ;# JC4   # JD10
set_property -dict {PACKAGE_PIN E7 IOSTANDARD LVCMOS33} [get_ports OV2_VSYNC]  ;# JC7
set_property -dict {PACKAGE_PIN J3 IOSTANDARD LVCMOS33} [get_ports OV2_HREF]   ;# JC8
 set_property PULLUP true [get_ports {iic_rtl2_scl_io}]
 set_property PULLUP true [get_ports {iic_rtl2_sda_io}]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets {OV2_PCLK_IBUF}]


#OV2 data pins
set_property -dict {PACKAGE_PIN H4 IOSTANDARD LVCMOS33} [get_ports {OV2_D[0]}]   ;# JD1
set_property -dict {PACKAGE_PIN H1 IOSTANDARD LVCMOS33} [get_ports {OV2_D[1]}]   ;# JD2
set_property -dict {PACKAGE_PIN G1 IOSTANDARD LVCMOS33} [get_ports {OV2_D[2]}]   ;# JD3
set_property -dict {PACKAGE_PIN G3 IOSTANDARD LVCMOS33} [get_ports {OV2_D[3]}]   ;# JD4
set_property -dict {PACKAGE_PIN H2 IOSTANDARD LVCMOS33} [get_ports {OV2_D[4]}]   ;# JD7
set_property -dict {PACKAGE_PIN G4 IOSTANDARD LVCMOS33} [get_ports {OV2_D[5]}]   ;# JD8
set_property -dict {PACKAGE_PIN G2 IOSTANDARD LVCMOS33} [get_ports {OV2_D[6]}]   ;# JD9
set_property -dict {PACKAGE_PIN G6 IOSTANDARD LVCMOS33} [get_ports {OV2_D[7]}]   ;# JD10    # JC4



##OV7670 mapped to Pmod JA
#set_property -dict {PACKAGE_PIN C17 IOSTANDARD LVCMOS33} [get_ports {iic_rtl_scl_io}];# JA1
#set_property -dict {PACKAGE_PIN D18 IOSTANDARD LVCMOS33} [get_ports {iic_rtl_sda_io}];# JA2
#set_property -dict {PACKAGE_PIN E18 IOSTANDARD LVCMOS33} [get_ports OV7670_XCLK]   ;# JA3
#set_property -dict {PACKAGE_PIN G17 IOSTANDARD LVCMOS33} [get_ports OV7670_RESET]  ;# JA4
#set_property -dict {PACKAGE_PIN D17 IOSTANDARD LVCMOS33} [get_ports OV7670_PWDN]   ;# JA7
#set_property -dict {PACKAGE_PIN G16 IOSTANDARD LVCMOS33} [get_ports OV7670_PCLK]   ;        # JB3
#set_property -dict {PACKAGE_PIN F18 IOSTANDARD LVCMOS33} [get_ports OV7670_VSYNC]  ;# JA9
#set_property -dict {PACKAGE_PIN G18 IOSTANDARD LVCMOS33} [get_ports OV7670_HREF]   ;# JA10
# set_property PULLUP true [get_ports {iic_rtl_scl_io}]
# set_property PULLUP true [get_ports {iic_rtl_sda_io}]

##OV7670 8 bit data mapping to JC
#set_property -dict {PACKAGE_PIN K1 IOSTANDARD LVCMOS33} [get_ports {OV7670_D[0]}]   ;# JC1
#set_property -dict {PACKAGE_PIN F6 IOSTANDARD LVCMOS33} [get_ports {OV7670_D[1]}]   ;# JC2
#set_property -dict {PACKAGE_PIN J2 IOSTANDARD LVCMOS33} [get_ports {OV7670_D[2]}]   ;# JC3
#set_property -dict {PACKAGE_PIN G6 IOSTANDARD LVCMOS33} [get_ports {OV7670_D[3]}]   ;# JC4
#set_property -dict {PACKAGE_PIN E7 IOSTANDARD LVCMOS33} [get_ports {OV7670_D[4]}]   ;# JC7
#set_property -dict {PACKAGE_PIN J3 IOSTANDARD LVCMOS33} [get_ports {OV7670_D[5]}]   ;# JC8
#set_property -dict {PACKAGE_PIN J4 IOSTANDARD LVCMOS33} [get_ports {OV7670_D[6]}]   ;# JC9
#set_property -dict {PACKAGE_PIN E6 IOSTANDARD LVCMOS33} [get_ports {OV7670_D[7]}]   ;# JC10

##OV2 config pins
#set_property -dict {PACKAGE_PIN D14 IOSTANDARD LVCMOS33} [get_ports {iic_rtl2_scl_io}];# JB1
#set_property -dict {PACKAGE_PIN H14 IOSTANDARD LVCMOS33} [get_ports {iic_rtl2_sda_io}];# JB4
#set_property -dict {PACKAGE_PIN E17 IOSTANDARD LVCMOS33} [get_ports OV2_RESET]  ;           # JA8
#set_property -dict {PACKAGE_PIN F16 IOSTANDARD LVCMOS33} [get_ports OV2_PCLK]   ;# JB2
#set_property -dict {PACKAGE_PIN E16 IOSTANDARD LVCMOS33} [get_ports OV2_VSYNC]  ;# JB7
#set_property -dict {PACKAGE_PIN F13 IOSTANDARD LVCMOS33} [get_ports OV2_HREF]   ;# JB8
# set_property PULLUP true [get_ports {iic_rtl2_scl_io}]
# set_property PULLUP true [get_ports {iic_rtl2_sda_io}]
##set_property -dict {PACKAGE_PIN E7 IOSTANDARD LVCMOS33} [get_ports OV2_PWDN]   ;# JC7 #can share
##set_property -dict {PACKAGE_PIN J2 IOSTANDARD LVCMOS33} [get_ports OV2_XCLK]   ;# JC3 #can share


##OV2 data pins
#set_property -dict {PACKAGE_PIN H4 IOSTANDARD LVCMOS33} [get_ports {OV2_D[0]}]   ;# JD1
#set_property -dict {PACKAGE_PIN H1 IOSTANDARD LVCMOS33} [get_ports {OV2_D[1]}]   ;# JD2
#set_property -dict {PACKAGE_PIN G1 IOSTANDARD LVCMOS33} [get_ports {OV2_D[2]}]   ;# JD3
#set_property -dict {PACKAGE_PIN G3 IOSTANDARD LVCMOS33} [get_ports {OV2_D[3]}]   ;# JD4
#set_property -dict {PACKAGE_PIN H2 IOSTANDARD LVCMOS33} [get_ports {OV2_D[4]}]   ;# JD7
#set_property -dict {PACKAGE_PIN G4 IOSTANDARD LVCMOS33} [get_ports {OV2_D[5]}]   ;# JD8
#set_property -dict {PACKAGE_PIN G2 IOSTANDARD LVCMOS33} [get_ports {OV2_D[6]}]   ;# JD9
#set_property -dict {PACKAGE_PIN F3 IOSTANDARD LVCMOS33} [get_ports {OV2_D[7]}]   ;# JD10

################################ Camera Constraints End ########################################


################################ VGA Constraints Begin ########################################
# Switches
#set_property -dict { PACKAGE_PIN J15   IOSTANDARD LVCMOS33 } [get_ports { vga_polarity }]; #IO_L24N_T3_RS0_15 Sch=sw[0]
#set_property -dict { PACKAGE_PIN L16   IOSTANDARD LVCMOS33 } [get_ports { vga_dbg }]; #IO_L3N_T0_DQS_EMCCLK_14 Sch=sw[1]

#VGA Connector
set_property -dict { PACKAGE_PIN A3    IOSTANDARD LVCMOS33 } [get_ports { vga_r[0] }]; #IO_L8N_T1_AD14N_35 Sch=vga_r[0]
set_property -dict { PACKAGE_PIN B4    IOSTANDARD LVCMOS33 } [get_ports { vga_r[1] }]; #IO_L7N_T1_AD6N_35 Sch=vga_r[1]
set_property -dict { PACKAGE_PIN C5    IOSTANDARD LVCMOS33 } [get_ports { vga_r[2] }]; #IO_L1N_T0_AD4N_35 Sch=vga_r[2]
set_property -dict { PACKAGE_PIN A4    IOSTANDARD LVCMOS33 } [get_ports { vga_r[3] }]; #IO_L8P_T1_AD14P_35 Sch=vga_r[3]

set_property -dict { PACKAGE_PIN C6    IOSTANDARD LVCMOS33 } [get_ports { vga_g[0] }]; #IO_L1P_T0_AD4P_35 Sch=vga_g[0]
set_property -dict { PACKAGE_PIN A5    IOSTANDARD LVCMOS33 } [get_ports { vga_g[1] }]; #IO_L3N_T0_DQS_AD5N_35 Sch=vga_g[1]
set_property -dict { PACKAGE_PIN B6    IOSTANDARD LVCMOS33 } [get_ports { vga_g[2] }]; #IO_L2N_T0_AD12N_35 Sch=vga_g[2]
set_property -dict { PACKAGE_PIN A6    IOSTANDARD LVCMOS33 } [get_ports { vga_g[3] }]; #IO_L3P_T0_DQS_AD5P_35 Sch=vga_g[3]

set_property -dict { PACKAGE_PIN B7    IOSTANDARD LVCMOS33 } [get_ports { vga_b[0] }]; #IO_L2P_T0_AD12P_35 Sch=vga_b[0]
set_property -dict { PACKAGE_PIN C7    IOSTANDARD LVCMOS33 } [get_ports { vga_b[1] }]; #IO_L4N_T0_35 Sch=vga_b[1]
set_property -dict { PACKAGE_PIN D7    IOSTANDARD LVCMOS33 } [get_ports { vga_b[2] }]; #IO_L6N_T0_VREF_35 Sch=vga_b[2]
set_property -dict { PACKAGE_PIN D8    IOSTANDARD LVCMOS33 } [get_ports { vga_b[3] }]; #IO_L4P_T0_35 Sch=vga_b[3]

set_property -dict { PACKAGE_PIN B11   IOSTANDARD LVCMOS33 } [get_ports { vga_hsync }]; #IO_L4P_T0_15 Sch=vga_hs
set_property -dict { PACKAGE_PIN B12   IOSTANDARD LVCMOS33 } [get_ports { vga_vsync }]; #IO_L3N_T0_DQS_AD1N_15 Sch=vga_vs



################################ VGA Constraints End ########################################

# Seb Stuff
# 16 switches
#set_property IOSTANDARD LVCMOS33 [get_ports {sw[0]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {sw[1]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {sw[2]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {sw[3]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {sw[4]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {sw[5]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {sw[6]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {sw[7]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {sw[8]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {sw[9]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {sw[10]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {sw[11]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {sw[12]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {sw[13]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {sw[14]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {sw[15]}]
set_property PACKAGE_PIN J15 [get_ports {sw[0]}]
set_property PACKAGE_PIN L16 [get_ports {sw[1]}]
set_property PACKAGE_PIN M13 [get_ports {sw[2]}]
set_property PACKAGE_PIN R15 [get_ports {sw[3]}]
set_property PACKAGE_PIN R17 [get_ports {sw[4]}]
set_property PACKAGE_PIN T18 [get_ports {sw[5]}]
set_property PACKAGE_PIN U18 [get_ports {sw[6]}]
set_property PACKAGE_PIN R13 [get_ports {sw[7]}]
set_property PACKAGE_PIN T8 [get_ports {sw[8]}]
set_property PACKAGE_PIN U8 [get_ports {sw[9]}]
set_property PACKAGE_PIN R16 [get_ports {sw[10]}]
set_property PACKAGE_PIN T13 [get_ports {sw[11]}]
set_property PACKAGE_PIN H6 [get_ports {sw[12]}]
set_property PACKAGE_PIN U12 [get_ports {sw[13]}]
set_property PACKAGE_PIN U11 [get_ports {sw[14]}]
set_property PACKAGE_PIN V10 [get_ports {sw[15]}]
# 5 buttons
set_property IOSTANDARD LVCMOS33 [get_ports {btn[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {btn[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {btn[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {btn[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {btn[4]}]
set_property PACKAGE_PIN M18 [get_ports {btn[0]}]
set_property PACKAGE_PIN P17 [get_ports {btn[1]}]
set_property PACKAGE_PIN N17 [get_ports {btn[2]}]
set_property PACKAGE_PIN M17 [get_ports {btn[3]}]
set_property PACKAGE_PIN P18 [get_ports {btn[4]}]
#16 leds
set_property IOSTANDARD LVCMOS33 [get_ports {led[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[9]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[10]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[11]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[12]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[13]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[14]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[15]}]
set_property PACKAGE_PIN H17 [get_ports {led[0]}]
set_property PACKAGE_PIN K15 [get_ports {led[1]}]
set_property PACKAGE_PIN J13 [get_ports {led[2]}]
set_property PACKAGE_PIN N14 [get_ports {led[3]}]
set_property PACKAGE_PIN R18 [get_ports {led[4]}]
set_property PACKAGE_PIN V17 [get_ports {led[5]}]
set_property PACKAGE_PIN U17 [get_ports {led[6]}]
set_property PACKAGE_PIN U16 [get_ports {led[7]}]
set_property PACKAGE_PIN V16 [get_ports {led[8]}]
set_property PACKAGE_PIN T15 [get_ports {led[9]}]
set_property PACKAGE_PIN U14 [get_ports {led[10]}]
set_property PACKAGE_PIN T16 [get_ports {led[11]}]
set_property PACKAGE_PIN V15 [get_ports {led[12]}]
set_property PACKAGE_PIN V14 [get_ports {led[13]}]
set_property PACKAGE_PIN V12 [get_ports {led[14]}]
set_property PACKAGE_PIN V11 [get_ports {led[15]}]
# dual seven seg display
set_property IOSTANDARD LVCMOS33 [get_ports {dual_seven_seg[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {dual_seven_seg[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {dual_seven_seg[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {dual_seven_seg[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {dual_seven_seg[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {dual_seven_seg[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {dual_seven_seg[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {dual_seven_seg[7]}]
set_property PACKAGE_PIN U13 [get_ports {dual_seven_seg[0]}]
set_property PACKAGE_PIN K2 [get_ports {dual_seven_seg[1]}]
set_property PACKAGE_PIN T14 [get_ports {dual_seven_seg[2]}]
set_property PACKAGE_PIN P14 [get_ports {dual_seven_seg[3]}]
set_property PACKAGE_PIN J14 [get_ports {dual_seven_seg[4]}]
set_property PACKAGE_PIN T9 [get_ports {dual_seven_seg[5]}]
set_property PACKAGE_PIN J18 [get_ports {dual_seven_seg[6]}]
set_property PACKAGE_PIN J17 [get_ports {dual_seven_seg[7]}]

# XADC CONFIG FOR I2S2
set_property IOSTANDARD LVCMOS33 [get_ports ad_lrclk]
set_property IOSTANDARD LVCMOS33 [get_ports da_lrclk]
set_property IOSTANDARD LVCMOS33 [get_ports ad_mclk]
set_property IOSTANDARD LVCMOS33 [get_ports da_mclk]
set_property IOSTANDARD LVCMOS33 [get_ports ad_sclk]
set_property IOSTANDARD LVCMOS33 [get_ports da_sclk]
set_property PACKAGE_PIN A13 [get_ports da_mclk]
set_property PACKAGE_PIN A14 [get_ports ad_mclk]
set_property PACKAGE_PIN A16 [get_ports ad_lrclk]
set_property PACKAGE_PIN A15 [get_ports da_lrclk]
set_property PACKAGE_PIN B17 [get_ports ad_sclk]
set_property PACKAGE_PIN B16 [get_ports da_sclk]
set_property IOSTANDARD LVCMOS33 [get_ports ad_sdout]
set_property IOSTANDARD LVCMOS33 [get_ports da_sdin]
set_property PACKAGE_PIN A18 [get_ports ad_sdout]
set_property PACKAGE_PIN B18 [get_ports da_sdin]