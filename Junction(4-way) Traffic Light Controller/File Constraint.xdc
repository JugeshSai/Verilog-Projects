set_property -dict { PACKAGE_PIN N11    IOSTANDARD LVCMOS33 } [get_ports { clk1 }];

set_property -dict { PACKAGE_PIN L5    IOSTANDARD LVCMOS33 } [get_ports { reset }];

set_property -dict { PACKAGE_PIN J3    IOSTANDARD LVCMOS33 } [get_ports { Red_S }]; 
set_property -dict { PACKAGE_PIN H3    IOSTANDARD LVCMOS33 } [get_ports { Yellow_S }];
set_property -dict { PACKAGE_PIN J1    IOSTANDARD LVCMOS33 } [get_ports { Green_S }];

set_property -dict { PACKAGE_PIN L3    IOSTANDARD LVCMOS33 } [get_ports { Red_W }]; 
set_property -dict { PACKAGE_PIN L2    IOSTANDARD LVCMOS33 } [get_ports { Yellow_W }];
set_property -dict { PACKAGE_PIN K3    IOSTANDARD LVCMOS33 } [get_ports { Green_W }];

set_property -dict { PACKAGE_PIN K5    IOSTANDARD LVCMOS33 } [get_ports { Red_N }]; 
set_property -dict { PACKAGE_PIN P6    IOSTANDARD LVCMOS33 } [get_ports { Yellow_N }];
set_property -dict { PACKAGE_PIN R7    IOSTANDARD LVCMOS33 } [get_ports { Green_N }];

set_property -dict { PACKAGE_PIN T5    IOSTANDARD LVCMOS33 } [get_ports { Red_E }]; 
set_property -dict { PACKAGE_PIN R5    IOSTANDARD LVCMOS33 } [get_ports { Yellow_E }];
set_property -dict { PACKAGE_PIN T10   IOSTANDARD LVCMOS33 } [get_ports { Green_E }];

set_property -dict { PACKAGE_PIN F2    IOSTANDARD LVCMOS33 } [get_ports { an[0] }]; 
set_property -dict { PACKAGE_PIN E1    IOSTANDARD LVCMOS33 } [get_ports { an[1] }];
set_property -dict { PACKAGE_PIN G5    IOSTANDARD LVCMOS33 } [get_ports { an[2] }];
set_property -dict { PACKAGE_PIN G4    IOSTANDARD LVCMOS33 } [get_ports { an[3] }];
 
set_property -dict { PACKAGE_PIN G2    IOSTANDARD LVCMOS33 } [get_ports { seg[7] }]; # a
set_property -dict { PACKAGE_PIN G1    IOSTANDARD LVCMOS33 } [get_ports { seg[6] }]; # b
set_property -dict { PACKAGE_PIN H5    IOSTANDARD LVCMOS33 } [get_ports { seg[5] }]; # c
set_property -dict { PACKAGE_PIN H4    IOSTANDARD LVCMOS33 } [get_ports { seg[4] }]; # d
set_property -dict { PACKAGE_PIN J5    IOSTANDARD LVCMOS33 } [get_ports { seg[3] }]; # e
set_property -dict { PACKAGE_PIN J4    IOSTANDARD LVCMOS33 } [get_ports { seg[2] }]; # f
set_property -dict { PACKAGE_PIN H2    IOSTANDARD LVCMOS33 } [get_ports { seg[1] }]; # g
set_property -dict { PACKAGE_PIN H1    IOSTANDARD LVCMOS33 } [get_ports { seg[0] }]; # dp
