
# 125 MHz fabric clock
set_property -dict { PACKAGE_PIN H16 IOSTANDARD LVCMOS33 } [get_ports { clk_i }];
create_clock -add -name sys_clk_pin -period 8.00 -waveform {0 4} [get_ports { clk_i }];

set_property -dict {PACKAGE_PIN L17 IOSTANDARD TMDS_33} [get_ports dvi_clk_n_o]
set_property -dict {PACKAGE_PIN L16 IOSTANDARD TMDS_33} [get_ports dvi_clk_p_o]
set_property -dict {PACKAGE_PIN K18 IOSTANDARD TMDS_33} [get_ports dvi_tx0_n_o]
set_property -dict {PACKAGE_PIN K17 IOSTANDARD TMDS_33} [get_ports dvi_tx0_p_o]
set_property -dict {PACKAGE_PIN J19 IOSTANDARD TMDS_33} [get_ports dvi_tx1_n_o]
set_property -dict {PACKAGE_PIN K19 IOSTANDARD TMDS_33} [get_ports dvi_tx1_p_o]
set_property -dict {PACKAGE_PIN H18 IOSTANDARD TMDS_33} [get_ports dvi_tx2_n_o]
set_property -dict {PACKAGE_PIN J18 IOSTANDARD TMDS_33} [get_ports dvi_tx2_p_o]

set_property -dict { PACKAGE_PIN D19    IOSTANDARD LVCMOS33 } [get_ports { rst_i }]; #IO_L4P_T0_35 Sch=BTN0