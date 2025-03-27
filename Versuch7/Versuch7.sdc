#************************************************************
# THIS IS A WIZARD-GENERATED FILE.                           
#
# Version 10.1 Build 197 01/19/2011 Service Pack 1 SJ Web Edition
#
#************************************************************

# Copyright (C) 1991-2011 Altera Corporation
# Your use of Altera Corporation's design tools, logic functions 
# and other software and tools, and its AMPP partner logic 
# functions, and any output files from any of the foregoing 
# (including device programming or simulation files), and any 
# associated documentation or information are expressly subject 
# to the terms and conditions of the Altera Program License 
# Subscription Agreement, Altera MegaCore Function License 
# Agreement, or other applicable license agreement, including, 
# without limitation, that your use is for the sole purpose of 
# programming logic devices manufactured by Altera and sold by 
# Altera or its authorized distributors.  Please refer to the 
# applicable agreement for further details.



# Clock constraints

create_clock -name "clk" -period 20.000ns [get_ports {clk}]
create_clock -name "b_clk" -period 80.000ns [get_ports {b_clk}]


# Automatically constrain PLL and other generated clocks
derive_pll_clocks -create_base_clocks

# Automatically calculate clock uncertainty to jitter and other effects.
#derive_clock_uncertainty
# Not supported for family Cyclone II

# tsu/th constraints

# tco constraints

# tpd constraints
set_multicycle_path -to [get_pins -compatibility_mode adcdac|dac_out_buffer*] -hold -end 2
set_multicycle_path -from [get_pins -compatibility_mode adcdac|adc_in_counter*] -hold -end 2

