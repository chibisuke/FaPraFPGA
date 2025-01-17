-- megafunction wizard: %Virtual JTAG%
-- GENERATION: STANDARD
-- VERSION: WM1.0
-- MODULE: sld_virtual_jtag 

-- ============================================================
-- File Name: test.vhd
-- Megafunction Name(s):
-- 			sld_virtual_jtag
--
-- Simulation Library Files(s):
-- 			altera_mf
-- ============================================================
-- ************************************************************
-- THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
--
-- 13.0.1 Build 232 06/12/2013 SP 1 SJ Web Edition
-- ************************************************************


--Copyright (C) 1991-2013 Altera Corporation
--Your use of Altera Corporation's design tools, logic functions 
--and other software and tools, and its AMPP partner logic 
--functions, and any output files from any of the foregoing 
--(including device programming or simulation files), and any 
--associated documentation or information are expressly subject 
--to the terms and conditions of the Altera Program License 
--Subscription Agreement, Altera MegaCore Function License 
--Agreement, or other applicable license agreement, including, 
--without limitation, that your use is for the sole purpose of 
--programming logic devices manufactured by Altera and sold by 
--Altera or its authorized distributors.  Please refer to the 
--applicable agreement for further details.


LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY altera_mf;
USE altera_mf.all;

ENTITY test IS
	PORT
	(
		ir_out		: IN STD_LOGIC_VECTOR (0 DOWNTO 0);
		tdo		: IN STD_LOGIC ;
		ir_in		: OUT STD_LOGIC_VECTOR (0 DOWNTO 0);
		jtag_state_cdr		: OUT STD_LOGIC ;
		jtag_state_cir		: OUT STD_LOGIC ;
		jtag_state_e1dr		: OUT STD_LOGIC ;
		jtag_state_e1ir		: OUT STD_LOGIC ;
		jtag_state_e2dr		: OUT STD_LOGIC ;
		jtag_state_e2ir		: OUT STD_LOGIC ;
		jtag_state_pdr		: OUT STD_LOGIC ;
		jtag_state_pir		: OUT STD_LOGIC ;
		jtag_state_rti		: OUT STD_LOGIC ;
		jtag_state_sdr		: OUT STD_LOGIC ;
		jtag_state_sdrs		: OUT STD_LOGIC ;
		jtag_state_sir		: OUT STD_LOGIC ;
		jtag_state_sirs		: OUT STD_LOGIC ;
		jtag_state_tlr		: OUT STD_LOGIC ;
		jtag_state_udr		: OUT STD_LOGIC ;
		jtag_state_uir		: OUT STD_LOGIC ;
		tck		: OUT STD_LOGIC ;
		tdi		: OUT STD_LOGIC ;
		tms		: OUT STD_LOGIC ;
		virtual_state_cdr		: OUT STD_LOGIC ;
		virtual_state_cir		: OUT STD_LOGIC ;
		virtual_state_e1dr		: OUT STD_LOGIC ;
		virtual_state_e2dr		: OUT STD_LOGIC ;
		virtual_state_pdr		: OUT STD_LOGIC ;
		virtual_state_sdr		: OUT STD_LOGIC ;
		virtual_state_udr		: OUT STD_LOGIC ;
		virtual_state_uir		: OUT STD_LOGIC 
	);
END test;


