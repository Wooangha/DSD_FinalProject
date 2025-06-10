
set_property PACKAGE_PIN JC1 [get_ports {led_select[0]}]
set_property PACKAGE_PIN JC2 [get_ports {led_select[1]}]
set_property PACKAGE_PIN JC3 [get_ports {led_select[2]}]

set_property PACKAGE_PIN JC4 [get_ports {led_out[16]}]
set_property PACKAGE_PIN JC7 [get_ports {led_out[15]}]
set_property PACKAGE_PIN JC8 [get_ports {led_out[14]}]
set_property PACKAGE_PIN JC9 [get_ports {led_out[13]}]
set_property PACKAGE_PIN JC10 [get_ports {led_out[12]}]

set_property PACKAGE_PIN JB1 [get_ports {led_out[11]}]
set_property PACKAGE_PIN JB2 [get_ports {led_out[10]}]
set_property PACKAGE_PIN JB3 [get_ports {led_out[9]}]
set_property PACKAGE_PIN JB4 [get_ports {led_out[8]}]
set_property PACKAGE_PIN JB7 [get_ports {led_out[7]}]
set_property PACKAGE_PIN JB8 [get_ports {led_out[6]}]
set_property PACKAGE_PIN JB9 [get_ports {led_out[5]}]
set_property PACKAGE_PIN JB10 [get_ports {led_out[4]}]

set_property PACKAGE_PIN JA7 [get_ports {led_out[3]}]
set_property PACKAGE_PIN JA8 [get_ports {led_out[2]}]
set_property PACKAGE_PIN JA9 [get_ports {led_out[1]}]
set_property PACKAGE_PIN JA10 [get_ports {led_out[0]}]

set_property PACKAGE_PIN XADC1_P [get_ports up]
set_property PACKAGE_PIN XADC2_P [get_ports down]
set_property PACKAGE_PIN XADC3_P [get_ports left]
set_property PACKAGE_PIN XADC4_P [get_ports right]
set_property PACKAGE_PIN XADC7_P [get_ports decision]
set_property PACKAGE_PIN XADC8_P [get_ports output_turn]

set_property PACKAGE_PIN U18 [get_ports reset_button]
set_property PACKAGE_PIN W19 [get_ports blue_reset_button]
set_property PACKAGE_PIN T17 [get_ports red_reset_button]

set_property PACKAGE_PIN W7 [get_ports {ssDisp[0]}]
set_property PACKAGE_PIN W6 [get_ports {ssDisp[1]}]
set_property PACKAGE_PIN U8 [get_ports {ssDisp[2]}]
set_property PACKAGE_PIN V8 [get_ports {ssDisp[3]}]
set_property PACKAGE_PIN U5 [get_ports {ssDisp[4]}]
set_property PACKAGE_PIN V5 [get_ports {ssDisp[5]}]
set_property PACKAGE_PIN U7 [get_ports {ssDisp[6]}]
set_property PACKAGE_PIN V7 [get_ports {ssDisp[7]}]

set_property PACKAGE_PIN W4 [get_ports {ssSel[0]}]
set_property PACKAGE_PIN V4 [get_ports {ssSel[1]}]
set_property PACKAGE_PIN U4 [get_ports {ssSel[2]}]
set_property PACKAGE_PIN U2 [get_ports {ssSel[3]}]

set_property PACKAGE_PIN W5 [get_ports clk]





set_property IOSTANDARD LVCMOS33 [get_ports {led_select[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_select[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_select[2]}]

set_property IOSTANDARD LVCMOS33 [get_ports {led_out[16]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_out[15]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_out[14]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_out[13]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_out[12]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_out[11]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_out[10]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_out[9]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_out[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_out[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_out[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_out[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_out[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_out[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_out[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_out[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_out[0]}]

set_property IOSTANDARD LVCMOS33 [get_ports up]
set_property IOSTANDARD LVCMOS33 [get_ports down]
set_property IOSTANDARD LVCMOS33 [get_ports left]
set_property IOSTANDARD LVCMOS33 [get_ports right]
set_property IOSTANDARD LVCMOS33 [get_ports decision]
set_property IOSTANDARD LVCMOS33 [get_ports output_turn]

set_property IOSTANDARD LVCMOS18 [get_ports reset_button]
set_property IOSTANDARD LVCMOS18 [get_ports blue_reset_button]
set_property IOSTANDARD LVCMOS18 [get_ports red_reset_button]

set_property IOSTANDARD LVCMOS18 [get_ports {ssDisp[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ssDisp[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ssDisp[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ssDisp[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ssDisp[4]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ssDisp[5]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ssDisp[6]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ssDisp[7]}]

set_property IOSTANDARD LVCMOS18 [get_ports {ssSel[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ssSel[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ssSel[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ssSel[3]}]

set_property IOSTANDARD LVCMOS18 [get_ports clk]

create_clock -period 10.000 -name clk0 -waveform {0.000 5.000} [get_ports clk]
