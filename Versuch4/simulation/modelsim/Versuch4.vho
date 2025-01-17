-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Web Edition"

-- DATE "01/14/2025 19:00:07"

-- 
-- Device: Altera EP2C20F484C7 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEII;
LIBRARY IEEE;
USE CYCLONEII.CYCLONEII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	Versuch4 IS
    PORT (
	clk : IN std_logic;
	sw : IN std_logic_vector(7 DOWNTO 0);
	key : IN std_logic_vector(1 DOWNTO 0);
	temp_scl : INOUT std_logic;
	temp_sda : INOUT std_logic;
	lcd_scl : INOUT std_logic;
	lcd_sda : INOUT std_logic;
	lcd_reset : OUT std_logic
	);
END Versuch4;

-- Design Ports Information
-- temp_scl	=>  Location: PIN_A20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- temp_sda	=>  Location: PIN_B20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- lcd_scl	=>  Location: PIN_A13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- lcd_sda	=>  Location: PIN_B13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- lcd_reset	=>  Location: PIN_B18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- clk	=>  Location: PIN_L1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- key[1]	=>  Location: PIN_R21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- key[0]	=>  Location: PIN_R22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- sw[3]	=>  Location: PIN_V12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- sw[1]	=>  Location: PIN_L21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- sw[2]	=>  Location: PIN_M22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- sw[7]	=>  Location: PIN_M2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- sw[6]	=>  Location: PIN_U11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- sw[5]	=>  Location: PIN_U12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- sw[4]	=>  Location: PIN_W12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- sw[0]	=>  Location: PIN_L22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF Versuch4 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_sw : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_key : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_lcd_reset : std_logic;
SIGNAL \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\ : std_logic_vector(6 DOWNTO 0);
SIGNAL \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\ : std_logic_vector(13 DOWNTO 0);
SIGNAL \clk~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a5\ : std_logic;
SIGNAL \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a12\ : std_logic;
SIGNAL \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a11\ : std_logic;
SIGNAL \display|timer1|counter[3]~24_combout\ : std_logic;
SIGNAL \display|timer1|counter[12]~42_combout\ : std_logic;
SIGNAL \display|timer1|counter[14]~46_combout\ : std_logic;
SIGNAL \display|timer1|counter[15]~48_combout\ : std_logic;
SIGNAL \display|timer1|counter[16]~51\ : std_logic;
SIGNAL \display|timer1|counter[17]~52_combout\ : std_logic;
SIGNAL \display|mem|char_reg|data[5]~0_combout\ : std_logic;
SIGNAL \display|mem|char_reg|data[4]~1_combout\ : std_logic;
SIGNAL \display|timer3|counter[0]~16_combout\ : std_logic;
SIGNAL \display|timer3|counter[0]~17\ : std_logic;
SIGNAL \display|timer3|counter[1]~18_combout\ : std_logic;
SIGNAL \display|timer3|counter[1]~19\ : std_logic;
SIGNAL \display|timer3|counter[2]~20_combout\ : std_logic;
SIGNAL \display|timer3|counter[2]~21\ : std_logic;
SIGNAL \display|timer3|counter[3]~22_combout\ : std_logic;
SIGNAL \display|timer3|counter[3]~23\ : std_logic;
SIGNAL \display|timer3|counter[4]~24_combout\ : std_logic;
SIGNAL \display|timer3|counter[4]~25\ : std_logic;
SIGNAL \display|timer3|counter[5]~26_combout\ : std_logic;
SIGNAL \display|timer3|counter[5]~27\ : std_logic;
SIGNAL \display|timer3|counter[6]~28_combout\ : std_logic;
SIGNAL \display|timer3|counter[6]~29\ : std_logic;
SIGNAL \display|timer3|counter[7]~30_combout\ : std_logic;
SIGNAL \display|timer3|counter[7]~31\ : std_logic;
SIGNAL \display|timer3|counter[8]~32_combout\ : std_logic;
SIGNAL \display|timer3|counter[8]~33\ : std_logic;
SIGNAL \display|timer3|counter[9]~34_combout\ : std_logic;
SIGNAL \display|timer3|counter[9]~35\ : std_logic;
SIGNAL \display|timer3|counter[10]~36_combout\ : std_logic;
SIGNAL \display|timer3|counter[10]~37\ : std_logic;
SIGNAL \display|timer3|counter[11]~38_combout\ : std_logic;
SIGNAL \display|timer3|counter[11]~39\ : std_logic;
SIGNAL \display|timer3|counter[12]~40_combout\ : std_logic;
SIGNAL \display|timer3|counter[12]~41\ : std_logic;
SIGNAL \display|timer3|counter[13]~42_combout\ : std_logic;
SIGNAL \display|timer3|counter[13]~43\ : std_logic;
SIGNAL \display|timer3|counter[14]~44_combout\ : std_logic;
SIGNAL \display|timer3|counter[14]~45\ : std_logic;
SIGNAL \display|timer3|counter[15]~46_combout\ : std_logic;
SIGNAL \display|timer2|counter[3]~16_combout\ : std_logic;
SIGNAL \display|timer2|counter[6]~22_combout\ : std_logic;
SIGNAL \tr|delay_timer|counter[1]~25_combout\ : std_logic;
SIGNAL \tr|delay_timer|counter[7]~37_combout\ : std_logic;
SIGNAL \tr|delay_timer|counter[14]~51_combout\ : std_logic;
SIGNAL \tr|delay_timer|counter[17]~57_combout\ : std_logic;
SIGNAL \display|logic|do_reset~regout\ : std_logic;
SIGNAL \tr|i2c_master_inst|LessThan1~0_combout\ : std_logic;
SIGNAL \display|i2c_master_inst|LessThan1~0_combout\ : std_logic;
SIGNAL \display|logic|do_reset_next~0_combout\ : std_logic;
SIGNAL \display|logic|do_reset_next~1_combout\ : std_logic;
SIGNAL \tr|i2c_master_inst|Decoder0~0_combout\ : std_logic;
SIGNAL \tr|tr_logic|i2c_l_rw~regout\ : std_logic;
SIGNAL \tr|i2c_master_inst|data_rx[7]~0_combout\ : std_logic;
SIGNAL \tr|i2c_master_inst|Selector26~3_combout\ : std_logic;
SIGNAL \tr|i2c_master_inst|Selector26~4_combout\ : std_logic;
SIGNAL \display|i2c_master_inst|stretch_reg~regout\ : std_logic;
SIGNAL \display|i2c_master_inst|Selector18~0_combout\ : std_logic;
SIGNAL \display|i2c_master_inst|Selector26~3_combout\ : std_logic;
SIGNAL \display|i2c_master_inst|Selector26~4_combout\ : std_logic;
SIGNAL \display|i2c_master_inst|Mux4~2_combout\ : std_logic;
SIGNAL \display|i2c_master_inst|Mux4~3_combout\ : std_logic;
SIGNAL \display|i2c_master_inst|Selector26~9_combout\ : std_logic;
SIGNAL \display|i2c_master_inst|Mux2~2_combout\ : std_logic;
SIGNAL \display|i2c_master_inst|Mux2~3_combout\ : std_logic;
SIGNAL \display|i2c_master_inst|Selector26~10_combout\ : std_logic;
SIGNAL \display|timer1|Equal0~3_combout\ : std_logic;
SIGNAL \display|mem|mem_mux|data[7]~2_combout\ : std_logic;
SIGNAL \display|wr_logic|process_1~2_combout\ : std_logic;
SIGNAL \display|mem|mem_mux|data[5]~3_combout\ : std_logic;
SIGNAL \display|mem|mem_mux|data[5]~4_combout\ : std_logic;
SIGNAL \display|mem|mem_mux|data[4]~5_combout\ : std_logic;
SIGNAL \display|wr_logic|process_1~3_combout\ : std_logic;
SIGNAL \display|mem|mem_mux|data[2]~7_combout\ : std_logic;
SIGNAL \display|timer3|Equal0~0_combout\ : std_logic;
SIGNAL \display|timer3|Equal0~1_combout\ : std_logic;
SIGNAL \display|timer3|Equal0~2_combout\ : std_logic;
SIGNAL \display|timer3|Equal0~3_combout\ : std_logic;
SIGNAL \display|timer3|Equal0~4_combout\ : std_logic;
SIGNAL \display|timer2|Equal0~0_combout\ : std_logic;
SIGNAL \tr|tr_logic|Selector8~0_combout\ : std_logic;
SIGNAL \display|i2c_master_inst|stretch_reg~0_combout\ : std_logic;
SIGNAL \display|wr_logic|Selector19~0_combout\ : std_logic;
SIGNAL \display|i2c_master_inst|addr_rw[0]~0_combout\ : std_logic;
SIGNAL \display|wr_logic|Selector16~0_combout\ : std_logic;
SIGNAL \display|wr_logic|Selector28~0_combout\ : std_logic;
SIGNAL \display|timer1|Equal0~5_combout\ : std_logic;
SIGNAL \display|mem|char_reg|Mux6~0_combout\ : std_logic;
SIGNAL \display|mem|char_reg|Mux6~1_combout\ : std_logic;
SIGNAL \display|mem|char_reg|Mux5~0_combout\ : std_logic;
SIGNAL \display|mem|temp_reg|Mux1~0_combout\ : std_logic;
SIGNAL \display|mem|char_reg|data_out~0_combout\ : std_logic;
SIGNAL \display|mem|char_reg|Mux7~0_combout\ : std_logic;
SIGNAL \display|mem|char_reg|Mux8~0_combout\ : std_logic;
SIGNAL \display|mem|char_reg|Mux10~1_combout\ : std_logic;
SIGNAL \display|mem|char_reg|Add1~0_combout\ : std_logic;
SIGNAL \display|mem|char_reg|Mux10~2_combout\ : std_logic;
SIGNAL \display|mem|char_reg|Add0~0_combout\ : std_logic;
SIGNAL \display|mem|char_reg|Mux10~3_combout\ : std_logic;
SIGNAL \display|mem|char_reg|Mux10~5_combout\ : std_logic;
SIGNAL \display|mem|temp_reg|Mux5~0_combout\ : std_logic;
SIGNAL \display|mem|temp_reg|Mux5~1_combout\ : std_logic;
SIGNAL \display|mem|temp_reg|Mux5~3_combout\ : std_logic;
SIGNAL \display|mem|temp_reg|Mux6~0_combout\ : std_logic;
SIGNAL \tr|bcd|a2[0]~0_combout\ : std_logic;
SIGNAL \tr|bcd|a2[2]~1_combout\ : std_logic;
SIGNAL \tr|bcd|a2[1]~2_combout\ : std_logic;
SIGNAL \tr|bcd|LessThan2~0_combout\ : std_logic;
SIGNAL \display|mem|temp_reg|Mux5~4_combout\ : std_logic;
SIGNAL \display|mem|temp_reg|Mux5~5_combout\ : std_logic;
SIGNAL \display|mem|char_reg|Mux11~0_combout\ : std_logic;
SIGNAL \display|mem|temp_reg|Mux6~1_combout\ : std_logic;
SIGNAL \display|mem|temp_reg|Mux6~2_combout\ : std_logic;
SIGNAL \display|mem|temp_reg|Mux6~3_combout\ : std_logic;
SIGNAL \display|mem|char_reg|Mux0~0_combout\ : std_logic;
SIGNAL \display|mem|char_reg|Mux0~1_combout\ : std_logic;
SIGNAL \display|mem|char_reg|Mux0~2_combout\ : std_logic;
SIGNAL \display|mem|char_reg|Mux0~3_combout\ : std_logic;
SIGNAL \display|mem|char_reg|Mux0~4_combout\ : std_logic;
SIGNAL \display|mem|char_reg|hex_l[0]~0_combout\ : std_logic;
SIGNAL \display|mem|char_reg|data_out~1_combout\ : std_logic;
SIGNAL \display|mem|char_reg|Mux12~0_combout\ : std_logic;
SIGNAL \display|mem|char_reg|tr_char[0]~1_combout\ : std_logic;
SIGNAL \display|mem|char_reg|Mux12~1_combout\ : std_logic;
SIGNAL \tr|bcd|LessThan2~1_combout\ : std_logic;
SIGNAL \display|mem|char_reg|Add1~2_combout\ : std_logic;
SIGNAL \display|mem|temp_reg|Mux4~2_combout\ : std_logic;
SIGNAL \tr|delay_timer|Equal0~3_combout\ : std_logic;
SIGNAL \tr|i2c_master_inst|data_rx[4]~1_combout\ : std_logic;
SIGNAL \tr|i2c_master_inst|data_rx[4]~2_combout\ : std_logic;
SIGNAL \tr|i2c_master_inst|data_rx[5]~3_combout\ : std_logic;
SIGNAL \tr|i2c_master_inst|data_rx[4]~4_combout\ : std_logic;
SIGNAL \tr|i2c_master_inst|data_rx[3]~5_combout\ : std_logic;
SIGNAL \tr|i2c_master_inst|data_rx[3]~6_combout\ : std_logic;
SIGNAL \tr|i2c_master_inst|data_rx[3]~7_combout\ : std_logic;
SIGNAL \tr|i2c_master_inst|data_rx[7]~8_combout\ : std_logic;
SIGNAL \tr|i2c_master_inst|data_rx[2]~10_combout\ : std_logic;
SIGNAL \tr|i2c_master_inst|data_rx[2]~11_combout\ : std_logic;
SIGNAL \tr|i2c_master_inst|data_rx[1]~12_combout\ : std_logic;
SIGNAL \tr|i2c_master_inst|data_rx[1]~13_combout\ : std_logic;
SIGNAL \tr|delay_timer|Equal0~7_combout\ : std_logic;
SIGNAL \display|mem|temp_reg|Mux7~4_combout\ : std_logic;
SIGNAL \display|mem|temp_reg|Mux4~3_combout\ : std_logic;
SIGNAL \ed1|sr[2]~feeder_combout\ : std_logic;
SIGNAL \ed1|sr[1]~feeder_combout\ : std_logic;
SIGNAL \tr|tr_logic|temp_r2[5]~feeder_combout\ : std_logic;
SIGNAL \tr|tr_logic|temp_r2[2]~feeder_combout\ : std_logic;
SIGNAL \tr|tr_logic|temp_r2[1]~feeder_combout\ : std_logic;
SIGNAL \ed1|sr[0]~feeder_combout\ : std_logic;
SIGNAL \temp_scl~0\ : std_logic;
SIGNAL \temp_sda~0\ : std_logic;
SIGNAL \lcd_scl~0\ : std_logic;
SIGNAL \lcd_sda~0\ : std_logic;
SIGNAL \tr|i2c_master_inst|count_reg[2]~11_combout\ : std_logic;
SIGNAL \tr|i2c_master_inst|count_reg[3]~13_combout\ : std_logic;
SIGNAL \tr|i2c_master_inst|Equal2~0_combout\ : std_logic;
SIGNAL \tr|i2c_master_inst|count_reg[5]~18\ : std_logic;
SIGNAL \tr|i2c_master_inst|count_reg[6]~19_combout\ : std_logic;
SIGNAL \tr|i2c_master_inst|Equal2~1_combout\ : std_logic;
SIGNAL \tr|i2c_master_inst|process_1~2_combout\ : std_logic;
SIGNAL \tr|i2c_master_inst|process_1~1_combout\ : std_logic;
SIGNAL \tr|i2c_master_inst|process_1~3_combout\ : std_logic;
SIGNAL \tr|i2c_master_inst|stretch_reg~0_combout\ : std_logic;
SIGNAL \tr|i2c_master_inst|stretch_reg~regout\ : std_logic;
SIGNAL \tr|i2c_master_inst|count_reg[0]~8\ : std_logic;
SIGNAL \tr|i2c_master_inst|count_reg[1]~9_combout\ : std_logic;
SIGNAL \tr|i2c_master_inst|count_reg[1]~10\ : std_logic;
SIGNAL \tr|i2c_master_inst|count_reg[2]~12\ : std_logic;
SIGNAL \tr|i2c_master_inst|count_reg[3]~14\ : std_logic;
SIGNAL \tr|i2c_master_inst|count_reg[4]~15_combout\ : std_logic;
SIGNAL \tr|i2c_master_inst|count_reg[4]~16\ : std_logic;
SIGNAL \tr|i2c_master_inst|count_reg[5]~17_combout\ : std_logic;
SIGNAL \tr|i2c_master_inst|count_reg[0]~7_combout\ : std_logic;
SIGNAL \tr|i2c_master_inst|LessThan1~1_combout\ : std_logic;
SIGNAL \tr|i2c_master_inst|process_1~0_combout\ : std_logic;
SIGNAL \tr|i2c_master_inst|bit_cnt[0]~1_combout\ : std_logic;
SIGNAL \tr|i2c_master_inst|scl_ena~0_combout\ : std_logic;
SIGNAL \tr|i2c_master_inst|data_clk_prev~regout\ : std_logic;
SIGNAL \tr|i2c_master_inst|data_clk_re~combout\ : std_logic;
SIGNAL \tr|i2c_master_inst|Selector26~6_combout\ : std_logic;
SIGNAL \tr|i2c_master_inst|state.slv_ack2~regout\ : std_logic;
SIGNAL \tr|i2c_master_inst|Selector24~0_combout\ : std_logic;
SIGNAL \tr|i2c_master_inst|state.mstr_ack~regout\ : std_logic;
SIGNAL \tr|i2c_master_inst|addr_rw[4]~0_combout\ : std_logic;
SIGNAL \tr|i2c_master_inst|addr_rw[0]~1_combout\ : std_logic;
SIGNAL \tr|i2c_master_inst|Selector21~0_combout\ : std_logic;
SIGNAL \tr|i2c_master_inst|process_3~0_combout\ : std_logic;
SIGNAL \tr|i2c_master_inst|Selector21~1_combout\ : std_logic;
SIGNAL \tr|i2c_master_inst|state.wr~regout\ : std_logic;
SIGNAL \tr|i2c_master_inst|bit_cnt[2]~0_combout\ : std_logic;
SIGNAL \tr|i2c_master_inst|Selector28~0_combout\ : std_logic;
SIGNAL \tr|i2c_master_inst|Add0~0_combout\ : std_logic;
SIGNAL \tr|i2c_master_inst|Equal0~0_combout\ : std_logic;
SIGNAL \tr|i2c_master_inst|Selector22~0_combout\ : std_logic;
SIGNAL \tr|i2c_master_inst|Selector22~1_combout\ : std_logic;
SIGNAL \tr|i2c_master_inst|state.rd~regout\ : std_logic;
SIGNAL \tr|i2c_master_inst|Selector0~1_combout\ : std_logic;
SIGNAL \tr|i2c_master_inst|Selector25~0_combout\ : std_logic;
SIGNAL \tr|i2c_master_inst|Selector19~0_combout\ : std_logic;
SIGNAL \tr|i2c_master_inst|state.command~regout\ : std_logic;
SIGNAL \tr|i2c_master_inst|Selector20~0_combout\ : std_logic;
SIGNAL \tr|i2c_master_inst|state.slv_ack1~regout\ : std_logic;
SIGNAL \tr|i2c_master_inst|Selector0~0_combout\ : std_logic;
SIGNAL \tr|i2c_master_inst|Selector0~2_combout\ : std_logic;
SIGNAL \tr|i2c_master_inst|busy_r~regout\ : std_logic;
SIGNAL \tr|tr_logic|state.WAIT_IDLE~0_combout\ : std_logic;
SIGNAL \tr|tr_logic|state.WAIT_IDLE~regout\ : std_logic;
SIGNAL \tr|delay_timer|counter[0]~24\ : std_logic;
SIGNAL \tr|delay_timer|counter[1]~26\ : std_logic;
SIGNAL \tr|delay_timer|counter[2]~27_combout\ : std_logic;
SIGNAL \tr|tr_logic|next_completed~0_combout\ : std_logic;
SIGNAL \tr|tr_logic|completed~regout\ : std_logic;
SIGNAL \tr|delay_timer|Selector0~0_combout\ : std_logic;
SIGNAL \tr|delay_timer|state.IDLE~regout\ : std_logic;
SIGNAL \tr|delay_timer|Selector1~0_combout\ : std_logic;
SIGNAL \tr|delay_timer|state.WAITING~regout\ : std_logic;
SIGNAL \tr|delay_timer|counter[2]~28\ : std_logic;
SIGNAL \tr|delay_timer|counter[3]~30\ : std_logic;
SIGNAL \tr|delay_timer|counter[4]~31_combout\ : std_logic;
SIGNAL \tr|delay_timer|counter[4]~32\ : std_logic;
SIGNAL \tr|delay_timer|counter[5]~34\ : std_logic;
SIGNAL \tr|delay_timer|counter[6]~35_combout\ : std_logic;
SIGNAL \tr|delay_timer|counter[6]~36\ : std_logic;
SIGNAL \tr|delay_timer|counter[7]~38\ : std_logic;
SIGNAL \tr|delay_timer|counter[8]~39_combout\ : std_logic;
SIGNAL \tr|delay_timer|counter[8]~40\ : std_logic;
SIGNAL \tr|delay_timer|counter[9]~41_combout\ : std_logic;
SIGNAL \tr|delay_timer|counter[9]~42\ : std_logic;
SIGNAL \tr|delay_timer|counter[10]~43_combout\ : std_logic;
SIGNAL \tr|delay_timer|counter[10]~44\ : std_logic;
SIGNAL \tr|delay_timer|counter[11]~45_combout\ : std_logic;
SIGNAL \tr|delay_timer|counter[11]~46\ : std_logic;
SIGNAL \tr|delay_timer|counter[12]~47_combout\ : std_logic;
SIGNAL \tr|delay_timer|counter[12]~48\ : std_logic;
SIGNAL \tr|delay_timer|counter[13]~49_combout\ : std_logic;
SIGNAL \tr|delay_timer|counter[13]~50\ : std_logic;
SIGNAL \tr|delay_timer|counter[14]~52\ : std_logic;
SIGNAL \tr|delay_timer|counter[15]~53_combout\ : std_logic;
SIGNAL \tr|delay_timer|counter[15]~54\ : std_logic;
SIGNAL \tr|delay_timer|counter[16]~56\ : std_logic;
SIGNAL \tr|delay_timer|counter[17]~58\ : std_logic;
SIGNAL \tr|delay_timer|counter[18]~59_combout\ : std_logic;
SIGNAL \tr|delay_timer|counter[18]~60\ : std_logic;
SIGNAL \tr|delay_timer|counter[19]~62\ : std_logic;
SIGNAL \tr|delay_timer|counter[20]~63_combout\ : std_logic;
SIGNAL \tr|delay_timer|counter[20]~64\ : std_logic;
SIGNAL \tr|delay_timer|counter[21]~66\ : std_logic;
SIGNAL \tr|delay_timer|counter[22]~67_combout\ : std_logic;
SIGNAL \tr|delay_timer|counter[21]~65_combout\ : std_logic;
SIGNAL \tr|delay_timer|Equal0~6_combout\ : std_logic;
SIGNAL \tr|delay_timer|counter[19]~61_combout\ : std_logic;
SIGNAL \tr|delay_timer|counter[16]~55_combout\ : std_logic;
SIGNAL \tr|delay_timer|Equal0~5_combout\ : std_logic;
SIGNAL \tr|delay_timer|counter[5]~33_combout\ : std_logic;
SIGNAL \tr|delay_timer|Equal0~1_combout\ : std_logic;
SIGNAL \tr|delay_timer|Equal0~2_combout\ : std_logic;
SIGNAL \tr|delay_timer|counter[3]~29_combout\ : std_logic;
SIGNAL \tr|delay_timer|counter[0]~23_combout\ : std_logic;
SIGNAL \tr|delay_timer|Equal0~0_combout\ : std_logic;
SIGNAL \tr|delay_timer|Equal0~4_combout\ : std_logic;
SIGNAL \tr|delay_timer|Selector2~0_combout\ : std_logic;
SIGNAL \tr|delay_timer|state.TRIGGERED~regout\ : std_logic;
SIGNAL \tr|delay_timer|fire~regout\ : std_logic;
SIGNAL \tr|tr_logic|Selector7~0_combout\ : std_logic;
SIGNAL \tr|tr_logic|state.WAIT_DELAY~regout\ : std_logic;
SIGNAL \tr|tr_logic|Selector1~0_combout\ : std_logic;
SIGNAL \tr|tr_logic|Selector1~1_combout\ : std_logic;
SIGNAL \tr|tr_logic|state.IDLE~regout\ : std_logic;
SIGNAL \tr|tr_logic|Selector2~0_combout\ : std_logic;
SIGNAL \tr|tr_logic|state.WRITE_ACTIVE~regout\ : std_logic;
SIGNAL \tr|tr_logic|Selector3~0_combout\ : std_logic;
SIGNAL \tr|tr_logic|state.WRITE_COMPLETE~regout\ : std_logic;
SIGNAL \tr|tr_logic|Selector4~0_combout\ : std_logic;
SIGNAL \tr|tr_logic|state.READ_ACTIVE~regout\ : std_logic;
SIGNAL \tr|tr_logic|Selector5~0_combout\ : std_logic;
SIGNAL \tr|tr_logic|state.READ_COMPLETE~regout\ : std_logic;
SIGNAL \tr|tr_logic|Selector6~0_combout\ : std_logic;
SIGNAL \tr|tr_logic|state.READ2_ACTIVE~regout\ : std_logic;
SIGNAL \tr|tr_logic|Selector9~0_combout\ : std_logic;
SIGNAL \tr|tr_logic|i2c_l_ena~regout\ : std_logic;
SIGNAL \tr|i2c_master_inst|Selector18~0_combout\ : std_logic;
SIGNAL \tr|i2c_master_inst|Selector18~1_combout\ : std_logic;
SIGNAL \tr|i2c_master_inst|state.start~regout\ : std_logic;
SIGNAL \tr|i2c_master_inst|state.stop~regout\ : std_logic;
SIGNAL \tr|i2c_master_inst|scl_ena~1_combout\ : std_logic;
SIGNAL \tr|i2c_master_inst|scl_ena~regout\ : std_logic;
SIGNAL \tr|i2c_master_inst|scl~1_combout\ : std_logic;
SIGNAL \tr|i2c_master_inst|Selector26~7_combout\ : std_logic;
SIGNAL \tr|i2c_master_inst|Selector26~8_combout\ : std_logic;
SIGNAL \tr|i2c_master_inst|Selector17~0_combout\ : std_logic;
SIGNAL \tr|i2c_master_inst|state.ready~regout\ : std_logic;
SIGNAL \tr|i2c_master_inst|Selector26~0_combout\ : std_logic;
SIGNAL \tr|i2c_master_inst|Selector26~1_combout\ : std_logic;
SIGNAL \tr|i2c_master_inst|Selector26~2_combout\ : std_logic;
SIGNAL \tr|i2c_master_inst|Selector26~5_combout\ : std_logic;
SIGNAL \tr|i2c_master_inst|sda_int~regout\ : std_logic;
SIGNAL \tr|i2c_master_inst|Selector32~0_combout\ : std_logic;
SIGNAL \display|i2c_master_inst|count_reg[0]~7_combout\ : std_logic;
SIGNAL \display|i2c_master_inst|count_reg[0]~8\ : std_logic;
SIGNAL \display|i2c_master_inst|count_reg[1]~10\ : std_logic;
SIGNAL \display|i2c_master_inst|count_reg[2]~11_combout\ : std_logic;
SIGNAL \display|i2c_master_inst|count_reg[2]~12\ : std_logic;
SIGNAL \display|i2c_master_inst|count_reg[3]~14\ : std_logic;
SIGNAL \display|i2c_master_inst|count_reg[4]~16\ : std_logic;
SIGNAL \display|i2c_master_inst|count_reg[5]~17_combout\ : std_logic;
SIGNAL \display|i2c_master_inst|count_reg[4]~15_combout\ : std_logic;
SIGNAL \display|i2c_master_inst|count_reg[3]~13_combout\ : std_logic;
SIGNAL \display|i2c_master_inst|Equal2~0_combout\ : std_logic;
SIGNAL \display|i2c_master_inst|Equal2~1_combout\ : std_logic;
SIGNAL \display|i2c_master_inst|process_1~0_combout\ : std_logic;
SIGNAL \display|i2c_master_inst|count_reg[5]~18\ : std_logic;
SIGNAL \display|i2c_master_inst|count_reg[6]~19_combout\ : std_logic;
SIGNAL \display|wr_logic|Selector11~0_combout\ : std_logic;
SIGNAL \display|wr_logic|state.RD_STATUS_RD~regout\ : std_logic;
SIGNAL \display|wr_logic|Selector12~0_combout\ : std_logic;
SIGNAL \display|wr_logic|state.RD_STATUS_RD_BUSY~regout\ : std_logic;
SIGNAL \display|wr_logic|Selector13~0_combout\ : std_logic;
SIGNAL \display|wr_logic|state.RD_STATUS_RESULT~regout\ : std_logic;
SIGNAL \display|i2c_master_inst|Selector28~0_combout\ : std_logic;
SIGNAL \display|i2c_master_inst|LessThan1~1_combout\ : std_logic;
SIGNAL \display|i2c_master_inst|process_1~2_combout\ : std_logic;
SIGNAL \display|i2c_master_inst|count_reg[1]~9_combout\ : std_logic;
SIGNAL \display|i2c_master_inst|process_1~1_combout\ : std_logic;
SIGNAL \display|i2c_master_inst|process_1~3_combout\ : std_logic;
SIGNAL \display|i2c_master_inst|scl_ena~0_combout\ : std_logic;
SIGNAL \display|i2c_master_inst|data_clk_re~combout\ : std_logic;
SIGNAL \display|i2c_master_inst|Equal0~0_combout\ : std_logic;
SIGNAL \display|i2c_master_inst|Selector19~0_combout\ : std_logic;
SIGNAL \display|i2c_master_inst|state.command~regout\ : std_logic;
SIGNAL \display|i2c_master_inst|bit_cnt[2]~0_combout\ : std_logic;
SIGNAL \display|i2c_master_inst|Add0~0_combout\ : std_logic;
SIGNAL \display|i2c_master_inst|bit_cnt[0]~1_combout\ : std_logic;
SIGNAL \display|i2c_master_inst|data_rx[7]~1_combout\ : std_logic;
SIGNAL \display|i2c_master_inst|data_rx[7]~2_combout\ : std_logic;
SIGNAL \display|wr_logic|current_addr[0]~9\ : std_logic;
SIGNAL \display|wr_logic|current_addr[1]~11\ : std_logic;
SIGNAL \display|wr_logic|current_addr[2]~12_combout\ : std_logic;
SIGNAL \~GND~combout\ : std_logic;
SIGNAL \display|wr_logic|Selector16~1_combout\ : std_logic;
SIGNAL \display|wr_logic|state.WR_DATA~regout\ : std_logic;
SIGNAL \ed2|sr[0]~feeder_combout\ : std_logic;
SIGNAL \ed2|sr[1]~feeder_combout\ : std_logic;
SIGNAL \ed2|sr[2]~feeder_combout\ : std_logic;
SIGNAL \display|logic|update_char_next~0_combout\ : std_logic;
SIGNAL \display|logic|update_char~regout\ : std_logic;
SIGNAL \display|logic|update_temp_next~0_combout\ : std_logic;
SIGNAL \display|logic|update_temp~regout\ : std_logic;
SIGNAL \display|wr_logic|done~regout\ : std_logic;
SIGNAL \display|logic|Selector2~1_combout\ : std_logic;
SIGNAL \display|logic|Selector2~5_combout\ : std_logic;
SIGNAL \display|logic|Selector1~1_combout\ : std_logic;
SIGNAL \display|logic|state.INIT_WAIT~regout\ : std_logic;
SIGNAL \display|timer1|counter[0]~18_combout\ : std_logic;
SIGNAL \display|logic|Selector0~0_combout\ : std_logic;
SIGNAL \display|logic|state.INIT_START~regout\ : std_logic;
SIGNAL \display|logic|t_start[0]~0_combout\ : std_logic;
SIGNAL \display|timer1|Selector0~0_combout\ : std_logic;
SIGNAL \display|timer1|state.IDLE~regout\ : std_logic;
SIGNAL \display|timer1|Selector1~0_combout\ : std_logic;
SIGNAL \display|timer1|state.WAITING~regout\ : std_logic;
SIGNAL \display|timer1|counter[0]~19\ : std_logic;
SIGNAL \display|timer1|counter[1]~21\ : std_logic;
SIGNAL \display|timer1|counter[2]~22_combout\ : std_logic;
SIGNAL \display|timer1|counter[2]~23\ : std_logic;
SIGNAL \display|timer1|counter[3]~25\ : std_logic;
SIGNAL \display|timer1|counter[4]~26_combout\ : std_logic;
SIGNAL \display|timer1|counter[4]~27\ : std_logic;
SIGNAL \display|timer1|counter[5]~29\ : std_logic;
SIGNAL \display|timer1|counter[6]~30_combout\ : std_logic;
SIGNAL \display|timer1|counter[6]~31\ : std_logic;
SIGNAL \display|timer1|counter[7]~32_combout\ : std_logic;
SIGNAL \display|timer1|counter[7]~33\ : std_logic;
SIGNAL \display|timer1|counter[8]~34_combout\ : std_logic;
SIGNAL \display|timer1|counter[8]~35\ : std_logic;
SIGNAL \display|timer1|counter[9]~36_combout\ : std_logic;
SIGNAL \display|timer1|counter[9]~37\ : std_logic;
SIGNAL \display|timer1|counter[10]~38_combout\ : std_logic;
SIGNAL \display|timer1|counter[10]~39\ : std_logic;
SIGNAL \display|timer1|counter[11]~40_combout\ : std_logic;
SIGNAL \display|timer1|Equal0~2_combout\ : std_logic;
SIGNAL \display|timer1|counter[1]~20_combout\ : std_logic;
SIGNAL \display|timer1|Equal0~0_combout\ : std_logic;
SIGNAL \display|timer1|counter[5]~28_combout\ : std_logic;
SIGNAL \display|timer1|Equal0~1_combout\ : std_logic;
SIGNAL \display|timer1|Equal0~4_combout\ : std_logic;
SIGNAL \display|timer1|counter[11]~41\ : std_logic;
SIGNAL \display|timer1|counter[12]~43\ : std_logic;
SIGNAL \display|timer1|counter[13]~44_combout\ : std_logic;
SIGNAL \display|timer1|counter[13]~45\ : std_logic;
SIGNAL \display|timer1|counter[14]~47\ : std_logic;
SIGNAL \display|timer1|counter[15]~49\ : std_logic;
SIGNAL \display|timer1|counter[16]~50_combout\ : std_logic;
SIGNAL \display|timer1|Selector2~0_combout\ : std_logic;
SIGNAL \display|timer1|state.TRIGGERED~regout\ : std_logic;
SIGNAL \display|timer1|fire~feeder_combout\ : std_logic;
SIGNAL \display|timer1|fire~regout\ : std_logic;
SIGNAL \display|logic|Selector2~0_combout\ : std_logic;
SIGNAL \display|logic|Selector2~6_combout\ : std_logic;
SIGNAL \display|logic|state.INIT_RESET~regout\ : std_logic;
SIGNAL \display|timer2|counter[0]~10_combout\ : std_logic;
SIGNAL \display|timer2|Selector0~0_combout\ : std_logic;
SIGNAL \display|timer2|state.IDLE~regout\ : std_logic;
SIGNAL \display|timer2|Selector1~0_combout\ : std_logic;
SIGNAL \display|timer2|state.WAITING~regout\ : std_logic;
SIGNAL \display|timer2|counter[0]~11\ : std_logic;
SIGNAL \display|timer2|counter[1]~12_combout\ : std_logic;
SIGNAL \display|timer2|counter[1]~13\ : std_logic;
SIGNAL \display|timer2|counter[2]~14_combout\ : std_logic;
SIGNAL \display|timer2|counter[2]~15\ : std_logic;
SIGNAL \display|timer2|counter[3]~17\ : std_logic;
SIGNAL \display|timer2|counter[4]~18_combout\ : std_logic;
SIGNAL \display|timer2|counter[4]~19\ : std_logic;
SIGNAL \display|timer2|counter[5]~21\ : std_logic;
SIGNAL \display|timer2|counter[6]~23\ : std_logic;
SIGNAL \display|timer2|counter[7]~24_combout\ : std_logic;
SIGNAL \display|timer2|counter[5]~20_combout\ : std_logic;
SIGNAL \display|timer2|Equal0~1_combout\ : std_logic;
SIGNAL \display|timer2|counter[7]~25\ : std_logic;
SIGNAL \display|timer2|counter[8]~26_combout\ : std_logic;
SIGNAL \display|timer2|counter[8]~27\ : std_logic;
SIGNAL \display|timer2|counter[9]~28_combout\ : std_logic;
SIGNAL \display|timer2|Equal0~2_combout\ : std_logic;
SIGNAL \display|timer2|Selector2~0_combout\ : std_logic;
SIGNAL \display|timer2|state.TRIGGERED~regout\ : std_logic;
SIGNAL \display|timer2|fire~feeder_combout\ : std_logic;
SIGNAL \display|timer2|fire~regout\ : std_logic;
SIGNAL \display|logic|Selector2~4_combout\ : std_logic;
SIGNAL \display|timer3|Selector0~0_combout\ : std_logic;
SIGNAL \display|timer3|state.IDLE~regout\ : std_logic;
SIGNAL \display|timer3|Selector1~0_combout\ : std_logic;
SIGNAL \display|timer3|state.WAITING~regout\ : std_logic;
SIGNAL \display|timer3|Selector2~0_combout\ : std_logic;
SIGNAL \display|timer3|state.TRIGGERED~regout\ : std_logic;
SIGNAL \display|timer3|fire~regout\ : std_logic;
SIGNAL \display|logic|Selector3~0_combout\ : std_logic;
SIGNAL \display|logic|state.INIT_WAIT2~regout\ : std_logic;
SIGNAL \display|logic|Selector2~3_combout\ : std_logic;
SIGNAL \display|logic|Selector1~0_combout\ : std_logic;
SIGNAL \display|logic|Selector1~2_combout\ : std_logic;
SIGNAL \display|logic|Selector5~0_combout\ : std_logic;
SIGNAL \display|logic|state.WAIT_MAIN~regout\ : std_logic;
SIGNAL \display|logic|Selector7~0_combout\ : std_logic;
SIGNAL \display|logic|state.DO_UPDATE_TEMP~regout\ : std_logic;
SIGNAL \display|logic|Selector4~0_combout\ : std_logic;
SIGNAL \display|logic|state.INIT_SEQ~regout\ : std_logic;
SIGNAL \display|logic|Selector6~0_combout\ : std_logic;
SIGNAL \display|logic|state.DO_UPDATE_CHAR~regout\ : std_logic;
SIGNAL \display|logic|Selector2~2_combout\ : std_logic;
SIGNAL \display|logic|start_write~regout\ : std_logic;
SIGNAL \display|wr_logic|current_addr[7]~24_combout\ : std_logic;
SIGNAL \display|wr_logic|current_addr[2]~13\ : std_logic;
SIGNAL \display|wr_logic|current_addr[3]~15\ : std_logic;
SIGNAL \display|wr_logic|current_addr[4]~17\ : std_logic;
SIGNAL \display|wr_logic|current_addr[5]~18_combout\ : std_logic;
SIGNAL \display|wr_logic|current_addr[5]~19\ : std_logic;
SIGNAL \display|wr_logic|current_addr[6]~21\ : std_logic;
SIGNAL \display|wr_logic|current_addr[7]~22_combout\ : std_logic;
SIGNAL \display|logic|write_start_addr_next[7]~0_combout\ : std_logic;
SIGNAL \clk~combout\ : std_logic;
SIGNAL \clk~clkctrl_outclk\ : std_logic;
SIGNAL \display|wr_logic|current_addr[0]~8_combout\ : std_logic;
SIGNAL \display|wr_logic|current_addr[1]~10_combout\ : std_logic;
SIGNAL \display|wr_logic|current_addr[3]~14_combout\ : std_logic;
SIGNAL \display|wr_logic|current_addr[4]~16_combout\ : std_logic;
SIGNAL \display|wr_logic|current_addr[6]~20_combout\ : std_logic;
SIGNAL \display|logic|write_start_addr[6]~feeder_combout\ : std_logic;
SIGNAL \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a0~portadataout\ : std_logic;
SIGNAL \tr|i2c_master_inst|Equal0~1_combout\ : std_logic;
SIGNAL \tr|i2c_master_inst|data_rx[0]~14_combout\ : std_logic;
SIGNAL \tr|tr_logic|temp_r2[0]~feeder_combout\ : std_logic;
SIGNAL \display|mem|temp_reg|Mux7~2_combout\ : std_logic;
SIGNAL \tr|i2c_master_inst|data_rx[7]~9_combout\ : std_logic;
SIGNAL \tr|tr_logic|temp_r1[7]~0_combout\ : std_logic;
SIGNAL \display|mem|temp_reg|Mux5~2_combout\ : std_logic;
SIGNAL \display|mem|temp_reg|Mux7~3_combout\ : std_logic;
SIGNAL \display|mem|mem_mux|data[0]~10_combout\ : std_logic;
SIGNAL \display|mem|mem_mux|data[0]~11_combout\ : std_logic;
SIGNAL \display|mem|char_reg|tr_char~0_combout\ : std_logic;
SIGNAL \display|mem|char_reg|data[1]~2_combout\ : std_logic;
SIGNAL \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a9\ : std_logic;
SIGNAL \display|mem|char_reg|data[1]~3_combout\ : std_logic;
SIGNAL \display|mem|char_reg|Mux9~0_combout\ : std_logic;
SIGNAL \display|mem|char_reg|Add0~1_combout\ : std_logic;
SIGNAL \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a8\ : std_logic;
SIGNAL \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a2\ : std_logic;
SIGNAL \display|mem|char_reg|LessThan0~0_combout\ : std_logic;
SIGNAL \display|mem|char_reg|data[1]~4_combout\ : std_logic;
SIGNAL \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a3\ : std_logic;
SIGNAL \display|mem|char_reg|Mux9~1_combout\ : std_logic;
SIGNAL \display|mem|char_reg|Mux9~2_combout\ : std_logic;
SIGNAL \display|mem|char_reg|Mux10~0_combout\ : std_logic;
SIGNAL \display|mem|char_reg|Mux9~3_combout\ : std_logic;
SIGNAL \display|mem|mem_mux|data[3]~12_combout\ : std_logic;
SIGNAL \display|wr_logic|process_1~5_combout\ : std_logic;
SIGNAL \display|mem|char_reg|data[1]~5_combout\ : std_logic;
SIGNAL \display|mem|char_reg|Add1~1_combout\ : std_logic;
SIGNAL \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a1\ : std_logic;
SIGNAL \display|mem|char_reg|Mux11~1_combout\ : std_logic;
SIGNAL \display|mem|char_reg|Mux11~2_combout\ : std_logic;
SIGNAL \display|mem|char_reg|Mux10~4_combout\ : std_logic;
SIGNAL \display|mem|char_reg|Mux11~3_combout\ : std_logic;
SIGNAL \display|mem|mem_mux|data[1]~9_combout\ : std_logic;
SIGNAL \display|mem|mem_mux|data[2]~8_combout\ : std_logic;
SIGNAL \display|wr_logic|process_1~4_combout\ : std_logic;
SIGNAL \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a10\ : std_logic;
SIGNAL \display|wr_logic|process_1~0_combout\ : std_logic;
SIGNAL \display|wr_logic|process_1~1_combout\ : std_logic;
SIGNAL \display|wr_logic|process_1~6_combout\ : std_logic;
SIGNAL \display|wr_logic|Selector15~2_combout\ : std_logic;
SIGNAL \display|wr_logic|state.WR_CONTROL_BUSY~regout\ : std_logic;
SIGNAL \display|wr_logic|Selector18~2_combout\ : std_logic;
SIGNAL \display|wr_logic|Selector17~0_combout\ : std_logic;
SIGNAL \display|wr_logic|state.WR_DATA_BUSY~regout\ : std_logic;
SIGNAL \display|wr_logic|Selector18~5_combout\ : std_logic;
SIGNAL \display|wr_logic|Selector18~3_combout\ : std_logic;
SIGNAL \display|wr_logic|state.WR_DONE~regout\ : std_logic;
SIGNAL \display|wr_logic|Selector8~0_combout\ : std_logic;
SIGNAL \display|wr_logic|state.IDLE~regout\ : std_logic;
SIGNAL \display|wr_logic|Selector9~0_combout\ : std_logic;
SIGNAL \display|wr_logic|Selector9~1_combout\ : std_logic;
SIGNAL \display|wr_logic|Selector9~2_combout\ : std_logic;
SIGNAL \display|wr_logic|state.RD_STATUS_WR~regout\ : std_logic;
SIGNAL \display|wr_logic|Selector10~0_combout\ : std_logic;
SIGNAL \display|wr_logic|state.RD_STATUS_WR_BUSY~regout\ : std_logic;
SIGNAL \display|wr_logic|Selector20~0_combout\ : std_logic;
SIGNAL \display|wr_logic|Selector20~1_combout\ : std_logic;
SIGNAL \display|wr_logic|i2c_rwb~regout\ : std_logic;
SIGNAL \display|i2c_master_inst|data_clk_prev~regout\ : std_logic;
SIGNAL \display|i2c_master_inst|addr_rw[0]~1_combout\ : std_logic;
SIGNAL \display|i2c_master_inst|process_3~0_combout\ : std_logic;
SIGNAL \display|i2c_master_inst|Selector20~0_combout\ : std_logic;
SIGNAL \display|i2c_master_inst|state.slv_ack1~regout\ : std_logic;
SIGNAL \display|i2c_master_inst|Selector21~0_combout\ : std_logic;
SIGNAL \display|i2c_master_inst|Selector21~1_combout\ : std_logic;
SIGNAL \display|i2c_master_inst|state.wr~regout\ : std_logic;
SIGNAL \display|i2c_master_inst|Selector23~0_combout\ : std_logic;
SIGNAL \display|i2c_master_inst|state.slv_ack2~regout\ : std_logic;
SIGNAL \display|i2c_master_inst|Selector25~0_combout\ : std_logic;
SIGNAL \display|i2c_master_inst|state.stop~regout\ : std_logic;
SIGNAL \display|i2c_master_inst|Selector17~0_combout\ : std_logic;
SIGNAL \display|i2c_master_inst|state.ready~regout\ : std_logic;
SIGNAL \display|i2c_master_inst|Selector0~1_combout\ : std_logic;
SIGNAL \display|i2c_master_inst|Selector0~0_combout\ : std_logic;
SIGNAL \display|i2c_master_inst|Selector0~2_combout\ : std_logic;
SIGNAL \display|i2c_master_inst|busy_r~regout\ : std_logic;
SIGNAL \display|wr_logic|Selector19~1_combout\ : std_logic;
SIGNAL \display|wr_logic|Selector18~4_combout\ : std_logic;
SIGNAL \display|wr_logic|Selector14~0_combout\ : std_logic;
SIGNAL \display|wr_logic|state.WR_CONTROL~regout\ : std_logic;
SIGNAL \display|wr_logic|state_next~11_combout\ : std_logic;
SIGNAL \display|wr_logic|Selector19~2_combout\ : std_logic;
SIGNAL \display|wr_logic|i2c_en~regout\ : std_logic;
SIGNAL \display|i2c_master_inst|Selector18~1_combout\ : std_logic;
SIGNAL \display|i2c_master_inst|state.start~regout\ : std_logic;
SIGNAL \display|i2c_master_inst|data_rx[7]~0_combout\ : std_logic;
SIGNAL \display|i2c_master_inst|scl_ena~1_combout\ : std_logic;
SIGNAL \display|i2c_master_inst|scl_ena~regout\ : std_logic;
SIGNAL \display|i2c_master_inst|scl~1_combout\ : std_logic;
SIGNAL \display|i2c_master_inst|Selector26~1_combout\ : std_logic;
SIGNAL \display|i2c_master_inst|Selector26~0_combout\ : std_logic;
SIGNAL \display|i2c_master_inst|Selector26~2_combout\ : std_logic;
SIGNAL \display|i2c_master_inst|Selector22~0_combout\ : std_logic;
SIGNAL \display|i2c_master_inst|Selector26~5_combout\ : std_logic;
SIGNAL \display|mem|char_reg|Mux6~2_combout\ : std_logic;
SIGNAL \display|mem|char_reg|Mux6~3_combout\ : std_logic;
SIGNAL \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a6\ : std_logic;
SIGNAL \display|mem|mem_mux|data[6]~1_combout\ : std_logic;
SIGNAL \display|mem|char_reg|Mux2~0_combout\ : std_logic;
SIGNAL \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a13\ : std_logic;
SIGNAL \display|mem|mem_mux|data[10]~0_combout\ : std_logic;
SIGNAL \display|mem|mem_mux|data[10]~13_combout\ : std_logic;
SIGNAL \display|wr_logic|Selector22~0_combout\ : std_logic;
SIGNAL \display|wr_logic|i2c_data_wrb[1]~0_combout\ : std_logic;
SIGNAL \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a7\ : std_logic;
SIGNAL \display|wr_logic|Selector21~0_combout\ : std_logic;
SIGNAL \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a4\ : std_logic;
SIGNAL \display|mem|mem_mux|data[4]~6_combout\ : std_logic;
SIGNAL \display|wr_logic|Selector24~0_combout\ : std_logic;
SIGNAL \display|wr_logic|Selector24~1_combout\ : std_logic;
SIGNAL \display|wr_logic|Selector23~0_combout\ : std_logic;
SIGNAL \display|i2c_master_inst|Mux4~0_combout\ : std_logic;
SIGNAL \display|i2c_master_inst|Mux4~1_combout\ : std_logic;
SIGNAL \display|i2c_master_inst|Selector26~6_combout\ : std_logic;
SIGNAL \display|i2c_master_inst|Selector24~0_combout\ : std_logic;
SIGNAL \display|i2c_master_inst|state.mstr_ack~regout\ : std_logic;
SIGNAL \display|i2c_master_inst|Selector22~1_combout\ : std_logic;
SIGNAL \display|wr_logic|Selector27~0_combout\ : std_logic;
SIGNAL \display|wr_logic|Selector26~0_combout\ : std_logic;
SIGNAL \display|wr_logic|Selector25~0_combout\ : std_logic;
SIGNAL \display|i2c_master_inst|Mux3~0_combout\ : std_logic;
SIGNAL \display|i2c_master_inst|Mux3~1_combout\ : std_logic;
SIGNAL \display|i2c_master_inst|Mux3~2_combout\ : std_logic;
SIGNAL \display|i2c_master_inst|Mux3~3_combout\ : std_logic;
SIGNAL \display|i2c_master_inst|Selector26~12_combout\ : std_logic;
SIGNAL \display|i2c_master_inst|Selector26~13_combout\ : std_logic;
SIGNAL \display|i2c_master_inst|Selector22~2_combout\ : std_logic;
SIGNAL \display|i2c_master_inst|state.rd~regout\ : std_logic;
SIGNAL \display|i2c_master_inst|Selector26~7_combout\ : std_logic;
SIGNAL \display|i2c_master_inst|Mux2~0_combout\ : std_logic;
SIGNAL \display|i2c_master_inst|Mux2~1_combout\ : std_logic;
SIGNAL \display|i2c_master_inst|Selector26~8_combout\ : std_logic;
SIGNAL \display|i2c_master_inst|Selector26~11_combout\ : std_logic;
SIGNAL \display|i2c_master_inst|sda_int~regout\ : std_logic;
SIGNAL \display|i2c_master_inst|Selector32~0_combout\ : std_logic;
SIGNAL \display|logic|lcd_reset~0_combout\ : std_logic;
SIGNAL \display|logic|lcd_reset~regout\ : std_logic;
SIGNAL \ed2|sr\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \display|i2c_master_inst|data_tx\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \display|i2c_master_inst|addr_rw\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \display|i2c_master_inst|data_rx\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \display|i2c_master_inst|bit_cnt\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \display|i2c_master_inst|count_reg\ : std_logic_vector(6 DOWNTO 0);
SIGNAL \ed1|sr\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \tr|i2c_master_inst|data_rx\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \tr|i2c_master_inst|count_reg\ : std_logic_vector(6 DOWNTO 0);
SIGNAL \tr|i2c_master_inst|bit_cnt\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \tr|i2c_master_inst|addr_rw\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \tr|tr_logic|ttemp\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \tr|tr_logic|temp_r2\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \tr|tr_logic|temp_r1\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \tr|delay_timer|counter\ : std_logic_vector(22 DOWNTO 0);
SIGNAL \display|mem|temp_reg|data\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \display|timer2|counter\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \display|wr_logic|i2c_data_wrb\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \display|timer3|counter\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \display|timer1|counter\ : std_logic_vector(17 DOWNTO 0);
SIGNAL \display|wr_logic|current_addr\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \display|mem|char_reg|data\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \display|logic|t_start\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \key~combout\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \sw~combout\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \display|logic|write_start_addr\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \tr|delay_timer|ALT_INV_state.WAITING~regout\ : std_logic;
SIGNAL \display|timer2|ALT_INV_state.WAITING~regout\ : std_logic;
SIGNAL \display|timer3|ALT_INV_state.WAITING~regout\ : std_logic;
SIGNAL \display|i2c_master_inst|ALT_INV_busy_r~regout\ : std_logic;
SIGNAL \display|timer1|ALT_INV_state.WAITING~regout\ : std_logic;
SIGNAL \display|wr_logic|ALT_INV_state.WR_DATA~regout\ : std_logic;

BEGIN

ww_clk <= clk;
ww_sw <= sw;
ww_key <= key;
lcd_reset <= ww_lcd_reset;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\ <= (\display|wr_logic|current_addr\(6) & \display|wr_logic|current_addr\(5) & \display|wr_logic|current_addr\(4) & \display|wr_logic|current_addr\(3) & 
\display|wr_logic|current_addr\(2) & \display|wr_logic|current_addr\(1) & \display|wr_logic|current_addr\(0));

\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a0~portadataout\ <= \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(0);
\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a1\ <= \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(1);
\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a2\ <= \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(2);
\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a3\ <= \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(3);
\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a4\ <= \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(4);
\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a5\ <= \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(5);
\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a6\ <= \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(6);
\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a7\ <= \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(7);
\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a8\ <= \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(8);
\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a9\ <= \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(9);
\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a10\ <= \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(10);
\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a11\ <= \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(11);
\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a12\ <= \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(12);
\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a13\ <= \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(13);

\clk~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \clk~combout\);
\tr|delay_timer|ALT_INV_state.WAITING~regout\ <= NOT \tr|delay_timer|state.WAITING~regout\;
\display|timer2|ALT_INV_state.WAITING~regout\ <= NOT \display|timer2|state.WAITING~regout\;
\display|timer3|ALT_INV_state.WAITING~regout\ <= NOT \display|timer3|state.WAITING~regout\;
\display|i2c_master_inst|ALT_INV_busy_r~regout\ <= NOT \display|i2c_master_inst|busy_r~regout\;
\display|timer1|ALT_INV_state.WAITING~regout\ <= NOT \display|timer1|state.WAITING~regout\;
\display|wr_logic|ALT_INV_state.WR_DATA~regout\ <= NOT \display|wr_logic|state.WR_DATA~regout\;

-- Location: LCFF_X45_Y19_N17
\display|timer1|counter[17]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|timer1|counter[17]~52_combout\,
	sclr => \display|timer1|ALT_INV_state.WAITING~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|timer1|counter\(17));

-- Location: LCFF_X45_Y20_N21
\display|timer1|counter[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|timer1|counter[3]~24_combout\,
	sclr => \display|timer1|ALT_INV_state.WAITING~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|timer1|counter\(3));

-- Location: LCFF_X45_Y19_N7
\display|timer1|counter[12]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|timer1|counter[12]~42_combout\,
	sclr => \display|timer1|ALT_INV_state.WAITING~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|timer1|counter\(12));

-- Location: LCFF_X45_Y19_N11
\display|timer1|counter[14]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|timer1|counter[14]~46_combout\,
	sclr => \display|timer1|ALT_INV_state.WAITING~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|timer1|counter\(14));

-- Location: LCFF_X45_Y19_N13
\display|timer1|counter[15]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|timer1|counter[15]~48_combout\,
	sclr => \display|timer1|ALT_INV_state.WAITING~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|timer1|counter\(15));

-- Location: LCFF_X40_Y19_N9
\display|mem|char_reg|data[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|mem|char_reg|data[5]~0_combout\,
	sdata => \display|mem|char_reg|Mux7~0_combout\,
	sload => \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a9\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|mem|char_reg|data\(5));

-- Location: LCFF_X40_Y19_N3
\display|mem|char_reg|data[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|mem|char_reg|data[4]~1_combout\,
	sdata => \display|mem|char_reg|Mux8~0_combout\,
	sload => \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a9\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|mem|char_reg|data\(4));

-- Location: M4K_X41_Y19
\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a0\ : cycloneii_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init0 => X"00000000003800C003800E00100000000000003800C003800E00100000000000003800C003800E00100000000000003800C003800E00100000000000003800C003800E00100000007001083C3AD1CBC61F1A144303806001807E02D80FE04F815606181C4251083C2CD403D04F0910C000000000003800C003800E00100000000000003C43D37FC20F08142E10804201083C3AD1CBC75F1D146111C846511C3C6DD197C54E28143210D043610CBC39D0CBC34F08143A10B8472113BC2DD0BBC72F1D14611134080000780CC0E3872E15D06E006C0391033872C07B806E02503A",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "Versuch4.Versuch40.rtl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "lcd:display|lcd_memory:mem|lcd_init_rom:rom|altsyncram:Mux10_rtl_0|altsyncram_nkv:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 7,
	port_a_byte_enable_clear => "none",
	port_a_byte_enable_clock => "none",
	port_a_data_in_clear => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 14,
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 127,
	port_a_logical_ram_depth => 128,
	port_a_logical_ram_width => 14,
	port_a_write_enable_clear => "none",
	port_a_write_enable_clock => "none",
	port_b_address_width => 7,
	port_b_data_width => 14,
	ram_block_type => "M4K",
	safe_write => "err_on_2clk")
-- pragma translate_on
PORT MAP (
	clk0 => \clk~clkctrl_outclk\,
	portaaddr => \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\);

-- Location: LCFF_X42_Y21_N1
\display|timer3|counter[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|timer3|counter[0]~16_combout\,
	sclr => \display|timer3|ALT_INV_state.WAITING~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|timer3|counter\(0));

-- Location: LCFF_X42_Y21_N3
\display|timer3|counter[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|timer3|counter[1]~18_combout\,
	sclr => \display|timer3|ALT_INV_state.WAITING~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|timer3|counter\(1));

-- Location: LCFF_X42_Y21_N5
\display|timer3|counter[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|timer3|counter[2]~20_combout\,
	sclr => \display|timer3|ALT_INV_state.WAITING~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|timer3|counter\(2));

-- Location: LCFF_X42_Y21_N7
\display|timer3|counter[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|timer3|counter[3]~22_combout\,
	sclr => \display|timer3|ALT_INV_state.WAITING~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|timer3|counter\(3));

-- Location: LCFF_X42_Y21_N9
\display|timer3|counter[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|timer3|counter[4]~24_combout\,
	sclr => \display|timer3|ALT_INV_state.WAITING~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|timer3|counter\(4));

-- Location: LCFF_X42_Y21_N13
\display|timer3|counter[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|timer3|counter[6]~28_combout\,
	sclr => \display|timer3|ALT_INV_state.WAITING~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|timer3|counter\(6));

-- Location: LCFF_X42_Y21_N11
\display|timer3|counter[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|timer3|counter[5]~26_combout\,
	sclr => \display|timer3|ALT_INV_state.WAITING~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|timer3|counter\(5));

-- Location: LCFF_X42_Y21_N15
\display|timer3|counter[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|timer3|counter[7]~30_combout\,
	sclr => \display|timer3|ALT_INV_state.WAITING~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|timer3|counter\(7));

-- Location: LCFF_X42_Y21_N17
\display|timer3|counter[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|timer3|counter[8]~32_combout\,
	sclr => \display|timer3|ALT_INV_state.WAITING~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|timer3|counter\(8));

-- Location: LCFF_X42_Y21_N19
\display|timer3|counter[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|timer3|counter[9]~34_combout\,
	sclr => \display|timer3|ALT_INV_state.WAITING~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|timer3|counter\(9));

-- Location: LCFF_X42_Y21_N21
\display|timer3|counter[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|timer3|counter[10]~36_combout\,
	sclr => \display|timer3|ALT_INV_state.WAITING~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|timer3|counter\(10));

-- Location: LCFF_X42_Y21_N23
\display|timer3|counter[11]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|timer3|counter[11]~38_combout\,
	sclr => \display|timer3|ALT_INV_state.WAITING~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|timer3|counter\(11));

-- Location: LCFF_X42_Y21_N29
\display|timer3|counter[14]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|timer3|counter[14]~44_combout\,
	sclr => \display|timer3|ALT_INV_state.WAITING~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|timer3|counter\(14));

-- Location: LCFF_X42_Y21_N31
\display|timer3|counter[15]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|timer3|counter[15]~46_combout\,
	sclr => \display|timer3|ALT_INV_state.WAITING~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|timer3|counter\(15));

-- Location: LCFF_X42_Y21_N25
\display|timer3|counter[12]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|timer3|counter[12]~40_combout\,
	sclr => \display|timer3|ALT_INV_state.WAITING~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|timer3|counter\(12));

-- Location: LCFF_X42_Y21_N27
\display|timer3|counter[13]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|timer3|counter[13]~42_combout\,
	sclr => \display|timer3|ALT_INV_state.WAITING~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|timer3|counter\(13));

-- Location: LCFF_X42_Y20_N7
\display|timer2|counter[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|timer2|counter[3]~16_combout\,
	sclr => \display|timer2|ALT_INV_state.WAITING~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|timer2|counter\(3));

-- Location: LCFF_X42_Y20_N13
\display|timer2|counter[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|timer2|counter[6]~22_combout\,
	sclr => \display|timer2|ALT_INV_state.WAITING~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|timer2|counter\(6));

-- Location: LCCOMB_X45_Y20_N20
\display|timer1|counter[3]~24\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|timer1|counter[3]~24_combout\ = (\display|timer1|counter\(3) & (!\display|timer1|counter[2]~23\)) # (!\display|timer1|counter\(3) & ((\display|timer1|counter[2]~23\) # (GND)))
-- \display|timer1|counter[3]~25\ = CARRY((!\display|timer1|counter[2]~23\) # (!\display|timer1|counter\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \display|timer1|counter\(3),
	datad => VCC,
	cin => \display|timer1|counter[2]~23\,
	combout => \display|timer1|counter[3]~24_combout\,
	cout => \display|timer1|counter[3]~25\);

-- Location: LCCOMB_X45_Y19_N6
\display|timer1|counter[12]~42\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|timer1|counter[12]~42_combout\ = (\display|timer1|counter\(12) & (\display|timer1|counter[11]~41\ $ (GND))) # (!\display|timer1|counter\(12) & (!\display|timer1|counter[11]~41\ & VCC))
-- \display|timer1|counter[12]~43\ = CARRY((\display|timer1|counter\(12) & !\display|timer1|counter[11]~41\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \display|timer1|counter\(12),
	datad => VCC,
	cin => \display|timer1|counter[11]~41\,
	combout => \display|timer1|counter[12]~42_combout\,
	cout => \display|timer1|counter[12]~43\);

-- Location: LCCOMB_X45_Y19_N10
\display|timer1|counter[14]~46\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|timer1|counter[14]~46_combout\ = (\display|timer1|counter\(14) & (\display|timer1|counter[13]~45\ $ (GND))) # (!\display|timer1|counter\(14) & (!\display|timer1|counter[13]~45\ & VCC))
-- \display|timer1|counter[14]~47\ = CARRY((\display|timer1|counter\(14) & !\display|timer1|counter[13]~45\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \display|timer1|counter\(14),
	datad => VCC,
	cin => \display|timer1|counter[13]~45\,
	combout => \display|timer1|counter[14]~46_combout\,
	cout => \display|timer1|counter[14]~47\);

-- Location: LCCOMB_X45_Y19_N12
\display|timer1|counter[15]~48\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|timer1|counter[15]~48_combout\ = (\display|timer1|counter\(15) & (!\display|timer1|counter[14]~47\)) # (!\display|timer1|counter\(15) & ((\display|timer1|counter[14]~47\) # (GND)))
-- \display|timer1|counter[15]~49\ = CARRY((!\display|timer1|counter[14]~47\) # (!\display|timer1|counter\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \display|timer1|counter\(15),
	datad => VCC,
	cin => \display|timer1|counter[14]~47\,
	combout => \display|timer1|counter[15]~48_combout\,
	cout => \display|timer1|counter[15]~49\);

-- Location: LCCOMB_X45_Y19_N14
\display|timer1|counter[16]~50\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|timer1|counter[16]~50_combout\ = (\display|timer1|counter\(16) & (\display|timer1|counter[15]~49\ $ (GND))) # (!\display|timer1|counter\(16) & (!\display|timer1|counter[15]~49\ & VCC))
-- \display|timer1|counter[16]~51\ = CARRY((\display|timer1|counter\(16) & !\display|timer1|counter[15]~49\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \display|timer1|counter\(16),
	datad => VCC,
	cin => \display|timer1|counter[15]~49\,
	combout => \display|timer1|counter[16]~50_combout\,
	cout => \display|timer1|counter[16]~51\);

-- Location: LCCOMB_X45_Y19_N16
\display|timer1|counter[17]~52\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|timer1|counter[17]~52_combout\ = \display|timer1|counter\(17) $ (\display|timer1|counter[16]~51\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \display|timer1|counter\(17),
	cin => \display|timer1|counter[16]~51\,
	combout => \display|timer1|counter[17]~52_combout\);

-- Location: LCCOMB_X40_Y19_N8
\display|mem|char_reg|data[5]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|mem|char_reg|data[5]~0_combout\ = (\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a8\ & (\display|mem|char_reg|data_out~0_combout\)) # (!\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a8\ & 
-- ((\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a8\,
	datab => \display|mem|char_reg|data_out~0_combout\,
	datad => \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a5\,
	combout => \display|mem|char_reg|data[5]~0_combout\);

-- Location: LCCOMB_X40_Y19_N2
\display|mem|char_reg|data[4]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|mem|char_reg|data[4]~1_combout\ = (\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a8\ & ((\display|mem|char_reg|data_out~0_combout\))) # (!\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a8\ & 
-- (\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a4\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a4\,
	datab => \display|mem|char_reg|data_out~0_combout\,
	datad => \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a8\,
	combout => \display|mem|char_reg|data[4]~1_combout\);

-- Location: LCCOMB_X42_Y21_N0
\display|timer3|counter[0]~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|timer3|counter[0]~16_combout\ = \display|timer3|counter\(0) $ (VCC)
-- \display|timer3|counter[0]~17\ = CARRY(\display|timer3|counter\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \display|timer3|counter\(0),
	datad => VCC,
	combout => \display|timer3|counter[0]~16_combout\,
	cout => \display|timer3|counter[0]~17\);

-- Location: LCCOMB_X42_Y21_N2
\display|timer3|counter[1]~18\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|timer3|counter[1]~18_combout\ = (\display|timer3|counter\(1) & (!\display|timer3|counter[0]~17\)) # (!\display|timer3|counter\(1) & ((\display|timer3|counter[0]~17\) # (GND)))
-- \display|timer3|counter[1]~19\ = CARRY((!\display|timer3|counter[0]~17\) # (!\display|timer3|counter\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \display|timer3|counter\(1),
	datad => VCC,
	cin => \display|timer3|counter[0]~17\,
	combout => \display|timer3|counter[1]~18_combout\,
	cout => \display|timer3|counter[1]~19\);

-- Location: LCCOMB_X42_Y21_N4
\display|timer3|counter[2]~20\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|timer3|counter[2]~20_combout\ = (\display|timer3|counter\(2) & (\display|timer3|counter[1]~19\ $ (GND))) # (!\display|timer3|counter\(2) & (!\display|timer3|counter[1]~19\ & VCC))
-- \display|timer3|counter[2]~21\ = CARRY((\display|timer3|counter\(2) & !\display|timer3|counter[1]~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \display|timer3|counter\(2),
	datad => VCC,
	cin => \display|timer3|counter[1]~19\,
	combout => \display|timer3|counter[2]~20_combout\,
	cout => \display|timer3|counter[2]~21\);

-- Location: LCCOMB_X42_Y21_N6
\display|timer3|counter[3]~22\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|timer3|counter[3]~22_combout\ = (\display|timer3|counter\(3) & (!\display|timer3|counter[2]~21\)) # (!\display|timer3|counter\(3) & ((\display|timer3|counter[2]~21\) # (GND)))
-- \display|timer3|counter[3]~23\ = CARRY((!\display|timer3|counter[2]~21\) # (!\display|timer3|counter\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \display|timer3|counter\(3),
	datad => VCC,
	cin => \display|timer3|counter[2]~21\,
	combout => \display|timer3|counter[3]~22_combout\,
	cout => \display|timer3|counter[3]~23\);

-- Location: LCCOMB_X42_Y21_N8
\display|timer3|counter[4]~24\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|timer3|counter[4]~24_combout\ = (\display|timer3|counter\(4) & (\display|timer3|counter[3]~23\ $ (GND))) # (!\display|timer3|counter\(4) & (!\display|timer3|counter[3]~23\ & VCC))
-- \display|timer3|counter[4]~25\ = CARRY((\display|timer3|counter\(4) & !\display|timer3|counter[3]~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \display|timer3|counter\(4),
	datad => VCC,
	cin => \display|timer3|counter[3]~23\,
	combout => \display|timer3|counter[4]~24_combout\,
	cout => \display|timer3|counter[4]~25\);

-- Location: LCCOMB_X42_Y21_N10
\display|timer3|counter[5]~26\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|timer3|counter[5]~26_combout\ = (\display|timer3|counter\(5) & (!\display|timer3|counter[4]~25\)) # (!\display|timer3|counter\(5) & ((\display|timer3|counter[4]~25\) # (GND)))
-- \display|timer3|counter[5]~27\ = CARRY((!\display|timer3|counter[4]~25\) # (!\display|timer3|counter\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \display|timer3|counter\(5),
	datad => VCC,
	cin => \display|timer3|counter[4]~25\,
	combout => \display|timer3|counter[5]~26_combout\,
	cout => \display|timer3|counter[5]~27\);

-- Location: LCCOMB_X42_Y21_N12
\display|timer3|counter[6]~28\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|timer3|counter[6]~28_combout\ = (\display|timer3|counter\(6) & (\display|timer3|counter[5]~27\ $ (GND))) # (!\display|timer3|counter\(6) & (!\display|timer3|counter[5]~27\ & VCC))
-- \display|timer3|counter[6]~29\ = CARRY((\display|timer3|counter\(6) & !\display|timer3|counter[5]~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \display|timer3|counter\(6),
	datad => VCC,
	cin => \display|timer3|counter[5]~27\,
	combout => \display|timer3|counter[6]~28_combout\,
	cout => \display|timer3|counter[6]~29\);

-- Location: LCCOMB_X42_Y21_N14
\display|timer3|counter[7]~30\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|timer3|counter[7]~30_combout\ = (\display|timer3|counter\(7) & (!\display|timer3|counter[6]~29\)) # (!\display|timer3|counter\(7) & ((\display|timer3|counter[6]~29\) # (GND)))
-- \display|timer3|counter[7]~31\ = CARRY((!\display|timer3|counter[6]~29\) # (!\display|timer3|counter\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \display|timer3|counter\(7),
	datad => VCC,
	cin => \display|timer3|counter[6]~29\,
	combout => \display|timer3|counter[7]~30_combout\,
	cout => \display|timer3|counter[7]~31\);

-- Location: LCCOMB_X42_Y21_N16
\display|timer3|counter[8]~32\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|timer3|counter[8]~32_combout\ = (\display|timer3|counter\(8) & (\display|timer3|counter[7]~31\ $ (GND))) # (!\display|timer3|counter\(8) & (!\display|timer3|counter[7]~31\ & VCC))
-- \display|timer3|counter[8]~33\ = CARRY((\display|timer3|counter\(8) & !\display|timer3|counter[7]~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \display|timer3|counter\(8),
	datad => VCC,
	cin => \display|timer3|counter[7]~31\,
	combout => \display|timer3|counter[8]~32_combout\,
	cout => \display|timer3|counter[8]~33\);

-- Location: LCCOMB_X42_Y21_N18
\display|timer3|counter[9]~34\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|timer3|counter[9]~34_combout\ = (\display|timer3|counter\(9) & (!\display|timer3|counter[8]~33\)) # (!\display|timer3|counter\(9) & ((\display|timer3|counter[8]~33\) # (GND)))
-- \display|timer3|counter[9]~35\ = CARRY((!\display|timer3|counter[8]~33\) # (!\display|timer3|counter\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \display|timer3|counter\(9),
	datad => VCC,
	cin => \display|timer3|counter[8]~33\,
	combout => \display|timer3|counter[9]~34_combout\,
	cout => \display|timer3|counter[9]~35\);

-- Location: LCCOMB_X42_Y21_N20
\display|timer3|counter[10]~36\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|timer3|counter[10]~36_combout\ = (\display|timer3|counter\(10) & (\display|timer3|counter[9]~35\ $ (GND))) # (!\display|timer3|counter\(10) & (!\display|timer3|counter[9]~35\ & VCC))
-- \display|timer3|counter[10]~37\ = CARRY((\display|timer3|counter\(10) & !\display|timer3|counter[9]~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \display|timer3|counter\(10),
	datad => VCC,
	cin => \display|timer3|counter[9]~35\,
	combout => \display|timer3|counter[10]~36_combout\,
	cout => \display|timer3|counter[10]~37\);

-- Location: LCCOMB_X42_Y21_N22
\display|timer3|counter[11]~38\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|timer3|counter[11]~38_combout\ = (\display|timer3|counter\(11) & (!\display|timer3|counter[10]~37\)) # (!\display|timer3|counter\(11) & ((\display|timer3|counter[10]~37\) # (GND)))
-- \display|timer3|counter[11]~39\ = CARRY((!\display|timer3|counter[10]~37\) # (!\display|timer3|counter\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \display|timer3|counter\(11),
	datad => VCC,
	cin => \display|timer3|counter[10]~37\,
	combout => \display|timer3|counter[11]~38_combout\,
	cout => \display|timer3|counter[11]~39\);

-- Location: LCCOMB_X42_Y21_N24
\display|timer3|counter[12]~40\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|timer3|counter[12]~40_combout\ = (\display|timer3|counter\(12) & (\display|timer3|counter[11]~39\ $ (GND))) # (!\display|timer3|counter\(12) & (!\display|timer3|counter[11]~39\ & VCC))
-- \display|timer3|counter[12]~41\ = CARRY((\display|timer3|counter\(12) & !\display|timer3|counter[11]~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \display|timer3|counter\(12),
	datad => VCC,
	cin => \display|timer3|counter[11]~39\,
	combout => \display|timer3|counter[12]~40_combout\,
	cout => \display|timer3|counter[12]~41\);

-- Location: LCCOMB_X42_Y21_N26
\display|timer3|counter[13]~42\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|timer3|counter[13]~42_combout\ = (\display|timer3|counter\(13) & (!\display|timer3|counter[12]~41\)) # (!\display|timer3|counter\(13) & ((\display|timer3|counter[12]~41\) # (GND)))
-- \display|timer3|counter[13]~43\ = CARRY((!\display|timer3|counter[12]~41\) # (!\display|timer3|counter\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \display|timer3|counter\(13),
	datad => VCC,
	cin => \display|timer3|counter[12]~41\,
	combout => \display|timer3|counter[13]~42_combout\,
	cout => \display|timer3|counter[13]~43\);

-- Location: LCCOMB_X42_Y21_N28
\display|timer3|counter[14]~44\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|timer3|counter[14]~44_combout\ = (\display|timer3|counter\(14) & (\display|timer3|counter[13]~43\ $ (GND))) # (!\display|timer3|counter\(14) & (!\display|timer3|counter[13]~43\ & VCC))
-- \display|timer3|counter[14]~45\ = CARRY((\display|timer3|counter\(14) & !\display|timer3|counter[13]~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \display|timer3|counter\(14),
	datad => VCC,
	cin => \display|timer3|counter[13]~43\,
	combout => \display|timer3|counter[14]~44_combout\,
	cout => \display|timer3|counter[14]~45\);

-- Location: LCCOMB_X42_Y21_N30
\display|timer3|counter[15]~46\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|timer3|counter[15]~46_combout\ = \display|timer3|counter[14]~45\ $ (\display|timer3|counter\(15))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \display|timer3|counter\(15),
	cin => \display|timer3|counter[14]~45\,
	combout => \display|timer3|counter[15]~46_combout\);

-- Location: LCCOMB_X42_Y20_N6
\display|timer2|counter[3]~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|timer2|counter[3]~16_combout\ = (\display|timer2|counter\(3) & (!\display|timer2|counter[2]~15\)) # (!\display|timer2|counter\(3) & ((\display|timer2|counter[2]~15\) # (GND)))
-- \display|timer2|counter[3]~17\ = CARRY((!\display|timer2|counter[2]~15\) # (!\display|timer2|counter\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \display|timer2|counter\(3),
	datad => VCC,
	cin => \display|timer2|counter[2]~15\,
	combout => \display|timer2|counter[3]~16_combout\,
	cout => \display|timer2|counter[3]~17\);

-- Location: LCCOMB_X42_Y20_N12
\display|timer2|counter[6]~22\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|timer2|counter[6]~22_combout\ = (\display|timer2|counter\(6) & (\display|timer2|counter[5]~21\ $ (GND))) # (!\display|timer2|counter\(6) & (!\display|timer2|counter[5]~21\ & VCC))
-- \display|timer2|counter[6]~23\ = CARRY((\display|timer2|counter\(6) & !\display|timer2|counter[5]~21\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \display|timer2|counter\(6),
	datad => VCC,
	cin => \display|timer2|counter[5]~21\,
	combout => \display|timer2|counter[6]~22_combout\,
	cout => \display|timer2|counter[6]~23\);

-- Location: LCFF_X38_Y24_N13
\tr|delay_timer|counter[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \tr|delay_timer|counter[1]~25_combout\,
	sclr => \tr|delay_timer|ALT_INV_state.WAITING~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \tr|delay_timer|counter\(1));

-- Location: LCFF_X38_Y24_N25
\tr|delay_timer|counter[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \tr|delay_timer|counter[7]~37_combout\,
	sclr => \tr|delay_timer|ALT_INV_state.WAITING~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \tr|delay_timer|counter\(7));

-- Location: LCFF_X38_Y23_N7
\tr|delay_timer|counter[14]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \tr|delay_timer|counter[14]~51_combout\,
	sclr => \tr|delay_timer|ALT_INV_state.WAITING~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \tr|delay_timer|counter\(14));

-- Location: LCFF_X38_Y23_N13
\tr|delay_timer|counter[17]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \tr|delay_timer|counter[17]~57_combout\,
	sclr => \tr|delay_timer|ALT_INV_state.WAITING~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \tr|delay_timer|counter\(17));

-- Location: LCCOMB_X38_Y24_N12
\tr|delay_timer|counter[1]~25\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|delay_timer|counter[1]~25_combout\ = (\tr|delay_timer|counter\(1) & (!\tr|delay_timer|counter[0]~24\)) # (!\tr|delay_timer|counter\(1) & ((\tr|delay_timer|counter[0]~24\) # (GND)))
-- \tr|delay_timer|counter[1]~26\ = CARRY((!\tr|delay_timer|counter[0]~24\) # (!\tr|delay_timer|counter\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \tr|delay_timer|counter\(1),
	datad => VCC,
	cin => \tr|delay_timer|counter[0]~24\,
	combout => \tr|delay_timer|counter[1]~25_combout\,
	cout => \tr|delay_timer|counter[1]~26\);

-- Location: LCCOMB_X38_Y24_N24
\tr|delay_timer|counter[7]~37\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|delay_timer|counter[7]~37_combout\ = (\tr|delay_timer|counter\(7) & (!\tr|delay_timer|counter[6]~36\)) # (!\tr|delay_timer|counter\(7) & ((\tr|delay_timer|counter[6]~36\) # (GND)))
-- \tr|delay_timer|counter[7]~38\ = CARRY((!\tr|delay_timer|counter[6]~36\) # (!\tr|delay_timer|counter\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \tr|delay_timer|counter\(7),
	datad => VCC,
	cin => \tr|delay_timer|counter[6]~36\,
	combout => \tr|delay_timer|counter[7]~37_combout\,
	cout => \tr|delay_timer|counter[7]~38\);

-- Location: LCCOMB_X38_Y23_N6
\tr|delay_timer|counter[14]~51\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|delay_timer|counter[14]~51_combout\ = (\tr|delay_timer|counter\(14) & (\tr|delay_timer|counter[13]~50\ $ (GND))) # (!\tr|delay_timer|counter\(14) & (!\tr|delay_timer|counter[13]~50\ & VCC))
-- \tr|delay_timer|counter[14]~52\ = CARRY((\tr|delay_timer|counter\(14) & !\tr|delay_timer|counter[13]~50\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \tr|delay_timer|counter\(14),
	datad => VCC,
	cin => \tr|delay_timer|counter[13]~50\,
	combout => \tr|delay_timer|counter[14]~51_combout\,
	cout => \tr|delay_timer|counter[14]~52\);

-- Location: LCCOMB_X38_Y23_N12
\tr|delay_timer|counter[17]~57\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|delay_timer|counter[17]~57_combout\ = (\tr|delay_timer|counter\(17) & (!\tr|delay_timer|counter[16]~56\)) # (!\tr|delay_timer|counter\(17) & ((\tr|delay_timer|counter[16]~56\) # (GND)))
-- \tr|delay_timer|counter[17]~58\ = CARRY((!\tr|delay_timer|counter[16]~56\) # (!\tr|delay_timer|counter\(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \tr|delay_timer|counter\(17),
	datad => VCC,
	cin => \tr|delay_timer|counter[16]~56\,
	combout => \tr|delay_timer|counter[17]~57_combout\,
	cout => \tr|delay_timer|counter[17]~58\);

-- Location: LCFF_X46_Y20_N25
\display|logic|do_reset\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|logic|do_reset_next~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|logic|do_reset~regout\);

-- Location: LCCOMB_X35_Y21_N24
\tr|i2c_master_inst|LessThan1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|i2c_master_inst|LessThan1~0_combout\ = (\tr|i2c_master_inst|count_reg\(3) & (\tr|i2c_master_inst|count_reg\(1) & (\tr|i2c_master_inst|count_reg\(4) & \tr|i2c_master_inst|count_reg\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tr|i2c_master_inst|count_reg\(3),
	datab => \tr|i2c_master_inst|count_reg\(1),
	datac => \tr|i2c_master_inst|count_reg\(4),
	datad => \tr|i2c_master_inst|count_reg\(2),
	combout => \tr|i2c_master_inst|LessThan1~0_combout\);

-- Location: LCCOMB_X34_Y24_N24
\display|i2c_master_inst|LessThan1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|i2c_master_inst|LessThan1~0_combout\ = (\display|i2c_master_inst|count_reg\(1) & (\display|i2c_master_inst|count_reg\(4) & (\display|i2c_master_inst|count_reg\(2) & \display|i2c_master_inst|count_reg\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|i2c_master_inst|count_reg\(1),
	datab => \display|i2c_master_inst|count_reg\(4),
	datac => \display|i2c_master_inst|count_reg\(2),
	datad => \display|i2c_master_inst|count_reg\(3),
	combout => \display|i2c_master_inst|LessThan1~0_combout\);

-- Location: LCCOMB_X43_Y20_N12
\display|logic|do_reset_next~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|logic|do_reset_next~0_combout\ = (\display|logic|do_reset~regout\ & ((\display|logic|update_char~regout\) # ((\display|logic|update_temp~regout\) # (!\display|logic|state.WAIT_MAIN~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|logic|do_reset~regout\,
	datab => \display|logic|update_char~regout\,
	datac => \display|logic|update_temp~regout\,
	datad => \display|logic|state.WAIT_MAIN~regout\,
	combout => \display|logic|do_reset_next~0_combout\);

-- Location: LCFF_X46_Y20_N3
\ed1|sr[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \ed1|sr[2]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ed1|sr\(2));

-- Location: LCFF_X46_Y20_N29
\ed1|sr[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \ed1|sr[1]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ed1|sr\(1));

-- Location: LCCOMB_X46_Y20_N24
\display|logic|do_reset_next~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|logic|do_reset_next~1_combout\ = (\display|logic|do_reset_next~0_combout\) # ((!\ed1|sr\(1) & (!\display|logic|do_reset~regout\ & \ed1|sr\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|logic|do_reset_next~0_combout\,
	datab => \ed1|sr\(1),
	datac => \display|logic|do_reset~regout\,
	datad => \ed1|sr\(2),
	combout => \display|logic|do_reset_next~1_combout\);

-- Location: LCCOMB_X36_Y21_N16
\tr|i2c_master_inst|Decoder0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|i2c_master_inst|Decoder0~0_combout\ = (\tr|i2c_master_inst|data_clk_prev~regout\ & !\tr|i2c_master_inst|scl_ena~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \tr|i2c_master_inst|data_clk_prev~regout\,
	datad => \tr|i2c_master_inst|scl_ena~0_combout\,
	combout => \tr|i2c_master_inst|Decoder0~0_combout\);

-- Location: LCFF_X37_Y23_N9
\tr|tr_logic|i2c_l_rw\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \tr|tr_logic|Selector8~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \tr|tr_logic|i2c_l_rw~regout\);

-- Location: LCCOMB_X36_Y21_N20
\tr|i2c_master_inst|data_rx[7]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|i2c_master_inst|data_rx[7]~0_combout\ = (!\tr|i2c_master_inst|bit_cnt\(1) & (!\tr|i2c_master_inst|bit_cnt\(0) & !\tr|i2c_master_inst|bit_cnt\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tr|i2c_master_inst|bit_cnt\(1),
	datab => \tr|i2c_master_inst|bit_cnt\(0),
	datac => \tr|i2c_master_inst|bit_cnt\(2),
	combout => \tr|i2c_master_inst|data_rx[7]~0_combout\);

-- Location: LCCOMB_X36_Y22_N10
\tr|i2c_master_inst|Selector26~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|i2c_master_inst|Selector26~3_combout\ = (\tr|i2c_master_inst|data_rx[7]~0_combout\ & ((\tr|i2c_master_inst|state.start~regout\) # ((\tr|i2c_master_inst|Equal0~0_combout\ & \tr|i2c_master_inst|state.wr~regout\)))) # 
-- (!\tr|i2c_master_inst|data_rx[7]~0_combout\ & (\tr|i2c_master_inst|Equal0~0_combout\ & ((\tr|i2c_master_inst|state.wr~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tr|i2c_master_inst|data_rx[7]~0_combout\,
	datab => \tr|i2c_master_inst|Equal0~0_combout\,
	datac => \tr|i2c_master_inst|state.start~regout\,
	datad => \tr|i2c_master_inst|state.wr~regout\,
	combout => \tr|i2c_master_inst|Selector26~3_combout\);

-- Location: LCCOMB_X36_Y22_N6
\tr|i2c_master_inst|Selector26~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|i2c_master_inst|Selector26~4_combout\ = (\tr|i2c_master_inst|Selector26~3_combout\) # (((\tr|i2c_master_inst|Selector24~0_combout\ & \tr|i2c_master_inst|process_3~0_combout\)) # (!\tr|i2c_master_inst|Selector22~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tr|i2c_master_inst|Selector26~3_combout\,
	datab => \tr|i2c_master_inst|Selector24~0_combout\,
	datac => \tr|i2c_master_inst|process_3~0_combout\,
	datad => \tr|i2c_master_inst|Selector22~0_combout\,
	combout => \tr|i2c_master_inst|Selector26~4_combout\);

-- Location: LCFF_X34_Y24_N27
\display|i2c_master_inst|stretch_reg\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|i2c_master_inst|stretch_reg~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|i2c_master_inst|stretch_reg~regout\);

-- Location: LCCOMB_X35_Y23_N12
\display|i2c_master_inst|Selector18~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|i2c_master_inst|Selector18~0_combout\ = (\display|i2c_master_inst|state.mstr_ack~regout\ & ((\display|wr_logic|i2c_rwb~regout\ $ (\display|i2c_master_inst|addr_rw\(0))))) # (!\display|i2c_master_inst|state.mstr_ack~regout\ & 
-- (\display|i2c_master_inst|state.slv_ack2~regout\ & (\display|wr_logic|i2c_rwb~regout\ $ (\display|i2c_master_inst|addr_rw\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|i2c_master_inst|state.mstr_ack~regout\,
	datab => \display|i2c_master_inst|state.slv_ack2~regout\,
	datac => \display|wr_logic|i2c_rwb~regout\,
	datad => \display|i2c_master_inst|addr_rw\(0),
	combout => \display|i2c_master_inst|Selector18~0_combout\);

-- Location: LCCOMB_X35_Y23_N0
\display|i2c_master_inst|Selector26~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|i2c_master_inst|Selector26~3_combout\ = (\display|i2c_master_inst|state.slv_ack2~regout\ & ((\display|wr_logic|i2c_rwb~regout\ $ (\display|i2c_master_inst|addr_rw\(0))) # (!\display|wr_logic|i2c_en~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|wr_logic|i2c_en~regout\,
	datab => \display|i2c_master_inst|state.slv_ack2~regout\,
	datac => \display|wr_logic|i2c_rwb~regout\,
	datad => \display|i2c_master_inst|addr_rw\(0),
	combout => \display|i2c_master_inst|Selector26~3_combout\);

-- Location: LCCOMB_X35_Y24_N10
\display|i2c_master_inst|Selector26~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|i2c_master_inst|Selector26~4_combout\ = ((\display|i2c_master_inst|Selector26~3_combout\) # ((\display|i2c_master_inst|state.stop~regout\) # (\display|i2c_master_inst|state.mstr_ack~regout\))) # (!\display|i2c_master_inst|state.ready~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|i2c_master_inst|state.ready~regout\,
	datab => \display|i2c_master_inst|Selector26~3_combout\,
	datac => \display|i2c_master_inst|state.stop~regout\,
	datad => \display|i2c_master_inst|state.mstr_ack~regout\,
	combout => \display|i2c_master_inst|Selector26~4_combout\);

-- Location: LCFF_X36_Y23_N29
\display|i2c_master_inst|data_tx[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \display|wr_logic|i2c_data_wrb\(0),
	sload => VCC,
	ena => \display|i2c_master_inst|addr_rw[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|i2c_master_inst|data_tx\(0));

-- Location: LCFF_X39_Y19_N25
\display|wr_logic|i2c_data_wrb[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|wr_logic|Selector28~0_combout\,
	ena => \display|wr_logic|i2c_data_wrb[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|wr_logic|i2c_data_wrb\(0));

-- Location: LCCOMB_X36_Y23_N26
\display|i2c_master_inst|Mux4~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|i2c_master_inst|Mux4~2_combout\ = (\display|i2c_master_inst|bit_cnt\(1) & ((\display|i2c_master_inst|bit_cnt\(0) & (\display|wr_logic|i2c_data_wrb\(0))) # (!\display|i2c_master_inst|bit_cnt\(0) & ((\display|wr_logic|i2c_data_wrb\(1)))))) # 
-- (!\display|i2c_master_inst|bit_cnt\(1) & (((!\display|i2c_master_inst|bit_cnt\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000111110000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|i2c_master_inst|bit_cnt\(1),
	datab => \display|wr_logic|i2c_data_wrb\(0),
	datac => \display|i2c_master_inst|bit_cnt\(0),
	datad => \display|wr_logic|i2c_data_wrb\(1),
	combout => \display|i2c_master_inst|Mux4~2_combout\);

-- Location: LCCOMB_X36_Y23_N12
\display|i2c_master_inst|Mux4~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|i2c_master_inst|Mux4~3_combout\ = (\display|i2c_master_inst|bit_cnt\(1) & (((\display|i2c_master_inst|Mux4~2_combout\)))) # (!\display|i2c_master_inst|bit_cnt\(1) & ((\display|i2c_master_inst|Mux4~2_combout\ & 
-- ((\display|wr_logic|i2c_data_wrb\(3)))) # (!\display|i2c_master_inst|Mux4~2_combout\ & (\display|wr_logic|i2c_data_wrb\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|i2c_master_inst|bit_cnt\(1),
	datab => \display|wr_logic|i2c_data_wrb\(2),
	datac => \display|wr_logic|i2c_data_wrb\(3),
	datad => \display|i2c_master_inst|Mux4~2_combout\,
	combout => \display|i2c_master_inst|Mux4~3_combout\);

-- Location: LCCOMB_X35_Y23_N6
\display|i2c_master_inst|Selector26~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|i2c_master_inst|Selector26~9_combout\ = (\display|i2c_master_inst|bit_cnt\(2) & (\display|i2c_master_inst|Mux4~3_combout\ & (!\display|i2c_master_inst|process_3~0_combout\ & \display|i2c_master_inst|state.slv_ack2~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|i2c_master_inst|bit_cnt\(2),
	datab => \display|i2c_master_inst|Mux4~3_combout\,
	datac => \display|i2c_master_inst|process_3~0_combout\,
	datad => \display|i2c_master_inst|state.slv_ack2~regout\,
	combout => \display|i2c_master_inst|Selector26~9_combout\);

-- Location: LCCOMB_X36_Y23_N28
\display|i2c_master_inst|Mux2~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|i2c_master_inst|Mux2~2_combout\ = (\display|i2c_master_inst|bit_cnt\(0) & (\display|i2c_master_inst|bit_cnt\(1) & (\display|i2c_master_inst|data_tx\(0)))) # (!\display|i2c_master_inst|bit_cnt\(0) & (((\display|i2c_master_inst|data_tx\(1))) # 
-- (!\display|i2c_master_inst|bit_cnt\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101010110010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|i2c_master_inst|bit_cnt\(0),
	datab => \display|i2c_master_inst|bit_cnt\(1),
	datac => \display|i2c_master_inst|data_tx\(0),
	datad => \display|i2c_master_inst|data_tx\(1),
	combout => \display|i2c_master_inst|Mux2~2_combout\);

-- Location: LCCOMB_X36_Y23_N0
\display|i2c_master_inst|Mux2~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|i2c_master_inst|Mux2~3_combout\ = (\display|i2c_master_inst|bit_cnt\(1) & (\display|i2c_master_inst|Mux2~2_combout\)) # (!\display|i2c_master_inst|bit_cnt\(1) & ((\display|i2c_master_inst|Mux2~2_combout\ & (\display|i2c_master_inst|data_tx\(3))) 
-- # (!\display|i2c_master_inst|Mux2~2_combout\ & ((\display|i2c_master_inst|data_tx\(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|i2c_master_inst|bit_cnt\(1),
	datab => \display|i2c_master_inst|Mux2~2_combout\,
	datac => \display|i2c_master_inst|data_tx\(3),
	datad => \display|i2c_master_inst|data_tx\(2),
	combout => \display|i2c_master_inst|Mux2~3_combout\);

-- Location: LCCOMB_X35_Y23_N24
\display|i2c_master_inst|Selector26~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|i2c_master_inst|Selector26~10_combout\ = (\display|i2c_master_inst|Selector26~9_combout\) # ((\display|i2c_master_inst|Mux2~3_combout\ & (\display|i2c_master_inst|state.slv_ack1~regout\ & \display|i2c_master_inst|bit_cnt\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|i2c_master_inst|Mux2~3_combout\,
	datab => \display|i2c_master_inst|Selector26~9_combout\,
	datac => \display|i2c_master_inst|state.slv_ack1~regout\,
	datad => \display|i2c_master_inst|bit_cnt\(2),
	combout => \display|i2c_master_inst|Selector26~10_combout\);

-- Location: LCCOMB_X45_Y19_N24
\display|timer1|Equal0~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|timer1|Equal0~3_combout\ = (\display|timer1|counter\(14) & (\display|timer1|counter\(15) & (!\display|timer1|counter\(13) & \display|timer1|counter\(12))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|timer1|counter\(14),
	datab => \display|timer1|counter\(15),
	datac => \display|timer1|counter\(13),
	datad => \display|timer1|counter\(12),
	combout => \display|timer1|Equal0~3_combout\);

-- Location: LCFF_X46_Y20_N7
\ed1|sr[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \ed1|sr[0]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ed1|sr\(0));

-- Location: LCFF_X42_Y19_N17
\display|mem|char_reg|data[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|mem|char_reg|Mux5~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|mem|char_reg|data\(7));

-- Location: LCFF_X38_Y21_N17
\display|mem|temp_reg|data[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|mem|temp_reg|Mux1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|mem|temp_reg|data\(7));

-- Location: LCCOMB_X39_Y19_N6
\display|mem|mem_mux|data[7]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|mem|mem_mux|data[7]~2_combout\ = (\display|wr_logic|current_addr\(7) & ((\display|wr_logic|current_addr\(6) & (\display|mem|char_reg|data\(7))) # (!\display|wr_logic|current_addr\(6) & ((\display|mem|temp_reg|data\(7))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|wr_logic|current_addr\(6),
	datab => \display|wr_logic|current_addr\(7),
	datac => \display|mem|char_reg|data\(7),
	datad => \display|mem|temp_reg|data\(7),
	combout => \display|mem|mem_mux|data[7]~2_combout\);

-- Location: LCCOMB_X39_Y19_N16
\display|wr_logic|process_1~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|wr_logic|process_1~2_combout\ = (!\display|mem|mem_mux|data[7]~2_combout\ & (!\display|mem|mem_mux|data[6]~1_combout\ & ((\display|wr_logic|current_addr\(7)) # (!\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a7\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|mem|mem_mux|data[7]~2_combout\,
	datab => \display|wr_logic|current_addr\(7),
	datac => \display|mem|mem_mux|data[6]~1_combout\,
	datad => \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a7\,
	combout => \display|wr_logic|process_1~2_combout\);

-- Location: LCCOMB_X40_Y19_N16
\display|mem|mem_mux|data[5]~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|mem|mem_mux|data[5]~3_combout\ = (\display|wr_logic|current_addr\(7) & ((\display|wr_logic|current_addr\(6) & (\display|mem|char_reg|data\(5))) # (!\display|wr_logic|current_addr\(6) & 
-- ((\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a12\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|wr_logic|current_addr\(6),
	datab => \display|mem|char_reg|data\(5),
	datac => \display|wr_logic|current_addr\(7),
	datad => \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a12\,
	combout => \display|mem|mem_mux|data[5]~3_combout\);

-- Location: LCCOMB_X40_Y19_N10
\display|mem|mem_mux|data[5]~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|mem|mem_mux|data[5]~4_combout\ = (\display|mem|mem_mux|data[5]~3_combout\) # ((!\display|wr_logic|current_addr\(7) & \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|mem|mem_mux|data[5]~3_combout\,
	datac => \display|wr_logic|current_addr\(7),
	datad => \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a5\,
	combout => \display|mem|mem_mux|data[5]~4_combout\);

-- Location: LCCOMB_X40_Y19_N20
\display|mem|mem_mux|data[4]~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|mem|mem_mux|data[4]~5_combout\ = (\display|wr_logic|current_addr\(7) & ((\display|wr_logic|current_addr\(6) & (\display|mem|char_reg|data\(4))) # (!\display|wr_logic|current_addr\(6) & 
-- ((\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a11\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|wr_logic|current_addr\(6),
	datab => \display|mem|char_reg|data\(4),
	datac => \display|wr_logic|current_addr\(7),
	datad => \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a11\,
	combout => \display|mem|mem_mux|data[4]~5_combout\);

-- Location: LCCOMB_X40_Y19_N24
\display|wr_logic|process_1~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|wr_logic|process_1~3_combout\ = (\display|wr_logic|process_1~2_combout\ & (!\display|mem|mem_mux|data[4]~6_combout\ & !\display|mem|mem_mux|data[5]~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \display|wr_logic|process_1~2_combout\,
	datac => \display|mem|mem_mux|data[4]~6_combout\,
	datad => \display|mem|mem_mux|data[5]~4_combout\,
	combout => \display|wr_logic|process_1~3_combout\);

-- Location: LCFF_X38_Y19_N27
\display|mem|char_reg|data[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|mem|char_reg|Mux10~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|mem|char_reg|data\(2));

-- Location: LCFF_X38_Y21_N3
\display|mem|temp_reg|data[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|mem|temp_reg|Mux5~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|mem|temp_reg|data\(2));

-- Location: LCCOMB_X38_Y19_N12
\display|mem|mem_mux|data[2]~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|mem|mem_mux|data[2]~7_combout\ = (\display|wr_logic|current_addr\(7) & ((\display|wr_logic|current_addr\(6) & (\display|mem|char_reg|data\(2))) # (!\display|wr_logic|current_addr\(6) & ((\display|mem|temp_reg|data\(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000101010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|wr_logic|current_addr\(7),
	datab => \display|mem|char_reg|data\(2),
	datac => \display|wr_logic|current_addr\(6),
	datad => \display|mem|temp_reg|data\(2),
	combout => \display|mem|mem_mux|data[2]~7_combout\);

-- Location: LCFF_X38_Y21_N5
\display|mem|temp_reg|data[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|mem|temp_reg|Mux6~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|mem|temp_reg|data\(1));

-- Location: LCFF_X36_Y19_N3
\display|mem|char_reg|data[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|mem|char_reg|Mux12~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|mem|char_reg|data\(0));

-- Location: LCFF_X38_Y21_N25
\display|mem|temp_reg|data[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|mem|temp_reg|Mux4~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|mem|temp_reg|data\(3));

-- Location: LCCOMB_X43_Y21_N22
\display|timer3|Equal0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|timer3|Equal0~0_combout\ = (!\display|timer3|counter\(0) & (!\display|timer3|counter\(3) & (!\display|timer3|counter\(2) & !\display|timer3|counter\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|timer3|counter\(0),
	datab => \display|timer3|counter\(3),
	datac => \display|timer3|counter\(2),
	datad => \display|timer3|counter\(1),
	combout => \display|timer3|Equal0~0_combout\);

-- Location: LCCOMB_X43_Y21_N24
\display|timer3|Equal0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|timer3|Equal0~1_combout\ = (\display|timer3|counter\(6) & (!\display|timer3|counter\(7) & (!\display|timer3|counter\(5) & \display|timer3|counter\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|timer3|counter\(6),
	datab => \display|timer3|counter\(7),
	datac => \display|timer3|counter\(5),
	datad => \display|timer3|counter\(4),
	combout => \display|timer3|Equal0~1_combout\);

-- Location: LCCOMB_X43_Y21_N2
\display|timer3|Equal0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|timer3|Equal0~2_combout\ = (!\display|timer3|counter\(11) & (\display|timer3|counter\(9) & (!\display|timer3|counter\(10) & \display|timer3|counter\(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|timer3|counter\(11),
	datab => \display|timer3|counter\(9),
	datac => \display|timer3|counter\(10),
	datad => \display|timer3|counter\(8),
	combout => \display|timer3|Equal0~2_combout\);

-- Location: LCCOMB_X43_Y21_N4
\display|timer3|Equal0~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|timer3|Equal0~3_combout\ = (\display|timer3|counter\(14) & (!\display|timer3|counter\(13) & (\display|timer3|counter\(15) & !\display|timer3|counter\(12))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|timer3|counter\(14),
	datab => \display|timer3|counter\(13),
	datac => \display|timer3|counter\(15),
	datad => \display|timer3|counter\(12),
	combout => \display|timer3|Equal0~3_combout\);

-- Location: LCCOMB_X43_Y21_N6
\display|timer3|Equal0~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|timer3|Equal0~4_combout\ = (\display|timer3|Equal0~1_combout\ & (\display|timer3|Equal0~2_combout\ & (\display|timer3|Equal0~3_combout\ & \display|timer3|Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|timer3|Equal0~1_combout\,
	datab => \display|timer3|Equal0~2_combout\,
	datac => \display|timer3|Equal0~3_combout\,
	datad => \display|timer3|Equal0~0_combout\,
	combout => \display|timer3|Equal0~4_combout\);

-- Location: LCCOMB_X42_Y20_N24
\display|timer2|Equal0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|timer2|Equal0~0_combout\ = (\display|timer2|counter\(3) & (!\display|timer2|counter\(1) & (!\display|timer2|counter\(2) & !\display|timer2|counter\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|timer2|counter\(3),
	datab => \display|timer2|counter\(1),
	datac => \display|timer2|counter\(2),
	datad => \display|timer2|counter\(0),
	combout => \display|timer2|Equal0~0_combout\);

-- Location: LCCOMB_X37_Y23_N8
\tr|tr_logic|Selector8~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|tr_logic|Selector8~0_combout\ = (\tr|tr_logic|state.WRITE_COMPLETE~regout\) # ((!\tr|tr_logic|state.IDLE~regout\ & \tr|tr_logic|i2c_l_rw~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \tr|tr_logic|state.IDLE~regout\,
	datac => \tr|tr_logic|i2c_l_rw~regout\,
	datad => \tr|tr_logic|state.WRITE_COMPLETE~regout\,
	combout => \tr|tr_logic|Selector8~0_combout\);

-- Location: LCCOMB_X34_Y24_N26
\display|i2c_master_inst|stretch_reg~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|i2c_master_inst|stretch_reg~0_combout\ = (\display|i2c_master_inst|process_1~3_combout\ & ((\display|i2c_master_inst|stretch_reg~regout\))) # (!\display|i2c_master_inst|process_1~3_combout\ & (!\lcd_scl~0\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lcd_scl~0\,
	datac => \display|i2c_master_inst|stretch_reg~regout\,
	datad => \display|i2c_master_inst|process_1~3_combout\,
	combout => \display|i2c_master_inst|stretch_reg~0_combout\);

-- Location: LCCOMB_X39_Y20_N28
\display|wr_logic|Selector19~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|wr_logic|Selector19~0_combout\ = (\display|wr_logic|state.WR_CONTROL~regout\) # ((\display|wr_logic|state.RD_STATUS_WR~regout\) # ((!\display|wr_logic|state.WR_DATA_BUSY~regout\ & !\display|wr_logic|state.RD_STATUS_RD_BUSY~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|wr_logic|state.WR_CONTROL~regout\,
	datab => \display|wr_logic|state.RD_STATUS_WR~regout\,
	datac => \display|wr_logic|state.WR_DATA_BUSY~regout\,
	datad => \display|wr_logic|state.RD_STATUS_RD_BUSY~regout\,
	combout => \display|wr_logic|Selector19~0_combout\);

-- Location: LCCOMB_X35_Y24_N28
\display|i2c_master_inst|addr_rw[0]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|i2c_master_inst|addr_rw[0]~0_combout\ = ((!\display|i2c_master_inst|state.mstr_ack~regout\ & (!\display|i2c_master_inst|state.slv_ack2~regout\ & \display|i2c_master_inst|state.ready~regout\))) # (!\display|wr_logic|i2c_en~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|i2c_master_inst|state.mstr_ack~regout\,
	datab => \display|i2c_master_inst|state.slv_ack2~regout\,
	datac => \display|wr_logic|i2c_en~regout\,
	datad => \display|i2c_master_inst|state.ready~regout\,
	combout => \display|i2c_master_inst|addr_rw[0]~0_combout\);

-- Location: LCCOMB_X39_Y19_N20
\display|wr_logic|Selector16~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|wr_logic|Selector16~0_combout\ = (\display|i2c_master_inst|busy_r~regout\ & \display|wr_logic|state.WR_CONTROL_BUSY~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \display|i2c_master_inst|busy_r~regout\,
	datad => \display|wr_logic|state.WR_CONTROL_BUSY~regout\,
	combout => \display|wr_logic|Selector16~0_combout\);

-- Location: LCCOMB_X39_Y19_N24
\display|wr_logic|Selector28~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|wr_logic|Selector28~0_combout\ = (\display|wr_logic|state.WR_CONTROL_BUSY~regout\ & ((\display|mem|mem_mux|data[0]~10_combout\) # ((\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a0~portadataout\ & !\display|wr_logic|current_addr\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|wr_logic|state.WR_CONTROL_BUSY~regout\,
	datab => \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a0~portadataout\,
	datac => \display|wr_logic|current_addr\(7),
	datad => \display|mem|mem_mux|data[0]~10_combout\,
	combout => \display|wr_logic|Selector28~0_combout\);

-- Location: LCCOMB_X45_Y19_N20
\display|timer1|Equal0~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|timer1|Equal0~5_combout\ = (\display|timer1|counter\(17) & (\display|timer1|counter\(16) & \display|timer1|Equal0~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|timer1|counter\(17),
	datac => \display|timer1|counter\(16),
	datad => \display|timer1|Equal0~4_combout\,
	combout => \display|timer1|Equal0~5_combout\);

-- Location: LCCOMB_X36_Y19_N12
\display|mem|char_reg|Mux6~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|mem|char_reg|Mux6~0_combout\ = (!\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a2\ & (\sw~combout\(3) & ((\sw~combout\(1)) # (\sw~combout\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a2\,
	datab => \sw~combout\(3),
	datac => \sw~combout\(1),
	datad => \sw~combout\(2),
	combout => \display|mem|char_reg|Mux6~0_combout\);

-- Location: LCCOMB_X36_Y19_N6
\display|mem|char_reg|Mux6~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|mem|char_reg|Mux6~1_combout\ = (!\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a9\ & ((\display|mem|char_reg|Mux6~0_combout\) # ((\display|mem|char_reg|LessThan0~0_combout\ & \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a2\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|mem|char_reg|Mux6~0_combout\,
	datab => \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a9\,
	datac => \display|mem|char_reg|LessThan0~0_combout\,
	datad => \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a2\,
	combout => \display|mem|char_reg|Mux6~1_combout\);

-- Location: LCCOMB_X42_Y19_N16
\display|mem|char_reg|Mux5~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|mem|char_reg|Mux5~0_combout\ = (!\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a8\ & (!\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a9\ & \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a8\,
	datab => \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a9\,
	datad => \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a7\,
	combout => \display|mem|char_reg|Mux5~0_combout\);

-- Location: LCCOMB_X38_Y21_N16
\display|mem|temp_reg|Mux1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|mem|temp_reg|Mux1~0_combout\ = (!\display|wr_logic|current_addr\(1) & (!\display|wr_logic|current_addr\(2) & !\display|wr_logic|current_addr\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \display|wr_logic|current_addr\(1),
	datac => \display|wr_logic|current_addr\(2),
	datad => \display|wr_logic|current_addr\(0),
	combout => \display|mem|temp_reg|Mux1~0_combout\);

-- Location: LCCOMB_X36_Y19_N20
\display|mem|char_reg|data_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|mem|char_reg|data_out~0_combout\ = (\display|mem|char_reg|data[1]~2_combout\) # ((!\display|mem|char_reg|LessThan0~0_combout\ & \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a2\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|mem|char_reg|data[1]~2_combout\,
	datac => \display|mem|char_reg|LessThan0~0_combout\,
	datad => \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a2\,
	combout => \display|mem|char_reg|data_out~0_combout\);

-- Location: LCCOMB_X37_Y19_N20
\display|mem|char_reg|Mux7~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|mem|char_reg|Mux7~0_combout\ = (\sw~combout\(5)) # ((\sw~combout\(7)) # ((!\sw~combout\(6)) # (!\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a8\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sw~combout\(5),
	datab => \sw~combout\(7),
	datac => \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a8\,
	datad => \sw~combout\(6),
	combout => \display|mem|char_reg|Mux7~0_combout\);

-- Location: LCCOMB_X42_Y19_N26
\display|mem|char_reg|Mux8~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|mem|char_reg|Mux8~0_combout\ = ((\sw~combout\(4)) # (!\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a8\)) # (!\display|mem|char_reg|tr_char~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \display|mem|char_reg|tr_char~0_combout\,
	datac => \sw~combout\(4),
	datad => \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a8\,
	combout => \display|mem|char_reg|Mux8~0_combout\);

-- Location: LCCOMB_X38_Y19_N30
\display|mem|char_reg|Mux10~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|mem|char_reg|Mux10~1_combout\ = (\display|mem|char_reg|data[1]~3_combout\ & \sw~combout\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \display|mem|char_reg|data[1]~3_combout\,
	datad => \sw~combout\(2),
	combout => \display|mem|char_reg|Mux10~1_combout\);

-- Location: LCCOMB_X37_Y19_N14
\display|mem|char_reg|Add1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|mem|char_reg|Add1~0_combout\ = \sw~combout\(2) $ (((\sw~combout\(0)) # (\sw~combout\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010111111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sw~combout\(0),
	datac => \sw~combout\(1),
	datad => \sw~combout\(2),
	combout => \display|mem|char_reg|Add1~0_combout\);

-- Location: LCCOMB_X37_Y19_N26
\display|mem|char_reg|Mux10~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|mem|char_reg|Mux10~2_combout\ = (\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a2\ & ((\sw~combout\(6)) # ((\display|mem|char_reg|LessThan0~0_combout\) # (!\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a8\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sw~combout\(6),
	datab => \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a8\,
	datac => \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a2\,
	datad => \display|mem|char_reg|LessThan0~0_combout\,
	combout => \display|mem|char_reg|Mux10~2_combout\);

-- Location: LCCOMB_X37_Y19_N4
\display|mem|char_reg|Add0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|mem|char_reg|Add0~0_combout\ = \sw~combout\(6) $ (((\sw~combout\(5)) # (\sw~combout\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010111111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sw~combout\(5),
	datac => \sw~combout\(4),
	datad => \sw~combout\(6),
	combout => \display|mem|char_reg|Add0~0_combout\);

-- Location: LCCOMB_X37_Y19_N30
\display|mem|char_reg|Mux10~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|mem|char_reg|Mux10~3_combout\ = (\display|mem|char_reg|data[1]~4_combout\ & ((\display|mem|char_reg|Mux10~2_combout\ & ((!\display|mem|char_reg|Add0~0_combout\))) # (!\display|mem|char_reg|Mux10~2_combout\ & 
-- (!\display|mem|char_reg|Add1~0_combout\)))) # (!\display|mem|char_reg|data[1]~4_combout\ & (((\display|mem|char_reg|Mux10~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111100100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|mem|char_reg|data[1]~4_combout\,
	datab => \display|mem|char_reg|Add1~0_combout\,
	datac => \display|mem|char_reg|Add0~0_combout\,
	datad => \display|mem|char_reg|Mux10~2_combout\,
	combout => \display|mem|char_reg|Mux10~3_combout\);

-- Location: LCCOMB_X38_Y19_N26
\display|mem|char_reg|Mux10~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|mem|char_reg|Mux10~5_combout\ = (\display|mem|char_reg|Mux10~1_combout\) # ((\display|mem|char_reg|Mux10~0_combout\) # ((\display|mem|char_reg|Mux10~4_combout\ & \display|mem|char_reg|Mux10~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|mem|char_reg|Mux10~4_combout\,
	datab => \display|mem|char_reg|Mux10~1_combout\,
	datac => \display|mem|char_reg|Mux10~3_combout\,
	datad => \display|mem|char_reg|Mux10~0_combout\,
	combout => \display|mem|char_reg|Mux10~5_combout\);

-- Location: LCCOMB_X38_Y21_N26
\display|mem|temp_reg|Mux5~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|mem|temp_reg|Mux5~0_combout\ = (!\display|wr_logic|current_addr\(2) & (\display|wr_logic|current_addr\(1) $ (!\display|wr_logic|current_addr\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \display|wr_logic|current_addr\(1),
	datac => \display|wr_logic|current_addr\(2),
	datad => \display|wr_logic|current_addr\(0),
	combout => \display|mem|temp_reg|Mux5~0_combout\);

-- Location: LCFF_X37_Y21_N25
\tr|tr_logic|ttemp[13]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \tr|tr_logic|temp_r2\(5),
	sload => VCC,
	ena => \tr|tr_logic|next_completed~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \tr|tr_logic|ttemp\(13));

-- Location: LCFF_X37_Y21_N19
\tr|tr_logic|ttemp[12]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \tr|tr_logic|temp_r2\(4),
	sload => VCC,
	ena => \tr|tr_logic|next_completed~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \tr|tr_logic|ttemp\(12));

-- Location: LCFF_X37_Y21_N29
\tr|tr_logic|ttemp[11]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \tr|tr_logic|temp_r2\(3),
	sload => VCC,
	ena => \tr|tr_logic|next_completed~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \tr|tr_logic|ttemp\(11));

-- Location: LCCOMB_X37_Y21_N14
\display|mem|temp_reg|Mux5~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|mem|temp_reg|Mux5~1_combout\ = (!\display|wr_logic|current_addr\(2) & (\tr|tr_logic|ttemp\(13) & ((\tr|tr_logic|ttemp\(11)) # (\tr|tr_logic|ttemp\(12)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|wr_logic|current_addr\(2),
	datab => \tr|tr_logic|ttemp\(11),
	datac => \tr|tr_logic|ttemp\(13),
	datad => \tr|tr_logic|ttemp\(12),
	combout => \display|mem|temp_reg|Mux5~1_combout\);

-- Location: LCCOMB_X38_Y21_N30
\display|mem|temp_reg|Mux5~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|mem|temp_reg|Mux5~3_combout\ = (!\display|wr_logic|current_addr\(1) & ((\display|mem|temp_reg|Mux5~1_combout\) # (\display|mem|temp_reg|Mux5~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|mem|temp_reg|Mux5~1_combout\,
	datab => \display|wr_logic|current_addr\(1),
	datad => \display|mem|temp_reg|Mux5~2_combout\,
	combout => \display|mem|temp_reg|Mux5~3_combout\);

-- Location: LCCOMB_X38_Y21_N8
\display|mem|temp_reg|Mux6~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|mem|temp_reg|Mux6~0_combout\ = (!\display|wr_logic|current_addr\(2) & \display|wr_logic|current_addr\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \display|wr_logic|current_addr\(2),
	datad => \display|wr_logic|current_addr\(1),
	combout => \display|mem|temp_reg|Mux6~0_combout\);

-- Location: LCFF_X37_Y21_N17
\tr|tr_logic|ttemp[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \tr|tr_logic|temp_r2\(2),
	sload => VCC,
	ena => \tr|tr_logic|next_completed~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \tr|tr_logic|ttemp\(10));

-- Location: LCCOMB_X37_Y21_N18
\tr|bcd|a2[0]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|bcd|a2[0]~0_combout\ = (\tr|tr_logic|ttemp\(12) & ((\tr|tr_logic|ttemp\(13) & (!\tr|tr_logic|ttemp\(11) & \tr|tr_logic|ttemp\(10))) # (!\tr|tr_logic|ttemp\(13) & (\tr|tr_logic|ttemp\(11) & !\tr|tr_logic|ttemp\(10))))) # (!\tr|tr_logic|ttemp\(12) & 
-- (\tr|tr_logic|ttemp\(10) $ (((\tr|tr_logic|ttemp\(13) & !\tr|tr_logic|ttemp\(11))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010110101000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tr|tr_logic|ttemp\(13),
	datab => \tr|tr_logic|ttemp\(11),
	datac => \tr|tr_logic|ttemp\(12),
	datad => \tr|tr_logic|ttemp\(10),
	combout => \tr|bcd|a2[0]~0_combout\);

-- Location: LCFF_X38_Y21_N11
\tr|tr_logic|ttemp[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \tr|tr_logic|temp_r2\(1),
	sload => VCC,
	ena => \tr|tr_logic|next_completed~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \tr|tr_logic|ttemp\(9));

-- Location: LCCOMB_X37_Y21_N28
\tr|bcd|a2[2]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|bcd|a2[2]~1_combout\ = (\tr|tr_logic|ttemp\(12) & (!\tr|tr_logic|ttemp\(10) & (\tr|tr_logic|ttemp\(13) $ (!\tr|tr_logic|ttemp\(11))))) # (!\tr|tr_logic|ttemp\(12) & (\tr|tr_logic|ttemp\(13) & (!\tr|tr_logic|ttemp\(11) & \tr|tr_logic|ttemp\(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001010000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tr|tr_logic|ttemp\(13),
	datab => \tr|tr_logic|ttemp\(12),
	datac => \tr|tr_logic|ttemp\(11),
	datad => \tr|tr_logic|ttemp\(10),
	combout => \tr|bcd|a2[2]~1_combout\);

-- Location: LCCOMB_X37_Y21_N24
\tr|bcd|a2[1]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|bcd|a2[1]~2_combout\ = (\tr|tr_logic|ttemp\(13) & (!\tr|tr_logic|ttemp\(11) & ((\tr|tr_logic|ttemp\(12)) # (!\tr|tr_logic|ttemp\(10))))) # (!\tr|tr_logic|ttemp\(13) & (\tr|tr_logic|ttemp\(11) & ((\tr|tr_logic|ttemp\(10)) # 
-- (!\tr|tr_logic|ttemp\(12)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101111010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tr|tr_logic|ttemp\(10),
	datab => \tr|tr_logic|ttemp\(12),
	datac => \tr|tr_logic|ttemp\(13),
	datad => \tr|tr_logic|ttemp\(11),
	combout => \tr|bcd|a2[1]~2_combout\);

-- Location: LCCOMB_X38_Y21_N20
\tr|bcd|LessThan2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|bcd|LessThan2~0_combout\ = (\tr|bcd|a2[2]~1_combout\) # ((\tr|bcd|a2[1]~2_combout\ & ((\tr|tr_logic|ttemp\(9)) # (\tr|bcd|a2[0]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tr|tr_logic|ttemp\(9),
	datab => \tr|bcd|a2[0]~0_combout\,
	datac => \tr|bcd|a2[1]~2_combout\,
	datad => \tr|bcd|a2[2]~1_combout\,
	combout => \tr|bcd|LessThan2~0_combout\);

-- Location: LCCOMB_X38_Y21_N14
\display|mem|temp_reg|Mux5~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|mem|temp_reg|Mux5~4_combout\ = (\display|mem|temp_reg|Mux6~0_combout\ & (\tr|bcd|a2[0]~0_combout\ $ (((\tr|bcd|LessThan2~0_combout\ & !\tr|tr_logic|ttemp\(9))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tr|bcd|LessThan2~0_combout\,
	datab => \tr|bcd|a2[0]~0_combout\,
	datac => \display|mem|temp_reg|Mux6~0_combout\,
	datad => \tr|tr_logic|ttemp\(9),
	combout => \display|mem|temp_reg|Mux5~4_combout\);

-- Location: LCCOMB_X38_Y21_N2
\display|mem|temp_reg|Mux5~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|mem|temp_reg|Mux5~5_combout\ = (\display|mem|temp_reg|Mux5~3_combout\) # ((\display|mem|temp_reg|Mux5~4_combout\) # (\display|mem|temp_reg|Mux5~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \display|mem|temp_reg|Mux5~3_combout\,
	datac => \display|mem|temp_reg|Mux5~4_combout\,
	datad => \display|mem|temp_reg|Mux5~0_combout\,
	combout => \display|mem|temp_reg|Mux5~5_combout\);

-- Location: LCCOMB_X38_Y19_N10
\display|mem|char_reg|Mux11~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|mem|char_reg|Mux11~0_combout\ = (\display|mem|char_reg|data[1]~3_combout\ & \sw~combout\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \display|mem|char_reg|data[1]~3_combout\,
	datad => \sw~combout\(1),
	combout => \display|mem|char_reg|Mux11~0_combout\);

-- Location: LCCOMB_X37_Y21_N16
\display|mem|temp_reg|Mux6~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|mem|temp_reg|Mux6~1_combout\ = (\tr|tr_logic|ttemp\(13) & ((\tr|tr_logic|ttemp\(11) & (\tr|tr_logic|ttemp\(10) & \tr|tr_logic|ttemp\(12))) # (!\tr|tr_logic|ttemp\(11) & ((!\tr|tr_logic|ttemp\(12)))))) # (!\tr|tr_logic|ttemp\(13) & 
-- (\tr|tr_logic|ttemp\(12) & ((\tr|tr_logic|ttemp\(11)) # (\tr|tr_logic|ttemp\(10)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101010000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tr|tr_logic|ttemp\(13),
	datab => \tr|tr_logic|ttemp\(11),
	datac => \tr|tr_logic|ttemp\(10),
	datad => \tr|tr_logic|ttemp\(12),
	combout => \display|mem|temp_reg|Mux6~1_combout\);

-- Location: LCCOMB_X38_Y21_N0
\display|mem|temp_reg|Mux6~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|mem|temp_reg|Mux6~2_combout\ = (\display|wr_logic|current_addr\(0) & (!\display|wr_logic|current_addr\(2) & ((\display|mem|temp_reg|Mux6~1_combout\) # (\display|wr_logic|current_addr\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|wr_logic|current_addr\(0),
	datab => \display|mem|temp_reg|Mux6~1_combout\,
	datac => \display|wr_logic|current_addr\(2),
	datad => \display|wr_logic|current_addr\(1),
	combout => \display|mem|temp_reg|Mux6~2_combout\);

-- Location: LCCOMB_X38_Y21_N4
\display|mem|temp_reg|Mux6~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|mem|temp_reg|Mux6~3_combout\ = (\display|mem|temp_reg|Mux6~2_combout\) # ((\display|mem|temp_reg|Mux6~0_combout\ & (\tr|tr_logic|ttemp\(9) $ (\tr|bcd|LessThan2~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tr|tr_logic|ttemp\(9),
	datab => \display|mem|temp_reg|Mux6~0_combout\,
	datac => \tr|bcd|LessThan2~0_combout\,
	datad => \display|mem|temp_reg|Mux6~2_combout\,
	combout => \display|mem|temp_reg|Mux6~3_combout\);

-- Location: LCCOMB_X36_Y19_N30
\display|mem|char_reg|Mux0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|mem|char_reg|Mux0~0_combout\ = (\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a0~portadataout\ & (((\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a1\)))) # (!\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a0~portadataout\ & 
-- ((\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a1\ & (\sw~combout\(6))) # (!\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a1\ & ((\sw~combout\(4))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a0~portadataout\,
	datab => \sw~combout\(6),
	datac => \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a1\,
	datad => \sw~combout\(4),
	combout => \display|mem|char_reg|Mux0~0_combout\);

-- Location: LCCOMB_X36_Y19_N0
\display|mem|char_reg|Mux0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|mem|char_reg|Mux0~1_combout\ = (\display|mem|char_reg|Mux0~0_combout\ & ((\sw~combout\(7)) # ((!\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a0~portadataout\)))) # (!\display|mem|char_reg|Mux0~0_combout\ & 
-- (((\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a0~portadataout\ & \sw~combout\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011110010001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sw~combout\(7),
	datab => \display|mem|char_reg|Mux0~0_combout\,
	datac => \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a0~portadataout\,
	datad => \sw~combout\(5),
	combout => \display|mem|char_reg|Mux0~1_combout\);

-- Location: LCCOMB_X36_Y19_N18
\display|mem|char_reg|Mux0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|mem|char_reg|Mux0~2_combout\ = (\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a1\ & (\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a0~portadataout\)) # (!\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a1\ & 
-- ((\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a0~portadataout\ & (\sw~combout\(1))) # (!\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a0~portadataout\ & ((\sw~combout\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a1\,
	datab => \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a0~portadataout\,
	datac => \sw~combout\(1),
	datad => \sw~combout\(0),
	combout => \display|mem|char_reg|Mux0~2_combout\);

-- Location: LCCOMB_X36_Y19_N4
\display|mem|char_reg|Mux0~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|mem|char_reg|Mux0~3_combout\ = (\display|mem|char_reg|Mux0~2_combout\ & ((\sw~combout\(3)) # ((!\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a1\)))) # (!\display|mem|char_reg|Mux0~2_combout\ & 
-- (((\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a1\ & \sw~combout\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011110010001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sw~combout\(3),
	datab => \display|mem|char_reg|Mux0~2_combout\,
	datac => \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a1\,
	datad => \sw~combout\(2),
	combout => \display|mem|char_reg|Mux0~3_combout\);

-- Location: LCCOMB_X36_Y19_N22
\display|mem|char_reg|Mux0~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|mem|char_reg|Mux0~4_combout\ = (\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a2\ & (\display|mem|char_reg|Mux0~1_combout\)) # (!\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a2\ & ((\display|mem|char_reg|Mux0~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \display|mem|char_reg|Mux0~1_combout\,
	datac => \display|mem|char_reg|Mux0~3_combout\,
	datad => \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a2\,
	combout => \display|mem|char_reg|Mux0~4_combout\);

-- Location: LCCOMB_X36_Y19_N16
\display|mem|char_reg|hex_l[0]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|mem|char_reg|hex_l[0]~0_combout\ = \sw~combout\(0) $ ((((!\sw~combout\(1) & !\sw~combout\(2))) # (!\sw~combout\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100110010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sw~combout\(0),
	datab => \sw~combout\(3),
	datac => \sw~combout\(1),
	datad => \sw~combout\(2),
	combout => \display|mem|char_reg|hex_l[0]~0_combout\);

-- Location: LCCOMB_X36_Y19_N26
\display|mem|char_reg|data_out~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|mem|char_reg|data_out~1_combout\ = (\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a2\ & ((\display|mem|char_reg|LessThan0~0_combout\ $ (\sw~combout\(4))))) # (!\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a2\ & 
-- (!\display|mem|char_reg|hex_l[0]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|mem|char_reg|hex_l[0]~0_combout\,
	datab => \display|mem|char_reg|LessThan0~0_combout\,
	datac => \sw~combout\(4),
	datad => \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a2\,
	combout => \display|mem|char_reg|data_out~1_combout\);

-- Location: LCCOMB_X36_Y19_N28
\display|mem|char_reg|Mux12~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|mem|char_reg|Mux12~0_combout\ = (\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a8\ & ((\display|mem|char_reg|data_out~1_combout\) # ((\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a9\)))) # 
-- (!\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a8\ & (((\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a0~portadataout\ & !\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a9\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a8\,
	datab => \display|mem|char_reg|data_out~1_combout\,
	datac => \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a0~portadataout\,
	datad => \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a9\,
	combout => \display|mem|char_reg|Mux12~0_combout\);

-- Location: LCCOMB_X37_Y19_N8
\display|mem|char_reg|tr_char[0]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|mem|char_reg|tr_char[0]~1_combout\ = (\sw~combout\(7)) # ((\sw~combout\(0)) # ((!\sw~combout\(6) & !\sw~combout\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sw~combout\(6),
	datab => \sw~combout\(7),
	datac => \sw~combout\(5),
	datad => \sw~combout\(0),
	combout => \display|mem|char_reg|tr_char[0]~1_combout\);

-- Location: LCCOMB_X36_Y19_N2
\display|mem|char_reg|Mux12~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|mem|char_reg|Mux12~1_combout\ = (\display|mem|char_reg|Mux12~0_combout\ & (((\display|mem|char_reg|tr_char[0]~1_combout\) # (!\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a9\)))) # (!\display|mem|char_reg|Mux12~0_combout\ & 
-- (\display|mem|char_reg|Mux0~4_combout\ & ((\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a9\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|mem|char_reg|Mux12~0_combout\,
	datab => \display|mem|char_reg|Mux0~4_combout\,
	datac => \display|mem|char_reg|tr_char[0]~1_combout\,
	datad => \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a9\,
	combout => \display|mem|char_reg|Mux12~1_combout\);

-- Location: LCCOMB_X38_Y21_N10
\tr|bcd|LessThan2~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|bcd|LessThan2~1_combout\ = (\tr|tr_logic|ttemp\(9)) # (\tr|bcd|a2[0]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \tr|tr_logic|ttemp\(9),
	datad => \tr|bcd|a2[0]~0_combout\,
	combout => \tr|bcd|LessThan2~1_combout\);

-- Location: LCCOMB_X36_Y19_N14
\display|mem|char_reg|Add1~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|mem|char_reg|Add1~2_combout\ = \sw~combout\(3) $ (((\sw~combout\(0)) # ((\sw~combout\(1)) # (\sw~combout\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100110110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sw~combout\(0),
	datab => \sw~combout\(3),
	datac => \sw~combout\(1),
	datad => \sw~combout\(2),
	combout => \display|mem|char_reg|Add1~2_combout\);

-- Location: LCCOMB_X38_Y21_N28
\display|mem|temp_reg|Mux4~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|mem|temp_reg|Mux4~2_combout\ = (\display|mem|temp_reg|Mux6~0_combout\ & (\tr|bcd|a2[1]~2_combout\ $ (((\tr|bcd|LessThan2~0_combout\ & \tr|bcd|LessThan2~1_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tr|bcd|LessThan2~0_combout\,
	datab => \tr|bcd|a2[1]~2_combout\,
	datac => \display|mem|temp_reg|Mux6~0_combout\,
	datad => \tr|bcd|LessThan2~1_combout\,
	combout => \display|mem|temp_reg|Mux4~2_combout\);

-- Location: LCFF_X37_Y21_N3
\tr|tr_logic|temp_r2[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \tr|tr_logic|temp_r2[5]~feeder_combout\,
	ena => \tr|tr_logic|next_completed~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \tr|tr_logic|temp_r2\(5));

-- Location: LCFF_X37_Y21_N21
\tr|tr_logic|temp_r2[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \tr|i2c_master_inst|data_rx\(4),
	sload => VCC,
	ena => \tr|tr_logic|next_completed~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \tr|tr_logic|temp_r2\(4));

-- Location: LCFF_X34_Y21_N9
\tr|tr_logic|temp_r2[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \tr|i2c_master_inst|data_rx\(3),
	sload => VCC,
	ena => \tr|tr_logic|next_completed~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \tr|tr_logic|temp_r2\(3));

-- Location: LCFF_X34_Y21_N3
\tr|tr_logic|temp_r2[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \tr|tr_logic|temp_r2[2]~feeder_combout\,
	ena => \tr|tr_logic|next_completed~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \tr|tr_logic|temp_r2\(2));

-- Location: LCFF_X34_Y21_N5
\tr|tr_logic|temp_r2[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \tr|tr_logic|temp_r2[1]~feeder_combout\,
	ena => \tr|tr_logic|next_completed~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \tr|tr_logic|temp_r2\(1));

-- Location: LCFF_X37_Y21_N7
\tr|i2c_master_inst|data_rx[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \tr|i2c_master_inst|data_rx[5]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \tr|i2c_master_inst|data_rx\(5));

-- Location: LCFF_X37_Y21_N9
\tr|i2c_master_inst|data_rx[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \tr|i2c_master_inst|data_rx[4]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \tr|i2c_master_inst|data_rx\(4));

-- Location: LCFF_X34_Y21_N25
\tr|i2c_master_inst|data_rx[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \tr|i2c_master_inst|data_rx[3]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \tr|i2c_master_inst|data_rx\(3));

-- Location: LCFF_X34_Y21_N27
\tr|i2c_master_inst|data_rx[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \tr|i2c_master_inst|data_rx[2]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \tr|i2c_master_inst|data_rx\(2));

-- Location: LCFF_X34_Y21_N29
\tr|i2c_master_inst|data_rx[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \tr|i2c_master_inst|data_rx[1]~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \tr|i2c_master_inst|data_rx\(1));

-- Location: LCCOMB_X38_Y23_N24
\tr|delay_timer|Equal0~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|delay_timer|Equal0~3_combout\ = (\tr|delay_timer|counter\(14) & (!\tr|delay_timer|counter\(15) & (!\tr|delay_timer|counter\(13) & !\tr|delay_timer|counter\(12))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tr|delay_timer|counter\(14),
	datab => \tr|delay_timer|counter\(15),
	datac => \tr|delay_timer|counter\(13),
	datad => \tr|delay_timer|counter\(12),
	combout => \tr|delay_timer|Equal0~3_combout\);

-- Location: LCCOMB_X36_Y21_N10
\tr|i2c_master_inst|data_rx[4]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|i2c_master_inst|data_rx[4]~1_combout\ = (\tr|i2c_master_inst|bit_cnt\(1) & !\tr|i2c_master_inst|bit_cnt\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tr|i2c_master_inst|bit_cnt\(1),
	datac => \tr|i2c_master_inst|bit_cnt\(2),
	combout => \tr|i2c_master_inst|data_rx[4]~1_combout\);

-- Location: LCCOMB_X36_Y21_N28
\tr|i2c_master_inst|data_rx[4]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|i2c_master_inst|data_rx[4]~2_combout\ = (\tr|i2c_master_inst|data_clk_prev~regout\ & (\tr|i2c_master_inst|data_rx[4]~1_combout\ & (\tr|i2c_master_inst|state.rd~regout\ & !\tr|i2c_master_inst|scl_ena~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tr|i2c_master_inst|data_clk_prev~regout\,
	datab => \tr|i2c_master_inst|data_rx[4]~1_combout\,
	datac => \tr|i2c_master_inst|state.rd~regout\,
	datad => \tr|i2c_master_inst|scl_ena~0_combout\,
	combout => \tr|i2c_master_inst|data_rx[4]~2_combout\);

-- Location: LCCOMB_X37_Y21_N6
\tr|i2c_master_inst|data_rx[5]~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|i2c_master_inst|data_rx[5]~3_combout\ = (\tr|i2c_master_inst|data_rx[4]~2_combout\ & ((\tr|i2c_master_inst|bit_cnt\(0) & ((\tr|i2c_master_inst|data_rx\(5)))) # (!\tr|i2c_master_inst|bit_cnt\(0) & (\temp_sda~0\)))) # 
-- (!\tr|i2c_master_inst|data_rx[4]~2_combout\ & (((\tr|i2c_master_inst|data_rx\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \temp_sda~0\,
	datab => \tr|i2c_master_inst|data_rx[4]~2_combout\,
	datac => \tr|i2c_master_inst|data_rx\(5),
	datad => \tr|i2c_master_inst|bit_cnt\(0),
	combout => \tr|i2c_master_inst|data_rx[5]~3_combout\);

-- Location: LCCOMB_X37_Y21_N8
\tr|i2c_master_inst|data_rx[4]~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|i2c_master_inst|data_rx[4]~4_combout\ = (\tr|i2c_master_inst|data_rx[4]~2_combout\ & ((\tr|i2c_master_inst|bit_cnt\(0) & (\temp_sda~0\)) # (!\tr|i2c_master_inst|bit_cnt\(0) & ((\tr|i2c_master_inst|data_rx\(4)))))) # 
-- (!\tr|i2c_master_inst|data_rx[4]~2_combout\ & (((\tr|i2c_master_inst|data_rx\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \temp_sda~0\,
	datab => \tr|i2c_master_inst|data_rx[4]~2_combout\,
	datac => \tr|i2c_master_inst|data_rx\(4),
	datad => \tr|i2c_master_inst|bit_cnt\(0),
	combout => \tr|i2c_master_inst|data_rx[4]~4_combout\);

-- Location: LCCOMB_X34_Y21_N0
\tr|i2c_master_inst|data_rx[3]~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|i2c_master_inst|data_rx[3]~5_combout\ = (!\tr|i2c_master_inst|bit_cnt\(0) & !\tr|i2c_master_inst|bit_cnt\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \tr|i2c_master_inst|bit_cnt\(0),
	datad => \tr|i2c_master_inst|bit_cnt\(1),
	combout => \tr|i2c_master_inst|data_rx[3]~5_combout\);

-- Location: LCCOMB_X36_Y21_N6
\tr|i2c_master_inst|data_rx[3]~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|i2c_master_inst|data_rx[3]~6_combout\ = (\tr|i2c_master_inst|data_clk_prev~regout\ & (\tr|i2c_master_inst|state.rd~regout\ & (\tr|i2c_master_inst|bit_cnt\(2) & !\tr|i2c_master_inst|scl_ena~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tr|i2c_master_inst|data_clk_prev~regout\,
	datab => \tr|i2c_master_inst|state.rd~regout\,
	datac => \tr|i2c_master_inst|bit_cnt\(2),
	datad => \tr|i2c_master_inst|scl_ena~0_combout\,
	combout => \tr|i2c_master_inst|data_rx[3]~6_combout\);

-- Location: LCCOMB_X34_Y21_N24
\tr|i2c_master_inst|data_rx[3]~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|i2c_master_inst|data_rx[3]~7_combout\ = (\tr|i2c_master_inst|data_rx[3]~6_combout\ & ((\tr|i2c_master_inst|data_rx[3]~5_combout\ & ((\temp_sda~0\))) # (!\tr|i2c_master_inst|data_rx[3]~5_combout\ & (\tr|i2c_master_inst|data_rx\(3))))) # 
-- (!\tr|i2c_master_inst|data_rx[3]~6_combout\ & (((\tr|i2c_master_inst|data_rx\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tr|i2c_master_inst|data_rx[3]~6_combout\,
	datab => \tr|i2c_master_inst|data_rx[3]~5_combout\,
	datac => \tr|i2c_master_inst|data_rx\(3),
	datad => \temp_sda~0\,
	combout => \tr|i2c_master_inst|data_rx[3]~7_combout\);

-- Location: LCCOMB_X36_Y21_N24
\tr|i2c_master_inst|data_rx[7]~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|i2c_master_inst|data_rx[7]~8_combout\ = (\tr|i2c_master_inst|data_clk_prev~regout\ & (\tr|i2c_master_inst|data_rx[7]~0_combout\ & (\tr|i2c_master_inst|state.rd~regout\ & !\tr|i2c_master_inst|scl_ena~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tr|i2c_master_inst|data_clk_prev~regout\,
	datab => \tr|i2c_master_inst|data_rx[7]~0_combout\,
	datac => \tr|i2c_master_inst|state.rd~regout\,
	datad => \tr|i2c_master_inst|scl_ena~0_combout\,
	combout => \tr|i2c_master_inst|data_rx[7]~8_combout\);

-- Location: LCCOMB_X34_Y21_N18
\tr|i2c_master_inst|data_rx[2]~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|i2c_master_inst|data_rx[2]~10_combout\ = (\tr|i2c_master_inst|bit_cnt\(0) & !\tr|i2c_master_inst|bit_cnt\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \tr|i2c_master_inst|bit_cnt\(0),
	datad => \tr|i2c_master_inst|bit_cnt\(1),
	combout => \tr|i2c_master_inst|data_rx[2]~10_combout\);

-- Location: LCCOMB_X34_Y21_N26
\tr|i2c_master_inst|data_rx[2]~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|i2c_master_inst|data_rx[2]~11_combout\ = (\tr|i2c_master_inst|data_rx[3]~6_combout\ & ((\tr|i2c_master_inst|data_rx[2]~10_combout\ & ((\temp_sda~0\))) # (!\tr|i2c_master_inst|data_rx[2]~10_combout\ & (\tr|i2c_master_inst|data_rx\(2))))) # 
-- (!\tr|i2c_master_inst|data_rx[3]~6_combout\ & (((\tr|i2c_master_inst|data_rx\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tr|i2c_master_inst|data_rx[3]~6_combout\,
	datab => \tr|i2c_master_inst|data_rx[2]~10_combout\,
	datac => \tr|i2c_master_inst|data_rx\(2),
	datad => \temp_sda~0\,
	combout => \tr|i2c_master_inst|data_rx[2]~11_combout\);

-- Location: LCCOMB_X34_Y21_N12
\tr|i2c_master_inst|data_rx[1]~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|i2c_master_inst|data_rx[1]~12_combout\ = (!\tr|i2c_master_inst|bit_cnt\(0) & \tr|i2c_master_inst|bit_cnt\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \tr|i2c_master_inst|bit_cnt\(0),
	datad => \tr|i2c_master_inst|bit_cnt\(1),
	combout => \tr|i2c_master_inst|data_rx[1]~12_combout\);

-- Location: LCCOMB_X34_Y21_N28
\tr|i2c_master_inst|data_rx[1]~13\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|i2c_master_inst|data_rx[1]~13_combout\ = (\tr|i2c_master_inst|data_rx[1]~12_combout\ & ((\tr|i2c_master_inst|data_rx[3]~6_combout\ & (\temp_sda~0\)) # (!\tr|i2c_master_inst|data_rx[3]~6_combout\ & ((\tr|i2c_master_inst|data_rx\(1)))))) # 
-- (!\tr|i2c_master_inst|data_rx[1]~12_combout\ & (((\tr|i2c_master_inst|data_rx\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tr|i2c_master_inst|data_rx[1]~12_combout\,
	datab => \temp_sda~0\,
	datac => \tr|i2c_master_inst|data_rx\(1),
	datad => \tr|i2c_master_inst|data_rx[3]~6_combout\,
	combout => \tr|i2c_master_inst|data_rx[1]~13_combout\);

-- Location: LCCOMB_X37_Y23_N10
\tr|delay_timer|Equal0~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|delay_timer|Equal0~7_combout\ = (\tr|delay_timer|Equal0~6_combout\ & (\tr|delay_timer|Equal0~5_combout\ & \tr|delay_timer|Equal0~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \tr|delay_timer|Equal0~6_combout\,
	datac => \tr|delay_timer|Equal0~5_combout\,
	datad => \tr|delay_timer|Equal0~4_combout\,
	combout => \tr|delay_timer|Equal0~7_combout\);

-- Location: LCCOMB_X38_Y21_N6
\display|mem|temp_reg|Mux7~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|mem|temp_reg|Mux7~4_combout\ = \tr|bcd|a2[2]~1_combout\ $ (((\tr|bcd|a2[1]~2_combout\ & ((\tr|tr_logic|ttemp\(9)) # (\tr|bcd|a2[0]~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tr|tr_logic|ttemp\(9),
	datab => \tr|bcd|a2[0]~0_combout\,
	datac => \tr|bcd|a2[1]~2_combout\,
	datad => \tr|bcd|a2[2]~1_combout\,
	combout => \display|mem|temp_reg|Mux7~4_combout\);

-- Location: LCCOMB_X38_Y21_N24
\display|mem|temp_reg|Mux4~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|mem|temp_reg|Mux4~3_combout\ = (\display|mem|temp_reg|Mux4~2_combout\) # ((!\display|wr_logic|current_addr\(2) & (\display|wr_logic|current_addr\(0) $ (!\display|wr_logic|current_addr\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111011001101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|wr_logic|current_addr\(0),
	datab => \display|mem|temp_reg|Mux4~2_combout\,
	datac => \display|wr_logic|current_addr\(2),
	datad => \display|wr_logic|current_addr\(1),
	combout => \display|mem|temp_reg|Mux4~3_combout\);

-- Location: PIN_R22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\key[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_key(0),
	combout => \key~combout\(0));

-- Location: PIN_L22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\sw[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_sw(0),
	combout => \sw~combout\(0));

-- Location: LCCOMB_X46_Y20_N2
\ed1|sr[2]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \ed1|sr[2]~feeder_combout\ = \ed1|sr\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \ed1|sr\(1),
	combout => \ed1|sr[2]~feeder_combout\);

-- Location: LCCOMB_X46_Y20_N28
\ed1|sr[1]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \ed1|sr[1]~feeder_combout\ = \ed1|sr\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \ed1|sr\(0),
	combout => \ed1|sr[1]~feeder_combout\);

-- Location: LCCOMB_X37_Y21_N2
\tr|tr_logic|temp_r2[5]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|tr_logic|temp_r2[5]~feeder_combout\ = \tr|i2c_master_inst|data_rx\(5)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \tr|i2c_master_inst|data_rx\(5),
	combout => \tr|tr_logic|temp_r2[5]~feeder_combout\);

-- Location: LCCOMB_X34_Y21_N2
\tr|tr_logic|temp_r2[2]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|tr_logic|temp_r2[2]~feeder_combout\ = \tr|i2c_master_inst|data_rx\(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \tr|i2c_master_inst|data_rx\(2),
	combout => \tr|tr_logic|temp_r2[2]~feeder_combout\);

-- Location: LCCOMB_X34_Y21_N4
\tr|tr_logic|temp_r2[1]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|tr_logic|temp_r2[1]~feeder_combout\ = \tr|i2c_master_inst|data_rx\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \tr|i2c_master_inst|data_rx\(1),
	combout => \tr|tr_logic|temp_r2[1]~feeder_combout\);

-- Location: LCCOMB_X46_Y20_N6
\ed1|sr[0]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \ed1|sr[0]~feeder_combout\ = \key~combout\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \key~combout\(0),
	combout => \ed1|sr[0]~feeder_combout\);

-- Location: PIN_A20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\temp_scl~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	open_drain_output => "true",
	operation_mode => "bidir",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \tr|i2c_master_inst|scl~1_combout\,
	oe => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	padio => temp_scl,
	combout => \temp_scl~0\);

-- Location: PIN_B20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\temp_sda~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	open_drain_output => "true",
	operation_mode => "bidir",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \tr|i2c_master_inst|Selector32~0_combout\,
	oe => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	padio => temp_sda,
	combout => \temp_sda~0\);

-- Location: PIN_A13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\lcd_scl~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	open_drain_output => "true",
	operation_mode => "bidir",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \display|i2c_master_inst|scl~1_combout\,
	oe => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	padio => lcd_scl,
	combout => \lcd_scl~0\);

-- Location: PIN_B13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\lcd_sda~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	open_drain_output => "true",
	operation_mode => "bidir",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \display|i2c_master_inst|Selector32~0_combout\,
	oe => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	padio => lcd_sda,
	combout => \lcd_sda~0\);

-- Location: LCCOMB_X35_Y21_N10
\tr|i2c_master_inst|count_reg[2]~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|i2c_master_inst|count_reg[2]~11_combout\ = (\tr|i2c_master_inst|count_reg\(2) & (\tr|i2c_master_inst|count_reg[1]~10\ $ (GND))) # (!\tr|i2c_master_inst|count_reg\(2) & (!\tr|i2c_master_inst|count_reg[1]~10\ & VCC))
-- \tr|i2c_master_inst|count_reg[2]~12\ = CARRY((\tr|i2c_master_inst|count_reg\(2) & !\tr|i2c_master_inst|count_reg[1]~10\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \tr|i2c_master_inst|count_reg\(2),
	datad => VCC,
	cin => \tr|i2c_master_inst|count_reg[1]~10\,
	combout => \tr|i2c_master_inst|count_reg[2]~11_combout\,
	cout => \tr|i2c_master_inst|count_reg[2]~12\);

-- Location: LCCOMB_X35_Y21_N12
\tr|i2c_master_inst|count_reg[3]~13\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|i2c_master_inst|count_reg[3]~13_combout\ = (\tr|i2c_master_inst|count_reg\(3) & (!\tr|i2c_master_inst|count_reg[2]~12\)) # (!\tr|i2c_master_inst|count_reg\(3) & ((\tr|i2c_master_inst|count_reg[2]~12\) # (GND)))
-- \tr|i2c_master_inst|count_reg[3]~14\ = CARRY((!\tr|i2c_master_inst|count_reg[2]~12\) # (!\tr|i2c_master_inst|count_reg\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \tr|i2c_master_inst|count_reg\(3),
	datad => VCC,
	cin => \tr|i2c_master_inst|count_reg[2]~12\,
	combout => \tr|i2c_master_inst|count_reg[3]~13_combout\,
	cout => \tr|i2c_master_inst|count_reg[3]~14\);

-- Location: LCFF_X35_Y21_N13
\tr|i2c_master_inst|count_reg[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \tr|i2c_master_inst|count_reg[3]~13_combout\,
	sclr => \tr|i2c_master_inst|Equal2~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \tr|i2c_master_inst|count_reg\(3));

-- Location: LCCOMB_X35_Y21_N28
\tr|i2c_master_inst|Equal2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|i2c_master_inst|Equal2~0_combout\ = (\tr|i2c_master_inst|count_reg\(0) & (\tr|i2c_master_inst|count_reg\(1) & (\tr|i2c_master_inst|count_reg\(4) & \tr|i2c_master_inst|count_reg\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tr|i2c_master_inst|count_reg\(0),
	datab => \tr|i2c_master_inst|count_reg\(1),
	datac => \tr|i2c_master_inst|count_reg\(4),
	datad => \tr|i2c_master_inst|count_reg\(3),
	combout => \tr|i2c_master_inst|Equal2~0_combout\);

-- Location: LCCOMB_X35_Y21_N16
\tr|i2c_master_inst|count_reg[5]~17\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|i2c_master_inst|count_reg[5]~17_combout\ = (\tr|i2c_master_inst|count_reg\(5) & (!\tr|i2c_master_inst|count_reg[4]~16\)) # (!\tr|i2c_master_inst|count_reg\(5) & ((\tr|i2c_master_inst|count_reg[4]~16\) # (GND)))
-- \tr|i2c_master_inst|count_reg[5]~18\ = CARRY((!\tr|i2c_master_inst|count_reg[4]~16\) # (!\tr|i2c_master_inst|count_reg\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \tr|i2c_master_inst|count_reg\(5),
	datad => VCC,
	cin => \tr|i2c_master_inst|count_reg[4]~16\,
	combout => \tr|i2c_master_inst|count_reg[5]~17_combout\,
	cout => \tr|i2c_master_inst|count_reg[5]~18\);

-- Location: LCCOMB_X35_Y21_N18
\tr|i2c_master_inst|count_reg[6]~19\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|i2c_master_inst|count_reg[6]~19_combout\ = \tr|i2c_master_inst|count_reg[5]~18\ $ (!\tr|i2c_master_inst|count_reg\(6))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \tr|i2c_master_inst|count_reg\(6),
	cin => \tr|i2c_master_inst|count_reg[5]~18\,
	combout => \tr|i2c_master_inst|count_reg[6]~19_combout\);

-- Location: LCFF_X35_Y21_N19
\tr|i2c_master_inst|count_reg[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \tr|i2c_master_inst|count_reg[6]~19_combout\,
	sclr => \tr|i2c_master_inst|Equal2~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \tr|i2c_master_inst|count_reg\(6));

-- Location: LCCOMB_X35_Y21_N30
\tr|i2c_master_inst|Equal2~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|i2c_master_inst|Equal2~1_combout\ = (!\tr|i2c_master_inst|count_reg\(2) & (\tr|i2c_master_inst|Equal2~0_combout\ & (\tr|i2c_master_inst|count_reg\(5) & \tr|i2c_master_inst|count_reg\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tr|i2c_master_inst|count_reg\(2),
	datab => \tr|i2c_master_inst|Equal2~0_combout\,
	datac => \tr|i2c_master_inst|count_reg\(5),
	datad => \tr|i2c_master_inst|count_reg\(6),
	combout => \tr|i2c_master_inst|Equal2~1_combout\);

-- Location: LCFF_X35_Y21_N11
\tr|i2c_master_inst|count_reg[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \tr|i2c_master_inst|count_reg[2]~11_combout\,
	sclr => \tr|i2c_master_inst|Equal2~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \tr|i2c_master_inst|count_reg\(2));

-- Location: LCCOMB_X35_Y21_N22
\tr|i2c_master_inst|process_1~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|i2c_master_inst|process_1~2_combout\ = (\tr|i2c_master_inst|count_reg\(5)) # ((\tr|i2c_master_inst|count_reg\(3) & (\tr|i2c_master_inst|count_reg\(4) & \tr|i2c_master_inst|count_reg\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tr|i2c_master_inst|count_reg\(3),
	datab => \tr|i2c_master_inst|count_reg\(4),
	datac => \tr|i2c_master_inst|count_reg\(5),
	datad => \tr|i2c_master_inst|count_reg\(2),
	combout => \tr|i2c_master_inst|process_1~2_combout\);

-- Location: LCCOMB_X35_Y21_N4
\tr|i2c_master_inst|process_1~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|i2c_master_inst|process_1~1_combout\ = (\tr|i2c_master_inst|count_reg\(5) & (((\tr|i2c_master_inst|count_reg\(6))))) # (!\tr|i2c_master_inst|count_reg\(5) & ((\tr|i2c_master_inst|count_reg\(0)) # ((\tr|i2c_master_inst|count_reg\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111000001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tr|i2c_master_inst|count_reg\(0),
	datab => \tr|i2c_master_inst|count_reg\(1),
	datac => \tr|i2c_master_inst|count_reg\(5),
	datad => \tr|i2c_master_inst|count_reg\(6),
	combout => \tr|i2c_master_inst|process_1~1_combout\);

-- Location: LCCOMB_X35_Y21_N0
\tr|i2c_master_inst|process_1~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|i2c_master_inst|process_1~3_combout\ = (\tr|i2c_master_inst|LessThan1~0_combout\ & (\tr|i2c_master_inst|process_1~2_combout\ & (\tr|i2c_master_inst|process_1~1_combout\))) # (!\tr|i2c_master_inst|LessThan1~0_combout\ & 
-- (((\tr|i2c_master_inst|process_1~2_combout\ & \tr|i2c_master_inst|process_1~1_combout\)) # (!\tr|i2c_master_inst|count_reg\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tr|i2c_master_inst|LessThan1~0_combout\,
	datab => \tr|i2c_master_inst|process_1~2_combout\,
	datac => \tr|i2c_master_inst|process_1~1_combout\,
	datad => \tr|i2c_master_inst|count_reg\(6),
	combout => \tr|i2c_master_inst|process_1~3_combout\);

-- Location: LCCOMB_X35_Y21_N2
\tr|i2c_master_inst|stretch_reg~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|i2c_master_inst|stretch_reg~0_combout\ = (\tr|i2c_master_inst|process_1~3_combout\ & (\tr|i2c_master_inst|stretch_reg~regout\)) # (!\tr|i2c_master_inst|process_1~3_combout\ & ((!\temp_scl~0\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \tr|i2c_master_inst|process_1~3_combout\,
	datac => \tr|i2c_master_inst|stretch_reg~regout\,
	datad => \temp_scl~0\,
	combout => \tr|i2c_master_inst|stretch_reg~0_combout\);

-- Location: LCFF_X35_Y21_N3
\tr|i2c_master_inst|stretch_reg\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \tr|i2c_master_inst|stretch_reg~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \tr|i2c_master_inst|stretch_reg~regout\);

-- Location: LCCOMB_X35_Y21_N6
\tr|i2c_master_inst|count_reg[0]~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|i2c_master_inst|count_reg[0]~7_combout\ = (\tr|i2c_master_inst|count_reg\(0) & (\tr|i2c_master_inst|stretch_reg~regout\ $ (GND))) # (!\tr|i2c_master_inst|count_reg\(0) & (!\tr|i2c_master_inst|stretch_reg~regout\ & VCC))
-- \tr|i2c_master_inst|count_reg[0]~8\ = CARRY((\tr|i2c_master_inst|count_reg\(0) & !\tr|i2c_master_inst|stretch_reg~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100100100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tr|i2c_master_inst|count_reg\(0),
	datab => \tr|i2c_master_inst|stretch_reg~regout\,
	datad => VCC,
	combout => \tr|i2c_master_inst|count_reg[0]~7_combout\,
	cout => \tr|i2c_master_inst|count_reg[0]~8\);

-- Location: LCCOMB_X35_Y21_N8
\tr|i2c_master_inst|count_reg[1]~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|i2c_master_inst|count_reg[1]~9_combout\ = (\tr|i2c_master_inst|count_reg\(1) & (!\tr|i2c_master_inst|count_reg[0]~8\)) # (!\tr|i2c_master_inst|count_reg\(1) & ((\tr|i2c_master_inst|count_reg[0]~8\) # (GND)))
-- \tr|i2c_master_inst|count_reg[1]~10\ = CARRY((!\tr|i2c_master_inst|count_reg[0]~8\) # (!\tr|i2c_master_inst|count_reg\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \tr|i2c_master_inst|count_reg\(1),
	datad => VCC,
	cin => \tr|i2c_master_inst|count_reg[0]~8\,
	combout => \tr|i2c_master_inst|count_reg[1]~9_combout\,
	cout => \tr|i2c_master_inst|count_reg[1]~10\);

-- Location: LCFF_X35_Y21_N9
\tr|i2c_master_inst|count_reg[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \tr|i2c_master_inst|count_reg[1]~9_combout\,
	sclr => \tr|i2c_master_inst|Equal2~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \tr|i2c_master_inst|count_reg\(1));

-- Location: LCCOMB_X35_Y21_N14
\tr|i2c_master_inst|count_reg[4]~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|i2c_master_inst|count_reg[4]~15_combout\ = (\tr|i2c_master_inst|count_reg\(4) & (\tr|i2c_master_inst|count_reg[3]~14\ $ (GND))) # (!\tr|i2c_master_inst|count_reg\(4) & (!\tr|i2c_master_inst|count_reg[3]~14\ & VCC))
-- \tr|i2c_master_inst|count_reg[4]~16\ = CARRY((\tr|i2c_master_inst|count_reg\(4) & !\tr|i2c_master_inst|count_reg[3]~14\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \tr|i2c_master_inst|count_reg\(4),
	datad => VCC,
	cin => \tr|i2c_master_inst|count_reg[3]~14\,
	combout => \tr|i2c_master_inst|count_reg[4]~15_combout\,
	cout => \tr|i2c_master_inst|count_reg[4]~16\);

-- Location: LCFF_X35_Y21_N15
\tr|i2c_master_inst|count_reg[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \tr|i2c_master_inst|count_reg[4]~15_combout\,
	sclr => \tr|i2c_master_inst|Equal2~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \tr|i2c_master_inst|count_reg\(4));

-- Location: LCFF_X35_Y21_N17
\tr|i2c_master_inst|count_reg[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \tr|i2c_master_inst|count_reg[5]~17_combout\,
	sclr => \tr|i2c_master_inst|Equal2~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \tr|i2c_master_inst|count_reg\(5));

-- Location: LCFF_X35_Y21_N7
\tr|i2c_master_inst|count_reg[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \tr|i2c_master_inst|count_reg[0]~7_combout\,
	sclr => \tr|i2c_master_inst|Equal2~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \tr|i2c_master_inst|count_reg\(0));

-- Location: LCCOMB_X35_Y21_N26
\tr|i2c_master_inst|LessThan1~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|i2c_master_inst|LessThan1~1_combout\ = (\tr|i2c_master_inst|count_reg\(5)) # ((\tr|i2c_master_inst|LessThan1~0_combout\ & \tr|i2c_master_inst|count_reg\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tr|i2c_master_inst|LessThan1~0_combout\,
	datac => \tr|i2c_master_inst|count_reg\(5),
	datad => \tr|i2c_master_inst|count_reg\(0),
	combout => \tr|i2c_master_inst|LessThan1~1_combout\);

-- Location: LCCOMB_X35_Y21_N20
\tr|i2c_master_inst|process_1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|i2c_master_inst|process_1~0_combout\ = (\tr|i2c_master_inst|LessThan1~0_combout\ & ((\tr|i2c_master_inst|count_reg\(5)) # (!\tr|i2c_master_inst|count_reg\(0)))) # (!\tr|i2c_master_inst|LessThan1~0_combout\ & (!\tr|i2c_master_inst|count_reg\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tr|i2c_master_inst|LessThan1~0_combout\,
	datac => \tr|i2c_master_inst|count_reg\(5),
	datad => \tr|i2c_master_inst|count_reg\(0),
	combout => \tr|i2c_master_inst|process_1~0_combout\);

-- Location: LCCOMB_X36_Y22_N12
\tr|i2c_master_inst|bit_cnt[0]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|i2c_master_inst|bit_cnt[0]~1_combout\ = !\tr|i2c_master_inst|bit_cnt\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \tr|i2c_master_inst|bit_cnt\(0),
	combout => \tr|i2c_master_inst|bit_cnt[0]~1_combout\);

-- Location: LCCOMB_X36_Y21_N12
\tr|i2c_master_inst|scl_ena~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|i2c_master_inst|scl_ena~0_combout\ = (\tr|i2c_master_inst|count_reg\(6) & (!\tr|i2c_master_inst|process_1~3_combout\)) # (!\tr|i2c_master_inst|count_reg\(6) & (\tr|i2c_master_inst|LessThan1~1_combout\ & ((!\tr|i2c_master_inst|process_1~0_combout\) # 
-- (!\tr|i2c_master_inst|process_1~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tr|i2c_master_inst|process_1~3_combout\,
	datab => \tr|i2c_master_inst|LessThan1~1_combout\,
	datac => \tr|i2c_master_inst|process_1~0_combout\,
	datad => \tr|i2c_master_inst|count_reg\(6),
	combout => \tr|i2c_master_inst|scl_ena~0_combout\);

-- Location: LCFF_X36_Y21_N13
\tr|i2c_master_inst|data_clk_prev\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \tr|i2c_master_inst|scl_ena~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \tr|i2c_master_inst|data_clk_prev~regout\);

-- Location: LCCOMB_X36_Y21_N26
\tr|i2c_master_inst|data_clk_re\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|i2c_master_inst|data_clk_re~combout\ = (!\tr|i2c_master_inst|data_clk_prev~regout\ & \tr|i2c_master_inst|scl_ena~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \tr|i2c_master_inst|data_clk_prev~regout\,
	datad => \tr|i2c_master_inst|scl_ena~0_combout\,
	combout => \tr|i2c_master_inst|data_clk_re~combout\);

-- Location: LCCOMB_X36_Y22_N26
\tr|i2c_master_inst|Selector26~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|i2c_master_inst|Selector26~6_combout\ = (\tr|i2c_master_inst|bit_cnt\(0) & (\tr|i2c_master_inst|bit_cnt\(1) & (\tr|i2c_master_inst|bit_cnt\(2) & \tr|i2c_master_inst|state.wr~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tr|i2c_master_inst|bit_cnt\(0),
	datab => \tr|i2c_master_inst|bit_cnt\(1),
	datac => \tr|i2c_master_inst|bit_cnt\(2),
	datad => \tr|i2c_master_inst|state.wr~regout\,
	combout => \tr|i2c_master_inst|Selector26~6_combout\);

-- Location: LCFF_X36_Y22_N27
\tr|i2c_master_inst|state.slv_ack2\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \tr|i2c_master_inst|Selector26~6_combout\,
	ena => \tr|i2c_master_inst|data_clk_re~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \tr|i2c_master_inst|state.slv_ack2~regout\);

-- Location: LCCOMB_X36_Y22_N28
\tr|i2c_master_inst|Selector24~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|i2c_master_inst|Selector24~0_combout\ = (\tr|i2c_master_inst|bit_cnt\(0) & (\tr|i2c_master_inst|state.rd~regout\ & (\tr|i2c_master_inst|bit_cnt\(2) & \tr|i2c_master_inst|bit_cnt\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tr|i2c_master_inst|bit_cnt\(0),
	datab => \tr|i2c_master_inst|state.rd~regout\,
	datac => \tr|i2c_master_inst|bit_cnt\(2),
	datad => \tr|i2c_master_inst|bit_cnt\(1),
	combout => \tr|i2c_master_inst|Selector24~0_combout\);

-- Location: LCFF_X36_Y22_N29
\tr|i2c_master_inst|state.mstr_ack\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \tr|i2c_master_inst|Selector24~0_combout\,
	ena => \tr|i2c_master_inst|data_clk_re~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \tr|i2c_master_inst|state.mstr_ack~regout\);

-- Location: LCCOMB_X37_Y22_N6
\tr|i2c_master_inst|addr_rw[4]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|i2c_master_inst|addr_rw[4]~0_combout\ = (\tr|tr_logic|i2c_l_ena~regout\ & (((\tr|i2c_master_inst|state.slv_ack2~regout\) # (\tr|i2c_master_inst|state.mstr_ack~regout\)) # (!\tr|i2c_master_inst|state.ready~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tr|i2c_master_inst|state.ready~regout\,
	datab => \tr|i2c_master_inst|state.slv_ack2~regout\,
	datac => \tr|tr_logic|i2c_l_ena~regout\,
	datad => \tr|i2c_master_inst|state.mstr_ack~regout\,
	combout => \tr|i2c_master_inst|addr_rw[4]~0_combout\);

-- Location: LCCOMB_X37_Y22_N4
\tr|i2c_master_inst|addr_rw[0]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|i2c_master_inst|addr_rw[0]~1_combout\ = (\tr|i2c_master_inst|data_clk_re~combout\ & ((\tr|i2c_master_inst|addr_rw[4]~0_combout\ & (\tr|tr_logic|i2c_l_rw~regout\)) # (!\tr|i2c_master_inst|addr_rw[4]~0_combout\ & ((\tr|i2c_master_inst|addr_rw\(0)))))) # 
-- (!\tr|i2c_master_inst|data_clk_re~combout\ & (((\tr|i2c_master_inst|addr_rw\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tr|tr_logic|i2c_l_rw~regout\,
	datab => \tr|i2c_master_inst|data_clk_re~combout\,
	datac => \tr|i2c_master_inst|addr_rw\(0),
	datad => \tr|i2c_master_inst|addr_rw[4]~0_combout\,
	combout => \tr|i2c_master_inst|addr_rw[0]~1_combout\);

-- Location: LCFF_X37_Y22_N5
\tr|i2c_master_inst|addr_rw[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \tr|i2c_master_inst|addr_rw[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \tr|i2c_master_inst|addr_rw\(0));

-- Location: LCCOMB_X37_Y22_N8
\tr|i2c_master_inst|Selector21~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|i2c_master_inst|Selector21~0_combout\ = (\tr|i2c_master_inst|state.slv_ack1~regout\ & (((!\tr|i2c_master_inst|Equal0~0_combout\ & \tr|i2c_master_inst|state.wr~regout\)) # (!\tr|i2c_master_inst|addr_rw\(0)))) # 
-- (!\tr|i2c_master_inst|state.slv_ack1~regout\ & (!\tr|i2c_master_inst|Equal0~0_combout\ & ((\tr|i2c_master_inst|state.wr~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011101100001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tr|i2c_master_inst|state.slv_ack1~regout\,
	datab => \tr|i2c_master_inst|Equal0~0_combout\,
	datac => \tr|i2c_master_inst|addr_rw\(0),
	datad => \tr|i2c_master_inst|state.wr~regout\,
	combout => \tr|i2c_master_inst|Selector21~0_combout\);

-- Location: LCCOMB_X37_Y22_N0
\tr|i2c_master_inst|process_3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|i2c_master_inst|process_3~0_combout\ = (\tr|tr_logic|i2c_l_rw~regout\ $ (\tr|i2c_master_inst|addr_rw\(0))) # (!\tr|tr_logic|i2c_l_ena~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110111101101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tr|tr_logic|i2c_l_rw~regout\,
	datab => \tr|i2c_master_inst|addr_rw\(0),
	datac => \tr|tr_logic|i2c_l_ena~regout\,
	combout => \tr|i2c_master_inst|process_3~0_combout\);

-- Location: LCCOMB_X37_Y22_N30
\tr|i2c_master_inst|Selector21~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|i2c_master_inst|Selector21~1_combout\ = (\tr|i2c_master_inst|Selector21~0_combout\) # ((\tr|i2c_master_inst|state.slv_ack2~regout\ & !\tr|i2c_master_inst|process_3~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \tr|i2c_master_inst|state.slv_ack2~regout\,
	datac => \tr|i2c_master_inst|Selector21~0_combout\,
	datad => \tr|i2c_master_inst|process_3~0_combout\,
	combout => \tr|i2c_master_inst|Selector21~1_combout\);

-- Location: LCFF_X37_Y22_N31
\tr|i2c_master_inst|state.wr\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \tr|i2c_master_inst|Selector21~1_combout\,
	ena => \tr|i2c_master_inst|data_clk_re~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \tr|i2c_master_inst|state.wr~regout\);

-- Location: LCCOMB_X36_Y22_N2
\tr|i2c_master_inst|bit_cnt[2]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|i2c_master_inst|bit_cnt[2]~0_combout\ = (\tr|i2c_master_inst|data_clk_re~combout\ & ((\tr|i2c_master_inst|state.command~regout\) # ((\tr|i2c_master_inst|state.rd~regout\) # (\tr|i2c_master_inst|state.wr~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tr|i2c_master_inst|state.command~regout\,
	datab => \tr|i2c_master_inst|data_clk_re~combout\,
	datac => \tr|i2c_master_inst|state.rd~regout\,
	datad => \tr|i2c_master_inst|state.wr~regout\,
	combout => \tr|i2c_master_inst|bit_cnt[2]~0_combout\);

-- Location: LCFF_X36_Y22_N13
\tr|i2c_master_inst|bit_cnt[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \tr|i2c_master_inst|bit_cnt[0]~1_combout\,
	ena => \tr|i2c_master_inst|bit_cnt[2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \tr|i2c_master_inst|bit_cnt\(0));

-- Location: LCCOMB_X36_Y22_N18
\tr|i2c_master_inst|Selector28~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|i2c_master_inst|Selector28~0_combout\ = \tr|i2c_master_inst|bit_cnt\(1) $ (\tr|i2c_master_inst|bit_cnt\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \tr|i2c_master_inst|bit_cnt\(1),
	datad => \tr|i2c_master_inst|bit_cnt\(0),
	combout => \tr|i2c_master_inst|Selector28~0_combout\);

-- Location: LCFF_X36_Y22_N19
\tr|i2c_master_inst|bit_cnt[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \tr|i2c_master_inst|Selector28~0_combout\,
	ena => \tr|i2c_master_inst|bit_cnt[2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \tr|i2c_master_inst|bit_cnt\(1));

-- Location: LCCOMB_X36_Y22_N16
\tr|i2c_master_inst|Add0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|i2c_master_inst|Add0~0_combout\ = \tr|i2c_master_inst|bit_cnt\(2) $ (((\tr|i2c_master_inst|bit_cnt\(0) & \tr|i2c_master_inst|bit_cnt\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tr|i2c_master_inst|bit_cnt\(0),
	datac => \tr|i2c_master_inst|bit_cnt\(2),
	datad => \tr|i2c_master_inst|bit_cnt\(1),
	combout => \tr|i2c_master_inst|Add0~0_combout\);

-- Location: LCFF_X36_Y22_N17
\tr|i2c_master_inst|bit_cnt[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \tr|i2c_master_inst|Add0~0_combout\,
	ena => \tr|i2c_master_inst|bit_cnt[2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \tr|i2c_master_inst|bit_cnt\(2));

-- Location: LCCOMB_X36_Y22_N22
\tr|i2c_master_inst|Equal0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|i2c_master_inst|Equal0~0_combout\ = (\tr|i2c_master_inst|bit_cnt\(0) & (\tr|i2c_master_inst|bit_cnt\(2) & \tr|i2c_master_inst|bit_cnt\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tr|i2c_master_inst|bit_cnt\(0),
	datac => \tr|i2c_master_inst|bit_cnt\(2),
	datad => \tr|i2c_master_inst|bit_cnt\(1),
	combout => \tr|i2c_master_inst|Equal0~0_combout\);

-- Location: LCCOMB_X37_Y22_N2
\tr|i2c_master_inst|Selector22~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|i2c_master_inst|Selector22~0_combout\ = (\tr|i2c_master_inst|state.slv_ack1~regout\ & (!\tr|i2c_master_inst|addr_rw\(0) & ((\tr|i2c_master_inst|process_3~0_combout\) # (!\tr|i2c_master_inst|state.mstr_ack~regout\)))) # 
-- (!\tr|i2c_master_inst|state.slv_ack1~regout\ & (((\tr|i2c_master_inst|process_3~0_combout\)) # (!\tr|i2c_master_inst|state.mstr_ack~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111100010011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tr|i2c_master_inst|state.slv_ack1~regout\,
	datab => \tr|i2c_master_inst|state.mstr_ack~regout\,
	datac => \tr|i2c_master_inst|addr_rw\(0),
	datad => \tr|i2c_master_inst|process_3~0_combout\,
	combout => \tr|i2c_master_inst|Selector22~0_combout\);

-- Location: LCCOMB_X36_Y22_N14
\tr|i2c_master_inst|Selector22~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|i2c_master_inst|Selector22~1_combout\ = ((!\tr|i2c_master_inst|Equal0~0_combout\ & \tr|i2c_master_inst|state.rd~regout\)) # (!\tr|i2c_master_inst|Selector22~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \tr|i2c_master_inst|Equal0~0_combout\,
	datac => \tr|i2c_master_inst|state.rd~regout\,
	datad => \tr|i2c_master_inst|Selector22~0_combout\,
	combout => \tr|i2c_master_inst|Selector22~1_combout\);

-- Location: LCFF_X36_Y22_N15
\tr|i2c_master_inst|state.rd\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \tr|i2c_master_inst|Selector22~1_combout\,
	ena => \tr|i2c_master_inst|data_clk_re~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \tr|i2c_master_inst|state.rd~regout\);

-- Location: LCCOMB_X37_Y22_N28
\tr|i2c_master_inst|Selector0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|i2c_master_inst|Selector0~1_combout\ = (\tr|i2c_master_inst|state.rd~regout\) # ((\tr|i2c_master_inst|state.wr~regout\) # ((!\tr|i2c_master_inst|state.ready~regout\ & \tr|tr_logic|i2c_l_ena~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tr|i2c_master_inst|state.ready~regout\,
	datab => \tr|i2c_master_inst|state.rd~regout\,
	datac => \tr|tr_logic|i2c_l_ena~regout\,
	datad => \tr|i2c_master_inst|state.wr~regout\,
	combout => \tr|i2c_master_inst|Selector0~1_combout\);

-- Location: LCCOMB_X37_Y22_N10
\tr|i2c_master_inst|Selector25~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|i2c_master_inst|Selector25~0_combout\ = (!\tr|tr_logic|i2c_l_ena~regout\ & ((\tr|i2c_master_inst|state.slv_ack2~regout\) # (\tr|i2c_master_inst|state.mstr_ack~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \tr|i2c_master_inst|state.slv_ack2~regout\,
	datac => \tr|tr_logic|i2c_l_ena~regout\,
	datad => \tr|i2c_master_inst|state.mstr_ack~regout\,
	combout => \tr|i2c_master_inst|Selector25~0_combout\);

-- Location: LCCOMB_X36_Y22_N8
\tr|i2c_master_inst|Selector19~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|i2c_master_inst|Selector19~0_combout\ = (\tr|i2c_master_inst|state.start~regout\) # ((!\tr|i2c_master_inst|Equal0~0_combout\ & \tr|i2c_master_inst|state.command~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tr|i2c_master_inst|state.start~regout\,
	datab => \tr|i2c_master_inst|Equal0~0_combout\,
	datac => \tr|i2c_master_inst|state.command~regout\,
	combout => \tr|i2c_master_inst|Selector19~0_combout\);

-- Location: LCFF_X36_Y22_N9
\tr|i2c_master_inst|state.command\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \tr|i2c_master_inst|Selector19~0_combout\,
	ena => \tr|i2c_master_inst|data_clk_re~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \tr|i2c_master_inst|state.command~regout\);

-- Location: LCCOMB_X36_Y22_N20
\tr|i2c_master_inst|Selector20~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|i2c_master_inst|Selector20~0_combout\ = (\tr|i2c_master_inst|bit_cnt\(0) & (\tr|i2c_master_inst|state.command~regout\ & (\tr|i2c_master_inst|bit_cnt\(2) & \tr|i2c_master_inst|bit_cnt\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tr|i2c_master_inst|bit_cnt\(0),
	datab => \tr|i2c_master_inst|state.command~regout\,
	datac => \tr|i2c_master_inst|bit_cnt\(2),
	datad => \tr|i2c_master_inst|bit_cnt\(1),
	combout => \tr|i2c_master_inst|Selector20~0_combout\);

-- Location: LCFF_X36_Y22_N21
\tr|i2c_master_inst|state.slv_ack1\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \tr|i2c_master_inst|Selector20~0_combout\,
	ena => \tr|i2c_master_inst|data_clk_re~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \tr|i2c_master_inst|state.slv_ack1~regout\);

-- Location: LCCOMB_X37_Y22_N18
\tr|i2c_master_inst|Selector0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|i2c_master_inst|Selector0~0_combout\ = (\tr|i2c_master_inst|busy_r~regout\ & ((\tr|i2c_master_inst|state.command~regout\) # ((\tr|i2c_master_inst|Selector25~0_combout\) # (\tr|i2c_master_inst|state.slv_ack1~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tr|i2c_master_inst|state.command~regout\,
	datab => \tr|i2c_master_inst|Selector25~0_combout\,
	datac => \tr|i2c_master_inst|state.slv_ack1~regout\,
	datad => \tr|i2c_master_inst|busy_r~regout\,
	combout => \tr|i2c_master_inst|Selector0~0_combout\);

-- Location: LCCOMB_X37_Y22_N12
\tr|i2c_master_inst|Selector0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|i2c_master_inst|Selector0~2_combout\ = (\tr|i2c_master_inst|Selector0~1_combout\) # ((\tr|i2c_master_inst|state.start~regout\) # (\tr|i2c_master_inst|Selector0~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \tr|i2c_master_inst|Selector0~1_combout\,
	datac => \tr|i2c_master_inst|state.start~regout\,
	datad => \tr|i2c_master_inst|Selector0~0_combout\,
	combout => \tr|i2c_master_inst|Selector0~2_combout\);

-- Location: LCFF_X37_Y22_N13
\tr|i2c_master_inst|busy_r\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \tr|i2c_master_inst|Selector0~2_combout\,
	ena => \tr|i2c_master_inst|data_clk_re~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \tr|i2c_master_inst|busy_r~regout\);

-- Location: LCCOMB_X37_Y23_N2
\tr|tr_logic|state.WAIT_IDLE~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|tr_logic|state.WAIT_IDLE~0_combout\ = (\tr|tr_logic|state.WAIT_IDLE~regout\) # (!\tr|i2c_master_inst|busy_r~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \tr|tr_logic|state.WAIT_IDLE~regout\,
	datad => \tr|i2c_master_inst|busy_r~regout\,
	combout => \tr|tr_logic|state.WAIT_IDLE~0_combout\);

-- Location: LCFF_X37_Y23_N3
\tr|tr_logic|state.WAIT_IDLE\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \tr|tr_logic|state.WAIT_IDLE~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \tr|tr_logic|state.WAIT_IDLE~regout\);

-- Location: LCCOMB_X38_Y24_N10
\tr|delay_timer|counter[0]~23\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|delay_timer|counter[0]~23_combout\ = \tr|delay_timer|counter\(0) $ (VCC)
-- \tr|delay_timer|counter[0]~24\ = CARRY(\tr|delay_timer|counter\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tr|delay_timer|counter\(0),
	datad => VCC,
	combout => \tr|delay_timer|counter[0]~23_combout\,
	cout => \tr|delay_timer|counter[0]~24\);

-- Location: LCCOMB_X38_Y24_N14
\tr|delay_timer|counter[2]~27\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|delay_timer|counter[2]~27_combout\ = (\tr|delay_timer|counter\(2) & (\tr|delay_timer|counter[1]~26\ $ (GND))) # (!\tr|delay_timer|counter\(2) & (!\tr|delay_timer|counter[1]~26\ & VCC))
-- \tr|delay_timer|counter[2]~28\ = CARRY((\tr|delay_timer|counter\(2) & !\tr|delay_timer|counter[1]~26\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \tr|delay_timer|counter\(2),
	datad => VCC,
	cin => \tr|delay_timer|counter[1]~26\,
	combout => \tr|delay_timer|counter[2]~27_combout\,
	cout => \tr|delay_timer|counter[2]~28\);

-- Location: LCCOMB_X37_Y23_N20
\tr|tr_logic|next_completed~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|tr_logic|next_completed~0_combout\ = (!\tr|i2c_master_inst|busy_r~regout\ & \tr|tr_logic|state.READ2_ACTIVE~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tr|i2c_master_inst|busy_r~regout\,
	datad => \tr|tr_logic|state.READ2_ACTIVE~regout\,
	combout => \tr|tr_logic|next_completed~0_combout\);

-- Location: LCFF_X37_Y23_N21
\tr|tr_logic|completed\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \tr|tr_logic|next_completed~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \tr|tr_logic|completed~regout\);

-- Location: LCCOMB_X37_Y23_N4
\tr|delay_timer|Selector0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|delay_timer|Selector0~0_combout\ = (!\tr|delay_timer|state.TRIGGERED~regout\ & ((\tr|delay_timer|state.IDLE~regout\) # (\tr|tr_logic|completed~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tr|delay_timer|state.TRIGGERED~regout\,
	datac => \tr|delay_timer|state.IDLE~regout\,
	datad => \tr|tr_logic|completed~regout\,
	combout => \tr|delay_timer|Selector0~0_combout\);

-- Location: LCFF_X37_Y23_N5
\tr|delay_timer|state.IDLE\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \tr|delay_timer|Selector0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \tr|delay_timer|state.IDLE~regout\);

-- Location: LCCOMB_X37_Y23_N0
\tr|delay_timer|Selector1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|delay_timer|Selector1~0_combout\ = (\tr|delay_timer|Equal0~7_combout\ & (!\tr|delay_timer|state.IDLE~regout\ & ((\tr|tr_logic|completed~regout\)))) # (!\tr|delay_timer|Equal0~7_combout\ & ((\tr|delay_timer|state.WAITING~regout\) # 
-- ((!\tr|delay_timer|state.IDLE~regout\ & \tr|tr_logic|completed~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111001101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tr|delay_timer|Equal0~7_combout\,
	datab => \tr|delay_timer|state.IDLE~regout\,
	datac => \tr|delay_timer|state.WAITING~regout\,
	datad => \tr|tr_logic|completed~regout\,
	combout => \tr|delay_timer|Selector1~0_combout\);

-- Location: LCFF_X37_Y23_N1
\tr|delay_timer|state.WAITING\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \tr|delay_timer|Selector1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \tr|delay_timer|state.WAITING~regout\);

-- Location: LCFF_X38_Y24_N15
\tr|delay_timer|counter[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \tr|delay_timer|counter[2]~27_combout\,
	sclr => \tr|delay_timer|ALT_INV_state.WAITING~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \tr|delay_timer|counter\(2));

-- Location: LCCOMB_X38_Y24_N16
\tr|delay_timer|counter[3]~29\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|delay_timer|counter[3]~29_combout\ = (\tr|delay_timer|counter\(3) & (!\tr|delay_timer|counter[2]~28\)) # (!\tr|delay_timer|counter\(3) & ((\tr|delay_timer|counter[2]~28\) # (GND)))
-- \tr|delay_timer|counter[3]~30\ = CARRY((!\tr|delay_timer|counter[2]~28\) # (!\tr|delay_timer|counter\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \tr|delay_timer|counter\(3),
	datad => VCC,
	cin => \tr|delay_timer|counter[2]~28\,
	combout => \tr|delay_timer|counter[3]~29_combout\,
	cout => \tr|delay_timer|counter[3]~30\);

-- Location: LCCOMB_X38_Y24_N18
\tr|delay_timer|counter[4]~31\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|delay_timer|counter[4]~31_combout\ = (\tr|delay_timer|counter\(4) & (\tr|delay_timer|counter[3]~30\ $ (GND))) # (!\tr|delay_timer|counter\(4) & (!\tr|delay_timer|counter[3]~30\ & VCC))
-- \tr|delay_timer|counter[4]~32\ = CARRY((\tr|delay_timer|counter\(4) & !\tr|delay_timer|counter[3]~30\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \tr|delay_timer|counter\(4),
	datad => VCC,
	cin => \tr|delay_timer|counter[3]~30\,
	combout => \tr|delay_timer|counter[4]~31_combout\,
	cout => \tr|delay_timer|counter[4]~32\);

-- Location: LCFF_X38_Y24_N19
\tr|delay_timer|counter[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \tr|delay_timer|counter[4]~31_combout\,
	sclr => \tr|delay_timer|ALT_INV_state.WAITING~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \tr|delay_timer|counter\(4));

-- Location: LCCOMB_X38_Y24_N20
\tr|delay_timer|counter[5]~33\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|delay_timer|counter[5]~33_combout\ = (\tr|delay_timer|counter\(5) & (!\tr|delay_timer|counter[4]~32\)) # (!\tr|delay_timer|counter\(5) & ((\tr|delay_timer|counter[4]~32\) # (GND)))
-- \tr|delay_timer|counter[5]~34\ = CARRY((!\tr|delay_timer|counter[4]~32\) # (!\tr|delay_timer|counter\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \tr|delay_timer|counter\(5),
	datad => VCC,
	cin => \tr|delay_timer|counter[4]~32\,
	combout => \tr|delay_timer|counter[5]~33_combout\,
	cout => \tr|delay_timer|counter[5]~34\);

-- Location: LCCOMB_X38_Y24_N22
\tr|delay_timer|counter[6]~35\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|delay_timer|counter[6]~35_combout\ = (\tr|delay_timer|counter\(6) & (\tr|delay_timer|counter[5]~34\ $ (GND))) # (!\tr|delay_timer|counter\(6) & (!\tr|delay_timer|counter[5]~34\ & VCC))
-- \tr|delay_timer|counter[6]~36\ = CARRY((\tr|delay_timer|counter\(6) & !\tr|delay_timer|counter[5]~34\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \tr|delay_timer|counter\(6),
	datad => VCC,
	cin => \tr|delay_timer|counter[5]~34\,
	combout => \tr|delay_timer|counter[6]~35_combout\,
	cout => \tr|delay_timer|counter[6]~36\);

-- Location: LCFF_X38_Y24_N23
\tr|delay_timer|counter[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \tr|delay_timer|counter[6]~35_combout\,
	sclr => \tr|delay_timer|ALT_INV_state.WAITING~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \tr|delay_timer|counter\(6));

-- Location: LCCOMB_X38_Y24_N26
\tr|delay_timer|counter[8]~39\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|delay_timer|counter[8]~39_combout\ = (\tr|delay_timer|counter\(8) & (\tr|delay_timer|counter[7]~38\ $ (GND))) # (!\tr|delay_timer|counter\(8) & (!\tr|delay_timer|counter[7]~38\ & VCC))
-- \tr|delay_timer|counter[8]~40\ = CARRY((\tr|delay_timer|counter\(8) & !\tr|delay_timer|counter[7]~38\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \tr|delay_timer|counter\(8),
	datad => VCC,
	cin => \tr|delay_timer|counter[7]~38\,
	combout => \tr|delay_timer|counter[8]~39_combout\,
	cout => \tr|delay_timer|counter[8]~40\);

-- Location: LCFF_X38_Y24_N27
\tr|delay_timer|counter[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \tr|delay_timer|counter[8]~39_combout\,
	sclr => \tr|delay_timer|ALT_INV_state.WAITING~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \tr|delay_timer|counter\(8));

-- Location: LCCOMB_X38_Y24_N28
\tr|delay_timer|counter[9]~41\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|delay_timer|counter[9]~41_combout\ = (\tr|delay_timer|counter\(9) & (!\tr|delay_timer|counter[8]~40\)) # (!\tr|delay_timer|counter\(9) & ((\tr|delay_timer|counter[8]~40\) # (GND)))
-- \tr|delay_timer|counter[9]~42\ = CARRY((!\tr|delay_timer|counter[8]~40\) # (!\tr|delay_timer|counter\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \tr|delay_timer|counter\(9),
	datad => VCC,
	cin => \tr|delay_timer|counter[8]~40\,
	combout => \tr|delay_timer|counter[9]~41_combout\,
	cout => \tr|delay_timer|counter[9]~42\);

-- Location: LCFF_X38_Y24_N29
\tr|delay_timer|counter[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \tr|delay_timer|counter[9]~41_combout\,
	sclr => \tr|delay_timer|ALT_INV_state.WAITING~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \tr|delay_timer|counter\(9));

-- Location: LCCOMB_X38_Y24_N30
\tr|delay_timer|counter[10]~43\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|delay_timer|counter[10]~43_combout\ = (\tr|delay_timer|counter\(10) & (\tr|delay_timer|counter[9]~42\ $ (GND))) # (!\tr|delay_timer|counter\(10) & (!\tr|delay_timer|counter[9]~42\ & VCC))
-- \tr|delay_timer|counter[10]~44\ = CARRY((\tr|delay_timer|counter\(10) & !\tr|delay_timer|counter[9]~42\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \tr|delay_timer|counter\(10),
	datad => VCC,
	cin => \tr|delay_timer|counter[9]~42\,
	combout => \tr|delay_timer|counter[10]~43_combout\,
	cout => \tr|delay_timer|counter[10]~44\);

-- Location: LCFF_X38_Y24_N31
\tr|delay_timer|counter[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \tr|delay_timer|counter[10]~43_combout\,
	sclr => \tr|delay_timer|ALT_INV_state.WAITING~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \tr|delay_timer|counter\(10));

-- Location: LCCOMB_X38_Y23_N0
\tr|delay_timer|counter[11]~45\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|delay_timer|counter[11]~45_combout\ = (\tr|delay_timer|counter\(11) & (!\tr|delay_timer|counter[10]~44\)) # (!\tr|delay_timer|counter\(11) & ((\tr|delay_timer|counter[10]~44\) # (GND)))
-- \tr|delay_timer|counter[11]~46\ = CARRY((!\tr|delay_timer|counter[10]~44\) # (!\tr|delay_timer|counter\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \tr|delay_timer|counter\(11),
	datad => VCC,
	cin => \tr|delay_timer|counter[10]~44\,
	combout => \tr|delay_timer|counter[11]~45_combout\,
	cout => \tr|delay_timer|counter[11]~46\);

-- Location: LCFF_X38_Y23_N1
\tr|delay_timer|counter[11]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \tr|delay_timer|counter[11]~45_combout\,
	sclr => \tr|delay_timer|ALT_INV_state.WAITING~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \tr|delay_timer|counter\(11));

-- Location: LCCOMB_X38_Y23_N2
\tr|delay_timer|counter[12]~47\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|delay_timer|counter[12]~47_combout\ = (\tr|delay_timer|counter\(12) & (\tr|delay_timer|counter[11]~46\ $ (GND))) # (!\tr|delay_timer|counter\(12) & (!\tr|delay_timer|counter[11]~46\ & VCC))
-- \tr|delay_timer|counter[12]~48\ = CARRY((\tr|delay_timer|counter\(12) & !\tr|delay_timer|counter[11]~46\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \tr|delay_timer|counter\(12),
	datad => VCC,
	cin => \tr|delay_timer|counter[11]~46\,
	combout => \tr|delay_timer|counter[12]~47_combout\,
	cout => \tr|delay_timer|counter[12]~48\);

-- Location: LCFF_X38_Y23_N3
\tr|delay_timer|counter[12]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \tr|delay_timer|counter[12]~47_combout\,
	sclr => \tr|delay_timer|ALT_INV_state.WAITING~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \tr|delay_timer|counter\(12));

-- Location: LCCOMB_X38_Y23_N4
\tr|delay_timer|counter[13]~49\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|delay_timer|counter[13]~49_combout\ = (\tr|delay_timer|counter\(13) & (!\tr|delay_timer|counter[12]~48\)) # (!\tr|delay_timer|counter\(13) & ((\tr|delay_timer|counter[12]~48\) # (GND)))
-- \tr|delay_timer|counter[13]~50\ = CARRY((!\tr|delay_timer|counter[12]~48\) # (!\tr|delay_timer|counter\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \tr|delay_timer|counter\(13),
	datad => VCC,
	cin => \tr|delay_timer|counter[12]~48\,
	combout => \tr|delay_timer|counter[13]~49_combout\,
	cout => \tr|delay_timer|counter[13]~50\);

-- Location: LCFF_X38_Y23_N5
\tr|delay_timer|counter[13]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \tr|delay_timer|counter[13]~49_combout\,
	sclr => \tr|delay_timer|ALT_INV_state.WAITING~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \tr|delay_timer|counter\(13));

-- Location: LCCOMB_X38_Y23_N8
\tr|delay_timer|counter[15]~53\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|delay_timer|counter[15]~53_combout\ = (\tr|delay_timer|counter\(15) & (!\tr|delay_timer|counter[14]~52\)) # (!\tr|delay_timer|counter\(15) & ((\tr|delay_timer|counter[14]~52\) # (GND)))
-- \tr|delay_timer|counter[15]~54\ = CARRY((!\tr|delay_timer|counter[14]~52\) # (!\tr|delay_timer|counter\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \tr|delay_timer|counter\(15),
	datad => VCC,
	cin => \tr|delay_timer|counter[14]~52\,
	combout => \tr|delay_timer|counter[15]~53_combout\,
	cout => \tr|delay_timer|counter[15]~54\);

-- Location: LCFF_X38_Y23_N9
\tr|delay_timer|counter[15]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \tr|delay_timer|counter[15]~53_combout\,
	sclr => \tr|delay_timer|ALT_INV_state.WAITING~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \tr|delay_timer|counter\(15));

-- Location: LCCOMB_X38_Y23_N10
\tr|delay_timer|counter[16]~55\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|delay_timer|counter[16]~55_combout\ = (\tr|delay_timer|counter\(16) & (\tr|delay_timer|counter[15]~54\ $ (GND))) # (!\tr|delay_timer|counter\(16) & (!\tr|delay_timer|counter[15]~54\ & VCC))
-- \tr|delay_timer|counter[16]~56\ = CARRY((\tr|delay_timer|counter\(16) & !\tr|delay_timer|counter[15]~54\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \tr|delay_timer|counter\(16),
	datad => VCC,
	cin => \tr|delay_timer|counter[15]~54\,
	combout => \tr|delay_timer|counter[16]~55_combout\,
	cout => \tr|delay_timer|counter[16]~56\);

-- Location: LCCOMB_X38_Y23_N14
\tr|delay_timer|counter[18]~59\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|delay_timer|counter[18]~59_combout\ = (\tr|delay_timer|counter\(18) & (\tr|delay_timer|counter[17]~58\ $ (GND))) # (!\tr|delay_timer|counter\(18) & (!\tr|delay_timer|counter[17]~58\ & VCC))
-- \tr|delay_timer|counter[18]~60\ = CARRY((\tr|delay_timer|counter\(18) & !\tr|delay_timer|counter[17]~58\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \tr|delay_timer|counter\(18),
	datad => VCC,
	cin => \tr|delay_timer|counter[17]~58\,
	combout => \tr|delay_timer|counter[18]~59_combout\,
	cout => \tr|delay_timer|counter[18]~60\);

-- Location: LCFF_X38_Y23_N15
\tr|delay_timer|counter[18]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \tr|delay_timer|counter[18]~59_combout\,
	sclr => \tr|delay_timer|ALT_INV_state.WAITING~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \tr|delay_timer|counter\(18));

-- Location: LCCOMB_X38_Y23_N16
\tr|delay_timer|counter[19]~61\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|delay_timer|counter[19]~61_combout\ = (\tr|delay_timer|counter\(19) & (!\tr|delay_timer|counter[18]~60\)) # (!\tr|delay_timer|counter\(19) & ((\tr|delay_timer|counter[18]~60\) # (GND)))
-- \tr|delay_timer|counter[19]~62\ = CARRY((!\tr|delay_timer|counter[18]~60\) # (!\tr|delay_timer|counter\(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \tr|delay_timer|counter\(19),
	datad => VCC,
	cin => \tr|delay_timer|counter[18]~60\,
	combout => \tr|delay_timer|counter[19]~61_combout\,
	cout => \tr|delay_timer|counter[19]~62\);

-- Location: LCCOMB_X38_Y23_N18
\tr|delay_timer|counter[20]~63\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|delay_timer|counter[20]~63_combout\ = (\tr|delay_timer|counter\(20) & (\tr|delay_timer|counter[19]~62\ $ (GND))) # (!\tr|delay_timer|counter\(20) & (!\tr|delay_timer|counter[19]~62\ & VCC))
-- \tr|delay_timer|counter[20]~64\ = CARRY((\tr|delay_timer|counter\(20) & !\tr|delay_timer|counter[19]~62\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \tr|delay_timer|counter\(20),
	datad => VCC,
	cin => \tr|delay_timer|counter[19]~62\,
	combout => \tr|delay_timer|counter[20]~63_combout\,
	cout => \tr|delay_timer|counter[20]~64\);

-- Location: LCFF_X38_Y23_N19
\tr|delay_timer|counter[20]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \tr|delay_timer|counter[20]~63_combout\,
	sclr => \tr|delay_timer|ALT_INV_state.WAITING~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \tr|delay_timer|counter\(20));

-- Location: LCCOMB_X38_Y23_N20
\tr|delay_timer|counter[21]~65\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|delay_timer|counter[21]~65_combout\ = (\tr|delay_timer|counter\(21) & (!\tr|delay_timer|counter[20]~64\)) # (!\tr|delay_timer|counter\(21) & ((\tr|delay_timer|counter[20]~64\) # (GND)))
-- \tr|delay_timer|counter[21]~66\ = CARRY((!\tr|delay_timer|counter[20]~64\) # (!\tr|delay_timer|counter\(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \tr|delay_timer|counter\(21),
	datad => VCC,
	cin => \tr|delay_timer|counter[20]~64\,
	combout => \tr|delay_timer|counter[21]~65_combout\,
	cout => \tr|delay_timer|counter[21]~66\);

-- Location: LCCOMB_X38_Y23_N22
\tr|delay_timer|counter[22]~67\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|delay_timer|counter[22]~67_combout\ = \tr|delay_timer|counter[21]~66\ $ (!\tr|delay_timer|counter\(22))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \tr|delay_timer|counter\(22),
	cin => \tr|delay_timer|counter[21]~66\,
	combout => \tr|delay_timer|counter[22]~67_combout\);

-- Location: LCFF_X38_Y23_N23
\tr|delay_timer|counter[22]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \tr|delay_timer|counter[22]~67_combout\,
	sclr => \tr|delay_timer|ALT_INV_state.WAITING~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \tr|delay_timer|counter\(22));

-- Location: LCFF_X38_Y23_N21
\tr|delay_timer|counter[21]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \tr|delay_timer|counter[21]~65_combout\,
	sclr => \tr|delay_timer|ALT_INV_state.WAITING~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \tr|delay_timer|counter\(21));

-- Location: LCCOMB_X38_Y23_N28
\tr|delay_timer|Equal0~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|delay_timer|Equal0~6_combout\ = (\tr|delay_timer|counter\(22) & (!\tr|delay_timer|counter\(21) & !\tr|delay_timer|counter\(20)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \tr|delay_timer|counter\(22),
	datac => \tr|delay_timer|counter\(21),
	datad => \tr|delay_timer|counter\(20),
	combout => \tr|delay_timer|Equal0~6_combout\);

-- Location: LCFF_X38_Y23_N17
\tr|delay_timer|counter[19]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \tr|delay_timer|counter[19]~61_combout\,
	sclr => \tr|delay_timer|ALT_INV_state.WAITING~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \tr|delay_timer|counter\(19));

-- Location: LCFF_X38_Y23_N11
\tr|delay_timer|counter[16]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \tr|delay_timer|counter[16]~55_combout\,
	sclr => \tr|delay_timer|ALT_INV_state.WAITING~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \tr|delay_timer|counter\(16));

-- Location: LCCOMB_X38_Y23_N26
\tr|delay_timer|Equal0~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|delay_timer|Equal0~5_combout\ = (!\tr|delay_timer|counter\(17) & (\tr|delay_timer|counter\(18) & (\tr|delay_timer|counter\(19) & !\tr|delay_timer|counter\(16))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tr|delay_timer|counter\(17),
	datab => \tr|delay_timer|counter\(18),
	datac => \tr|delay_timer|counter\(19),
	datad => \tr|delay_timer|counter\(16),
	combout => \tr|delay_timer|Equal0~5_combout\);

-- Location: LCFF_X38_Y24_N21
\tr|delay_timer|counter[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \tr|delay_timer|counter[5]~33_combout\,
	sclr => \tr|delay_timer|ALT_INV_state.WAITING~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \tr|delay_timer|counter\(5));

-- Location: LCCOMB_X38_Y24_N2
\tr|delay_timer|Equal0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|delay_timer|Equal0~1_combout\ = (!\tr|delay_timer|counter\(7) & (!\tr|delay_timer|counter\(4) & (!\tr|delay_timer|counter\(5) & \tr|delay_timer|counter\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tr|delay_timer|counter\(7),
	datab => \tr|delay_timer|counter\(4),
	datac => \tr|delay_timer|counter\(5),
	datad => \tr|delay_timer|counter\(6),
	combout => \tr|delay_timer|Equal0~1_combout\);

-- Location: LCCOMB_X38_Y24_N4
\tr|delay_timer|Equal0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|delay_timer|Equal0~2_combout\ = (\tr|delay_timer|counter\(9) & (!\tr|delay_timer|counter\(10) & (\tr|delay_timer|counter\(11) & \tr|delay_timer|counter\(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tr|delay_timer|counter\(9),
	datab => \tr|delay_timer|counter\(10),
	datac => \tr|delay_timer|counter\(11),
	datad => \tr|delay_timer|counter\(8),
	combout => \tr|delay_timer|Equal0~2_combout\);

-- Location: LCFF_X38_Y24_N17
\tr|delay_timer|counter[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \tr|delay_timer|counter[3]~29_combout\,
	sclr => \tr|delay_timer|ALT_INV_state.WAITING~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \tr|delay_timer|counter\(3));

-- Location: LCFF_X38_Y24_N11
\tr|delay_timer|counter[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \tr|delay_timer|counter[0]~23_combout\,
	sclr => \tr|delay_timer|ALT_INV_state.WAITING~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \tr|delay_timer|counter\(0));

-- Location: LCCOMB_X38_Y24_N0
\tr|delay_timer|Equal0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|delay_timer|Equal0~0_combout\ = (!\tr|delay_timer|counter\(1) & (!\tr|delay_timer|counter\(2) & (!\tr|delay_timer|counter\(3) & !\tr|delay_timer|counter\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tr|delay_timer|counter\(1),
	datab => \tr|delay_timer|counter\(2),
	datac => \tr|delay_timer|counter\(3),
	datad => \tr|delay_timer|counter\(0),
	combout => \tr|delay_timer|Equal0~0_combout\);

-- Location: LCCOMB_X38_Y24_N6
\tr|delay_timer|Equal0~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|delay_timer|Equal0~4_combout\ = (\tr|delay_timer|Equal0~3_combout\ & (\tr|delay_timer|Equal0~1_combout\ & (\tr|delay_timer|Equal0~2_combout\ & \tr|delay_timer|Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tr|delay_timer|Equal0~3_combout\,
	datab => \tr|delay_timer|Equal0~1_combout\,
	datac => \tr|delay_timer|Equal0~2_combout\,
	datad => \tr|delay_timer|Equal0~0_combout\,
	combout => \tr|delay_timer|Equal0~4_combout\);

-- Location: LCCOMB_X37_Y23_N24
\tr|delay_timer|Selector2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|delay_timer|Selector2~0_combout\ = (\tr|delay_timer|state.WAITING~regout\ & (\tr|delay_timer|Equal0~6_combout\ & (\tr|delay_timer|Equal0~5_combout\ & \tr|delay_timer|Equal0~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tr|delay_timer|state.WAITING~regout\,
	datab => \tr|delay_timer|Equal0~6_combout\,
	datac => \tr|delay_timer|Equal0~5_combout\,
	datad => \tr|delay_timer|Equal0~4_combout\,
	combout => \tr|delay_timer|Selector2~0_combout\);

-- Location: LCFF_X37_Y23_N25
\tr|delay_timer|state.TRIGGERED\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \tr|delay_timer|Selector2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \tr|delay_timer|state.TRIGGERED~regout\);

-- Location: LCFF_X37_Y23_N7
\tr|delay_timer|fire\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \tr|delay_timer|state.TRIGGERED~regout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \tr|delay_timer|fire~regout\);

-- Location: LCCOMB_X37_Y23_N26
\tr|tr_logic|Selector7~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|tr_logic|Selector7~0_combout\ = (\tr|i2c_master_inst|busy_r~regout\ & (!\tr|delay_timer|fire~regout\ & (\tr|tr_logic|state.WAIT_DELAY~regout\))) # (!\tr|i2c_master_inst|busy_r~regout\ & ((\tr|tr_logic|state.READ2_ACTIVE~regout\) # 
-- ((!\tr|delay_timer|fire~regout\ & \tr|tr_logic|state.WAIT_DELAY~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111010100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tr|i2c_master_inst|busy_r~regout\,
	datab => \tr|delay_timer|fire~regout\,
	datac => \tr|tr_logic|state.WAIT_DELAY~regout\,
	datad => \tr|tr_logic|state.READ2_ACTIVE~regout\,
	combout => \tr|tr_logic|Selector7~0_combout\);

-- Location: LCFF_X37_Y23_N27
\tr|tr_logic|state.WAIT_DELAY\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \tr|tr_logic|Selector7~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \tr|tr_logic|state.WAIT_DELAY~regout\);

-- Location: LCCOMB_X37_Y23_N6
\tr|tr_logic|Selector1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|tr_logic|Selector1~0_combout\ = (\tr|delay_timer|fire~regout\ & \tr|tr_logic|state.WAIT_DELAY~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \tr|delay_timer|fire~regout\,
	datad => \tr|tr_logic|state.WAIT_DELAY~regout\,
	combout => \tr|tr_logic|Selector1~0_combout\);

-- Location: LCCOMB_X37_Y23_N22
\tr|tr_logic|Selector1~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|tr_logic|Selector1~1_combout\ = (\tr|tr_logic|Selector1~0_combout\) # ((!\tr|i2c_master_inst|busy_r~regout\ & ((\tr|tr_logic|state.IDLE~regout\) # (!\tr|tr_logic|state.WAIT_IDLE~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tr|i2c_master_inst|busy_r~regout\,
	datab => \tr|tr_logic|state.WAIT_IDLE~regout\,
	datac => \tr|tr_logic|state.IDLE~regout\,
	datad => \tr|tr_logic|Selector1~0_combout\,
	combout => \tr|tr_logic|Selector1~1_combout\);

-- Location: LCFF_X37_Y23_N23
\tr|tr_logic|state.IDLE\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \tr|tr_logic|Selector1~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \tr|tr_logic|state.IDLE~regout\);

-- Location: LCCOMB_X37_Y23_N14
\tr|tr_logic|Selector2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|tr_logic|Selector2~0_combout\ = (\tr|i2c_master_inst|busy_r~regout\ & ((\tr|tr_logic|state.IDLE~regout\) # (\tr|tr_logic|state.WRITE_ACTIVE~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \tr|tr_logic|state.IDLE~regout\,
	datac => \tr|tr_logic|state.WRITE_ACTIVE~regout\,
	datad => \tr|i2c_master_inst|busy_r~regout\,
	combout => \tr|tr_logic|Selector2~0_combout\);

-- Location: LCFF_X37_Y23_N15
\tr|tr_logic|state.WRITE_ACTIVE\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \tr|tr_logic|Selector2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \tr|tr_logic|state.WRITE_ACTIVE~regout\);

-- Location: LCCOMB_X37_Y23_N18
\tr|tr_logic|Selector3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|tr_logic|Selector3~0_combout\ = (!\tr|i2c_master_inst|busy_r~regout\ & ((\tr|tr_logic|state.WRITE_ACTIVE~regout\) # (\tr|tr_logic|state.WRITE_COMPLETE~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010001010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tr|i2c_master_inst|busy_r~regout\,
	datab => \tr|tr_logic|state.WRITE_ACTIVE~regout\,
	datac => \tr|tr_logic|state.WRITE_COMPLETE~regout\,
	combout => \tr|tr_logic|Selector3~0_combout\);

-- Location: LCFF_X37_Y23_N19
\tr|tr_logic|state.WRITE_COMPLETE\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \tr|tr_logic|Selector3~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \tr|tr_logic|state.WRITE_COMPLETE~regout\);

-- Location: LCCOMB_X37_Y23_N28
\tr|tr_logic|Selector4~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|tr_logic|Selector4~0_combout\ = (\tr|i2c_master_inst|busy_r~regout\ & ((\tr|tr_logic|state.READ_ACTIVE~regout\) # (\tr|tr_logic|state.WRITE_COMPLETE~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tr|i2c_master_inst|busy_r~regout\,
	datac => \tr|tr_logic|state.READ_ACTIVE~regout\,
	datad => \tr|tr_logic|state.WRITE_COMPLETE~regout\,
	combout => \tr|tr_logic|Selector4~0_combout\);

-- Location: LCFF_X37_Y23_N29
\tr|tr_logic|state.READ_ACTIVE\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \tr|tr_logic|Selector4~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \tr|tr_logic|state.READ_ACTIVE~regout\);

-- Location: LCCOMB_X37_Y23_N12
\tr|tr_logic|Selector5~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|tr_logic|Selector5~0_combout\ = (!\tr|i2c_master_inst|busy_r~regout\ & ((\tr|tr_logic|state.READ_COMPLETE~regout\) # (\tr|tr_logic|state.READ_ACTIVE~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tr|i2c_master_inst|busy_r~regout\,
	datac => \tr|tr_logic|state.READ_COMPLETE~regout\,
	datad => \tr|tr_logic|state.READ_ACTIVE~regout\,
	combout => \tr|tr_logic|Selector5~0_combout\);

-- Location: LCFF_X37_Y23_N13
\tr|tr_logic|state.READ_COMPLETE\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \tr|tr_logic|Selector5~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \tr|tr_logic|state.READ_COMPLETE~regout\);

-- Location: LCCOMB_X37_Y23_N30
\tr|tr_logic|Selector6~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|tr_logic|Selector6~0_combout\ = (\tr|i2c_master_inst|busy_r~regout\ & ((\tr|tr_logic|state.READ2_ACTIVE~regout\) # (\tr|tr_logic|state.READ_COMPLETE~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tr|i2c_master_inst|busy_r~regout\,
	datac => \tr|tr_logic|state.READ2_ACTIVE~regout\,
	datad => \tr|tr_logic|state.READ_COMPLETE~regout\,
	combout => \tr|tr_logic|Selector6~0_combout\);

-- Location: LCFF_X37_Y23_N31
\tr|tr_logic|state.READ2_ACTIVE\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \tr|tr_logic|Selector6~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \tr|tr_logic|state.READ2_ACTIVE~regout\);

-- Location: LCCOMB_X37_Y23_N16
\tr|tr_logic|Selector9~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|tr_logic|Selector9~0_combout\ = (\tr|tr_logic|state.READ2_ACTIVE~regout\ & (((\tr|tr_logic|i2c_l_ena~regout\ & \tr|i2c_master_inst|busy_r~regout\)))) # (!\tr|tr_logic|state.READ2_ACTIVE~regout\ & ((\tr|tr_logic|state.IDLE~regout\) # 
-- ((\tr|tr_logic|i2c_l_ena~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001000110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tr|tr_logic|state.IDLE~regout\,
	datab => \tr|tr_logic|state.READ2_ACTIVE~regout\,
	datac => \tr|tr_logic|i2c_l_ena~regout\,
	datad => \tr|i2c_master_inst|busy_r~regout\,
	combout => \tr|tr_logic|Selector9~0_combout\);

-- Location: LCFF_X37_Y23_N17
\tr|tr_logic|i2c_l_ena\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \tr|tr_logic|Selector9~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \tr|tr_logic|i2c_l_ena~regout\);

-- Location: LCCOMB_X37_Y22_N22
\tr|i2c_master_inst|Selector18~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|i2c_master_inst|Selector18~0_combout\ = (\tr|i2c_master_inst|state.slv_ack2~regout\ & (\tr|tr_logic|i2c_l_rw~regout\ $ ((\tr|i2c_master_inst|addr_rw\(0))))) # (!\tr|i2c_master_inst|state.slv_ack2~regout\ & (\tr|i2c_master_inst|state.mstr_ack~regout\ & 
-- (\tr|tr_logic|i2c_l_rw~regout\ $ (\tr|i2c_master_inst|addr_rw\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tr|tr_logic|i2c_l_rw~regout\,
	datab => \tr|i2c_master_inst|state.slv_ack2~regout\,
	datac => \tr|i2c_master_inst|addr_rw\(0),
	datad => \tr|i2c_master_inst|state.mstr_ack~regout\,
	combout => \tr|i2c_master_inst|Selector18~0_combout\);

-- Location: LCCOMB_X37_Y22_N16
\tr|i2c_master_inst|Selector18~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|i2c_master_inst|Selector18~1_combout\ = (\tr|tr_logic|i2c_l_ena~regout\ & ((\tr|i2c_master_inst|Selector18~0_combout\) # (!\tr|i2c_master_inst|state.ready~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tr|i2c_master_inst|state.ready~regout\,
	datac => \tr|tr_logic|i2c_l_ena~regout\,
	datad => \tr|i2c_master_inst|Selector18~0_combout\,
	combout => \tr|i2c_master_inst|Selector18~1_combout\);

-- Location: LCFF_X37_Y22_N17
\tr|i2c_master_inst|state.start\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \tr|i2c_master_inst|Selector18~1_combout\,
	ena => \tr|i2c_master_inst|data_clk_re~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \tr|i2c_master_inst|state.start~regout\);

-- Location: LCFF_X37_Y22_N11
\tr|i2c_master_inst|state.stop\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \tr|i2c_master_inst|Selector25~0_combout\,
	ena => \tr|i2c_master_inst|data_clk_re~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \tr|i2c_master_inst|state.stop~regout\);

-- Location: LCCOMB_X36_Y21_N8
\tr|i2c_master_inst|scl_ena~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|i2c_master_inst|scl_ena~1_combout\ = (\tr|i2c_master_inst|Decoder0~0_combout\ & ((\tr|i2c_master_inst|state.start~regout\) # ((\tr|i2c_master_inst|scl_ena~regout\ & !\tr|i2c_master_inst|state.stop~regout\)))) # 
-- (!\tr|i2c_master_inst|Decoder0~0_combout\ & (((\tr|i2c_master_inst|scl_ena~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tr|i2c_master_inst|Decoder0~0_combout\,
	datab => \tr|i2c_master_inst|state.start~regout\,
	datac => \tr|i2c_master_inst|scl_ena~regout\,
	datad => \tr|i2c_master_inst|state.stop~regout\,
	combout => \tr|i2c_master_inst|scl_ena~1_combout\);

-- Location: LCFF_X36_Y21_N9
\tr|i2c_master_inst|scl_ena\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \tr|i2c_master_inst|scl_ena~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \tr|i2c_master_inst|scl_ena~regout\);

-- Location: LCCOMB_X36_Y21_N18
\tr|i2c_master_inst|scl~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|i2c_master_inst|scl~1_combout\ = (\tr|i2c_master_inst|count_reg\(6)) # (((\tr|i2c_master_inst|LessThan1~1_combout\ & \tr|i2c_master_inst|process_1~0_combout\)) # (!\tr|i2c_master_inst|scl_ena~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tr|i2c_master_inst|LessThan1~1_combout\,
	datab => \tr|i2c_master_inst|count_reg\(6),
	datac => \tr|i2c_master_inst|process_1~0_combout\,
	datad => \tr|i2c_master_inst|scl_ena~regout\,
	combout => \tr|i2c_master_inst|scl~1_combout\);

-- Location: LCCOMB_X36_Y22_N4
\tr|i2c_master_inst|Selector26~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|i2c_master_inst|Selector26~7_combout\ = (\tr|i2c_master_inst|bit_cnt\(2) & ((\tr|i2c_master_inst|addr_rw\(0)) # ((\tr|i2c_master_inst|bit_cnt\(0) & !\tr|i2c_master_inst|state.start~regout\)))) # (!\tr|i2c_master_inst|bit_cnt\(2) & 
-- (((\tr|i2c_master_inst|state.start~regout\)) # (!\tr|i2c_master_inst|bit_cnt\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110100111001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tr|i2c_master_inst|bit_cnt\(0),
	datab => \tr|i2c_master_inst|bit_cnt\(2),
	datac => \tr|i2c_master_inst|state.start~regout\,
	datad => \tr|i2c_master_inst|addr_rw\(0),
	combout => \tr|i2c_master_inst|Selector26~7_combout\);

-- Location: LCCOMB_X36_Y22_N30
\tr|i2c_master_inst|Selector26~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|i2c_master_inst|Selector26~8_combout\ = (\tr|i2c_master_inst|Selector26~7_combout\ & ((\tr|i2c_master_inst|state.command~regout\) # ((\tr|i2c_master_inst|bit_cnt\(0) & \tr|i2c_master_inst|state.start~regout\)))) # 
-- (!\tr|i2c_master_inst|Selector26~7_combout\ & (\tr|i2c_master_inst|bit_cnt\(0) & (\tr|i2c_master_inst|state.start~regout\ & \tr|i2c_master_inst|state.command~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tr|i2c_master_inst|bit_cnt\(0),
	datab => \tr|i2c_master_inst|Selector26~7_combout\,
	datac => \tr|i2c_master_inst|state.start~regout\,
	datad => \tr|i2c_master_inst|state.command~regout\,
	combout => \tr|i2c_master_inst|Selector26~8_combout\);

-- Location: LCCOMB_X37_Y22_N24
\tr|i2c_master_inst|Selector17~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|i2c_master_inst|Selector17~0_combout\ = (!\tr|i2c_master_inst|state.stop~regout\ & ((\tr|tr_logic|i2c_l_ena~regout\) # (\tr|i2c_master_inst|state.ready~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tr|tr_logic|i2c_l_ena~regout\,
	datac => \tr|i2c_master_inst|state.ready~regout\,
	datad => \tr|i2c_master_inst|state.stop~regout\,
	combout => \tr|i2c_master_inst|Selector17~0_combout\);

-- Location: LCFF_X37_Y22_N25
\tr|i2c_master_inst|state.ready\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \tr|i2c_master_inst|Selector17~0_combout\,
	ena => \tr|i2c_master_inst|data_clk_re~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \tr|i2c_master_inst|state.ready~regout\);

-- Location: LCCOMB_X37_Y22_N26
\tr|i2c_master_inst|Selector26~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|i2c_master_inst|Selector26~0_combout\ = (\tr|i2c_master_inst|state.slv_ack2~regout\ & ((\tr|tr_logic|i2c_l_rw~regout\ $ (\tr|i2c_master_inst|addr_rw\(0))) # (!\tr|tr_logic|i2c_l_ena~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tr|tr_logic|i2c_l_rw~regout\,
	datab => \tr|i2c_master_inst|addr_rw\(0),
	datac => \tr|tr_logic|i2c_l_ena~regout\,
	datad => \tr|i2c_master_inst|state.slv_ack2~regout\,
	combout => \tr|i2c_master_inst|Selector26~0_combout\);

-- Location: LCCOMB_X37_Y22_N20
\tr|i2c_master_inst|Selector26~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|i2c_master_inst|Selector26~1_combout\ = (\tr|i2c_master_inst|state.stop~regout\) # ((\tr|i2c_master_inst|state.mstr_ack~regout\) # ((\tr|i2c_master_inst|Selector26~0_combout\) # (!\tr|i2c_master_inst|state.ready~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tr|i2c_master_inst|state.stop~regout\,
	datab => \tr|i2c_master_inst|state.mstr_ack~regout\,
	datac => \tr|i2c_master_inst|state.ready~regout\,
	datad => \tr|i2c_master_inst|Selector26~0_combout\,
	combout => \tr|i2c_master_inst|Selector26~1_combout\);

-- Location: LCCOMB_X36_Y22_N0
\tr|i2c_master_inst|Selector26~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|i2c_master_inst|Selector26~2_combout\ = (!\tr|i2c_master_inst|sda_int~regout\ & ((\tr|i2c_master_inst|Selector26~1_combout\) # ((!\tr|i2c_master_inst|Equal0~0_combout\ & \tr|i2c_master_inst|state.rd~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tr|i2c_master_inst|sda_int~regout\,
	datab => \tr|i2c_master_inst|Equal0~0_combout\,
	datac => \tr|i2c_master_inst|state.rd~regout\,
	datad => \tr|i2c_master_inst|Selector26~1_combout\,
	combout => \tr|i2c_master_inst|Selector26~2_combout\);

-- Location: LCCOMB_X36_Y22_N24
\tr|i2c_master_inst|Selector26~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|i2c_master_inst|Selector26~5_combout\ = (!\tr|i2c_master_inst|Selector26~4_combout\ & (!\tr|i2c_master_inst|Selector26~2_combout\ & ((!\tr|i2c_master_inst|bit_cnt\(1)) # (!\tr|i2c_master_inst|Selector26~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tr|i2c_master_inst|Selector26~4_combout\,
	datab => \tr|i2c_master_inst|Selector26~8_combout\,
	datac => \tr|i2c_master_inst|Selector26~2_combout\,
	datad => \tr|i2c_master_inst|bit_cnt\(1),
	combout => \tr|i2c_master_inst|Selector26~5_combout\);

-- Location: LCFF_X36_Y22_N25
\tr|i2c_master_inst|sda_int\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \tr|i2c_master_inst|Selector26~5_combout\,
	ena => \tr|i2c_master_inst|data_clk_re~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \tr|i2c_master_inst|sda_int~regout\);

-- Location: LCCOMB_X36_Y21_N30
\tr|i2c_master_inst|Selector32~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|i2c_master_inst|Selector32~0_combout\ = (\tr|i2c_master_inst|state.start~regout\ & (\tr|i2c_master_inst|data_clk_prev~regout\)) # (!\tr|i2c_master_inst|state.start~regout\ & ((\tr|i2c_master_inst|state.stop~regout\ & 
-- (!\tr|i2c_master_inst|data_clk_prev~regout\)) # (!\tr|i2c_master_inst|state.stop~regout\ & ((!\tr|i2c_master_inst|sda_int~regout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100110001011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tr|i2c_master_inst|data_clk_prev~regout\,
	datab => \tr|i2c_master_inst|state.start~regout\,
	datac => \tr|i2c_master_inst|sda_int~regout\,
	datad => \tr|i2c_master_inst|state.stop~regout\,
	combout => \tr|i2c_master_inst|Selector32~0_combout\);

-- Location: LCCOMB_X34_Y24_N4
\display|i2c_master_inst|count_reg[0]~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|i2c_master_inst|count_reg[0]~7_combout\ = (\display|i2c_master_inst|stretch_reg~regout\ & (\display|i2c_master_inst|count_reg\(0) & VCC)) # (!\display|i2c_master_inst|stretch_reg~regout\ & (\display|i2c_master_inst|count_reg\(0) $ (VCC)))
-- \display|i2c_master_inst|count_reg[0]~8\ = CARRY((!\display|i2c_master_inst|stretch_reg~regout\ & \display|i2c_master_inst|count_reg\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100101000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|i2c_master_inst|stretch_reg~regout\,
	datab => \display|i2c_master_inst|count_reg\(0),
	datad => VCC,
	combout => \display|i2c_master_inst|count_reg[0]~7_combout\,
	cout => \display|i2c_master_inst|count_reg[0]~8\);

-- Location: LCCOMB_X34_Y24_N6
\display|i2c_master_inst|count_reg[1]~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|i2c_master_inst|count_reg[1]~9_combout\ = (\display|i2c_master_inst|count_reg\(1) & (!\display|i2c_master_inst|count_reg[0]~8\)) # (!\display|i2c_master_inst|count_reg\(1) & ((\display|i2c_master_inst|count_reg[0]~8\) # (GND)))
-- \display|i2c_master_inst|count_reg[1]~10\ = CARRY((!\display|i2c_master_inst|count_reg[0]~8\) # (!\display|i2c_master_inst|count_reg\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \display|i2c_master_inst|count_reg\(1),
	datad => VCC,
	cin => \display|i2c_master_inst|count_reg[0]~8\,
	combout => \display|i2c_master_inst|count_reg[1]~9_combout\,
	cout => \display|i2c_master_inst|count_reg[1]~10\);

-- Location: LCCOMB_X34_Y24_N8
\display|i2c_master_inst|count_reg[2]~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|i2c_master_inst|count_reg[2]~11_combout\ = (\display|i2c_master_inst|count_reg\(2) & (\display|i2c_master_inst|count_reg[1]~10\ $ (GND))) # (!\display|i2c_master_inst|count_reg\(2) & (!\display|i2c_master_inst|count_reg[1]~10\ & VCC))
-- \display|i2c_master_inst|count_reg[2]~12\ = CARRY((\display|i2c_master_inst|count_reg\(2) & !\display|i2c_master_inst|count_reg[1]~10\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \display|i2c_master_inst|count_reg\(2),
	datad => VCC,
	cin => \display|i2c_master_inst|count_reg[1]~10\,
	combout => \display|i2c_master_inst|count_reg[2]~11_combout\,
	cout => \display|i2c_master_inst|count_reg[2]~12\);

-- Location: LCFF_X34_Y24_N9
\display|i2c_master_inst|count_reg[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|i2c_master_inst|count_reg[2]~11_combout\,
	sclr => \display|i2c_master_inst|Equal2~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|i2c_master_inst|count_reg\(2));

-- Location: LCCOMB_X34_Y24_N10
\display|i2c_master_inst|count_reg[3]~13\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|i2c_master_inst|count_reg[3]~13_combout\ = (\display|i2c_master_inst|count_reg\(3) & (!\display|i2c_master_inst|count_reg[2]~12\)) # (!\display|i2c_master_inst|count_reg\(3) & ((\display|i2c_master_inst|count_reg[2]~12\) # (GND)))
-- \display|i2c_master_inst|count_reg[3]~14\ = CARRY((!\display|i2c_master_inst|count_reg[2]~12\) # (!\display|i2c_master_inst|count_reg\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \display|i2c_master_inst|count_reg\(3),
	datad => VCC,
	cin => \display|i2c_master_inst|count_reg[2]~12\,
	combout => \display|i2c_master_inst|count_reg[3]~13_combout\,
	cout => \display|i2c_master_inst|count_reg[3]~14\);

-- Location: LCCOMB_X34_Y24_N12
\display|i2c_master_inst|count_reg[4]~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|i2c_master_inst|count_reg[4]~15_combout\ = (\display|i2c_master_inst|count_reg\(4) & (\display|i2c_master_inst|count_reg[3]~14\ $ (GND))) # (!\display|i2c_master_inst|count_reg\(4) & (!\display|i2c_master_inst|count_reg[3]~14\ & VCC))
-- \display|i2c_master_inst|count_reg[4]~16\ = CARRY((\display|i2c_master_inst|count_reg\(4) & !\display|i2c_master_inst|count_reg[3]~14\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \display|i2c_master_inst|count_reg\(4),
	datad => VCC,
	cin => \display|i2c_master_inst|count_reg[3]~14\,
	combout => \display|i2c_master_inst|count_reg[4]~15_combout\,
	cout => \display|i2c_master_inst|count_reg[4]~16\);

-- Location: LCCOMB_X34_Y24_N14
\display|i2c_master_inst|count_reg[5]~17\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|i2c_master_inst|count_reg[5]~17_combout\ = (\display|i2c_master_inst|count_reg\(5) & (!\display|i2c_master_inst|count_reg[4]~16\)) # (!\display|i2c_master_inst|count_reg\(5) & ((\display|i2c_master_inst|count_reg[4]~16\) # (GND)))
-- \display|i2c_master_inst|count_reg[5]~18\ = CARRY((!\display|i2c_master_inst|count_reg[4]~16\) # (!\display|i2c_master_inst|count_reg\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \display|i2c_master_inst|count_reg\(5),
	datad => VCC,
	cin => \display|i2c_master_inst|count_reg[4]~16\,
	combout => \display|i2c_master_inst|count_reg[5]~17_combout\,
	cout => \display|i2c_master_inst|count_reg[5]~18\);

-- Location: LCFF_X34_Y24_N15
\display|i2c_master_inst|count_reg[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|i2c_master_inst|count_reg[5]~17_combout\,
	sclr => \display|i2c_master_inst|Equal2~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|i2c_master_inst|count_reg\(5));

-- Location: LCFF_X34_Y24_N13
\display|i2c_master_inst|count_reg[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|i2c_master_inst|count_reg[4]~15_combout\,
	sclr => \display|i2c_master_inst|Equal2~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|i2c_master_inst|count_reg\(4));

-- Location: LCFF_X34_Y24_N11
\display|i2c_master_inst|count_reg[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|i2c_master_inst|count_reg[3]~13_combout\,
	sclr => \display|i2c_master_inst|Equal2~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|i2c_master_inst|count_reg\(3));

-- Location: LCCOMB_X34_Y24_N28
\display|i2c_master_inst|Equal2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|i2c_master_inst|Equal2~0_combout\ = (\display|i2c_master_inst|count_reg\(1) & (\display|i2c_master_inst|count_reg\(4) & (\display|i2c_master_inst|count_reg\(0) & \display|i2c_master_inst|count_reg\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|i2c_master_inst|count_reg\(1),
	datab => \display|i2c_master_inst|count_reg\(4),
	datac => \display|i2c_master_inst|count_reg\(0),
	datad => \display|i2c_master_inst|count_reg\(3),
	combout => \display|i2c_master_inst|Equal2~0_combout\);

-- Location: LCCOMB_X34_Y24_N30
\display|i2c_master_inst|Equal2~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|i2c_master_inst|Equal2~1_combout\ = (\display|i2c_master_inst|count_reg\(6) & (!\display|i2c_master_inst|count_reg\(2) & (\display|i2c_master_inst|count_reg\(5) & \display|i2c_master_inst|Equal2~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|i2c_master_inst|count_reg\(6),
	datab => \display|i2c_master_inst|count_reg\(2),
	datac => \display|i2c_master_inst|count_reg\(5),
	datad => \display|i2c_master_inst|Equal2~0_combout\,
	combout => \display|i2c_master_inst|Equal2~1_combout\);

-- Location: LCFF_X34_Y24_N5
\display|i2c_master_inst|count_reg[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|i2c_master_inst|count_reg[0]~7_combout\,
	sclr => \display|i2c_master_inst|Equal2~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|i2c_master_inst|count_reg\(0));

-- Location: LCCOMB_X34_Y24_N2
\display|i2c_master_inst|process_1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|i2c_master_inst|process_1~0_combout\ = (\display|i2c_master_inst|LessThan1~0_combout\ & ((\display|i2c_master_inst|count_reg\(5)) # (!\display|i2c_master_inst|count_reg\(0)))) # (!\display|i2c_master_inst|LessThan1~0_combout\ & 
-- ((!\display|i2c_master_inst|count_reg\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010011110100111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|i2c_master_inst|LessThan1~0_combout\,
	datab => \display|i2c_master_inst|count_reg\(0),
	datac => \display|i2c_master_inst|count_reg\(5),
	combout => \display|i2c_master_inst|process_1~0_combout\);

-- Location: LCCOMB_X34_Y24_N16
\display|i2c_master_inst|count_reg[6]~19\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|i2c_master_inst|count_reg[6]~19_combout\ = \display|i2c_master_inst|count_reg\(6) $ (!\display|i2c_master_inst|count_reg[5]~18\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110100101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \display|i2c_master_inst|count_reg\(6),
	cin => \display|i2c_master_inst|count_reg[5]~18\,
	combout => \display|i2c_master_inst|count_reg[6]~19_combout\);

-- Location: LCFF_X34_Y24_N17
\display|i2c_master_inst|count_reg[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|i2c_master_inst|count_reg[6]~19_combout\,
	sclr => \display|i2c_master_inst|Equal2~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|i2c_master_inst|count_reg\(6));

-- Location: LCCOMB_X38_Y20_N12
\display|wr_logic|Selector11~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|wr_logic|Selector11~0_combout\ = (\display|wr_logic|state.RD_STATUS_RD~regout\) # (\display|wr_logic|state.RD_STATUS_WR_BUSY~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \display|wr_logic|state.RD_STATUS_RD~regout\,
	datad => \display|wr_logic|state.RD_STATUS_WR_BUSY~regout\,
	combout => \display|wr_logic|Selector11~0_combout\);

-- Location: LCFF_X38_Y20_N13
\display|wr_logic|state.RD_STATUS_RD\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|wr_logic|Selector11~0_combout\,
	sclr => \display|i2c_master_inst|ALT_INV_busy_r~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|wr_logic|state.RD_STATUS_RD~regout\);

-- Location: LCCOMB_X39_Y20_N18
\display|wr_logic|Selector12~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|wr_logic|Selector12~0_combout\ = (\display|wr_logic|state.RD_STATUS_RD_BUSY~regout\) # (\display|wr_logic|state.RD_STATUS_RD~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \display|wr_logic|state.RD_STATUS_RD_BUSY~regout\,
	datad => \display|wr_logic|state.RD_STATUS_RD~regout\,
	combout => \display|wr_logic|Selector12~0_combout\);

-- Location: LCFF_X39_Y20_N19
\display|wr_logic|state.RD_STATUS_RD_BUSY\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|wr_logic|Selector12~0_combout\,
	sclr => \display|i2c_master_inst|busy_r~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|wr_logic|state.RD_STATUS_RD_BUSY~regout\);

-- Location: LCCOMB_X38_Y20_N16
\display|wr_logic|Selector13~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|wr_logic|Selector13~0_combout\ = (\display|wr_logic|state.RD_STATUS_RESULT~regout\) # (\display|wr_logic|state.RD_STATUS_RD_BUSY~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \display|wr_logic|state.RD_STATUS_RESULT~regout\,
	datad => \display|wr_logic|state.RD_STATUS_RD_BUSY~regout\,
	combout => \display|wr_logic|Selector13~0_combout\);

-- Location: LCFF_X38_Y20_N17
\display|wr_logic|state.RD_STATUS_RESULT\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|wr_logic|Selector13~0_combout\,
	sclr => \display|i2c_master_inst|ALT_INV_busy_r~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|wr_logic|state.RD_STATUS_RESULT~regout\);

-- Location: LCCOMB_X36_Y23_N2
\display|i2c_master_inst|Selector28~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|i2c_master_inst|Selector28~0_combout\ = \display|i2c_master_inst|bit_cnt\(0) $ (\display|i2c_master_inst|bit_cnt\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|i2c_master_inst|bit_cnt\(0),
	datac => \display|i2c_master_inst|bit_cnt\(1),
	combout => \display|i2c_master_inst|Selector28~0_combout\);

-- Location: LCCOMB_X34_Y24_N18
\display|i2c_master_inst|LessThan1~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|i2c_master_inst|LessThan1~1_combout\ = (\display|i2c_master_inst|count_reg\(5)) # ((\display|i2c_master_inst|LessThan1~0_combout\ & \display|i2c_master_inst|count_reg\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|i2c_master_inst|LessThan1~0_combout\,
	datab => \display|i2c_master_inst|count_reg\(0),
	datac => \display|i2c_master_inst|count_reg\(5),
	combout => \display|i2c_master_inst|LessThan1~1_combout\);

-- Location: LCCOMB_X34_Y24_N22
\display|i2c_master_inst|process_1~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|i2c_master_inst|process_1~2_combout\ = (\display|i2c_master_inst|count_reg\(5)) # ((\display|i2c_master_inst|count_reg\(4) & (\display|i2c_master_inst|count_reg\(2) & \display|i2c_master_inst|count_reg\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|i2c_master_inst|count_reg\(4),
	datab => \display|i2c_master_inst|count_reg\(2),
	datac => \display|i2c_master_inst|count_reg\(5),
	datad => \display|i2c_master_inst|count_reg\(3),
	combout => \display|i2c_master_inst|process_1~2_combout\);

-- Location: LCFF_X34_Y24_N7
\display|i2c_master_inst|count_reg[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|i2c_master_inst|count_reg[1]~9_combout\,
	sclr => \display|i2c_master_inst|Equal2~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|i2c_master_inst|count_reg\(1));

-- Location: LCCOMB_X34_Y24_N20
\display|i2c_master_inst|process_1~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|i2c_master_inst|process_1~1_combout\ = (\display|i2c_master_inst|count_reg\(5) & (\display|i2c_master_inst|count_reg\(6))) # (!\display|i2c_master_inst|count_reg\(5) & (((\display|i2c_master_inst|count_reg\(0)) # 
-- (\display|i2c_master_inst|count_reg\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|i2c_master_inst|count_reg\(6),
	datab => \display|i2c_master_inst|count_reg\(0),
	datac => \display|i2c_master_inst|count_reg\(5),
	datad => \display|i2c_master_inst|count_reg\(1),
	combout => \display|i2c_master_inst|process_1~1_combout\);

-- Location: LCCOMB_X34_Y24_N0
\display|i2c_master_inst|process_1~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|i2c_master_inst|process_1~3_combout\ = (\display|i2c_master_inst|LessThan1~0_combout\ & (\display|i2c_master_inst|process_1~2_combout\ & ((\display|i2c_master_inst|process_1~1_combout\)))) # (!\display|i2c_master_inst|LessThan1~0_combout\ & 
-- (((\display|i2c_master_inst|process_1~2_combout\ & \display|i2c_master_inst|process_1~1_combout\)) # (!\display|i2c_master_inst|count_reg\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110100000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|i2c_master_inst|LessThan1~0_combout\,
	datab => \display|i2c_master_inst|process_1~2_combout\,
	datac => \display|i2c_master_inst|count_reg\(6),
	datad => \display|i2c_master_inst|process_1~1_combout\,
	combout => \display|i2c_master_inst|process_1~3_combout\);

-- Location: LCCOMB_X35_Y24_N20
\display|i2c_master_inst|scl_ena~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|i2c_master_inst|scl_ena~0_combout\ = (\display|i2c_master_inst|count_reg\(6) & (((!\display|i2c_master_inst|process_1~3_combout\)))) # (!\display|i2c_master_inst|count_reg\(6) & (\display|i2c_master_inst|LessThan1~1_combout\ & 
-- ((!\display|i2c_master_inst|process_1~3_combout\) # (!\display|i2c_master_inst|process_1~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111101001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|i2c_master_inst|process_1~0_combout\,
	datab => \display|i2c_master_inst|LessThan1~1_combout\,
	datac => \display|i2c_master_inst|process_1~3_combout\,
	datad => \display|i2c_master_inst|count_reg\(6),
	combout => \display|i2c_master_inst|scl_ena~0_combout\);

-- Location: LCCOMB_X35_Y24_N0
\display|i2c_master_inst|data_clk_re\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|i2c_master_inst|data_clk_re~combout\ = (!\display|i2c_master_inst|data_clk_prev~regout\ & \display|i2c_master_inst|scl_ena~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|i2c_master_inst|data_clk_prev~regout\,
	datad => \display|i2c_master_inst|scl_ena~0_combout\,
	combout => \display|i2c_master_inst|data_clk_re~combout\);

-- Location: LCCOMB_X36_Y24_N0
\display|i2c_master_inst|Equal0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|i2c_master_inst|Equal0~0_combout\ = (\display|i2c_master_inst|bit_cnt\(0) & (\display|i2c_master_inst|bit_cnt\(1) & \display|i2c_master_inst|bit_cnt\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|i2c_master_inst|bit_cnt\(0),
	datac => \display|i2c_master_inst|bit_cnt\(1),
	datad => \display|i2c_master_inst|bit_cnt\(2),
	combout => \display|i2c_master_inst|Equal0~0_combout\);

-- Location: LCCOMB_X36_Y24_N12
\display|i2c_master_inst|Selector19~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|i2c_master_inst|Selector19~0_combout\ = (\display|i2c_master_inst|state.start~regout\) # ((\display|i2c_master_inst|state.command~regout\ & !\display|i2c_master_inst|Equal0~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|i2c_master_inst|state.start~regout\,
	datac => \display|i2c_master_inst|state.command~regout\,
	datad => \display|i2c_master_inst|Equal0~0_combout\,
	combout => \display|i2c_master_inst|Selector19~0_combout\);

-- Location: LCFF_X36_Y24_N13
\display|i2c_master_inst|state.command\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|i2c_master_inst|Selector19~0_combout\,
	ena => \display|i2c_master_inst|data_clk_re~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|i2c_master_inst|state.command~regout\);

-- Location: LCCOMB_X36_Y24_N20
\display|i2c_master_inst|bit_cnt[2]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|i2c_master_inst|bit_cnt[2]~0_combout\ = (\display|i2c_master_inst|data_clk_re~combout\ & ((\display|i2c_master_inst|state.rd~regout\) # ((\display|i2c_master_inst|state.wr~regout\) # (\display|i2c_master_inst|state.command~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|i2c_master_inst|state.rd~regout\,
	datab => \display|i2c_master_inst|state.wr~regout\,
	datac => \display|i2c_master_inst|data_clk_re~combout\,
	datad => \display|i2c_master_inst|state.command~regout\,
	combout => \display|i2c_master_inst|bit_cnt[2]~0_combout\);

-- Location: LCFF_X36_Y23_N3
\display|i2c_master_inst|bit_cnt[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|i2c_master_inst|Selector28~0_combout\,
	ena => \display|i2c_master_inst|bit_cnt[2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|i2c_master_inst|bit_cnt\(1));

-- Location: LCCOMB_X36_Y23_N4
\display|i2c_master_inst|Add0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|i2c_master_inst|Add0~0_combout\ = \display|i2c_master_inst|bit_cnt\(2) $ (((\display|i2c_master_inst|bit_cnt\(0) & \display|i2c_master_inst|bit_cnt\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100001111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|i2c_master_inst|bit_cnt\(0),
	datab => \display|i2c_master_inst|bit_cnt\(1),
	datac => \display|i2c_master_inst|bit_cnt\(2),
	combout => \display|i2c_master_inst|Add0~0_combout\);

-- Location: LCFF_X36_Y23_N5
\display|i2c_master_inst|bit_cnt[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|i2c_master_inst|Add0~0_combout\,
	ena => \display|i2c_master_inst|bit_cnt[2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|i2c_master_inst|bit_cnt\(2));

-- Location: LCCOMB_X36_Y23_N24
\display|i2c_master_inst|bit_cnt[0]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|i2c_master_inst|bit_cnt[0]~1_combout\ = !\display|i2c_master_inst|bit_cnt\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \display|i2c_master_inst|bit_cnt\(0),
	combout => \display|i2c_master_inst|bit_cnt[0]~1_combout\);

-- Location: LCFF_X36_Y23_N25
\display|i2c_master_inst|bit_cnt[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|i2c_master_inst|bit_cnt[0]~1_combout\,
	ena => \display|i2c_master_inst|bit_cnt[2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|i2c_master_inst|bit_cnt\(0));

-- Location: LCCOMB_X36_Y24_N18
\display|i2c_master_inst|data_rx[7]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|i2c_master_inst|data_rx[7]~1_combout\ = (\display|i2c_master_inst|state.rd~regout\ & (!\display|i2c_master_inst|bit_cnt\(2) & (!\display|i2c_master_inst|bit_cnt\(1) & !\display|i2c_master_inst|bit_cnt\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|i2c_master_inst|state.rd~regout\,
	datab => \display|i2c_master_inst|bit_cnt\(2),
	datac => \display|i2c_master_inst|bit_cnt\(1),
	datad => \display|i2c_master_inst|bit_cnt\(0),
	combout => \display|i2c_master_inst|data_rx[7]~1_combout\);

-- Location: LCCOMB_X35_Y24_N24
\display|i2c_master_inst|data_rx[7]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|i2c_master_inst|data_rx[7]~2_combout\ = (\display|i2c_master_inst|data_rx[7]~0_combout\ & ((\display|i2c_master_inst|data_rx[7]~1_combout\ & (\lcd_sda~0\)) # (!\display|i2c_master_inst|data_rx[7]~1_combout\ & 
-- ((\display|i2c_master_inst|data_rx\(7)))))) # (!\display|i2c_master_inst|data_rx[7]~0_combout\ & (((\display|i2c_master_inst|data_rx\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|i2c_master_inst|data_rx[7]~0_combout\,
	datab => \lcd_sda~0\,
	datac => \display|i2c_master_inst|data_rx\(7),
	datad => \display|i2c_master_inst|data_rx[7]~1_combout\,
	combout => \display|i2c_master_inst|data_rx[7]~2_combout\);

-- Location: LCFF_X35_Y24_N25
\display|i2c_master_inst|data_rx[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|i2c_master_inst|data_rx[7]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|i2c_master_inst|data_rx\(7));

-- Location: LCCOMB_X40_Y20_N4
\display|wr_logic|current_addr[0]~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|wr_logic|current_addr[0]~8_combout\ = (\display|wr_logic|current_addr\(0) & (\display|i2c_master_inst|busy_r~regout\ $ (GND))) # (!\display|wr_logic|current_addr\(0) & (!\display|i2c_master_inst|busy_r~regout\ & VCC))
-- \display|wr_logic|current_addr[0]~9\ = CARRY((\display|wr_logic|current_addr\(0) & !\display|i2c_master_inst|busy_r~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100100100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|wr_logic|current_addr\(0),
	datab => \display|i2c_master_inst|busy_r~regout\,
	datad => VCC,
	combout => \display|wr_logic|current_addr[0]~8_combout\,
	cout => \display|wr_logic|current_addr[0]~9\);

-- Location: LCCOMB_X40_Y20_N6
\display|wr_logic|current_addr[1]~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|wr_logic|current_addr[1]~10_combout\ = (\display|wr_logic|current_addr\(1) & (!\display|wr_logic|current_addr[0]~9\)) # (!\display|wr_logic|current_addr\(1) & ((\display|wr_logic|current_addr[0]~9\) # (GND)))
-- \display|wr_logic|current_addr[1]~11\ = CARRY((!\display|wr_logic|current_addr[0]~9\) # (!\display|wr_logic|current_addr\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \display|wr_logic|current_addr\(1),
	datad => VCC,
	cin => \display|wr_logic|current_addr[0]~9\,
	combout => \display|wr_logic|current_addr[1]~10_combout\,
	cout => \display|wr_logic|current_addr[1]~11\);

-- Location: LCCOMB_X40_Y20_N8
\display|wr_logic|current_addr[2]~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|wr_logic|current_addr[2]~12_combout\ = (\display|wr_logic|current_addr\(2) & (\display|wr_logic|current_addr[1]~11\ $ (GND))) # (!\display|wr_logic|current_addr\(2) & (!\display|wr_logic|current_addr[1]~11\ & VCC))
-- \display|wr_logic|current_addr[2]~13\ = CARRY((\display|wr_logic|current_addr\(2) & !\display|wr_logic|current_addr[1]~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \display|wr_logic|current_addr\(2),
	datad => VCC,
	cin => \display|wr_logic|current_addr[1]~11\,
	combout => \display|wr_logic|current_addr[2]~12_combout\,
	cout => \display|wr_logic|current_addr[2]~13\);

-- Location: LCCOMB_X40_Y20_N20
\~GND\ : cycloneii_lcell_comb
-- Equation(s):
-- \~GND~combout\ = GND

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \~GND~combout\);

-- Location: LCCOMB_X38_Y20_N18
\display|wr_logic|Selector16~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|wr_logic|Selector16~1_combout\ = (\display|wr_logic|state.WR_DATA~regout\) # (\display|wr_logic|state.WR_CONTROL_BUSY~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \display|wr_logic|state.WR_DATA~regout\,
	datad => \display|wr_logic|state.WR_CONTROL_BUSY~regout\,
	combout => \display|wr_logic|Selector16~1_combout\);

-- Location: LCFF_X38_Y20_N19
\display|wr_logic|state.WR_DATA\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|wr_logic|Selector16~1_combout\,
	sclr => \display|i2c_master_inst|ALT_INV_busy_r~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|wr_logic|state.WR_DATA~regout\);

-- Location: PIN_R21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\key[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_key(1),
	combout => \key~combout\(1));

-- Location: LCCOMB_X40_Y20_N22
\ed2|sr[0]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \ed2|sr[0]~feeder_combout\ = \key~combout\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \key~combout\(1),
	combout => \ed2|sr[0]~feeder_combout\);

-- Location: LCFF_X40_Y20_N23
\ed2|sr[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \ed2|sr[0]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ed2|sr\(0));

-- Location: LCCOMB_X40_Y20_N28
\ed2|sr[1]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \ed2|sr[1]~feeder_combout\ = \ed2|sr\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \ed2|sr\(0),
	combout => \ed2|sr[1]~feeder_combout\);

-- Location: LCFF_X40_Y20_N29
\ed2|sr[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \ed2|sr[1]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ed2|sr\(1));

-- Location: LCCOMB_X40_Y20_N26
\ed2|sr[2]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \ed2|sr[2]~feeder_combout\ = \ed2|sr\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \ed2|sr\(1),
	combout => \ed2|sr[2]~feeder_combout\);

-- Location: LCFF_X40_Y20_N27
\ed2|sr[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \ed2|sr[2]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ed2|sr\(2));

-- Location: LCCOMB_X40_Y20_N24
\display|logic|update_char_next~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|logic|update_char_next~0_combout\ = (!\display|logic|state.DO_UPDATE_CHAR~regout\ & ((\display|logic|update_char~regout\) # ((!\ed2|sr\(1) & \ed2|sr\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|logic|state.DO_UPDATE_CHAR~regout\,
	datab => \ed2|sr\(1),
	datac => \display|logic|update_char~regout\,
	datad => \ed2|sr\(2),
	combout => \display|logic|update_char_next~0_combout\);

-- Location: LCFF_X40_Y20_N25
\display|logic|update_char\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|logic|update_char_next~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|logic|update_char~regout\);

-- Location: LCCOMB_X43_Y20_N16
\display|logic|update_temp_next~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|logic|update_temp_next~0_combout\ = (!\display|logic|state.DO_UPDATE_TEMP~regout\ & ((\tr|tr_logic|completed~regout\) # (\display|logic|update_temp~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \tr|tr_logic|completed~regout\,
	datac => \display|logic|update_temp~regout\,
	datad => \display|logic|state.DO_UPDATE_TEMP~regout\,
	combout => \display|logic|update_temp_next~0_combout\);

-- Location: LCFF_X43_Y20_N17
\display|logic|update_temp\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|logic|update_temp_next~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|logic|update_temp~regout\);

-- Location: LCFF_X43_Y20_N29
\display|wr_logic|done\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \display|wr_logic|state.WR_DONE~regout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|wr_logic|done~regout\);

-- Location: LCCOMB_X43_Y20_N10
\display|logic|Selector2~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|logic|Selector2~1_combout\ = (\display|logic|state.WAIT_MAIN~regout\ & ((\display|logic|do_reset~regout\) # ((\display|logic|update_char~regout\) # (\display|logic|update_temp~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|logic|do_reset~regout\,
	datab => \display|logic|update_char~regout\,
	datac => \display|logic|update_temp~regout\,
	datad => \display|logic|state.WAIT_MAIN~regout\,
	combout => \display|logic|Selector2~1_combout\);

-- Location: LCCOMB_X43_Y20_N2
\display|logic|Selector2~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|logic|Selector2~5_combout\ = ((\display|logic|Selector2~1_combout\) # ((\display|logic|Selector2~2_combout\ & \display|wr_logic|done~regout\))) # (!\display|logic|Selector1~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|logic|Selector2~2_combout\,
	datab => \display|wr_logic|done~regout\,
	datac => \display|logic|Selector1~0_combout\,
	datad => \display|logic|Selector2~1_combout\,
	combout => \display|logic|Selector2~5_combout\);

-- Location: LCCOMB_X43_Y20_N18
\display|logic|Selector1~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|logic|Selector1~1_combout\ = (\display|logic|state.INIT_START~regout\ & (!\display|logic|Selector2~5_combout\ & (\display|logic|state.INIT_WAIT~regout\))) # (!\display|logic|state.INIT_START~regout\ & (((!\display|logic|Selector2~5_combout\ & 
-- \display|logic|state.INIT_WAIT~regout\)) # (!\display|logic|Selector2~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000001110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|logic|state.INIT_START~regout\,
	datab => \display|logic|Selector2~5_combout\,
	datac => \display|logic|state.INIT_WAIT~regout\,
	datad => \display|logic|Selector2~1_combout\,
	combout => \display|logic|Selector1~1_combout\);

-- Location: LCFF_X43_Y20_N19
\display|logic|state.INIT_WAIT\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|logic|Selector1~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|logic|state.INIT_WAIT~regout\);

-- Location: LCCOMB_X45_Y20_N14
\display|timer1|counter[0]~18\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|timer1|counter[0]~18_combout\ = \display|timer1|counter\(0) $ (VCC)
-- \display|timer1|counter[0]~19\ = CARRY(\display|timer1|counter\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \display|timer1|counter\(0),
	datad => VCC,
	combout => \display|timer1|counter[0]~18_combout\,
	cout => \display|timer1|counter[0]~19\);

-- Location: LCCOMB_X43_Y20_N6
\display|logic|Selector0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|logic|Selector0~0_combout\ = ((\display|logic|update_char~regout\) # ((\display|logic|update_temp~regout\) # (!\display|logic|state.WAIT_MAIN~regout\))) # (!\display|logic|do_reset~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|logic|do_reset~regout\,
	datab => \display|logic|update_char~regout\,
	datac => \display|logic|update_temp~regout\,
	datad => \display|logic|state.WAIT_MAIN~regout\,
	combout => \display|logic|Selector0~0_combout\);

-- Location: LCFF_X43_Y20_N7
\display|logic|state.INIT_START\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|logic|Selector0~0_combout\,
	ena => \display|logic|Selector2~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|logic|state.INIT_START~regout\);

-- Location: LCCOMB_X44_Y19_N16
\display|logic|t_start[0]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|logic|t_start[0]~0_combout\ = !\display|logic|state.INIT_START~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \display|logic|state.INIT_START~regout\,
	combout => \display|logic|t_start[0]~0_combout\);

-- Location: LCFF_X44_Y19_N17
\display|logic|t_start[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|logic|t_start[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|logic|t_start\(0));

-- Location: LCCOMB_X45_Y19_N22
\display|timer1|Selector0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|timer1|Selector0~0_combout\ = (!\display|timer1|state.TRIGGERED~regout\ & ((\display|logic|t_start\(0)) # (\display|timer1|state.IDLE~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \display|logic|t_start\(0),
	datac => \display|timer1|state.IDLE~regout\,
	datad => \display|timer1|state.TRIGGERED~regout\,
	combout => \display|timer1|Selector0~0_combout\);

-- Location: LCFF_X45_Y19_N23
\display|timer1|state.IDLE\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|timer1|Selector0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|timer1|state.IDLE~regout\);

-- Location: LCCOMB_X45_Y19_N28
\display|timer1|Selector1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|timer1|Selector1~0_combout\ = (\display|timer1|Equal0~5_combout\ & (\display|logic|t_start\(0) & ((!\display|timer1|state.IDLE~regout\)))) # (!\display|timer1|Equal0~5_combout\ & ((\display|timer1|state.WAITING~regout\) # 
-- ((\display|logic|t_start\(0) & !\display|timer1|state.IDLE~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000011011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|timer1|Equal0~5_combout\,
	datab => \display|logic|t_start\(0),
	datac => \display|timer1|state.WAITING~regout\,
	datad => \display|timer1|state.IDLE~regout\,
	combout => \display|timer1|Selector1~0_combout\);

-- Location: LCFF_X45_Y19_N29
\display|timer1|state.WAITING\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|timer1|Selector1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|timer1|state.WAITING~regout\);

-- Location: LCFF_X45_Y20_N15
\display|timer1|counter[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|timer1|counter[0]~18_combout\,
	sclr => \display|timer1|ALT_INV_state.WAITING~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|timer1|counter\(0));

-- Location: LCCOMB_X45_Y20_N16
\display|timer1|counter[1]~20\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|timer1|counter[1]~20_combout\ = (\display|timer1|counter\(1) & (!\display|timer1|counter[0]~19\)) # (!\display|timer1|counter\(1) & ((\display|timer1|counter[0]~19\) # (GND)))
-- \display|timer1|counter[1]~21\ = CARRY((!\display|timer1|counter[0]~19\) # (!\display|timer1|counter\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \display|timer1|counter\(1),
	datad => VCC,
	cin => \display|timer1|counter[0]~19\,
	combout => \display|timer1|counter[1]~20_combout\,
	cout => \display|timer1|counter[1]~21\);

-- Location: LCCOMB_X45_Y20_N18
\display|timer1|counter[2]~22\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|timer1|counter[2]~22_combout\ = (\display|timer1|counter\(2) & (\display|timer1|counter[1]~21\ $ (GND))) # (!\display|timer1|counter\(2) & (!\display|timer1|counter[1]~21\ & VCC))
-- \display|timer1|counter[2]~23\ = CARRY((\display|timer1|counter\(2) & !\display|timer1|counter[1]~21\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \display|timer1|counter\(2),
	datad => VCC,
	cin => \display|timer1|counter[1]~21\,
	combout => \display|timer1|counter[2]~22_combout\,
	cout => \display|timer1|counter[2]~23\);

-- Location: LCFF_X45_Y20_N19
\display|timer1|counter[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|timer1|counter[2]~22_combout\,
	sclr => \display|timer1|ALT_INV_state.WAITING~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|timer1|counter\(2));

-- Location: LCCOMB_X45_Y20_N22
\display|timer1|counter[4]~26\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|timer1|counter[4]~26_combout\ = (\display|timer1|counter\(4) & (\display|timer1|counter[3]~25\ $ (GND))) # (!\display|timer1|counter\(4) & (!\display|timer1|counter[3]~25\ & VCC))
-- \display|timer1|counter[4]~27\ = CARRY((\display|timer1|counter\(4) & !\display|timer1|counter[3]~25\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \display|timer1|counter\(4),
	datad => VCC,
	cin => \display|timer1|counter[3]~25\,
	combout => \display|timer1|counter[4]~26_combout\,
	cout => \display|timer1|counter[4]~27\);

-- Location: LCFF_X45_Y20_N23
\display|timer1|counter[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|timer1|counter[4]~26_combout\,
	sclr => \display|timer1|ALT_INV_state.WAITING~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|timer1|counter\(4));

-- Location: LCCOMB_X45_Y20_N24
\display|timer1|counter[5]~28\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|timer1|counter[5]~28_combout\ = (\display|timer1|counter\(5) & (!\display|timer1|counter[4]~27\)) # (!\display|timer1|counter\(5) & ((\display|timer1|counter[4]~27\) # (GND)))
-- \display|timer1|counter[5]~29\ = CARRY((!\display|timer1|counter[4]~27\) # (!\display|timer1|counter\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \display|timer1|counter\(5),
	datad => VCC,
	cin => \display|timer1|counter[4]~27\,
	combout => \display|timer1|counter[5]~28_combout\,
	cout => \display|timer1|counter[5]~29\);

-- Location: LCCOMB_X45_Y20_N26
\display|timer1|counter[6]~30\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|timer1|counter[6]~30_combout\ = (\display|timer1|counter\(6) & (\display|timer1|counter[5]~29\ $ (GND))) # (!\display|timer1|counter\(6) & (!\display|timer1|counter[5]~29\ & VCC))
-- \display|timer1|counter[6]~31\ = CARRY((\display|timer1|counter\(6) & !\display|timer1|counter[5]~29\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \display|timer1|counter\(6),
	datad => VCC,
	cin => \display|timer1|counter[5]~29\,
	combout => \display|timer1|counter[6]~30_combout\,
	cout => \display|timer1|counter[6]~31\);

-- Location: LCFF_X45_Y20_N27
\display|timer1|counter[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|timer1|counter[6]~30_combout\,
	sclr => \display|timer1|ALT_INV_state.WAITING~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|timer1|counter\(6));

-- Location: LCCOMB_X45_Y20_N28
\display|timer1|counter[7]~32\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|timer1|counter[7]~32_combout\ = (\display|timer1|counter\(7) & (!\display|timer1|counter[6]~31\)) # (!\display|timer1|counter\(7) & ((\display|timer1|counter[6]~31\) # (GND)))
-- \display|timer1|counter[7]~33\ = CARRY((!\display|timer1|counter[6]~31\) # (!\display|timer1|counter\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \display|timer1|counter\(7),
	datad => VCC,
	cin => \display|timer1|counter[6]~31\,
	combout => \display|timer1|counter[7]~32_combout\,
	cout => \display|timer1|counter[7]~33\);

-- Location: LCFF_X45_Y20_N29
\display|timer1|counter[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|timer1|counter[7]~32_combout\,
	sclr => \display|timer1|ALT_INV_state.WAITING~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|timer1|counter\(7));

-- Location: LCCOMB_X45_Y20_N30
\display|timer1|counter[8]~34\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|timer1|counter[8]~34_combout\ = (\display|timer1|counter\(8) & (\display|timer1|counter[7]~33\ $ (GND))) # (!\display|timer1|counter\(8) & (!\display|timer1|counter[7]~33\ & VCC))
-- \display|timer1|counter[8]~35\ = CARRY((\display|timer1|counter\(8) & !\display|timer1|counter[7]~33\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \display|timer1|counter\(8),
	datad => VCC,
	cin => \display|timer1|counter[7]~33\,
	combout => \display|timer1|counter[8]~34_combout\,
	cout => \display|timer1|counter[8]~35\);

-- Location: LCFF_X45_Y20_N31
\display|timer1|counter[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|timer1|counter[8]~34_combout\,
	sclr => \display|timer1|ALT_INV_state.WAITING~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|timer1|counter\(8));

-- Location: LCCOMB_X45_Y19_N0
\display|timer1|counter[9]~36\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|timer1|counter[9]~36_combout\ = (\display|timer1|counter\(9) & (!\display|timer1|counter[8]~35\)) # (!\display|timer1|counter\(9) & ((\display|timer1|counter[8]~35\) # (GND)))
-- \display|timer1|counter[9]~37\ = CARRY((!\display|timer1|counter[8]~35\) # (!\display|timer1|counter\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \display|timer1|counter\(9),
	datad => VCC,
	cin => \display|timer1|counter[8]~35\,
	combout => \display|timer1|counter[9]~36_combout\,
	cout => \display|timer1|counter[9]~37\);

-- Location: LCFF_X45_Y19_N1
\display|timer1|counter[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|timer1|counter[9]~36_combout\,
	sclr => \display|timer1|ALT_INV_state.WAITING~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|timer1|counter\(9));

-- Location: LCCOMB_X45_Y19_N2
\display|timer1|counter[10]~38\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|timer1|counter[10]~38_combout\ = (\display|timer1|counter\(10) & (\display|timer1|counter[9]~37\ $ (GND))) # (!\display|timer1|counter\(10) & (!\display|timer1|counter[9]~37\ & VCC))
-- \display|timer1|counter[10]~39\ = CARRY((\display|timer1|counter\(10) & !\display|timer1|counter[9]~37\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \display|timer1|counter\(10),
	datad => VCC,
	cin => \display|timer1|counter[9]~37\,
	combout => \display|timer1|counter[10]~38_combout\,
	cout => \display|timer1|counter[10]~39\);

-- Location: LCFF_X45_Y19_N3
\display|timer1|counter[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|timer1|counter[10]~38_combout\,
	sclr => \display|timer1|ALT_INV_state.WAITING~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|timer1|counter\(10));

-- Location: LCCOMB_X45_Y19_N4
\display|timer1|counter[11]~40\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|timer1|counter[11]~40_combout\ = (\display|timer1|counter\(11) & (!\display|timer1|counter[10]~39\)) # (!\display|timer1|counter\(11) & ((\display|timer1|counter[10]~39\) # (GND)))
-- \display|timer1|counter[11]~41\ = CARRY((!\display|timer1|counter[10]~39\) # (!\display|timer1|counter\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \display|timer1|counter\(11),
	datad => VCC,
	cin => \display|timer1|counter[10]~39\,
	combout => \display|timer1|counter[11]~40_combout\,
	cout => \display|timer1|counter[11]~41\);

-- Location: LCFF_X45_Y19_N5
\display|timer1|counter[11]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|timer1|counter[11]~40_combout\,
	sclr => \display|timer1|ALT_INV_state.WAITING~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|timer1|counter\(11));

-- Location: LCCOMB_X45_Y19_N30
\display|timer1|Equal0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|timer1|Equal0~2_combout\ = (!\display|timer1|counter\(8) & (!\display|timer1|counter\(10) & (!\display|timer1|counter\(11) & !\display|timer1|counter\(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|timer1|counter\(8),
	datab => \display|timer1|counter\(10),
	datac => \display|timer1|counter\(11),
	datad => \display|timer1|counter\(9),
	combout => \display|timer1|Equal0~2_combout\);

-- Location: LCFF_X45_Y20_N17
\display|timer1|counter[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|timer1|counter[1]~20_combout\,
	sclr => \display|timer1|ALT_INV_state.WAITING~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|timer1|counter\(1));

-- Location: LCCOMB_X45_Y20_N8
\display|timer1|Equal0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|timer1|Equal0~0_combout\ = (!\display|timer1|counter\(3) & (!\display|timer1|counter\(0) & (!\display|timer1|counter\(1) & !\display|timer1|counter\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|timer1|counter\(3),
	datab => \display|timer1|counter\(0),
	datac => \display|timer1|counter\(1),
	datad => \display|timer1|counter\(2),
	combout => \display|timer1|Equal0~0_combout\);

-- Location: LCFF_X45_Y20_N25
\display|timer1|counter[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|timer1|counter[5]~28_combout\,
	sclr => \display|timer1|ALT_INV_state.WAITING~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|timer1|counter\(5));

-- Location: LCCOMB_X45_Y20_N10
\display|timer1|Equal0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|timer1|Equal0~1_combout\ = (\display|timer1|counter\(7) & (!\display|timer1|counter\(6) & (!\display|timer1|counter\(5) & \display|timer1|counter\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|timer1|counter\(7),
	datab => \display|timer1|counter\(6),
	datac => \display|timer1|counter\(5),
	datad => \display|timer1|counter\(4),
	combout => \display|timer1|Equal0~1_combout\);

-- Location: LCCOMB_X45_Y19_N26
\display|timer1|Equal0~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|timer1|Equal0~4_combout\ = (\display|timer1|Equal0~3_combout\ & (\display|timer1|Equal0~2_combout\ & (\display|timer1|Equal0~0_combout\ & \display|timer1|Equal0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|timer1|Equal0~3_combout\,
	datab => \display|timer1|Equal0~2_combout\,
	datac => \display|timer1|Equal0~0_combout\,
	datad => \display|timer1|Equal0~1_combout\,
	combout => \display|timer1|Equal0~4_combout\);

-- Location: LCCOMB_X45_Y19_N8
\display|timer1|counter[13]~44\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|timer1|counter[13]~44_combout\ = (\display|timer1|counter\(13) & (!\display|timer1|counter[12]~43\)) # (!\display|timer1|counter\(13) & ((\display|timer1|counter[12]~43\) # (GND)))
-- \display|timer1|counter[13]~45\ = CARRY((!\display|timer1|counter[12]~43\) # (!\display|timer1|counter\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \display|timer1|counter\(13),
	datad => VCC,
	cin => \display|timer1|counter[12]~43\,
	combout => \display|timer1|counter[13]~44_combout\,
	cout => \display|timer1|counter[13]~45\);

-- Location: LCFF_X45_Y19_N9
\display|timer1|counter[13]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|timer1|counter[13]~44_combout\,
	sclr => \display|timer1|ALT_INV_state.WAITING~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|timer1|counter\(13));

-- Location: LCFF_X45_Y19_N15
\display|timer1|counter[16]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|timer1|counter[16]~50_combout\,
	sclr => \display|timer1|ALT_INV_state.WAITING~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|timer1|counter\(16));

-- Location: LCCOMB_X45_Y19_N18
\display|timer1|Selector2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|timer1|Selector2~0_combout\ = (\display|timer1|counter\(17) & (\display|timer1|Equal0~4_combout\ & (\display|timer1|counter\(16) & \display|timer1|state.WAITING~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|timer1|counter\(17),
	datab => \display|timer1|Equal0~4_combout\,
	datac => \display|timer1|counter\(16),
	datad => \display|timer1|state.WAITING~regout\,
	combout => \display|timer1|Selector2~0_combout\);

-- Location: LCFF_X45_Y19_N19
\display|timer1|state.TRIGGERED\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|timer1|Selector2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|timer1|state.TRIGGERED~regout\);

-- Location: LCCOMB_X44_Y20_N24
\display|timer1|fire~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|timer1|fire~feeder_combout\ = \display|timer1|state.TRIGGERED~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \display|timer1|state.TRIGGERED~regout\,
	combout => \display|timer1|fire~feeder_combout\);

-- Location: LCFF_X44_Y20_N25
\display|timer1|fire\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|timer1|fire~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|timer1|fire~regout\);

-- Location: LCCOMB_X43_Y20_N4
\display|logic|Selector2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|logic|Selector2~0_combout\ = (\display|logic|state.INIT_WAIT~regout\ & \display|timer1|fire~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \display|logic|state.INIT_WAIT~regout\,
	datad => \display|timer1|fire~regout\,
	combout => \display|logic|Selector2~0_combout\);

-- Location: LCCOMB_X43_Y20_N24
\display|logic|Selector2~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|logic|Selector2~6_combout\ = (\display|logic|Selector2~1_combout\ & (((\display|logic|state.INIT_RESET~regout\ & !\display|logic|Selector2~5_combout\)))) # (!\display|logic|Selector2~1_combout\ & ((\display|logic|Selector2~0_combout\) # 
-- ((\display|logic|state.INIT_RESET~regout\ & !\display|logic|Selector2~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010011110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|logic|Selector2~1_combout\,
	datab => \display|logic|Selector2~0_combout\,
	datac => \display|logic|state.INIT_RESET~regout\,
	datad => \display|logic|Selector2~5_combout\,
	combout => \display|logic|Selector2~6_combout\);

-- Location: LCFF_X43_Y20_N25
\display|logic|state.INIT_RESET\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|logic|Selector2~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|logic|state.INIT_RESET~regout\);

-- Location: LCCOMB_X42_Y20_N0
\display|timer2|counter[0]~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|timer2|counter[0]~10_combout\ = \display|timer2|counter\(0) $ (VCC)
-- \display|timer2|counter[0]~11\ = CARRY(\display|timer2|counter\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \display|timer2|counter\(0),
	datad => VCC,
	combout => \display|timer2|counter[0]~10_combout\,
	cout => \display|timer2|counter[0]~11\);

-- Location: LCFF_X43_Y20_N5
\display|logic|t_start[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|logic|Selector2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|logic|t_start\(1));

-- Location: LCCOMB_X42_Y20_N22
\display|timer2|Selector0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|timer2|Selector0~0_combout\ = (!\display|timer2|state.TRIGGERED~regout\ & ((\display|timer2|state.IDLE~regout\) # (\display|logic|t_start\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \display|timer2|state.TRIGGERED~regout\,
	datac => \display|timer2|state.IDLE~regout\,
	datad => \display|logic|t_start\(1),
	combout => \display|timer2|Selector0~0_combout\);

-- Location: LCFF_X42_Y20_N23
\display|timer2|state.IDLE\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|timer2|Selector0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|timer2|state.IDLE~regout\);

-- Location: LCCOMB_X42_Y20_N30
\display|timer2|Selector1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|timer2|Selector1~0_combout\ = (\display|timer2|Equal0~2_combout\ & (!\display|timer2|state.IDLE~regout\ & ((\display|logic|t_start\(1))))) # (!\display|timer2|Equal0~2_combout\ & ((\display|timer2|state.WAITING~regout\) # 
-- ((!\display|timer2|state.IDLE~regout\ & \display|logic|t_start\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111001101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|timer2|Equal0~2_combout\,
	datab => \display|timer2|state.IDLE~regout\,
	datac => \display|timer2|state.WAITING~regout\,
	datad => \display|logic|t_start\(1),
	combout => \display|timer2|Selector1~0_combout\);

-- Location: LCFF_X42_Y20_N31
\display|timer2|state.WAITING\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|timer2|Selector1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|timer2|state.WAITING~regout\);

-- Location: LCFF_X42_Y20_N1
\display|timer2|counter[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|timer2|counter[0]~10_combout\,
	sclr => \display|timer2|ALT_INV_state.WAITING~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|timer2|counter\(0));

-- Location: LCCOMB_X42_Y20_N2
\display|timer2|counter[1]~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|timer2|counter[1]~12_combout\ = (\display|timer2|counter\(1) & (!\display|timer2|counter[0]~11\)) # (!\display|timer2|counter\(1) & ((\display|timer2|counter[0]~11\) # (GND)))
-- \display|timer2|counter[1]~13\ = CARRY((!\display|timer2|counter[0]~11\) # (!\display|timer2|counter\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \display|timer2|counter\(1),
	datad => VCC,
	cin => \display|timer2|counter[0]~11\,
	combout => \display|timer2|counter[1]~12_combout\,
	cout => \display|timer2|counter[1]~13\);

-- Location: LCFF_X42_Y20_N3
\display|timer2|counter[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|timer2|counter[1]~12_combout\,
	sclr => \display|timer2|ALT_INV_state.WAITING~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|timer2|counter\(1));

-- Location: LCCOMB_X42_Y20_N4
\display|timer2|counter[2]~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|timer2|counter[2]~14_combout\ = (\display|timer2|counter\(2) & (\display|timer2|counter[1]~13\ $ (GND))) # (!\display|timer2|counter\(2) & (!\display|timer2|counter[1]~13\ & VCC))
-- \display|timer2|counter[2]~15\ = CARRY((\display|timer2|counter\(2) & !\display|timer2|counter[1]~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \display|timer2|counter\(2),
	datad => VCC,
	cin => \display|timer2|counter[1]~13\,
	combout => \display|timer2|counter[2]~14_combout\,
	cout => \display|timer2|counter[2]~15\);

-- Location: LCFF_X42_Y20_N5
\display|timer2|counter[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|timer2|counter[2]~14_combout\,
	sclr => \display|timer2|ALT_INV_state.WAITING~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|timer2|counter\(2));

-- Location: LCCOMB_X42_Y20_N8
\display|timer2|counter[4]~18\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|timer2|counter[4]~18_combout\ = (\display|timer2|counter\(4) & (\display|timer2|counter[3]~17\ $ (GND))) # (!\display|timer2|counter\(4) & (!\display|timer2|counter[3]~17\ & VCC))
-- \display|timer2|counter[4]~19\ = CARRY((\display|timer2|counter\(4) & !\display|timer2|counter[3]~17\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \display|timer2|counter\(4),
	datad => VCC,
	cin => \display|timer2|counter[3]~17\,
	combout => \display|timer2|counter[4]~18_combout\,
	cout => \display|timer2|counter[4]~19\);

-- Location: LCFF_X42_Y20_N9
\display|timer2|counter[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|timer2|counter[4]~18_combout\,
	sclr => \display|timer2|ALT_INV_state.WAITING~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|timer2|counter\(4));

-- Location: LCCOMB_X42_Y20_N10
\display|timer2|counter[5]~20\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|timer2|counter[5]~20_combout\ = (\display|timer2|counter\(5) & (!\display|timer2|counter[4]~19\)) # (!\display|timer2|counter\(5) & ((\display|timer2|counter[4]~19\) # (GND)))
-- \display|timer2|counter[5]~21\ = CARRY((!\display|timer2|counter[4]~19\) # (!\display|timer2|counter\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \display|timer2|counter\(5),
	datad => VCC,
	cin => \display|timer2|counter[4]~19\,
	combout => \display|timer2|counter[5]~20_combout\,
	cout => \display|timer2|counter[5]~21\);

-- Location: LCCOMB_X42_Y20_N14
\display|timer2|counter[7]~24\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|timer2|counter[7]~24_combout\ = (\display|timer2|counter\(7) & (!\display|timer2|counter[6]~23\)) # (!\display|timer2|counter\(7) & ((\display|timer2|counter[6]~23\) # (GND)))
-- \display|timer2|counter[7]~25\ = CARRY((!\display|timer2|counter[6]~23\) # (!\display|timer2|counter\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \display|timer2|counter\(7),
	datad => VCC,
	cin => \display|timer2|counter[6]~23\,
	combout => \display|timer2|counter[7]~24_combout\,
	cout => \display|timer2|counter[7]~25\);

-- Location: LCFF_X42_Y20_N15
\display|timer2|counter[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|timer2|counter[7]~24_combout\,
	sclr => \display|timer2|ALT_INV_state.WAITING~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|timer2|counter\(7));

-- Location: LCFF_X42_Y20_N11
\display|timer2|counter[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|timer2|counter[5]~20_combout\,
	sclr => \display|timer2|ALT_INV_state.WAITING~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|timer2|counter\(5));

-- Location: LCCOMB_X42_Y20_N26
\display|timer2|Equal0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|timer2|Equal0~1_combout\ = (\display|timer2|counter\(6) & (\display|timer2|counter\(7) & (!\display|timer2|counter\(4) & \display|timer2|counter\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|timer2|counter\(6),
	datab => \display|timer2|counter\(7),
	datac => \display|timer2|counter\(4),
	datad => \display|timer2|counter\(5),
	combout => \display|timer2|Equal0~1_combout\);

-- Location: LCCOMB_X42_Y20_N16
\display|timer2|counter[8]~26\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|timer2|counter[8]~26_combout\ = (\display|timer2|counter\(8) & (\display|timer2|counter[7]~25\ $ (GND))) # (!\display|timer2|counter\(8) & (!\display|timer2|counter[7]~25\ & VCC))
-- \display|timer2|counter[8]~27\ = CARRY((\display|timer2|counter\(8) & !\display|timer2|counter[7]~25\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \display|timer2|counter\(8),
	datad => VCC,
	cin => \display|timer2|counter[7]~25\,
	combout => \display|timer2|counter[8]~26_combout\,
	cout => \display|timer2|counter[8]~27\);

-- Location: LCFF_X42_Y20_N17
\display|timer2|counter[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|timer2|counter[8]~26_combout\,
	sclr => \display|timer2|ALT_INV_state.WAITING~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|timer2|counter\(8));

-- Location: LCCOMB_X42_Y20_N18
\display|timer2|counter[9]~28\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|timer2|counter[9]~28_combout\ = \display|timer2|counter[8]~27\ $ (\display|timer2|counter\(9))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \display|timer2|counter\(9),
	cin => \display|timer2|counter[8]~27\,
	combout => \display|timer2|counter[9]~28_combout\);

-- Location: LCFF_X42_Y20_N19
\display|timer2|counter[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|timer2|counter[9]~28_combout\,
	sclr => \display|timer2|ALT_INV_state.WAITING~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|timer2|counter\(9));

-- Location: LCCOMB_X42_Y20_N20
\display|timer2|Equal0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|timer2|Equal0~2_combout\ = (\display|timer2|Equal0~0_combout\ & (\display|timer2|Equal0~1_combout\ & (\display|timer2|counter\(8) & \display|timer2|counter\(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|timer2|Equal0~0_combout\,
	datab => \display|timer2|Equal0~1_combout\,
	datac => \display|timer2|counter\(8),
	datad => \display|timer2|counter\(9),
	combout => \display|timer2|Equal0~2_combout\);

-- Location: LCCOMB_X42_Y20_N28
\display|timer2|Selector2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|timer2|Selector2~0_combout\ = (\display|timer2|Equal0~2_combout\ & \display|timer2|state.WAITING~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \display|timer2|Equal0~2_combout\,
	datad => \display|timer2|state.WAITING~regout\,
	combout => \display|timer2|Selector2~0_combout\);

-- Location: LCFF_X42_Y20_N29
\display|timer2|state.TRIGGERED\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|timer2|Selector2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|timer2|state.TRIGGERED~regout\);

-- Location: LCCOMB_X43_Y21_N30
\display|timer2|fire~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|timer2|fire~feeder_combout\ = \display|timer2|state.TRIGGERED~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \display|timer2|state.TRIGGERED~regout\,
	combout => \display|timer2|fire~feeder_combout\);

-- Location: LCFF_X43_Y21_N31
\display|timer2|fire\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|timer2|fire~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|timer2|fire~regout\);

-- Location: LCCOMB_X43_Y21_N0
\display|logic|Selector2~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|logic|Selector2~4_combout\ = (\display|logic|state.INIT_RESET~regout\ & \display|timer2|fire~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \display|logic|state.INIT_RESET~regout\,
	datad => \display|timer2|fire~regout\,
	combout => \display|logic|Selector2~4_combout\);

-- Location: LCFF_X43_Y21_N1
\display|logic|t_start[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|logic|Selector2~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|logic|t_start\(2));

-- Location: LCCOMB_X43_Y21_N8
\display|timer3|Selector0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|timer3|Selector0~0_combout\ = (!\display|timer3|state.TRIGGERED~regout\ & ((\display|logic|t_start\(2)) # (\display|timer3|state.IDLE~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010001010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|timer3|state.TRIGGERED~regout\,
	datab => \display|logic|t_start\(2),
	datac => \display|timer3|state.IDLE~regout\,
	combout => \display|timer3|Selector0~0_combout\);

-- Location: LCFF_X43_Y21_N9
\display|timer3|state.IDLE\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|timer3|Selector0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|timer3|state.IDLE~regout\);

-- Location: LCCOMB_X43_Y21_N28
\display|timer3|Selector1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|timer3|Selector1~0_combout\ = (\display|timer3|Equal0~4_combout\ & (\display|logic|t_start\(2) & ((!\display|timer3|state.IDLE~regout\)))) # (!\display|timer3|Equal0~4_combout\ & ((\display|timer3|state.WAITING~regout\) # 
-- ((\display|logic|t_start\(2) & !\display|timer3|state.IDLE~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000011011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|timer3|Equal0~4_combout\,
	datab => \display|logic|t_start\(2),
	datac => \display|timer3|state.WAITING~regout\,
	datad => \display|timer3|state.IDLE~regout\,
	combout => \display|timer3|Selector1~0_combout\);

-- Location: LCFF_X43_Y21_N29
\display|timer3|state.WAITING\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|timer3|Selector1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|timer3|state.WAITING~regout\);

-- Location: LCCOMB_X43_Y21_N18
\display|timer3|Selector2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|timer3|Selector2~0_combout\ = (\display|timer3|Equal0~4_combout\ & \display|timer3|state.WAITING~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|timer3|Equal0~4_combout\,
	datad => \display|timer3|state.WAITING~regout\,
	combout => \display|timer3|Selector2~0_combout\);

-- Location: LCFF_X43_Y21_N19
\display|timer3|state.TRIGGERED\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|timer3|Selector2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|timer3|state.TRIGGERED~regout\);

-- Location: LCFF_X43_Y21_N27
\display|timer3|fire\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \display|timer3|state.TRIGGERED~regout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|timer3|fire~regout\);

-- Location: LCCOMB_X43_Y21_N12
\display|logic|Selector3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|logic|Selector3~0_combout\ = (\display|logic|Selector2~5_combout\ & (!\display|logic|Selector2~1_combout\ & ((\display|logic|Selector2~4_combout\)))) # (!\display|logic|Selector2~5_combout\ & ((\display|logic|state.INIT_WAIT2~regout\) # 
-- ((!\display|logic|Selector2~1_combout\ & \display|logic|Selector2~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111001101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|logic|Selector2~5_combout\,
	datab => \display|logic|Selector2~1_combout\,
	datac => \display|logic|state.INIT_WAIT2~regout\,
	datad => \display|logic|Selector2~4_combout\,
	combout => \display|logic|Selector3~0_combout\);

-- Location: LCFF_X43_Y21_N13
\display|logic|state.INIT_WAIT2\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|logic|Selector3~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|logic|state.INIT_WAIT2~regout\);

-- Location: LCCOMB_X43_Y21_N26
\display|logic|Selector2~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|logic|Selector2~3_combout\ = (\display|timer3|fire~regout\ & \display|logic|state.INIT_WAIT2~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \display|timer3|fire~regout\,
	datad => \display|logic|state.INIT_WAIT2~regout\,
	combout => \display|logic|Selector2~3_combout\);

-- Location: LCCOMB_X43_Y20_N8
\display|logic|Selector1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|logic|Selector1~0_combout\ = (\display|logic|state.INIT_START~regout\ & (!\display|logic|Selector2~3_combout\ & (!\display|logic|Selector2~0_combout\ & !\display|logic|Selector2~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|logic|state.INIT_START~regout\,
	datab => \display|logic|Selector2~3_combout\,
	datac => \display|logic|Selector2~0_combout\,
	datad => \display|logic|Selector2~4_combout\,
	combout => \display|logic|Selector1~0_combout\);

-- Location: LCCOMB_X43_Y20_N28
\display|logic|Selector1~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|logic|Selector1~2_combout\ = (\display|logic|Selector2~2_combout\ & (\display|logic|Selector1~0_combout\ & (\display|wr_logic|done~regout\ & !\display|logic|Selector2~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|logic|Selector2~2_combout\,
	datab => \display|logic|Selector1~0_combout\,
	datac => \display|wr_logic|done~regout\,
	datad => \display|logic|Selector2~1_combout\,
	combout => \display|logic|Selector1~2_combout\);

-- Location: LCCOMB_X43_Y20_N30
\display|logic|Selector5~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|logic|Selector5~0_combout\ = (\display|logic|Selector1~2_combout\) # ((\display|logic|state.WAIT_MAIN~regout\ & !\display|logic|Selector2~5_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \display|logic|Selector1~2_combout\,
	datac => \display|logic|state.WAIT_MAIN~regout\,
	datad => \display|logic|Selector2~5_combout\,
	combout => \display|logic|Selector5~0_combout\);

-- Location: LCFF_X43_Y20_N31
\display|logic|state.WAIT_MAIN\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|logic|Selector5~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|logic|state.WAIT_MAIN~regout\);

-- Location: LCCOMB_X43_Y20_N26
\display|logic|Selector7~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|logic|Selector7~0_combout\ = (!\display|logic|update_char~regout\ & (\display|logic|update_temp~regout\ & \display|logic|state.WAIT_MAIN~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \display|logic|update_char~regout\,
	datac => \display|logic|update_temp~regout\,
	datad => \display|logic|state.WAIT_MAIN~regout\,
	combout => \display|logic|Selector7~0_combout\);

-- Location: LCFF_X43_Y20_N27
\display|logic|state.DO_UPDATE_TEMP\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|logic|Selector7~0_combout\,
	ena => \display|logic|Selector2~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|logic|state.DO_UPDATE_TEMP~regout\);

-- Location: LCCOMB_X43_Y20_N14
\display|logic|Selector4~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|logic|Selector4~0_combout\ = (\display|logic|Selector2~1_combout\ & (((\display|logic|state.INIT_SEQ~regout\ & !\display|logic|Selector2~5_combout\)))) # (!\display|logic|Selector2~1_combout\ & ((\display|logic|Selector2~3_combout\) # 
-- ((\display|logic|state.INIT_SEQ~regout\ & !\display|logic|Selector2~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010011110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|logic|Selector2~1_combout\,
	datab => \display|logic|Selector2~3_combout\,
	datac => \display|logic|state.INIT_SEQ~regout\,
	datad => \display|logic|Selector2~5_combout\,
	combout => \display|logic|Selector4~0_combout\);

-- Location: LCFF_X43_Y20_N15
\display|logic|state.INIT_SEQ\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|logic|Selector4~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|logic|state.INIT_SEQ~regout\);

-- Location: LCCOMB_X43_Y20_N0
\display|logic|Selector6~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|logic|Selector6~0_combout\ = (\display|logic|Selector2~5_combout\ & (\display|logic|state.WAIT_MAIN~regout\ & ((\display|logic|update_char~regout\)))) # (!\display|logic|Selector2~5_combout\ & ((\display|logic|state.DO_UPDATE_CHAR~regout\) # 
-- ((\display|logic|state.WAIT_MAIN~regout\ & \display|logic|update_char~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|logic|Selector2~5_combout\,
	datab => \display|logic|state.WAIT_MAIN~regout\,
	datac => \display|logic|state.DO_UPDATE_CHAR~regout\,
	datad => \display|logic|update_char~regout\,
	combout => \display|logic|Selector6~0_combout\);

-- Location: LCFF_X43_Y20_N1
\display|logic|state.DO_UPDATE_CHAR\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|logic|Selector6~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|logic|state.DO_UPDATE_CHAR~regout\);

-- Location: LCCOMB_X43_Y20_N20
\display|logic|Selector2~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|logic|Selector2~2_combout\ = (\display|logic|state.DO_UPDATE_TEMP~regout\) # ((\display|logic|state.INIT_SEQ~regout\) # (\display|logic|state.DO_UPDATE_CHAR~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \display|logic|state.DO_UPDATE_TEMP~regout\,
	datac => \display|logic|state.INIT_SEQ~regout\,
	datad => \display|logic|state.DO_UPDATE_CHAR~regout\,
	combout => \display|logic|Selector2~2_combout\);

-- Location: LCFF_X43_Y20_N21
\display|logic|start_write\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|logic|Selector2~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|logic|start_write~regout\);

-- Location: LCCOMB_X39_Y20_N2
\display|wr_logic|current_addr[7]~24\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|wr_logic|current_addr[7]~24_combout\ = (\display|wr_logic|state.IDLE~regout\ & (\display|wr_logic|state.WR_DATA~regout\)) # (!\display|wr_logic|state.IDLE~regout\ & ((\display|logic|start_write~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \display|wr_logic|state.WR_DATA~regout\,
	datac => \display|wr_logic|state.IDLE~regout\,
	datad => \display|logic|start_write~regout\,
	combout => \display|wr_logic|current_addr[7]~24_combout\);

-- Location: LCFF_X40_Y20_N9
\display|wr_logic|current_addr[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|wr_logic|current_addr[2]~12_combout\,
	sdata => \~GND~combout\,
	sload => \display|wr_logic|ALT_INV_state.WR_DATA~regout\,
	ena => \display|wr_logic|current_addr[7]~24_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|wr_logic|current_addr\(2));

-- Location: LCCOMB_X40_Y20_N10
\display|wr_logic|current_addr[3]~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|wr_logic|current_addr[3]~14_combout\ = (\display|wr_logic|current_addr\(3) & (!\display|wr_logic|current_addr[2]~13\)) # (!\display|wr_logic|current_addr\(3) & ((\display|wr_logic|current_addr[2]~13\) # (GND)))
-- \display|wr_logic|current_addr[3]~15\ = CARRY((!\display|wr_logic|current_addr[2]~13\) # (!\display|wr_logic|current_addr\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \display|wr_logic|current_addr\(3),
	datad => VCC,
	cin => \display|wr_logic|current_addr[2]~13\,
	combout => \display|wr_logic|current_addr[3]~14_combout\,
	cout => \display|wr_logic|current_addr[3]~15\);

-- Location: LCCOMB_X40_Y20_N12
\display|wr_logic|current_addr[4]~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|wr_logic|current_addr[4]~16_combout\ = (\display|wr_logic|current_addr\(4) & (\display|wr_logic|current_addr[3]~15\ $ (GND))) # (!\display|wr_logic|current_addr\(4) & (!\display|wr_logic|current_addr[3]~15\ & VCC))
-- \display|wr_logic|current_addr[4]~17\ = CARRY((\display|wr_logic|current_addr\(4) & !\display|wr_logic|current_addr[3]~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \display|wr_logic|current_addr\(4),
	datad => VCC,
	cin => \display|wr_logic|current_addr[3]~15\,
	combout => \display|wr_logic|current_addr[4]~16_combout\,
	cout => \display|wr_logic|current_addr[4]~17\);

-- Location: LCCOMB_X40_Y20_N14
\display|wr_logic|current_addr[5]~18\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|wr_logic|current_addr[5]~18_combout\ = (\display|wr_logic|current_addr\(5) & (!\display|wr_logic|current_addr[4]~17\)) # (!\display|wr_logic|current_addr\(5) & ((\display|wr_logic|current_addr[4]~17\) # (GND)))
-- \display|wr_logic|current_addr[5]~19\ = CARRY((!\display|wr_logic|current_addr[4]~17\) # (!\display|wr_logic|current_addr\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \display|wr_logic|current_addr\(5),
	datad => VCC,
	cin => \display|wr_logic|current_addr[4]~17\,
	combout => \display|wr_logic|current_addr[5]~18_combout\,
	cout => \display|wr_logic|current_addr[5]~19\);

-- Location: LCFF_X40_Y20_N15
\display|wr_logic|current_addr[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|wr_logic|current_addr[5]~18_combout\,
	sdata => \~GND~combout\,
	sload => \display|wr_logic|ALT_INV_state.WR_DATA~regout\,
	ena => \display|wr_logic|current_addr[7]~24_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|wr_logic|current_addr\(5));

-- Location: LCCOMB_X40_Y20_N16
\display|wr_logic|current_addr[6]~20\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|wr_logic|current_addr[6]~20_combout\ = (\display|wr_logic|current_addr\(6) & (\display|wr_logic|current_addr[5]~19\ $ (GND))) # (!\display|wr_logic|current_addr\(6) & (!\display|wr_logic|current_addr[5]~19\ & VCC))
-- \display|wr_logic|current_addr[6]~21\ = CARRY((\display|wr_logic|current_addr\(6) & !\display|wr_logic|current_addr[5]~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \display|wr_logic|current_addr\(6),
	datad => VCC,
	cin => \display|wr_logic|current_addr[5]~19\,
	combout => \display|wr_logic|current_addr[6]~20_combout\,
	cout => \display|wr_logic|current_addr[6]~21\);

-- Location: LCCOMB_X40_Y20_N18
\display|wr_logic|current_addr[7]~22\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|wr_logic|current_addr[7]~22_combout\ = \display|wr_logic|current_addr[6]~21\ $ (\display|wr_logic|current_addr\(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \display|wr_logic|current_addr\(7),
	cin => \display|wr_logic|current_addr[6]~21\,
	combout => \display|wr_logic|current_addr[7]~22_combout\);

-- Location: LCCOMB_X43_Y20_N22
\display|logic|write_start_addr_next[7]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|logic|write_start_addr_next[7]~0_combout\ = (\display|logic|state.DO_UPDATE_TEMP~regout\) # (\display|logic|state.DO_UPDATE_CHAR~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \display|logic|state.DO_UPDATE_TEMP~regout\,
	datad => \display|logic|state.DO_UPDATE_CHAR~regout\,
	combout => \display|logic|write_start_addr_next[7]~0_combout\);

-- Location: LCFF_X43_Y20_N23
\display|logic|write_start_addr[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|logic|write_start_addr_next[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|logic|write_start_addr\(7));

-- Location: LCFF_X40_Y20_N19
\display|wr_logic|current_addr[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|wr_logic|current_addr[7]~22_combout\,
	sdata => \display|logic|write_start_addr\(7),
	sload => \display|wr_logic|ALT_INV_state.WR_DATA~regout\,
	ena => \display|wr_logic|current_addr[7]~24_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|wr_logic|current_addr\(7));

-- Location: PIN_L1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\clk~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_clk,
	combout => \clk~combout\);

-- Location: CLKCTRL_G2
\clk~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk~clkctrl_outclk\);

-- Location: LCFF_X40_Y20_N5
\display|wr_logic|current_addr[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|wr_logic|current_addr[0]~8_combout\,
	sdata => \~GND~combout\,
	sload => \display|wr_logic|ALT_INV_state.WR_DATA~regout\,
	ena => \display|wr_logic|current_addr[7]~24_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|wr_logic|current_addr\(0));

-- Location: LCFF_X40_Y20_N7
\display|wr_logic|current_addr[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|wr_logic|current_addr[1]~10_combout\,
	sdata => \~GND~combout\,
	sload => \display|wr_logic|ALT_INV_state.WR_DATA~regout\,
	ena => \display|wr_logic|current_addr[7]~24_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|wr_logic|current_addr\(1));

-- Location: LCFF_X40_Y20_N11
\display|wr_logic|current_addr[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|wr_logic|current_addr[3]~14_combout\,
	sdata => \~GND~combout\,
	sload => \display|wr_logic|ALT_INV_state.WR_DATA~regout\,
	ena => \display|wr_logic|current_addr[7]~24_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|wr_logic|current_addr\(3));

-- Location: LCFF_X40_Y20_N13
\display|wr_logic|current_addr[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|wr_logic|current_addr[4]~16_combout\,
	sdata => \~GND~combout\,
	sload => \display|wr_logic|ALT_INV_state.WR_DATA~regout\,
	ena => \display|wr_logic|current_addr[7]~24_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|wr_logic|current_addr\(4));

-- Location: LCCOMB_X40_Y20_N2
\display|logic|write_start_addr[6]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|logic|write_start_addr[6]~feeder_combout\ = \display|logic|state.DO_UPDATE_CHAR~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \display|logic|state.DO_UPDATE_CHAR~regout\,
	combout => \display|logic|write_start_addr[6]~feeder_combout\);

-- Location: LCFF_X40_Y20_N3
\display|logic|write_start_addr[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|logic|write_start_addr[6]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|logic|write_start_addr\(6));

-- Location: LCFF_X40_Y20_N17
\display|wr_logic|current_addr[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|wr_logic|current_addr[6]~20_combout\,
	sdata => \display|logic|write_start_addr\(6),
	sload => \display|wr_logic|ALT_INV_state.WR_DATA~regout\,
	ena => \display|wr_logic|current_addr[7]~24_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|wr_logic|current_addr\(6));

-- Location: LCCOMB_X34_Y21_N30
\tr|i2c_master_inst|Equal0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|i2c_master_inst|Equal0~1_combout\ = (\tr|i2c_master_inst|bit_cnt\(0) & \tr|i2c_master_inst|bit_cnt\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \tr|i2c_master_inst|bit_cnt\(0),
	datad => \tr|i2c_master_inst|bit_cnt\(1),
	combout => \tr|i2c_master_inst|Equal0~1_combout\);

-- Location: LCCOMB_X34_Y21_N22
\tr|i2c_master_inst|data_rx[0]~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|i2c_master_inst|data_rx[0]~14_combout\ = (\tr|i2c_master_inst|data_rx[3]~6_combout\ & ((\tr|i2c_master_inst|Equal0~1_combout\ & ((\temp_sda~0\))) # (!\tr|i2c_master_inst|Equal0~1_combout\ & (\tr|i2c_master_inst|data_rx\(0))))) # 
-- (!\tr|i2c_master_inst|data_rx[3]~6_combout\ & (((\tr|i2c_master_inst|data_rx\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tr|i2c_master_inst|data_rx[3]~6_combout\,
	datab => \tr|i2c_master_inst|Equal0~1_combout\,
	datac => \tr|i2c_master_inst|data_rx\(0),
	datad => \temp_sda~0\,
	combout => \tr|i2c_master_inst|data_rx[0]~14_combout\);

-- Location: LCFF_X34_Y21_N23
\tr|i2c_master_inst|data_rx[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \tr|i2c_master_inst|data_rx[0]~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \tr|i2c_master_inst|data_rx\(0));

-- Location: LCCOMB_X34_Y21_N6
\tr|tr_logic|temp_r2[0]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|tr_logic|temp_r2[0]~feeder_combout\ = \tr|i2c_master_inst|data_rx\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \tr|i2c_master_inst|data_rx\(0),
	combout => \tr|tr_logic|temp_r2[0]~feeder_combout\);

-- Location: LCFF_X34_Y21_N7
\tr|tr_logic|temp_r2[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \tr|tr_logic|temp_r2[0]~feeder_combout\,
	ena => \tr|tr_logic|next_completed~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \tr|tr_logic|temp_r2\(0));

-- Location: LCFF_X38_Y21_N19
\tr|tr_logic|ttemp[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \tr|tr_logic|temp_r2\(0),
	sload => VCC,
	ena => \tr|tr_logic|next_completed~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \tr|tr_logic|ttemp\(8));

-- Location: LCCOMB_X38_Y21_N18
\display|mem|temp_reg|Mux7~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|mem|temp_reg|Mux7~2_combout\ = (!\display|wr_logic|current_addr\(2) & ((\display|wr_logic|current_addr\(0) & ((!\display|wr_logic|current_addr\(1)))) # (!\display|wr_logic|current_addr\(0) & (\tr|tr_logic|ttemp\(8) & 
-- \display|wr_logic|current_addr\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|wr_logic|current_addr\(0),
	datab => \display|wr_logic|current_addr\(2),
	datac => \tr|tr_logic|ttemp\(8),
	datad => \display|wr_logic|current_addr\(1),
	combout => \display|mem|temp_reg|Mux7~2_combout\);

-- Location: LCCOMB_X36_Y21_N0
\tr|i2c_master_inst|data_rx[7]~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|i2c_master_inst|data_rx[7]~9_combout\ = (\tr|i2c_master_inst|data_rx[7]~8_combout\ & ((\temp_sda~0\))) # (!\tr|i2c_master_inst|data_rx[7]~8_combout\ & (\tr|i2c_master_inst|data_rx\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tr|i2c_master_inst|data_rx[7]~8_combout\,
	datac => \tr|i2c_master_inst|data_rx\(7),
	datad => \temp_sda~0\,
	combout => \tr|i2c_master_inst|data_rx[7]~9_combout\);

-- Location: LCFF_X36_Y21_N1
\tr|i2c_master_inst|data_rx[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \tr|i2c_master_inst|data_rx[7]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \tr|i2c_master_inst|data_rx\(7));

-- Location: LCCOMB_X36_Y21_N22
\tr|tr_logic|temp_r1[7]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \tr|tr_logic|temp_r1[7]~0_combout\ = (\tr|i2c_master_inst|busy_r~regout\ & (((\tr|tr_logic|temp_r1\(7))))) # (!\tr|i2c_master_inst|busy_r~regout\ & ((\tr|tr_logic|state.READ_ACTIVE~regout\ & (\tr|i2c_master_inst|data_rx\(7))) # 
-- (!\tr|tr_logic|state.READ_ACTIVE~regout\ & ((\tr|tr_logic|temp_r1\(7))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tr|i2c_master_inst|busy_r~regout\,
	datab => \tr|i2c_master_inst|data_rx\(7),
	datac => \tr|tr_logic|temp_r1\(7),
	datad => \tr|tr_logic|state.READ_ACTIVE~regout\,
	combout => \tr|tr_logic|temp_r1[7]~0_combout\);

-- Location: LCFF_X36_Y21_N23
\tr|tr_logic|temp_r1[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \tr|tr_logic|temp_r1[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \tr|tr_logic|temp_r1\(7));

-- Location: LCFF_X38_Y21_N13
\tr|tr_logic|ttemp[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \tr|tr_logic|temp_r1\(7),
	sload => VCC,
	ena => \tr|tr_logic|next_completed~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \tr|tr_logic|ttemp\(7));

-- Location: LCCOMB_X38_Y21_N12
\display|mem|temp_reg|Mux5~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|mem|temp_reg|Mux5~2_combout\ = (\display|wr_logic|current_addr\(2) & (\tr|tr_logic|ttemp\(7) & !\display|wr_logic|current_addr\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \display|wr_logic|current_addr\(2),
	datac => \tr|tr_logic|ttemp\(7),
	datad => \display|wr_logic|current_addr\(0),
	combout => \display|mem|temp_reg|Mux5~2_combout\);

-- Location: LCCOMB_X38_Y21_N22
\display|mem|temp_reg|Mux7~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|mem|temp_reg|Mux7~3_combout\ = (\display|wr_logic|current_addr\(1) & (((\display|mem|temp_reg|Mux7~2_combout\)))) # (!\display|wr_logic|current_addr\(1) & ((\display|mem|temp_reg|Mux5~2_combout\) # ((\display|mem|temp_reg|Mux7~4_combout\ & 
-- \display|mem|temp_reg|Mux7~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|mem|temp_reg|Mux7~4_combout\,
	datab => \display|mem|temp_reg|Mux7~2_combout\,
	datac => \display|mem|temp_reg|Mux5~2_combout\,
	datad => \display|wr_logic|current_addr\(1),
	combout => \display|mem|temp_reg|Mux7~3_combout\);

-- Location: LCFF_X38_Y21_N23
\display|mem|temp_reg|data[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|mem|temp_reg|Mux7~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|mem|temp_reg|data\(0));

-- Location: LCCOMB_X40_Y20_N0
\display|mem|mem_mux|data[0]~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|mem|mem_mux|data[0]~10_combout\ = (\display|wr_logic|current_addr\(7) & ((\display|wr_logic|current_addr\(6) & (\display|mem|char_reg|data\(0))) # (!\display|wr_logic|current_addr\(6) & ((\display|mem|temp_reg|data\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|mem|char_reg|data\(0),
	datab => \display|mem|temp_reg|data\(0),
	datac => \display|wr_logic|current_addr\(6),
	datad => \display|wr_logic|current_addr\(7),
	combout => \display|mem|mem_mux|data[0]~10_combout\);

-- Location: LCCOMB_X39_Y19_N26
\display|mem|mem_mux|data[0]~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|mem|mem_mux|data[0]~11_combout\ = (\display|mem|mem_mux|data[0]~10_combout\) # ((!\display|wr_logic|current_addr\(7) & \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a0~portadataout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \display|wr_logic|current_addr\(7),
	datac => \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a0~portadataout\,
	datad => \display|mem|mem_mux|data[0]~10_combout\,
	combout => \display|mem|mem_mux|data[0]~11_combout\);

-- Location: PIN_M2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\sw[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_sw(7),
	combout => \sw~combout\(7));

-- Location: PIN_U12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\sw[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_sw(5),
	combout => \sw~combout\(5));

-- Location: PIN_U11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\sw[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_sw(6),
	combout => \sw~combout\(6));

-- Location: LCCOMB_X37_Y19_N10
\display|mem|char_reg|tr_char~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|mem|char_reg|tr_char~0_combout\ = (!\sw~combout\(7) & ((\sw~combout\(5)) # (\sw~combout\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \sw~combout\(7),
	datac => \sw~combout\(5),
	datad => \sw~combout\(6),
	combout => \display|mem|char_reg|tr_char~0_combout\);

-- Location: PIN_V12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\sw[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_sw(3),
	combout => \sw~combout\(3));

-- Location: PIN_L21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\sw[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_sw(1),
	combout => \sw~combout\(1));

-- Location: PIN_M22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\sw[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_sw(2),
	combout => \sw~combout\(2));

-- Location: LCCOMB_X36_Y19_N10
\display|mem|char_reg|data[1]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|mem|char_reg|data[1]~2_combout\ = (!\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a2\ & (((!\sw~combout\(1) & !\sw~combout\(2))) # (!\sw~combout\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000100010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a2\,
	datab => \sw~combout\(3),
	datac => \sw~combout\(1),
	datad => \sw~combout\(2),
	combout => \display|mem|char_reg|data[1]~2_combout\);

-- Location: LCCOMB_X38_Y19_N4
\display|mem|char_reg|data[1]~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|mem|char_reg|data[1]~3_combout\ = (\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a8\ & ((\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a9\ & (\display|mem|char_reg|tr_char~0_combout\)) # 
-- (!\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a9\ & ((\display|mem|char_reg|data[1]~2_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a8\,
	datab => \display|mem|char_reg|tr_char~0_combout\,
	datac => \display|mem|char_reg|data[1]~2_combout\,
	datad => \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a9\,
	combout => \display|mem|char_reg|data[1]~3_combout\);

-- Location: LCCOMB_X38_Y19_N28
\display|mem|char_reg|Mux9~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|mem|char_reg|Mux9~0_combout\ = (\display|mem|char_reg|data[1]~3_combout\ & \sw~combout\(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \display|mem|char_reg|data[1]~3_combout\,
	datac => \sw~combout\(3),
	combout => \display|mem|char_reg|Mux9~0_combout\);

-- Location: PIN_W12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\sw[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_sw(4),
	combout => \sw~combout\(4));

-- Location: LCCOMB_X37_Y19_N28
\display|mem|char_reg|Add0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|mem|char_reg|Add0~1_combout\ = \sw~combout\(7) $ (((\sw~combout\(5)) # ((\sw~combout\(4)) # (\sw~combout\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100110110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sw~combout\(5),
	datab => \sw~combout\(7),
	datac => \sw~combout\(4),
	datad => \sw~combout\(6),
	combout => \display|mem|char_reg|Add0~1_combout\);

-- Location: LCCOMB_X37_Y19_N0
\display|mem|char_reg|LessThan0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|mem|char_reg|LessThan0~0_combout\ = (\sw~combout\(7) & ((\sw~combout\(5)) # (\sw~combout\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \sw~combout\(7),
	datac => \sw~combout\(5),
	datad => \sw~combout\(6),
	combout => \display|mem|char_reg|LessThan0~0_combout\);

-- Location: LCCOMB_X37_Y19_N24
\display|mem|char_reg|data[1]~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|mem|char_reg|data[1]~4_combout\ = (\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a8\ & ((\display|mem|char_reg|LessThan0~0_combout\) # (!\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a2\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a8\,
	datac => \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a2\,
	datad => \display|mem|char_reg|LessThan0~0_combout\,
	combout => \display|mem|char_reg|data[1]~4_combout\);

-- Location: LCCOMB_X37_Y19_N18
\display|mem|char_reg|Mux9~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|mem|char_reg|Mux9~1_combout\ = (\display|mem|char_reg|data[1]~5_combout\ & ((\sw~combout\(7)) # ((\display|mem|char_reg|data[1]~4_combout\)))) # (!\display|mem|char_reg|data[1]~5_combout\ & (((!\display|mem|char_reg|data[1]~4_combout\ & 
-- \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a3\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|mem|char_reg|data[1]~5_combout\,
	datab => \sw~combout\(7),
	datac => \display|mem|char_reg|data[1]~4_combout\,
	datad => \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a3\,
	combout => \display|mem|char_reg|Mux9~1_combout\);

-- Location: LCCOMB_X37_Y19_N6
\display|mem|char_reg|Mux9~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|mem|char_reg|Mux9~2_combout\ = (\display|mem|char_reg|data[1]~4_combout\ & ((\display|mem|char_reg|Mux9~1_combout\ & ((\display|mem|char_reg|Add0~1_combout\))) # (!\display|mem|char_reg|Mux9~1_combout\ & (\display|mem|char_reg|Add1~2_combout\)))) 
-- # (!\display|mem|char_reg|data[1]~4_combout\ & (((\display|mem|char_reg|Mux9~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|mem|char_reg|Add1~2_combout\,
	datab => \display|mem|char_reg|Add0~1_combout\,
	datac => \display|mem|char_reg|data[1]~4_combout\,
	datad => \display|mem|char_reg|Mux9~1_combout\,
	combout => \display|mem|char_reg|Mux9~2_combout\);

-- Location: LCCOMB_X38_Y19_N2
\display|mem|char_reg|Mux10~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|mem|char_reg|Mux10~0_combout\ = (\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a8\ & (!\display|mem|char_reg|tr_char~0_combout\ & \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a8\,
	datac => \display|mem|char_reg|tr_char~0_combout\,
	datad => \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a9\,
	combout => \display|mem|char_reg|Mux10~0_combout\);

-- Location: LCCOMB_X38_Y19_N22
\display|mem|char_reg|Mux9~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|mem|char_reg|Mux9~3_combout\ = (\display|mem|char_reg|Mux9~0_combout\) # ((\display|mem|char_reg|Mux10~0_combout\) # ((\display|mem|char_reg|Mux10~4_combout\ & \display|mem|char_reg|Mux9~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|mem|char_reg|Mux10~4_combout\,
	datab => \display|mem|char_reg|Mux9~0_combout\,
	datac => \display|mem|char_reg|Mux9~2_combout\,
	datad => \display|mem|char_reg|Mux10~0_combout\,
	combout => \display|mem|char_reg|Mux9~3_combout\);

-- Location: LCFF_X38_Y19_N23
\display|mem|char_reg|data[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|mem|char_reg|Mux9~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|mem|char_reg|data\(3));

-- Location: LCCOMB_X38_Y19_N16
\display|mem|mem_mux|data[3]~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|mem|mem_mux|data[3]~12_combout\ = (\display|wr_logic|current_addr\(7) & ((\display|wr_logic|current_addr\(6) & ((\display|mem|char_reg|data\(3)))) # (!\display|wr_logic|current_addr\(6) & (\display|mem|temp_reg|data\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|mem|temp_reg|data\(3),
	datab => \display|mem|char_reg|data\(3),
	datac => \display|wr_logic|current_addr\(6),
	datad => \display|wr_logic|current_addr\(7),
	combout => \display|mem|mem_mux|data[3]~12_combout\);

-- Location: LCCOMB_X39_Y19_N28
\display|wr_logic|process_1~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|wr_logic|process_1~5_combout\ = (!\display|mem|mem_mux|data[0]~11_combout\ & (!\display|mem|mem_mux|data[3]~12_combout\ & ((\display|wr_logic|current_addr\(7)) # (!\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a3\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a3\,
	datab => \display|mem|mem_mux|data[0]~11_combout\,
	datac => \display|wr_logic|current_addr\(7),
	datad => \display|mem|mem_mux|data[3]~12_combout\,
	combout => \display|wr_logic|process_1~5_combout\);

-- Location: LCCOMB_X37_Y19_N16
\display|mem|char_reg|data[1]~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|mem|char_reg|data[1]~5_combout\ = (\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a2\ & \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a8\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a2\,
	datac => \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a8\,
	combout => \display|mem|char_reg|data[1]~5_combout\);

-- Location: LCCOMB_X37_Y19_N2
\display|mem|char_reg|Add1~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|mem|char_reg|Add1~1_combout\ = \sw~combout\(0) $ (\sw~combout\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sw~combout\(0),
	datac => \sw~combout\(1),
	combout => \display|mem|char_reg|Add1~1_combout\);

-- Location: LCCOMB_X37_Y19_N12
\display|mem|char_reg|Mux11~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|mem|char_reg|Mux11~1_combout\ = (\display|mem|char_reg|data[1]~5_combout\ & (((\display|mem|char_reg|data[1]~4_combout\)))) # (!\display|mem|char_reg|data[1]~5_combout\ & ((\display|mem|char_reg|data[1]~4_combout\ & 
-- (!\display|mem|char_reg|Add1~1_combout\)) # (!\display|mem|char_reg|data[1]~4_combout\ & ((\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a1\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011010110110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|mem|char_reg|data[1]~5_combout\,
	datab => \display|mem|char_reg|Add1~1_combout\,
	datac => \display|mem|char_reg|data[1]~4_combout\,
	datad => \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a1\,
	combout => \display|mem|char_reg|Mux11~1_combout\);

-- Location: LCCOMB_X37_Y19_N22
\display|mem|char_reg|Mux11~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|mem|char_reg|Mux11~2_combout\ = (\display|mem|char_reg|data[1]~5_combout\ & (\sw~combout\(5) $ (((!\sw~combout\(4) & \display|mem|char_reg|Mux11~1_combout\))))) # (!\display|mem|char_reg|data[1]~5_combout\ & 
-- (((\display|mem|char_reg|Mux11~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sw~combout\(5),
	datab => \sw~combout\(4),
	datac => \display|mem|char_reg|data[1]~5_combout\,
	datad => \display|mem|char_reg|Mux11~1_combout\,
	combout => \display|mem|char_reg|Mux11~2_combout\);

-- Location: LCCOMB_X38_Y19_N24
\display|mem|char_reg|Mux10~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|mem|char_reg|Mux10~4_combout\ = (!\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a9\ & ((!\display|mem|char_reg|data[1]~2_combout\) # (!\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a8\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a8\,
	datac => \display|mem|char_reg|data[1]~2_combout\,
	datad => \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a9\,
	combout => \display|mem|char_reg|Mux10~4_combout\);

-- Location: LCCOMB_X38_Y19_N0
\display|mem|char_reg|Mux11~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|mem|char_reg|Mux11~3_combout\ = (\display|mem|char_reg|Mux11~0_combout\) # ((\display|mem|char_reg|Mux10~0_combout\) # ((\display|mem|char_reg|Mux11~2_combout\ & \display|mem|char_reg|Mux10~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|mem|char_reg|Mux11~0_combout\,
	datab => \display|mem|char_reg|Mux11~2_combout\,
	datac => \display|mem|char_reg|Mux10~4_combout\,
	datad => \display|mem|char_reg|Mux10~0_combout\,
	combout => \display|mem|char_reg|Mux11~3_combout\);

-- Location: LCFF_X38_Y19_N1
\display|mem|char_reg|data[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|mem|char_reg|Mux11~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|mem|char_reg|data\(1));

-- Location: LCCOMB_X38_Y19_N18
\display|mem|mem_mux|data[1]~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|mem|mem_mux|data[1]~9_combout\ = (\display|wr_logic|current_addr\(7) & ((\display|wr_logic|current_addr\(6) & ((\display|mem|char_reg|data\(1)))) # (!\display|wr_logic|current_addr\(6) & (\display|mem|temp_reg|data\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|mem|temp_reg|data\(1),
	datab => \display|mem|char_reg|data\(1),
	datac => \display|wr_logic|current_addr\(6),
	datad => \display|wr_logic|current_addr\(7),
	combout => \display|mem|mem_mux|data[1]~9_combout\);

-- Location: LCCOMB_X38_Y19_N14
\display|mem|mem_mux|data[2]~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|mem|mem_mux|data[2]~8_combout\ = (\display|mem|mem_mux|data[2]~7_combout\) # ((\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a2\ & !\display|wr_logic|current_addr\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|mem|mem_mux|data[2]~7_combout\,
	datac => \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a2\,
	datad => \display|wr_logic|current_addr\(7),
	combout => \display|mem|mem_mux|data[2]~8_combout\);

-- Location: LCCOMB_X38_Y19_N20
\display|wr_logic|process_1~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|wr_logic|process_1~4_combout\ = (!\display|mem|mem_mux|data[1]~9_combout\ & (!\display|mem|mem_mux|data[2]~8_combout\ & ((\display|wr_logic|current_addr\(7)) # (!\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a1\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|wr_logic|current_addr\(7),
	datab => \display|mem|mem_mux|data[1]~9_combout\,
	datac => \display|mem|mem_mux|data[2]~8_combout\,
	datad => \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a1\,
	combout => \display|wr_logic|process_1~4_combout\);

-- Location: LCCOMB_X40_Y19_N0
\display|wr_logic|process_1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|wr_logic|process_1~0_combout\ = (!\display|i2c_master_inst|busy_r~regout\ & ((\display|wr_logic|current_addr\(7)) # ((!\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a8\ & !\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a9\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|i2c_master_inst|busy_r~regout\,
	datab => \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a8\,
	datac => \display|wr_logic|current_addr\(7),
	datad => \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a9\,
	combout => \display|wr_logic|process_1~0_combout\);

-- Location: LCCOMB_X40_Y19_N30
\display|wr_logic|process_1~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|wr_logic|process_1~1_combout\ = (!\display|mem|mem_mux|data[10]~0_combout\ & (\display|wr_logic|process_1~0_combout\ & ((\display|wr_logic|current_addr\(7)) # (!\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a10\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|mem|mem_mux|data[10]~0_combout\,
	datab => \display|wr_logic|current_addr\(7),
	datac => \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a10\,
	datad => \display|wr_logic|process_1~0_combout\,
	combout => \display|wr_logic|process_1~1_combout\);

-- Location: LCCOMB_X40_Y19_N18
\display|wr_logic|process_1~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|wr_logic|process_1~6_combout\ = (\display|wr_logic|process_1~3_combout\ & (\display|wr_logic|process_1~5_combout\ & (\display|wr_logic|process_1~4_combout\ & \display|wr_logic|process_1~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|wr_logic|process_1~3_combout\,
	datab => \display|wr_logic|process_1~5_combout\,
	datac => \display|wr_logic|process_1~4_combout\,
	datad => \display|wr_logic|process_1~1_combout\,
	combout => \display|wr_logic|process_1~6_combout\);

-- Location: LCCOMB_X39_Y19_N30
\display|wr_logic|Selector15~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|wr_logic|Selector15~2_combout\ = (!\display|i2c_master_inst|busy_r~regout\ & ((\display|wr_logic|state.WR_CONTROL_BUSY~regout\) # ((\display|wr_logic|state.WR_CONTROL~regout\ & !\display|wr_logic|process_1~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|wr_logic|state.WR_CONTROL~regout\,
	datab => \display|i2c_master_inst|busy_r~regout\,
	datac => \display|wr_logic|state.WR_CONTROL_BUSY~regout\,
	datad => \display|wr_logic|process_1~6_combout\,
	combout => \display|wr_logic|Selector15~2_combout\);

-- Location: LCFF_X39_Y19_N31
\display|wr_logic|state.WR_CONTROL_BUSY\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|wr_logic|Selector15~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|wr_logic|state.WR_CONTROL_BUSY~regout\);

-- Location: LCCOMB_X39_Y20_N8
\display|wr_logic|Selector18~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|wr_logic|Selector18~2_combout\ = (\display|i2c_master_inst|busy_r~regout\ & (!\display|wr_logic|state.WR_CONTROL_BUSY~regout\ & (!\display|wr_logic|state.RD_STATUS_WR_BUSY~regout\ & !\display|wr_logic|state.RD_STATUS_RD_BUSY~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|i2c_master_inst|busy_r~regout\,
	datab => \display|wr_logic|state.WR_CONTROL_BUSY~regout\,
	datac => \display|wr_logic|state.RD_STATUS_WR_BUSY~regout\,
	datad => \display|wr_logic|state.RD_STATUS_RD_BUSY~regout\,
	combout => \display|wr_logic|Selector18~2_combout\);

-- Location: LCCOMB_X39_Y20_N16
\display|wr_logic|Selector17~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|wr_logic|Selector17~0_combout\ = (\display|wr_logic|state.WR_DATA_BUSY~regout\) # (\display|wr_logic|state.WR_DATA~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \display|wr_logic|state.WR_DATA_BUSY~regout\,
	datad => \display|wr_logic|state.WR_DATA~regout\,
	combout => \display|wr_logic|Selector17~0_combout\);

-- Location: LCFF_X39_Y20_N17
\display|wr_logic|state.WR_DATA_BUSY\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|wr_logic|Selector17~0_combout\,
	sclr => \display|i2c_master_inst|busy_r~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|wr_logic|state.WR_DATA_BUSY~regout\);

-- Location: LCCOMB_X39_Y20_N6
\display|wr_logic|Selector18~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|wr_logic|Selector18~5_combout\ = (\display|wr_logic|state.IDLE~regout\ & (((\display|wr_logic|state.WR_DATA_BUSY~regout\)) # (!\display|wr_logic|Selector18~2_combout\))) # (!\display|wr_logic|state.IDLE~regout\ & 
-- (((\display|logic|start_write~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011110100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|wr_logic|state.IDLE~regout\,
	datab => \display|wr_logic|Selector18~2_combout\,
	datac => \display|wr_logic|state.WR_DATA_BUSY~regout\,
	datad => \display|logic|start_write~regout\,
	combout => \display|wr_logic|Selector18~5_combout\);

-- Location: LCCOMB_X39_Y20_N22
\display|wr_logic|Selector18~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|wr_logic|Selector18~3_combout\ = (\display|wr_logic|state.WR_CONTROL~regout\ & (\display|wr_logic|Selector18~5_combout\ & (!\display|wr_logic|state.WR_DONE~regout\ & \display|wr_logic|process_1~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|wr_logic|state.WR_CONTROL~regout\,
	datab => \display|wr_logic|Selector18~5_combout\,
	datac => \display|wr_logic|state.WR_DONE~regout\,
	datad => \display|wr_logic|process_1~6_combout\,
	combout => \display|wr_logic|Selector18~3_combout\);

-- Location: LCFF_X39_Y20_N23
\display|wr_logic|state.WR_DONE\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|wr_logic|Selector18~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|wr_logic|state.WR_DONE~regout\);

-- Location: LCCOMB_X39_Y20_N20
\display|wr_logic|Selector8~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|wr_logic|Selector8~0_combout\ = (!\display|wr_logic|state.WR_DONE~regout\ & ((\display|wr_logic|state.IDLE~regout\) # (\display|logic|start_write~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \display|wr_logic|state.WR_DONE~regout\,
	datac => \display|wr_logic|state.IDLE~regout\,
	datad => \display|logic|start_write~regout\,
	combout => \display|wr_logic|Selector8~0_combout\);

-- Location: LCFF_X39_Y20_N21
\display|wr_logic|state.IDLE\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|wr_logic|Selector8~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|wr_logic|state.IDLE~regout\);

-- Location: LCCOMB_X39_Y20_N14
\display|wr_logic|Selector9~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|wr_logic|Selector9~0_combout\ = (!\display|wr_logic|state.IDLE~regout\ & \display|logic|start_write~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \display|wr_logic|state.IDLE~regout\,
	datad => \display|logic|start_write~regout\,
	combout => \display|wr_logic|Selector9~0_combout\);

-- Location: LCCOMB_X39_Y20_N12
\display|wr_logic|Selector9~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|wr_logic|Selector9~1_combout\ = (\display|wr_logic|Selector9~0_combout\) # ((\display|i2c_master_inst|busy_r~regout\ & ((\display|wr_logic|state.WR_DATA_BUSY~regout\) # (\display|wr_logic|state.RD_STATUS_WR~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|wr_logic|state.WR_DATA_BUSY~regout\,
	datab => \display|i2c_master_inst|busy_r~regout\,
	datac => \display|wr_logic|Selector9~0_combout\,
	datad => \display|wr_logic|state.RD_STATUS_WR~regout\,
	combout => \display|wr_logic|Selector9~1_combout\);

-- Location: LCCOMB_X39_Y20_N26
\display|wr_logic|Selector9~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|wr_logic|Selector9~2_combout\ = (\display|wr_logic|Selector9~1_combout\) # ((!\display|i2c_master_inst|busy_r~regout\ & (\display|wr_logic|state.RD_STATUS_RESULT~regout\ & \display|i2c_master_inst|data_rx\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|i2c_master_inst|busy_r~regout\,
	datab => \display|wr_logic|state.RD_STATUS_RESULT~regout\,
	datac => \display|i2c_master_inst|data_rx\(7),
	datad => \display|wr_logic|Selector9~1_combout\,
	combout => \display|wr_logic|Selector9~2_combout\);

-- Location: LCFF_X39_Y20_N27
\display|wr_logic|state.RD_STATUS_WR\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|wr_logic|Selector9~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|wr_logic|state.RD_STATUS_WR~regout\);

-- Location: LCCOMB_X39_Y20_N4
\display|wr_logic|Selector10~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|wr_logic|Selector10~0_combout\ = (\display|wr_logic|state.RD_STATUS_WR_BUSY~regout\) # (\display|wr_logic|state.RD_STATUS_WR~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \display|wr_logic|state.RD_STATUS_WR_BUSY~regout\,
	datad => \display|wr_logic|state.RD_STATUS_WR~regout\,
	combout => \display|wr_logic|Selector10~0_combout\);

-- Location: LCFF_X39_Y20_N5
\display|wr_logic|state.RD_STATUS_WR_BUSY\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|wr_logic|Selector10~0_combout\,
	sclr => \display|i2c_master_inst|busy_r~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|wr_logic|state.RD_STATUS_WR_BUSY~regout\);

-- Location: LCCOMB_X39_Y20_N0
\display|wr_logic|Selector20~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|wr_logic|Selector20~0_combout\ = (\display|wr_logic|state.WR_CONTROL~regout\ & ((!\display|wr_logic|process_1~6_combout\))) # (!\display|wr_logic|state.WR_CONTROL~regout\ & (\display|wr_logic|state.RD_STATUS_WR~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|wr_logic|state.WR_CONTROL~regout\,
	datab => \display|wr_logic|state.RD_STATUS_WR~regout\,
	datad => \display|wr_logic|process_1~6_combout\,
	combout => \display|wr_logic|Selector20~0_combout\);

-- Location: LCCOMB_X39_Y20_N24
\display|wr_logic|Selector20~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|wr_logic|Selector20~1_combout\ = (\display|i2c_master_inst|busy_r~regout\ & ((\display|wr_logic|state.RD_STATUS_WR_BUSY~regout\) # ((\display|wr_logic|i2c_rwb~regout\)))) # (!\display|i2c_master_inst|busy_r~regout\ & 
-- (\display|wr_logic|i2c_rwb~regout\ & ((\display|wr_logic|state.RD_STATUS_WR_BUSY~regout\) # (!\display|wr_logic|Selector20~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|i2c_master_inst|busy_r~regout\,
	datab => \display|wr_logic|state.RD_STATUS_WR_BUSY~regout\,
	datac => \display|wr_logic|i2c_rwb~regout\,
	datad => \display|wr_logic|Selector20~0_combout\,
	combout => \display|wr_logic|Selector20~1_combout\);

-- Location: LCFF_X39_Y20_N25
\display|wr_logic|i2c_rwb\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|wr_logic|Selector20~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|wr_logic|i2c_rwb~regout\);

-- Location: LCFF_X35_Y24_N21
\display|i2c_master_inst|data_clk_prev\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|i2c_master_inst|scl_ena~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|i2c_master_inst|data_clk_prev~regout\);

-- Location: LCCOMB_X35_Y24_N22
\display|i2c_master_inst|addr_rw[0]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|i2c_master_inst|addr_rw[0]~1_combout\ = (!\display|i2c_master_inst|addr_rw[0]~0_combout\ & (!\display|i2c_master_inst|data_clk_prev~regout\ & \display|i2c_master_inst|scl_ena~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|i2c_master_inst|addr_rw[0]~0_combout\,
	datac => \display|i2c_master_inst|data_clk_prev~regout\,
	datad => \display|i2c_master_inst|scl_ena~0_combout\,
	combout => \display|i2c_master_inst|addr_rw[0]~1_combout\);

-- Location: LCFF_X35_Y23_N11
\display|i2c_master_inst|addr_rw[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \display|wr_logic|i2c_rwb~regout\,
	sload => VCC,
	ena => \display|i2c_master_inst|addr_rw[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|i2c_master_inst|addr_rw\(0));

-- Location: LCCOMB_X35_Y23_N10
\display|i2c_master_inst|process_3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|i2c_master_inst|process_3~0_combout\ = (\display|wr_logic|i2c_rwb~regout\ $ (\display|i2c_master_inst|addr_rw\(0))) # (!\display|wr_logic|i2c_en~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|wr_logic|i2c_rwb~regout\,
	datac => \display|i2c_master_inst|addr_rw\(0),
	datad => \display|wr_logic|i2c_en~regout\,
	combout => \display|i2c_master_inst|process_3~0_combout\);

-- Location: LCCOMB_X36_Y24_N30
\display|i2c_master_inst|Selector20~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|i2c_master_inst|Selector20~0_combout\ = (\display|i2c_master_inst|state.command~regout\ & (\display|i2c_master_inst|bit_cnt\(2) & (\display|i2c_master_inst|bit_cnt\(1) & \display|i2c_master_inst|bit_cnt\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|i2c_master_inst|state.command~regout\,
	datab => \display|i2c_master_inst|bit_cnt\(2),
	datac => \display|i2c_master_inst|bit_cnt\(1),
	datad => \display|i2c_master_inst|bit_cnt\(0),
	combout => \display|i2c_master_inst|Selector20~0_combout\);

-- Location: LCFF_X36_Y24_N31
\display|i2c_master_inst|state.slv_ack1\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|i2c_master_inst|Selector20~0_combout\,
	ena => \display|i2c_master_inst|data_clk_re~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|i2c_master_inst|state.slv_ack1~regout\);

-- Location: LCCOMB_X35_Y23_N2
\display|i2c_master_inst|Selector21~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|i2c_master_inst|Selector21~0_combout\ = (\display|i2c_master_inst|addr_rw\(0) & (!\display|i2c_master_inst|process_3~0_combout\ & ((\display|i2c_master_inst|state.slv_ack2~regout\)))) # (!\display|i2c_master_inst|addr_rw\(0) & 
-- ((\display|i2c_master_inst|state.slv_ack1~regout\) # ((!\display|i2c_master_inst|process_3~0_combout\ & \display|i2c_master_inst|state.slv_ack2~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111001101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|i2c_master_inst|addr_rw\(0),
	datab => \display|i2c_master_inst|process_3~0_combout\,
	datac => \display|i2c_master_inst|state.slv_ack1~regout\,
	datad => \display|i2c_master_inst|state.slv_ack2~regout\,
	combout => \display|i2c_master_inst|Selector21~0_combout\);

-- Location: LCCOMB_X35_Y23_N20
\display|i2c_master_inst|Selector21~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|i2c_master_inst|Selector21~1_combout\ = (\display|i2c_master_inst|Selector21~0_combout\) # ((!\display|i2c_master_inst|Equal0~0_combout\ & \display|i2c_master_inst|state.wr~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|i2c_master_inst|Equal0~0_combout\,
	datab => \display|i2c_master_inst|Selector21~0_combout\,
	datac => \display|i2c_master_inst|state.wr~regout\,
	combout => \display|i2c_master_inst|Selector21~1_combout\);

-- Location: LCFF_X35_Y23_N21
\display|i2c_master_inst|state.wr\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|i2c_master_inst|Selector21~1_combout\,
	ena => \display|i2c_master_inst|data_clk_re~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|i2c_master_inst|state.wr~regout\);

-- Location: LCCOMB_X36_Y24_N8
\display|i2c_master_inst|Selector23~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|i2c_master_inst|Selector23~0_combout\ = (\display|i2c_master_inst|bit_cnt\(0) & (\display|i2c_master_inst|state.wr~regout\ & (\display|i2c_master_inst|bit_cnt\(1) & \display|i2c_master_inst|bit_cnt\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|i2c_master_inst|bit_cnt\(0),
	datab => \display|i2c_master_inst|state.wr~regout\,
	datac => \display|i2c_master_inst|bit_cnt\(1),
	datad => \display|i2c_master_inst|bit_cnt\(2),
	combout => \display|i2c_master_inst|Selector23~0_combout\);

-- Location: LCFF_X36_Y24_N9
\display|i2c_master_inst|state.slv_ack2\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|i2c_master_inst|Selector23~0_combout\,
	ena => \display|i2c_master_inst|data_clk_re~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|i2c_master_inst|state.slv_ack2~regout\);

-- Location: LCCOMB_X35_Y24_N16
\display|i2c_master_inst|Selector25~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|i2c_master_inst|Selector25~0_combout\ = (!\display|wr_logic|i2c_en~regout\ & ((\display|i2c_master_inst|state.mstr_ack~regout\) # (\display|i2c_master_inst|state.slv_ack2~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111000001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|i2c_master_inst|state.mstr_ack~regout\,
	datab => \display|i2c_master_inst|state.slv_ack2~regout\,
	datac => \display|wr_logic|i2c_en~regout\,
	combout => \display|i2c_master_inst|Selector25~0_combout\);

-- Location: LCFF_X35_Y24_N17
\display|i2c_master_inst|state.stop\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|i2c_master_inst|Selector25~0_combout\,
	ena => \display|i2c_master_inst|data_clk_re~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|i2c_master_inst|state.stop~regout\);

-- Location: LCCOMB_X35_Y24_N6
\display|i2c_master_inst|Selector17~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|i2c_master_inst|Selector17~0_combout\ = (!\display|i2c_master_inst|state.stop~regout\ & ((\display|wr_logic|i2c_en~regout\) # (\display|i2c_master_inst|state.ready~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|wr_logic|i2c_en~regout\,
	datac => \display|i2c_master_inst|state.ready~regout\,
	datad => \display|i2c_master_inst|state.stop~regout\,
	combout => \display|i2c_master_inst|Selector17~0_combout\);

-- Location: LCFF_X35_Y24_N7
\display|i2c_master_inst|state.ready\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|i2c_master_inst|Selector17~0_combout\,
	ena => \display|i2c_master_inst|data_clk_re~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|i2c_master_inst|state.ready~regout\);

-- Location: LCCOMB_X36_Y24_N16
\display|i2c_master_inst|Selector0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|i2c_master_inst|Selector0~1_combout\ = (\display|i2c_master_inst|state.rd~regout\) # ((\display|i2c_master_inst|state.wr~regout\) # ((!\display|i2c_master_inst|state.ready~regout\ & \display|wr_logic|i2c_en~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|i2c_master_inst|state.rd~regout\,
	datab => \display|i2c_master_inst|state.ready~regout\,
	datac => \display|wr_logic|i2c_en~regout\,
	datad => \display|i2c_master_inst|state.wr~regout\,
	combout => \display|i2c_master_inst|Selector0~1_combout\);

-- Location: LCCOMB_X36_Y24_N22
\display|i2c_master_inst|Selector0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|i2c_master_inst|Selector0~0_combout\ = (\display|i2c_master_inst|busy_r~regout\ & ((\display|i2c_master_inst|state.command~regout\) # ((\display|i2c_master_inst|state.slv_ack1~regout\) # (\display|i2c_master_inst|Selector25~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|i2c_master_inst|state.command~regout\,
	datab => \display|i2c_master_inst|state.slv_ack1~regout\,
	datac => \display|i2c_master_inst|Selector25~0_combout\,
	datad => \display|i2c_master_inst|busy_r~regout\,
	combout => \display|i2c_master_inst|Selector0~0_combout\);

-- Location: LCCOMB_X36_Y24_N26
\display|i2c_master_inst|Selector0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|i2c_master_inst|Selector0~2_combout\ = (\display|i2c_master_inst|state.start~regout\) # ((\display|i2c_master_inst|Selector0~1_combout\) # (\display|i2c_master_inst|Selector0~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|i2c_master_inst|state.start~regout\,
	datac => \display|i2c_master_inst|Selector0~1_combout\,
	datad => \display|i2c_master_inst|Selector0~0_combout\,
	combout => \display|i2c_master_inst|Selector0~2_combout\);

-- Location: LCFF_X36_Y24_N27
\display|i2c_master_inst|busy_r\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|i2c_master_inst|Selector0~2_combout\,
	ena => \display|i2c_master_inst|data_clk_re~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|i2c_master_inst|busy_r~regout\);

-- Location: LCCOMB_X39_Y19_N8
\display|wr_logic|Selector19~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|wr_logic|Selector19~1_combout\ = (\display|wr_logic|i2c_en~regout\ & ((\display|wr_logic|Selector19~0_combout\) # (!\display|i2c_master_inst|busy_r~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|wr_logic|Selector19~0_combout\,
	datab => \display|i2c_master_inst|busy_r~regout\,
	datad => \display|wr_logic|i2c_en~regout\,
	combout => \display|wr_logic|Selector19~1_combout\);

-- Location: LCCOMB_X39_Y20_N30
\display|wr_logic|Selector18~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|wr_logic|Selector18~4_combout\ = (!\display|i2c_master_inst|busy_r~regout\ & \display|wr_logic|state.RD_STATUS_WR~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \display|i2c_master_inst|busy_r~regout\,
	datad => \display|wr_logic|state.RD_STATUS_WR~regout\,
	combout => \display|wr_logic|Selector18~4_combout\);

-- Location: LCCOMB_X39_Y20_N10
\display|wr_logic|Selector14~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|wr_logic|Selector14~0_combout\ = (\display|i2c_master_inst|busy_r~regout\ & (((\display|wr_logic|state.WR_CONTROL~regout\)))) # (!\display|i2c_master_inst|busy_r~regout\ & (!\display|i2c_master_inst|data_rx\(7) & 
-- ((\display|wr_logic|state.RD_STATUS_RESULT~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|i2c_master_inst|busy_r~regout\,
	datab => \display|i2c_master_inst|data_rx\(7),
	datac => \display|wr_logic|state.WR_CONTROL~regout\,
	datad => \display|wr_logic|state.RD_STATUS_RESULT~regout\,
	combout => \display|wr_logic|Selector14~0_combout\);

-- Location: LCFF_X39_Y20_N11
\display|wr_logic|state.WR_CONTROL\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|wr_logic|Selector14~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|wr_logic|state.WR_CONTROL~regout\);

-- Location: LCCOMB_X39_Y19_N2
\display|wr_logic|state_next~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|wr_logic|state_next~11_combout\ = (!\display|i2c_master_inst|busy_r~regout\ & \display|wr_logic|state.WR_CONTROL~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \display|i2c_master_inst|busy_r~regout\,
	datac => \display|wr_logic|state.WR_CONTROL~regout\,
	combout => \display|wr_logic|state_next~11_combout\);

-- Location: LCCOMB_X39_Y19_N0
\display|wr_logic|Selector19~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|wr_logic|Selector19~2_combout\ = (\display|wr_logic|Selector19~1_combout\) # ((\display|wr_logic|Selector18~4_combout\) # ((!\display|wr_logic|process_1~6_combout\ & \display|wr_logic|state_next~11_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|wr_logic|process_1~6_combout\,
	datab => \display|wr_logic|Selector19~1_combout\,
	datac => \display|wr_logic|Selector18~4_combout\,
	datad => \display|wr_logic|state_next~11_combout\,
	combout => \display|wr_logic|Selector19~2_combout\);

-- Location: LCFF_X39_Y19_N1
\display|wr_logic|i2c_en\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|wr_logic|Selector19~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|wr_logic|i2c_en~regout\);

-- Location: LCCOMB_X35_Y24_N14
\display|i2c_master_inst|Selector18~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|i2c_master_inst|Selector18~1_combout\ = (\display|wr_logic|i2c_en~regout\ & ((\display|i2c_master_inst|Selector18~0_combout\) # (!\display|i2c_master_inst|state.ready~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|i2c_master_inst|Selector18~0_combout\,
	datac => \display|wr_logic|i2c_en~regout\,
	datad => \display|i2c_master_inst|state.ready~regout\,
	combout => \display|i2c_master_inst|Selector18~1_combout\);

-- Location: LCFF_X35_Y24_N15
\display|i2c_master_inst|state.start\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|i2c_master_inst|Selector18~1_combout\,
	ena => \display|i2c_master_inst|data_clk_re~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|i2c_master_inst|state.start~regout\);

-- Location: LCCOMB_X35_Y24_N12
\display|i2c_master_inst|data_rx[7]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|i2c_master_inst|data_rx[7]~0_combout\ = (\display|i2c_master_inst|data_clk_prev~regout\ & !\display|i2c_master_inst|scl_ena~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|i2c_master_inst|data_clk_prev~regout\,
	datad => \display|i2c_master_inst|scl_ena~0_combout\,
	combout => \display|i2c_master_inst|data_rx[7]~0_combout\);

-- Location: LCCOMB_X35_Y24_N8
\display|i2c_master_inst|scl_ena~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|i2c_master_inst|scl_ena~1_combout\ = (\display|i2c_master_inst|data_rx[7]~0_combout\ & ((\display|i2c_master_inst|state.start~regout\) # ((!\display|i2c_master_inst|state.stop~regout\ & \display|i2c_master_inst|scl_ena~regout\)))) # 
-- (!\display|i2c_master_inst|data_rx[7]~0_combout\ & (((\display|i2c_master_inst|scl_ena~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|i2c_master_inst|state.stop~regout\,
	datab => \display|i2c_master_inst|state.start~regout\,
	datac => \display|i2c_master_inst|scl_ena~regout\,
	datad => \display|i2c_master_inst|data_rx[7]~0_combout\,
	combout => \display|i2c_master_inst|scl_ena~1_combout\);

-- Location: LCFF_X35_Y24_N9
\display|i2c_master_inst|scl_ena\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|i2c_master_inst|scl_ena~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|i2c_master_inst|scl_ena~regout\);

-- Location: LCCOMB_X35_Y24_N18
\display|i2c_master_inst|scl~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|i2c_master_inst|scl~1_combout\ = (\display|i2c_master_inst|count_reg\(6)) # (((\display|i2c_master_inst|process_1~0_combout\ & \display|i2c_master_inst|LessThan1~1_combout\)) # (!\display|i2c_master_inst|scl_ena~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111111001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|i2c_master_inst|process_1~0_combout\,
	datab => \display|i2c_master_inst|count_reg\(6),
	datac => \display|i2c_master_inst|scl_ena~regout\,
	datad => \display|i2c_master_inst|LessThan1~1_combout\,
	combout => \display|i2c_master_inst|scl~1_combout\);

-- Location: LCCOMB_X36_Y24_N24
\display|i2c_master_inst|Selector26~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|i2c_master_inst|Selector26~1_combout\ = (\display|i2c_master_inst|bit_cnt\(2) & (((\display|i2c_master_inst|addr_rw\(0) & \display|i2c_master_inst|bit_cnt\(1))) # (!\display|i2c_master_inst|bit_cnt\(0)))) # (!\display|i2c_master_inst|bit_cnt\(2) 
-- & (((\display|i2c_master_inst|bit_cnt\(1)) # (\display|i2c_master_inst|bit_cnt\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|i2c_master_inst|addr_rw\(0),
	datab => \display|i2c_master_inst|bit_cnt\(2),
	datac => \display|i2c_master_inst|bit_cnt\(1),
	datad => \display|i2c_master_inst|bit_cnt\(0),
	combout => \display|i2c_master_inst|Selector26~1_combout\);

-- Location: LCCOMB_X36_Y24_N6
\display|i2c_master_inst|Selector26~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|i2c_master_inst|Selector26~0_combout\ = ((\display|i2c_master_inst|bit_cnt\(0)) # ((\display|i2c_master_inst|addr_rw\(0) & \display|i2c_master_inst|bit_cnt\(1)))) # (!\display|i2c_master_inst|bit_cnt\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|i2c_master_inst|addr_rw\(0),
	datab => \display|i2c_master_inst|bit_cnt\(2),
	datac => \display|i2c_master_inst|bit_cnt\(1),
	datad => \display|i2c_master_inst|bit_cnt\(0),
	combout => \display|i2c_master_inst|Selector26~0_combout\);

-- Location: LCCOMB_X36_Y24_N10
\display|i2c_master_inst|Selector26~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|i2c_master_inst|Selector26~2_combout\ = (\display|i2c_master_inst|state.command~regout\ & ((\display|i2c_master_inst|Selector26~0_combout\) # ((\display|i2c_master_inst|state.start~regout\ & \display|i2c_master_inst|Selector26~1_combout\)))) # 
-- (!\display|i2c_master_inst|state.command~regout\ & (\display|i2c_master_inst|state.start~regout\ & (\display|i2c_master_inst|Selector26~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|i2c_master_inst|state.command~regout\,
	datab => \display|i2c_master_inst|state.start~regout\,
	datac => \display|i2c_master_inst|Selector26~1_combout\,
	datad => \display|i2c_master_inst|Selector26~0_combout\,
	combout => \display|i2c_master_inst|Selector26~2_combout\);

-- Location: LCCOMB_X36_Y24_N28
\display|i2c_master_inst|Selector22~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|i2c_master_inst|Selector22~0_combout\ = (\display|i2c_master_inst|state.rd~regout\ & (((!\display|i2c_master_inst|bit_cnt\(0)) # (!\display|i2c_master_inst|bit_cnt\(1))) # (!\display|i2c_master_inst|bit_cnt\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|i2c_master_inst|state.rd~regout\,
	datab => \display|i2c_master_inst|bit_cnt\(2),
	datac => \display|i2c_master_inst|bit_cnt\(1),
	datad => \display|i2c_master_inst|bit_cnt\(0),
	combout => \display|i2c_master_inst|Selector22~0_combout\);

-- Location: LCCOMB_X35_Y23_N18
\display|i2c_master_inst|Selector26~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|i2c_master_inst|Selector26~5_combout\ = (\display|i2c_master_inst|Selector26~2_combout\) # ((!\display|i2c_master_inst|sda_int~regout\ & ((\display|i2c_master_inst|Selector26~4_combout\) # (\display|i2c_master_inst|Selector22~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|i2c_master_inst|Selector26~4_combout\,
	datab => \display|i2c_master_inst|Selector26~2_combout\,
	datac => \display|i2c_master_inst|sda_int~regout\,
	datad => \display|i2c_master_inst|Selector22~0_combout\,
	combout => \display|i2c_master_inst|Selector26~5_combout\);

-- Location: LCCOMB_X36_Y19_N24
\display|mem|char_reg|Mux6~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|mem|char_reg|Mux6~2_combout\ = (\display|mem|char_reg|Mux6~1_combout\) # ((\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a9\ & ((\sw~combout\(6)) # (!\display|mem|char_reg|tr_char~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|mem|char_reg|Mux6~1_combout\,
	datab => \display|mem|char_reg|tr_char~0_combout\,
	datac => \sw~combout\(6),
	datad => \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a9\,
	combout => \display|mem|char_reg|Mux6~2_combout\);

-- Location: LCCOMB_X36_Y19_N8
\display|mem|char_reg|Mux6~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|mem|char_reg|Mux6~3_combout\ = (\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a8\ & (((\display|mem|char_reg|Mux6~2_combout\)))) # (!\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a8\ & 
-- (\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a6\ & ((!\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a9\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a6\,
	datab => \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a8\,
	datac => \display|mem|char_reg|Mux6~2_combout\,
	datad => \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a9\,
	combout => \display|mem|char_reg|Mux6~3_combout\);

-- Location: LCFF_X36_Y19_N9
\display|mem|char_reg|data[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|mem|char_reg|Mux6~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|mem|char_reg|data\(6));

-- Location: LCCOMB_X39_Y19_N4
\display|mem|mem_mux|data[6]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|mem|mem_mux|data[6]~1_combout\ = (\display|wr_logic|current_addr\(7) & (\display|wr_logic|current_addr\(6) & (\display|mem|char_reg|data\(6)))) # (!\display|wr_logic|current_addr\(7) & 
-- (((\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a6\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|wr_logic|current_addr\(6),
	datab => \display|wr_logic|current_addr\(7),
	datac => \display|mem|char_reg|data\(6),
	datad => \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a6\,
	combout => \display|mem|mem_mux|data[6]~1_combout\);

-- Location: LCCOMB_X40_Y19_N26
\display|mem|char_reg|Mux2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|mem|char_reg|Mux2~0_combout\ = (\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a8\) # ((\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a10\) # (\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a8\,
	datac => \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a10\,
	datad => \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a9\,
	combout => \display|mem|char_reg|Mux2~0_combout\);

-- Location: LCFF_X40_Y19_N27
\display|mem|char_reg|data[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|mem|char_reg|Mux2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|mem|char_reg|data\(10));

-- Location: LCCOMB_X40_Y19_N12
\display|mem|mem_mux|data[10]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|mem|mem_mux|data[10]~0_combout\ = (\display|wr_logic|current_addr\(7) & ((\display|wr_logic|current_addr\(6) & (\display|mem|char_reg|data\(10))) # (!\display|wr_logic|current_addr\(6) & 
-- ((\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a13\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|wr_logic|current_addr\(6),
	datab => \display|mem|char_reg|data\(10),
	datac => \display|wr_logic|current_addr\(7),
	datad => \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a13\,
	combout => \display|mem|mem_mux|data[10]~0_combout\);

-- Location: LCCOMB_X40_Y19_N28
\display|mem|mem_mux|data[10]~13\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|mem|mem_mux|data[10]~13_combout\ = (\display|mem|mem_mux|data[10]~0_combout\) # ((!\display|wr_logic|current_addr\(7) & \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a10\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \display|wr_logic|current_addr\(7),
	datac => \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a10\,
	datad => \display|mem|mem_mux|data[10]~0_combout\,
	combout => \display|mem|mem_mux|data[10]~13_combout\);

-- Location: LCCOMB_X39_Y19_N10
\display|wr_logic|Selector22~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|wr_logic|Selector22~0_combout\ = (\display|wr_logic|state.WR_CONTROL_BUSY~regout\ & (((\display|mem|mem_mux|data[6]~1_combout\)))) # (!\display|wr_logic|state.WR_CONTROL_BUSY~regout\ & (\display|wr_logic|state.WR_CONTROL~regout\ & 
-- ((\display|mem|mem_mux|data[10]~13_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|wr_logic|state.WR_CONTROL~regout\,
	datab => \display|wr_logic|state.WR_CONTROL_BUSY~regout\,
	datac => \display|mem|mem_mux|data[6]~1_combout\,
	datad => \display|mem|mem_mux|data[10]~13_combout\,
	combout => \display|wr_logic|Selector22~0_combout\);

-- Location: LCCOMB_X39_Y19_N14
\display|wr_logic|i2c_data_wrb[1]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|wr_logic|i2c_data_wrb[1]~0_combout\ = (\display|wr_logic|Selector16~0_combout\) # ((\display|wr_logic|Selector18~4_combout\) # ((\display|wr_logic|state_next~11_combout\ & !\display|wr_logic|process_1~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|wr_logic|Selector16~0_combout\,
	datab => \display|wr_logic|state_next~11_combout\,
	datac => \display|wr_logic|Selector18~4_combout\,
	datad => \display|wr_logic|process_1~6_combout\,
	combout => \display|wr_logic|i2c_data_wrb[1]~0_combout\);

-- Location: LCFF_X39_Y19_N11
\display|wr_logic|i2c_data_wrb[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|wr_logic|Selector22~0_combout\,
	ena => \display|wr_logic|i2c_data_wrb[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|wr_logic|i2c_data_wrb\(6));

-- Location: LCCOMB_X39_Y19_N12
\display|wr_logic|Selector21~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|wr_logic|Selector21~0_combout\ = (\display|wr_logic|state.WR_CONTROL_BUSY~regout\ & ((\display|mem|mem_mux|data[7]~2_combout\) # ((!\display|wr_logic|current_addr\(7) & \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a7\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000110010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|mem|mem_mux|data[7]~2_combout\,
	datab => \display|wr_logic|state.WR_CONTROL_BUSY~regout\,
	datac => \display|wr_logic|current_addr\(7),
	datad => \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a7\,
	combout => \display|wr_logic|Selector21~0_combout\);

-- Location: LCFF_X39_Y19_N13
\display|wr_logic|i2c_data_wrb[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|wr_logic|Selector21~0_combout\,
	ena => \display|wr_logic|i2c_data_wrb[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|wr_logic|i2c_data_wrb\(7));

-- Location: LCCOMB_X40_Y19_N14
\display|mem|mem_mux|data[4]~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|mem|mem_mux|data[4]~6_combout\ = (\display|mem|mem_mux|data[4]~5_combout\) # ((!\display|wr_logic|current_addr\(7) & \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a4\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|mem|mem_mux|data[4]~5_combout\,
	datac => \display|wr_logic|current_addr\(7),
	datad => \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a4\,
	combout => \display|mem|mem_mux|data[4]~6_combout\);

-- Location: LCCOMB_X40_Y19_N6
\display|wr_logic|Selector24~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|wr_logic|Selector24~0_combout\ = (!\display|wr_logic|state.WR_CONTROL_BUSY~regout\ & (!\display|wr_logic|current_addr\(7) & \display|wr_logic|state.WR_CONTROL~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|wr_logic|state.WR_CONTROL_BUSY~regout\,
	datab => \display|wr_logic|current_addr\(7),
	datac => \display|wr_logic|state.WR_CONTROL~regout\,
	combout => \display|wr_logic|Selector24~0_combout\);

-- Location: LCCOMB_X40_Y19_N22
\display|wr_logic|Selector24~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|wr_logic|Selector24~1_combout\ = (\display|wr_logic|state.WR_CONTROL_BUSY~regout\ & ((\display|mem|mem_mux|data[4]~6_combout\) # ((\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a8\ & \display|wr_logic|Selector24~0_combout\)))) # 
-- (!\display|wr_logic|state.WR_CONTROL_BUSY~regout\ & (((\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a8\ & \display|wr_logic|Selector24~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|wr_logic|state.WR_CONTROL_BUSY~regout\,
	datab => \display|mem|mem_mux|data[4]~6_combout\,
	datac => \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a8\,
	datad => \display|wr_logic|Selector24~0_combout\,
	combout => \display|wr_logic|Selector24~1_combout\);

-- Location: LCFF_X40_Y19_N23
\display|wr_logic|i2c_data_wrb[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|wr_logic|Selector24~1_combout\,
	ena => \display|wr_logic|i2c_data_wrb[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|wr_logic|i2c_data_wrb\(4));

-- Location: LCCOMB_X40_Y19_N4
\display|wr_logic|Selector23~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|wr_logic|Selector23~0_combout\ = (\display|mem|mem_mux|data[5]~4_combout\ & ((\display|wr_logic|state.WR_CONTROL_BUSY~regout\) # ((\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a9\ & \display|wr_logic|Selector24~0_combout\)))) # 
-- (!\display|mem|mem_mux|data[5]~4_combout\ & (\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a9\ & ((\display|wr_logic|Selector24~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|mem|mem_mux|data[5]~4_combout\,
	datab => \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a9\,
	datac => \display|wr_logic|state.WR_CONTROL_BUSY~regout\,
	datad => \display|wr_logic|Selector24~0_combout\,
	combout => \display|wr_logic|Selector23~0_combout\);

-- Location: LCFF_X40_Y19_N5
\display|wr_logic|i2c_data_wrb[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|wr_logic|Selector23~0_combout\,
	ena => \display|wr_logic|i2c_data_wrb[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|wr_logic|i2c_data_wrb\(5));

-- Location: LCCOMB_X36_Y23_N22
\display|i2c_master_inst|Mux4~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|i2c_master_inst|Mux4~0_combout\ = (\display|i2c_master_inst|bit_cnt\(1) & ((\display|i2c_master_inst|bit_cnt\(0) & (\display|wr_logic|i2c_data_wrb\(4))) # (!\display|i2c_master_inst|bit_cnt\(0) & ((\display|wr_logic|i2c_data_wrb\(5)))))) # 
-- (!\display|i2c_master_inst|bit_cnt\(1) & (!\display|i2c_master_inst|bit_cnt\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001110010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|i2c_master_inst|bit_cnt\(1),
	datab => \display|i2c_master_inst|bit_cnt\(0),
	datac => \display|wr_logic|i2c_data_wrb\(4),
	datad => \display|wr_logic|i2c_data_wrb\(5),
	combout => \display|i2c_master_inst|Mux4~0_combout\);

-- Location: LCCOMB_X36_Y23_N16
\display|i2c_master_inst|Mux4~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|i2c_master_inst|Mux4~1_combout\ = (\display|i2c_master_inst|bit_cnt\(1) & (((\display|i2c_master_inst|Mux4~0_combout\)))) # (!\display|i2c_master_inst|bit_cnt\(1) & ((\display|i2c_master_inst|Mux4~0_combout\ & 
-- ((\display|wr_logic|i2c_data_wrb\(7)))) # (!\display|i2c_master_inst|Mux4~0_combout\ & (\display|wr_logic|i2c_data_wrb\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|i2c_master_inst|bit_cnt\(1),
	datab => \display|wr_logic|i2c_data_wrb\(6),
	datac => \display|wr_logic|i2c_data_wrb\(7),
	datad => \display|i2c_master_inst|Mux4~0_combout\,
	combout => \display|i2c_master_inst|Mux4~1_combout\);

-- Location: LCCOMB_X35_Y23_N22
\display|i2c_master_inst|Selector26~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|i2c_master_inst|Selector26~6_combout\ = (!\display|i2c_master_inst|bit_cnt\(2) & (!\display|i2c_master_inst|process_3~0_combout\ & (\display|i2c_master_inst|Mux4~1_combout\ & \display|i2c_master_inst|state.slv_ack2~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|i2c_master_inst|bit_cnt\(2),
	datab => \display|i2c_master_inst|process_3~0_combout\,
	datac => \display|i2c_master_inst|Mux4~1_combout\,
	datad => \display|i2c_master_inst|state.slv_ack2~regout\,
	combout => \display|i2c_master_inst|Selector26~6_combout\);

-- Location: LCCOMB_X36_Y24_N2
\display|i2c_master_inst|Selector24~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|i2c_master_inst|Selector24~0_combout\ = (\display|i2c_master_inst|state.rd~regout\ & (\display|i2c_master_inst|bit_cnt\(2) & (\display|i2c_master_inst|bit_cnt\(1) & \display|i2c_master_inst|bit_cnt\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|i2c_master_inst|state.rd~regout\,
	datab => \display|i2c_master_inst|bit_cnt\(2),
	datac => \display|i2c_master_inst|bit_cnt\(1),
	datad => \display|i2c_master_inst|bit_cnt\(0),
	combout => \display|i2c_master_inst|Selector24~0_combout\);

-- Location: LCFF_X36_Y24_N3
\display|i2c_master_inst|state.mstr_ack\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|i2c_master_inst|Selector24~0_combout\,
	ena => \display|i2c_master_inst|data_clk_re~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|i2c_master_inst|state.mstr_ack~regout\);

-- Location: LCCOMB_X35_Y23_N8
\display|i2c_master_inst|Selector22~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|i2c_master_inst|Selector22~1_combout\ = (\display|i2c_master_inst|state.slv_ack1~regout\ & (!\display|i2c_master_inst|addr_rw\(0) & ((\display|i2c_master_inst|process_3~0_combout\) # (!\display|i2c_master_inst|state.mstr_ack~regout\)))) # 
-- (!\display|i2c_master_inst|state.slv_ack1~regout\ & ((\display|i2c_master_inst|process_3~0_combout\) # ((!\display|i2c_master_inst|state.mstr_ack~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010111001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|i2c_master_inst|state.slv_ack1~regout\,
	datab => \display|i2c_master_inst|process_3~0_combout\,
	datac => \display|i2c_master_inst|state.mstr_ack~regout\,
	datad => \display|i2c_master_inst|addr_rw\(0),
	combout => \display|i2c_master_inst|Selector22~1_combout\);

-- Location: LCCOMB_X39_Y19_N22
\display|wr_logic|Selector27~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|wr_logic|Selector27~0_combout\ = (\display|wr_logic|state.WR_CONTROL_BUSY~regout\ & ((\display|mem|mem_mux|data[1]~9_combout\) # ((\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a1\ & !\display|wr_logic|current_addr\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a1\,
	datab => \display|wr_logic|state.WR_CONTROL_BUSY~regout\,
	datac => \display|wr_logic|current_addr\(7),
	datad => \display|mem|mem_mux|data[1]~9_combout\,
	combout => \display|wr_logic|Selector27~0_combout\);

-- Location: LCFF_X39_Y19_N23
\display|wr_logic|i2c_data_wrb[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|wr_logic|Selector27~0_combout\,
	ena => \display|wr_logic|i2c_data_wrb[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|wr_logic|i2c_data_wrb\(1));

-- Location: LCFF_X36_Y23_N7
\display|i2c_master_inst|data_tx[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \display|wr_logic|i2c_data_wrb\(1),
	sload => VCC,
	ena => \display|i2c_master_inst|addr_rw[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|i2c_master_inst|data_tx\(1));

-- Location: LCCOMB_X38_Y19_N8
\display|wr_logic|Selector26~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|wr_logic|Selector26~0_combout\ = (\display|wr_logic|state.WR_CONTROL_BUSY~regout\ & ((\display|mem|mem_mux|data[2]~7_combout\) # ((\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a2\ & !\display|wr_logic|current_addr\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|mem|mem_mux|data[2]~7_combout\,
	datab => \display|wr_logic|state.WR_CONTROL_BUSY~regout\,
	datac => \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a2\,
	datad => \display|wr_logic|current_addr\(7),
	combout => \display|wr_logic|Selector26~0_combout\);

-- Location: LCFF_X38_Y19_N9
\display|wr_logic|i2c_data_wrb[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|wr_logic|Selector26~0_combout\,
	ena => \display|wr_logic|i2c_data_wrb[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|wr_logic|i2c_data_wrb\(2));

-- Location: LCFF_X36_Y23_N11
\display|i2c_master_inst|data_tx[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \display|wr_logic|i2c_data_wrb\(2),
	sload => VCC,
	ena => \display|i2c_master_inst|addr_rw[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|i2c_master_inst|data_tx\(2));

-- Location: LCCOMB_X39_Y19_N18
\display|wr_logic|Selector25~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|wr_logic|Selector25~0_combout\ = (\display|wr_logic|state.WR_CONTROL_BUSY~regout\ & ((\display|mem|mem_mux|data[3]~12_combout\) # ((\display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a3\ & !\display|wr_logic|current_addr\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|mem|rom|Mux10_rtl_0|auto_generated|ram_block1a3\,
	datab => \display|wr_logic|state.WR_CONTROL_BUSY~regout\,
	datac => \display|wr_logic|current_addr\(7),
	datad => \display|mem|mem_mux|data[3]~12_combout\,
	combout => \display|wr_logic|Selector25~0_combout\);

-- Location: LCFF_X39_Y19_N19
\display|wr_logic|i2c_data_wrb[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|wr_logic|Selector25~0_combout\,
	ena => \display|wr_logic|i2c_data_wrb[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|wr_logic|i2c_data_wrb\(3));

-- Location: LCFF_X36_Y23_N1
\display|i2c_master_inst|data_tx[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \display|wr_logic|i2c_data_wrb\(3),
	sload => VCC,
	ena => \display|i2c_master_inst|addr_rw[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|i2c_master_inst|data_tx\(3));

-- Location: LCCOMB_X36_Y23_N10
\display|i2c_master_inst|Mux3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|i2c_master_inst|Mux3~0_combout\ = (\display|i2c_master_inst|bit_cnt\(0) & (\display|i2c_master_inst|bit_cnt\(1) & ((\display|i2c_master_inst|data_tx\(3))))) # (!\display|i2c_master_inst|bit_cnt\(0) & ((\display|i2c_master_inst|bit_cnt\(1)) # 
-- ((\display|i2c_master_inst|data_tx\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110001010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|i2c_master_inst|bit_cnt\(0),
	datab => \display|i2c_master_inst|bit_cnt\(1),
	datac => \display|i2c_master_inst|data_tx\(2),
	datad => \display|i2c_master_inst|data_tx\(3),
	combout => \display|i2c_master_inst|Mux3~0_combout\);

-- Location: LCCOMB_X36_Y23_N6
\display|i2c_master_inst|Mux3~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|i2c_master_inst|Mux3~1_combout\ = (\display|i2c_master_inst|Selector28~0_combout\ & ((\display|i2c_master_inst|Mux3~0_combout\ & (\display|i2c_master_inst|data_tx\(0))) # (!\display|i2c_master_inst|Mux3~0_combout\ & 
-- ((\display|i2c_master_inst|data_tx\(1)))))) # (!\display|i2c_master_inst|Selector28~0_combout\ & (((\display|i2c_master_inst|Mux3~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|i2c_master_inst|data_tx\(0),
	datab => \display|i2c_master_inst|Selector28~0_combout\,
	datac => \display|i2c_master_inst|data_tx\(1),
	datad => \display|i2c_master_inst|Mux3~0_combout\,
	combout => \display|i2c_master_inst|Mux3~1_combout\);

-- Location: LCFF_X36_Y23_N31
\display|i2c_master_inst|data_tx[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \display|wr_logic|i2c_data_wrb\(5),
	sload => VCC,
	ena => \display|i2c_master_inst|addr_rw[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|i2c_master_inst|data_tx\(5));

-- Location: LCFF_X36_Y23_N19
\display|i2c_master_inst|data_tx[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \display|wr_logic|i2c_data_wrb\(6),
	sload => VCC,
	ena => \display|i2c_master_inst|addr_rw[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|i2c_master_inst|data_tx\(6));

-- Location: LCFF_X36_Y23_N9
\display|i2c_master_inst|data_tx[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \display|wr_logic|i2c_data_wrb\(7),
	sload => VCC,
	ena => \display|i2c_master_inst|addr_rw[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|i2c_master_inst|data_tx\(7));

-- Location: LCCOMB_X36_Y23_N18
\display|i2c_master_inst|Mux3~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|i2c_master_inst|Mux3~2_combout\ = (\display|i2c_master_inst|bit_cnt\(0) & (\display|i2c_master_inst|bit_cnt\(1) & ((\display|i2c_master_inst|data_tx\(7))))) # (!\display|i2c_master_inst|bit_cnt\(0) & ((\display|i2c_master_inst|bit_cnt\(1)) # 
-- ((\display|i2c_master_inst|data_tx\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110001010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|i2c_master_inst|bit_cnt\(0),
	datab => \display|i2c_master_inst|bit_cnt\(1),
	datac => \display|i2c_master_inst|data_tx\(6),
	datad => \display|i2c_master_inst|data_tx\(7),
	combout => \display|i2c_master_inst|Mux3~2_combout\);

-- Location: LCCOMB_X36_Y23_N30
\display|i2c_master_inst|Mux3~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|i2c_master_inst|Mux3~3_combout\ = (\display|i2c_master_inst|Selector28~0_combout\ & ((\display|i2c_master_inst|Mux3~2_combout\ & (\display|i2c_master_inst|data_tx\(4))) # (!\display|i2c_master_inst|Mux3~2_combout\ & 
-- ((\display|i2c_master_inst|data_tx\(5)))))) # (!\display|i2c_master_inst|Selector28~0_combout\ & (((\display|i2c_master_inst|Mux3~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|i2c_master_inst|data_tx\(4),
	datab => \display|i2c_master_inst|Selector28~0_combout\,
	datac => \display|i2c_master_inst|data_tx\(5),
	datad => \display|i2c_master_inst|Mux3~2_combout\,
	combout => \display|i2c_master_inst|Mux3~3_combout\);

-- Location: LCCOMB_X36_Y23_N14
\display|i2c_master_inst|Selector26~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|i2c_master_inst|Selector26~12_combout\ = (\display|i2c_master_inst|state.wr~regout\ & ((\display|i2c_master_inst|Add0~0_combout\ & (\display|i2c_master_inst|Mux3~1_combout\)) # (!\display|i2c_master_inst|Add0~0_combout\ & 
-- ((\display|i2c_master_inst|Mux3~3_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000101010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|i2c_master_inst|state.wr~regout\,
	datab => \display|i2c_master_inst|Mux3~1_combout\,
	datac => \display|i2c_master_inst|Add0~0_combout\,
	datad => \display|i2c_master_inst|Mux3~3_combout\,
	combout => \display|i2c_master_inst|Selector26~12_combout\);

-- Location: LCCOMB_X35_Y23_N4
\display|i2c_master_inst|Selector26~13\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|i2c_master_inst|Selector26~13_combout\ = (\display|i2c_master_inst|Selector26~6_combout\) # ((\display|i2c_master_inst|Selector26~12_combout\) # (!\display|i2c_master_inst|Selector22~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \display|i2c_master_inst|Selector26~6_combout\,
	datac => \display|i2c_master_inst|Selector22~1_combout\,
	datad => \display|i2c_master_inst|Selector26~12_combout\,
	combout => \display|i2c_master_inst|Selector26~13_combout\);

-- Location: LCCOMB_X35_Y23_N30
\display|i2c_master_inst|Selector22~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|i2c_master_inst|Selector22~2_combout\ = (\display|i2c_master_inst|Selector22~0_combout\) # (!\display|i2c_master_inst|Selector22~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \display|i2c_master_inst|Selector22~1_combout\,
	datad => \display|i2c_master_inst|Selector22~0_combout\,
	combout => \display|i2c_master_inst|Selector22~2_combout\);

-- Location: LCFF_X35_Y23_N31
\display|i2c_master_inst|state.rd\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|i2c_master_inst|Selector22~2_combout\,
	ena => \display|i2c_master_inst|data_clk_re~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|i2c_master_inst|state.rd~regout\);

-- Location: LCCOMB_X35_Y23_N26
\display|i2c_master_inst|Selector26~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|i2c_master_inst|Selector26~7_combout\ = (\display|i2c_master_inst|Equal0~0_combout\ & ((\display|i2c_master_inst|state.wr~regout\) # ((\display|i2c_master_inst|process_3~0_combout\ & \display|i2c_master_inst|state.rd~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|i2c_master_inst|Equal0~0_combout\,
	datab => \display|i2c_master_inst|process_3~0_combout\,
	datac => \display|i2c_master_inst|state.wr~regout\,
	datad => \display|i2c_master_inst|state.rd~regout\,
	combout => \display|i2c_master_inst|Selector26~7_combout\);

-- Location: LCFF_X36_Y23_N21
\display|i2c_master_inst|data_tx[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \display|wr_logic|i2c_data_wrb\(4),
	sload => VCC,
	ena => \display|i2c_master_inst|addr_rw[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|i2c_master_inst|data_tx\(4));

-- Location: LCCOMB_X36_Y23_N20
\display|i2c_master_inst|Mux2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|i2c_master_inst|Mux2~0_combout\ = (\display|i2c_master_inst|bit_cnt\(0) & (\display|i2c_master_inst|bit_cnt\(1) & (\display|i2c_master_inst|data_tx\(4)))) # (!\display|i2c_master_inst|bit_cnt\(0) & (((\display|i2c_master_inst|data_tx\(5))) # 
-- (!\display|i2c_master_inst|bit_cnt\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101010110010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|i2c_master_inst|bit_cnt\(0),
	datab => \display|i2c_master_inst|bit_cnt\(1),
	datac => \display|i2c_master_inst|data_tx\(4),
	datad => \display|i2c_master_inst|data_tx\(5),
	combout => \display|i2c_master_inst|Mux2~0_combout\);

-- Location: LCCOMB_X36_Y23_N8
\display|i2c_master_inst|Mux2~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|i2c_master_inst|Mux2~1_combout\ = (\display|i2c_master_inst|bit_cnt\(1) & (((\display|i2c_master_inst|Mux2~0_combout\)))) # (!\display|i2c_master_inst|bit_cnt\(1) & ((\display|i2c_master_inst|Mux2~0_combout\ & 
-- ((\display|i2c_master_inst|data_tx\(7)))) # (!\display|i2c_master_inst|Mux2~0_combout\ & (\display|i2c_master_inst|data_tx\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|i2c_master_inst|bit_cnt\(1),
	datab => \display|i2c_master_inst|data_tx\(6),
	datac => \display|i2c_master_inst|data_tx\(7),
	datad => \display|i2c_master_inst|Mux2~0_combout\,
	combout => \display|i2c_master_inst|Mux2~1_combout\);

-- Location: LCCOMB_X35_Y23_N28
\display|i2c_master_inst|Selector26~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|i2c_master_inst|Selector26~8_combout\ = (\display|i2c_master_inst|Selector26~7_combout\) # ((\display|i2c_master_inst|state.slv_ack1~regout\ & (\display|i2c_master_inst|Mux2~1_combout\ & !\display|i2c_master_inst|bit_cnt\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|i2c_master_inst|state.slv_ack1~regout\,
	datab => \display|i2c_master_inst|Selector26~7_combout\,
	datac => \display|i2c_master_inst|Mux2~1_combout\,
	datad => \display|i2c_master_inst|bit_cnt\(2),
	combout => \display|i2c_master_inst|Selector26~8_combout\);

-- Location: LCCOMB_X35_Y23_N16
\display|i2c_master_inst|Selector26~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|i2c_master_inst|Selector26~11_combout\ = (!\display|i2c_master_inst|Selector26~10_combout\ & (!\display|i2c_master_inst|Selector26~5_combout\ & (!\display|i2c_master_inst|Selector26~13_combout\ & !\display|i2c_master_inst|Selector26~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|i2c_master_inst|Selector26~10_combout\,
	datab => \display|i2c_master_inst|Selector26~5_combout\,
	datac => \display|i2c_master_inst|Selector26~13_combout\,
	datad => \display|i2c_master_inst|Selector26~8_combout\,
	combout => \display|i2c_master_inst|Selector26~11_combout\);

-- Location: LCFF_X35_Y23_N17
\display|i2c_master_inst|sda_int\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|i2c_master_inst|Selector26~11_combout\,
	ena => \display|i2c_master_inst|data_clk_re~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|i2c_master_inst|sda_int~regout\);

-- Location: LCCOMB_X35_Y24_N26
\display|i2c_master_inst|Selector32~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|i2c_master_inst|Selector32~0_combout\ = (\display|i2c_master_inst|state.start~regout\ & (\display|i2c_master_inst|data_clk_prev~regout\)) # (!\display|i2c_master_inst|state.start~regout\ & ((\display|i2c_master_inst|state.stop~regout\ & 
-- (!\display|i2c_master_inst|data_clk_prev~regout\)) # (!\display|i2c_master_inst|state.stop~regout\ & ((!\display|i2c_master_inst|sda_int~regout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010010100111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|i2c_master_inst|data_clk_prev~regout\,
	datab => \display|i2c_master_inst|state.stop~regout\,
	datac => \display|i2c_master_inst|state.start~regout\,
	datad => \display|i2c_master_inst|sda_int~regout\,
	combout => \display|i2c_master_inst|Selector32~0_combout\);

-- Location: LCCOMB_X43_Y21_N16
\display|logic|lcd_reset~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \display|logic|lcd_reset~0_combout\ = !\display|logic|state.INIT_RESET~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \display|logic|state.INIT_RESET~regout\,
	combout => \display|logic|lcd_reset~0_combout\);

-- Location: LCFF_X43_Y21_N17
\display|logic|lcd_reset\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display|logic|lcd_reset~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \display|logic|lcd_reset~regout\);

-- Location: PIN_B18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\lcd_reset~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \display|logic|lcd_reset~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_lcd_reset);
END structure;