ARCHITECTURE SYN OF test IS

	SIGNAL sub_wire0	: STD_LOGIC ;
	SIGNAL sub_wire1	: STD_LOGIC ;
	SIGNAL sub_wire2	: STD_LOGIC_VECTOR (0 DOWNTO 0);
	SIGNAL sub_wire3	: STD_LOGIC ;
	SIGNAL sub_wire4	: STD_LOGIC ;
	SIGNAL sub_wire5	: STD_LOGIC ;
	SIGNAL sub_wire6	: STD_LOGIC ;
	SIGNAL sub_wire7	: STD_LOGIC ;
	SIGNAL sub_wire8	: STD_LOGIC ;
	SIGNAL sub_wire9	: STD_LOGIC ;
	SIGNAL sub_wire10	: STD_LOGIC ;
	SIGNAL sub_wire11	: STD_LOGIC ;
	SIGNAL sub_wire12	: STD_LOGIC ;
	SIGNAL sub_wire13	: STD_LOGIC ;
	SIGNAL sub_wire14	: STD_LOGIC ;
	SIGNAL sub_wire15	: STD_LOGIC ;
	SIGNAL sub_wire16	: STD_LOGIC ;
	SIGNAL sub_wire17	: STD_LOGIC ;
	SIGNAL sub_wire18	: STD_LOGIC ;
	SIGNAL sub_wire19	: STD_LOGIC ;
	SIGNAL sub_wire20	: STD_LOGIC ;
	SIGNAL sub_wire21	: STD_LOGIC ;
	SIGNAL sub_wire22	: STD_LOGIC ;
	SIGNAL sub_wire23	: STD_LOGIC ;
	SIGNAL sub_wire24	: STD_LOGIC ;
	SIGNAL sub_wire25	: STD_LOGIC ;
	SIGNAL sub_wire26	: STD_LOGIC ;
	SIGNAL sub_wire27	: STD_LOGIC ;



	COMPONENT sld_virtual_jtag
	GENERIC (
		sld_auto_instance_index		: STRING;
		sld_instance_index		: NATURAL;
		sld_ir_width		: NATURAL;
		sld_sim_action		: STRING;
		sld_sim_n_scan		: NATURAL;
		sld_sim_total_length		: NATURAL;
		lpm_type		: STRING
	);
	PORT (
			jtag_state_pir	: OUT STD_LOGIC ;
			jtag_state_udr	: OUT STD_LOGIC ;
			ir_in	: OUT STD_LOGIC_VECTOR (0 DOWNTO 0);
			jtag_state_e1dr	: OUT STD_LOGIC ;
			jtag_state_sdrs	: OUT STD_LOGIC ;
			tdi	: OUT STD_LOGIC ;
			virtual_state_udr	: OUT STD_LOGIC ;
			ir_out	: IN STD_LOGIC_VECTOR (0 DOWNTO 0);
			jtag_state_e2dr	: OUT STD_LOGIC ;
			tck	: OUT STD_LOGIC ;
			virtual_state_e1dr	: OUT STD_LOGIC ;
			jtag_state_cir	: OUT STD_LOGIC ;
			jtag_state_pdr	: OUT STD_LOGIC ;
			jtag_state_sir	: OUT STD_LOGIC ;
			virtual_state_e2dr	: OUT STD_LOGIC ;
			jtag_state_rti	: OUT STD_LOGIC ;
			tms	: OUT STD_LOGIC ;
			virtual_state_cir	: OUT STD_LOGIC ;
			virtual_state_pdr	: OUT STD_LOGIC ;
			jtag_state_uir	: OUT STD_LOGIC ;
			jtag_state_cdr	: OUT STD_LOGIC ;
			jtag_state_e1ir	: OUT STD_LOGIC ;
			jtag_state_sdr	: OUT STD_LOGIC ;
			jtag_state_sirs	: OUT STD_LOGIC ;
			virtual_state_uir	: OUT STD_LOGIC ;
			jtag_state_e2ir	: OUT STD_LOGIC ;
			jtag_state_tlr	: OUT STD_LOGIC ;
			tdo	: IN STD_LOGIC ;
			virtual_state_cdr	: OUT STD_LOGIC ;
			virtual_state_sdr	: OUT STD_LOGIC 
	);
	END COMPONENT;

