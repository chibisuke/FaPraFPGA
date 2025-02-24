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


# Automatically constrain PLL and other generated clocks
derive_pll_clocks -create_base_clocks

# Automatically calculate clock uncertainty to jitter and other effects.
#derive_clock_uncertainty
# Not supported for family Cyclone II

# tsu/th constraints

# tco constraints

# tpd constraints

# 
# since the clock of mem_test is running at twice the speed of the lcd entities, Quartus thinks we're violating the hold time. 
# but the values of "display_data" is only read after a few tens of clock cycles and is the hold stable for at least a few seconds
# (until the user restarts the test). Since we're allowed to use set_false_path for this according to the assignment, we do so. 
# 
set_false_path -from [get_keepers {mem_test:ram|mem_test_logic:logic|*}] -to [get_keepers {lcd:lcd|lcd_i2c_writer:wr_logic|*}]

# 
# the update_lcd signal is crossing clock domain boundaries beween the mem_test_logic and the lcd_logic and therefor needs to be 
# active an additional clock cycle, so we definitly hit the rising_edge(clk). The logic of mem_test_logic takes care of this, but 
# quartus doesn't seem to notice. We explicitly tell quartus, that its ok to miss one cycle here. 
# 
set_multicycle_path -hold -end -from [get_keepers {mem_test:ram|mem_test_logic:logic|update_lcd}] -to [get_keepers {lcd:lcd|lcd_logic:logic|update_lcd_sync1}] 2

