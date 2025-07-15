set_property -dict { PACKAGE_PIN N11    IOSTANDARD LVCMOS33 } [get_ports { clk1 }];

set_property -dict {PACKAGE_PIN K13 IOSTANDARD LVCMOS33 PULLDOWN true} [get_ports { rst }];

set_property -dict { PACKAGE_PIN L5    IOSTANDARD LVCMOS33 } [get_ports { a_in[0] }]; #a_in 
set_property -dict { PACKAGE_PIN L4    IOSTANDARD LVCMOS33 } [get_ports { a_in[1] }];
set_property -dict { PACKAGE_PIN M4    IOSTANDARD LVCMOS33 } [get_ports { a_in[2] }];
set_property -dict { PACKAGE_PIN M2    IOSTANDARD LVCMOS33 } [get_ports { a_in[3] }];

set_property -dict { PACKAGE_PIN N3    IOSTANDARD LVCMOS33 } [get_ports { b_in[0] }]; #b_in
set_property -dict { PACKAGE_PIN N2    IOSTANDARD LVCMOS33 } [get_ports { b_in[1] }];
set_property -dict { PACKAGE_PIN N1    IOSTANDARD LVCMOS33 } [get_ports { b_in[2] }];
set_property -dict { PACKAGE_PIN P1    IOSTANDARD LVCMOS33 } [get_ports { b_in[3] }];

set_property -dict { PACKAGE_PIN T8    IOSTANDARD LVCMOS33 } [get_ports { c_in }]; #c_in

set_property -dict { PACKAGE_PIN N6    IOSTANDARD LVCMOS33 } [get_ports { op_code[0] }]; #Assigning Operational Code
set_property -dict { PACKAGE_PIN T7    IOSTANDARD LVCMOS33 } [get_ports { op_code[1] }];
set_property -dict { PACKAGE_PIN P8    IOSTANDARD LVCMOS33 } [get_ports { op_code[2] }];
set_property -dict { PACKAGE_PIN M6    IOSTANDARD LVCMOS33 } [get_ports { op_code[3] }];

set_property -dict { PACKAGE_PIN H3    IOSTANDARD LVCMOS33 } [get_ports { zero }]; #Blink if result is zero
set_property -dict { PACKAGE_PIN J1    IOSTANDARD LVCMOS33 } [get_ports { carry }]; #Blink if carry operation is executed

set_property -dict { PACKAGE_PIN F2    IOSTANDARD LVCMOS33 } [get_ports { an[0] }]; #LSB
set_property -dict { PACKAGE_PIN E1    IOSTANDARD LVCMOS33 } [get_ports { an[1] }];
set_property -dict { PACKAGE_PIN G5    IOSTANDARD LVCMOS33 } [get_ports { an[2] }];
set_property -dict { PACKAGE_PIN G4    IOSTANDARD LVCMOS33 } [get_ports { an[3] }]; #MSB

set_property -dict { PACKAGE_PIN G2    IOSTANDARD LVCMOS33 } [get_ports { seg[7] }]; # a
set_property -dict { PACKAGE_PIN G1    IOSTANDARD LVCMOS33 } [get_ports { seg[6] }]; # b
set_property -dict { PACKAGE_PIN H5    IOSTANDARD LVCMOS33 } [get_ports { seg[5] }]; # c
set_property -dict { PACKAGE_PIN H4    IOSTANDARD LVCMOS33 } [get_ports { seg[4] }]; # d
set_property -dict { PACKAGE_PIN J5    IOSTANDARD LVCMOS33 } [get_ports { seg[3] }]; # e
set_property -dict { PACKAGE_PIN J4    IOSTANDARD LVCMOS33 } [get_ports { seg[2] }]; # f
set_property -dict { PACKAGE_PIN H2    IOSTANDARD LVCMOS33 } [get_ports { seg[1] }]; # g
set_property -dict { PACKAGE_PIN H1    IOSTANDARD LVCMOS33 } [get_ports { seg[0] }]; # dp