BEGIN
	jtag_state_pir    <= sub_wire0;
	jtag_state_udr    <= sub_wire1;
	ir_in    <= sub_wire2(0 DOWNTO 0);
	jtag_state_e1dr    <= sub_wire3;
	jtag_state_sdrs    <= sub_wire4;
	tdi    <= sub_wire5;
	virtual_state_udr    <= sub_wire6;
	jtag_state_e2dr    <= sub_wire7;
	tck    <= sub_wire8;
	virtual_state_e1dr    <= sub_wire9;
	jtag_state_cir    <= sub_wire10;
	jtag_state_pdr    <= sub_wire11;
	jtag_state_sir    <= sub_wire12;
	virtual_state_e2dr    <= sub_wire13;
	jtag_state_rti    <= sub_wire14;
	tms    <= sub_wire15;
	virtual_state_cir    <= sub_wire16;
	virtual_state_pdr    <= sub_wire17;
	jtag_state_uir    <= sub_wire18;
	jtag_state_cdr    <= sub_wire19;
	jtag_state_e1ir    <= sub_wire20;
	jtag_state_sdr    <= sub_wire21;
	jtag_state_sirs    <= sub_wire22;
	virtual_state_uir    <= sub_wire23;
	jtag_state_e2ir    <= sub_wire24;
	jtag_state_tlr    <= sub_wire25;
	virtual_state_cdr    <= sub_wire26;
	virtual_state_sdr    <= sub_wire27;

	sld_virtual_jtag_component : sld_virtual_jtag
	GENERIC MAP (
		sld_auto_instance_index => "YES",
		sld_instance_index => 0,
		sld_ir_width => 1,
		sld_sim_action => "",
		sld_sim_n_scan => 0,
		sld_sim_total_length => 0,
		lpm_type => "sld_virtual_jtag"
	)
	PORT MAP (
		ir_out => ir_out,
		tdo => tdo,
		jtag_state_pir => sub_wire0,
		jtag_state_udr => sub_wire1,
		ir_in => sub_wire2,
		jtag_state_e1dr => sub_wire3,
		jtag_state_sdrs => sub_wire4,
		tdi => sub_wire5,
		virtual_state_udr => sub_wire6,
		jtag_state_e2dr => sub_wire7,
		tck => sub_wire8,
		virtual_state_e1dr => sub_wire9,
		jtag_state_cir => sub_wire10,
		jtag_state_pdr => sub_wire11,
		jtag_state_sir => sub_wire12,
		virtual_state_e2dr => sub_wire13,
		jtag_state_rti => sub_wire14,
		tms => sub_wire15,
		virtual_state_cir => sub_wire16,
		virtual_state_pdr => sub_wire17,
		jtag_state_uir => sub_wire18,
		jtag_state_cdr => sub_wire19,
		jtag_state_e1ir => sub_wire20,
		jtag_state_sdr => sub_wire21,
		jtag_state_sirs => sub_wire22,
		virtual_state_uir => sub_wire23,
		jtag_state_e2ir => sub_wire24,
		jtag_state_tlr => sub_wire25,
		virtual_state_cdr => sub_wire26,
		virtual_state_sdr => sub_wire27
	);



END SYN;

-- ============================================================
-- CNX file retrieval info
-- ============================================================
-- Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Cyclone II"
-- Retrieval info: PRIVATE: show_jtag_state STRING "1"
-- Retrieval info: LIBRARY: altera_mf altera_mf.altera_mf_components.all
-- Retrieval info: CONSTANT: SLD_AUTO_INSTANCE_INDEX STRING "YES"
-- Retrieval info: CONSTANT: SLD_INSTANCE_INDEX NUMERIC "0"
-- Retrieval info: CONSTANT: SLD_IR_WIDTH NUMERIC "1"
-- Retrieval info: CONSTANT: SLD_SIM_ACTION STRING ""
-- Retrieval info: CONSTANT: SLD_SIM_N_SCAN NUMERIC "0"
-- Retrieval info: CONSTANT: SLD_SIM_TOTAL_LENGTH NUMERIC "0"
-- Retrieval info: USED_PORT: ir_in 0 0 1 0 OUTPUT NODEFVAL "ir_in[0..0]"
-- Retrieval info: USED_PORT: ir_out 0 0 1 0 INPUT NODEFVAL "ir_out[0..0]"
-- Retrieval info: USED_PORT: jtag_state_cdr 0 0 0 0 OUTPUT NODEFVAL "jtag_state_cdr"
-- Retrieval info: USED_PORT: jtag_state_cir 0 0 0 0 OUTPUT NODEFVAL "jtag_state_cir"
-- Retrieval info: USED_PORT: jtag_state_e1dr 0 0 0 0 OUTPUT NODEFVAL "jtag_state_e1dr"
-- Retrieval info: USED_PORT: jtag_state_e1ir 0 0 0 0 OUTPUT NODEFVAL "jtag_state_e1ir"
-- Retrieval info: USED_PORT: jtag_state_e2dr 0 0 0 0 OUTPUT NODEFVAL "jtag_state_e2dr"
-- Retrieval info: USED_PORT: jtag_state_e2ir 0 0 0 0 OUTPUT NODEFVAL "jtag_state_e2ir"
-- Retrieval info: USED_PORT: jtag_state_pdr 0 0 0 0 OUTPUT NODEFVAL "jtag_state_pdr"
-- Retrieval info: USED_PORT: jtag_state_pir 0 0 0 0 OUTPUT NODEFVAL "jtag_state_pir"
-- Retrieval info: USED_PORT: jtag_state_rti 0 0 0 0 OUTPUT NODEFVAL "jtag_state_rti"
-- Retrieval info: USED_PORT: jtag_state_sdr 0 0 0 0 OUTPUT NODEFVAL "jtag_state_sdr"
-- Retrieval info: USED_PORT: jtag_state_sdrs 0 0 0 0 OUTPUT NODEFVAL "jtag_state_sdrs"
-- Retrieval info: USED_PORT: jtag_state_sir 0 0 0 0 OUTPUT NODEFVAL "jtag_state_sir"
-- Retrieval info: USED_PORT: jtag_state_sirs 0 0 0 0 OUTPUT NODEFVAL "jtag_state_sirs"
-- Retrieval info: USED_PORT: jtag_state_tlr 0 0 0 0 OUTPUT NODEFVAL "jtag_state_tlr"
-- Retrieval info: USED_PORT: jtag_state_udr 0 0 0 0 OUTPUT NODEFVAL "jtag_state_udr"
-- Retrieval info: USED_PORT: jtag_state_uir 0 0 0 0 OUTPUT NODEFVAL "jtag_state_uir"
-- Retrieval info: USED_PORT: tck 0 0 0 0 OUTPUT NODEFVAL "tck"
-- Retrieval info: USED_PORT: tdi 0 0 0 0 OUTPUT NODEFVAL "tdi"
-- Retrieval info: USED_PORT: tdo 0 0 0 0 INPUT NODEFVAL "tdo"
-- Retrieval info: USED_PORT: tms 0 0 0 0 OUTPUT NODEFVAL "tms"
-- Retrieval info: USED_PORT: virtual_state_cdr 0 0 0 0 OUTPUT NODEFVAL "virtual_state_cdr"
-- Retrieval info: USED_PORT: virtual_state_cir 0 0 0 0 OUTPUT NODEFVAL "virtual_state_cir"
-- Retrieval info: USED_PORT: virtual_state_e1dr 0 0 0 0 OUTPUT NODEFVAL "virtual_state_e1dr"
-- Retrieval info: USED_PORT: virtual_state_e2dr 0 0 0 0 OUTPUT NODEFVAL "virtual_state_e2dr"
-- Retrieval info: USED_PORT: virtual_state_pdr 0 0 0 0 OUTPUT NODEFVAL "virtual_state_pdr"
-- Retrieval info: USED_PORT: virtual_state_sdr 0 0 0 0 OUTPUT NODEFVAL "virtual_state_sdr"
-- Retrieval info: USED_PORT: virtual_state_udr 0 0 0 0 OUTPUT NODEFVAL "virtual_state_udr"
-- Retrieval info: USED_PORT: virtual_state_uir 0 0 0 0 OUTPUT NODEFVAL "virtual_state_uir"
-- Retrieval info: CONNECT: @ir_out 0 0 1 0 ir_out 0 0 1 0
-- Retrieval info: CONNECT: @tdo 0 0 0 0 tdo 0 0 0 0
-- Retrieval info: CONNECT: ir_in 0 0 1 0 @ir_in 0 0 1 0
-- Retrieval info: CONNECT: jtag_state_cdr 0 0 0 0 @jtag_state_cdr 0 0 0 0
-- Retrieval info: CONNECT: jtag_state_cir 0 0 0 0 @jtag_state_cir 0 0 0 0
-- Retrieval info: CONNECT: jtag_state_e1dr 0 0 0 0 @jtag_state_e1dr 0 0 0 0
-- Retrieval info: CONNECT: jtag_state_e1ir 0 0 0 0 @jtag_state_e1ir 0 0 0 0
-- Retrieval info: CONNECT: jtag_state_e2dr 0 0 0 0 @jtag_state_e2dr 0 0 0 0
-- Retrieval info: CONNECT: jtag_state_e2ir 0 0 0 0 @jtag_state_e2ir 0 0 0 0
-- Retrieval info: CONNECT: jtag_state_pdr 0 0 0 0 @jtag_state_pdr 0 0 0 0
-- Retrieval info: CONNECT: jtag_state_pir 0 0 0 0 @jtag_state_pir 0 0 0 0
-- Retrieval info: CONNECT: jtag_state_rti 0 0 0 0 @jtag_state_rti 0 0 0 0
-- Retrieval info: CONNECT: jtag_state_sdr 0 0 0 0 @jtag_state_sdr 0 0 0 0
-- Retrieval info: CONNECT: jtag_state_sdrs 0 0 0 0 @jtag_state_sdrs 0 0 0 0
-- Retrieval info: CONNECT: jtag_state_sir 0 0 0 0 @jtag_state_sir 0 0 0 0
-- Retrieval info: CONNECT: jtag_state_sirs 0 0 0 0 @jtag_state_sirs 0 0 0 0
-- Retrieval info: CONNECT: jtag_state_tlr 0 0 0 0 @jtag_state_tlr 0 0 0 0
-- Retrieval info: CONNECT: jtag_state_udr 0 0 0 0 @jtag_state_udr 0 0 0 0
-- Retrieval info: CONNECT: jtag_state_uir 0 0 0 0 @jtag_state_uir 0 0 0 0
-- Retrieval info: CONNECT: tck 0 0 0 0 @tck 0 0 0 0
-- Retrieval info: CONNECT: tdi 0 0 0 0 @tdi 0 0 0 0
-- Retrieval info: CONNECT: tms 0 0 0 0 @tms 0 0 0 0
-- Retrieval info: CONNECT: virtual_state_cdr 0 0 0 0 @virtual_state_cdr 0 0 0 0
-- Retrieval info: CONNECT: virtual_state_cir 0 0 0 0 @virtual_state_cir 0 0 0 0
-- Retrieval info: CONNECT: virtual_state_e1dr 0 0 0 0 @virtual_state_e1dr 0 0 0 0
-- Retrieval info: CONNECT: virtual_state_e2dr 0 0 0 0 @virtual_state_e2dr 0 0 0 0
-- Retrieval info: CONNECT: virtual_state_pdr 0 0 0 0 @virtual_state_pdr 0 0 0 0
-- Retrieval info: CONNECT: virtual_state_sdr 0 0 0 0 @virtual_state_sdr 0 0 0 0
-- Retrieval info: CONNECT: virtual_state_udr 0 0 0 0 @virtual_state_udr 0 0 0 0
-- Retrieval info: CONNECT: virtual_state_uir 0 0 0 0 @virtual_state_uir 0 0 0 0
-- Retrieval info: GEN_FILE: TYPE_NORMAL test.vhd TRUE
-- Retrieval info: GEN_FILE: TYPE_NORMAL test.inc FALSE
-- Retrieval info: GEN_FILE: TYPE_NORMAL test.cmp TRUE
-- Retrieval info: GEN_FILE: TYPE_NORMAL test.bsf FALSE
-- Retrieval info: GEN_FILE: TYPE_NORMAL test_inst.vhd FALSE
-- Retrieval info: LIB_FILE: altera_mf
