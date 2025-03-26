--******************************************************
--Versuch:
--Name:
--Matrikel-Nr.:
--Zeitbedarf:
--****************************************************** 

library ieee;
use ieee.std_logic_1164.all;

entity Versuch7 is
	port(
		clk: in std_logic;
		aud_i2c_sclk: out std_logic;
		aud_i2c_sdat: inout std_logic;
		aud_m_clk: out std_logic;
		aud_b_clk: out std_logic;
		aud_dac_lr_clk: out std_logic;
		aud_adc_lr_clk: out std_logic;
		aud_dacdat: out std_logic;
		aud_adcdat: in std_logic;
		
		sw: in std_logic_vector(3 downto 0);
		key: in std_logic_vector(0 downto 0)
		
		--out1: out std_logic; -- H12 IO_B1
		--out2: out std_logic -- H13 IO_B2
		
	);
end Versuch7;

architecture arch of Versuch7 is
	signal i2c_data: std_logic_vector(23 downto 0);
	signal i2c_wr: std_logic;
	signal i2c_idle: std_logic;
	
	--signal aud_i2c_sclk_int: std_logic;
	
	signal audio_data_in: std_logic_vector(31 downto 0);
	signal FIRout, audio_data_out: std_logic_vector(31 downto 0);
	signal load_done_tick: std_logic;
	
	signal mem_wraddr: std_logic_vector(9 downto 0);
	signal mem_rdaddr: std_logic_vector(9 downto 0);
	signal rd_data: std_logic_vector(31 downto 0);
	
	signal trigger_key: std_logic;
begin
	--out1 <= aud_i2c_sclk_int;
	--aud_i2c_sclk <= aud_i2c_sclk_int;
	--out2 <= aud_i2c_sdat;

	i2c: entity work.i2c(arch) port map(
		clk=>clk, 
		reset=>'0', 
		din=>i2c_data, 
		i2c_sclk=>aud_i2c_sclk, 
		i2c_sdat=>aud_i2c_sdat, 
		i2c_idle=>i2c_idle, 
		i2c_fail=>open, 
		i2c_done_tick=>open,
		wr_i2c=>i2c_wr
	);
	
	audio_config: entity work.audio_config(arch) port map(clk=>clk, i2c_data=>i2c_data, i2c_wr=>i2c_wr, i2c_idle=>i2c_idle);
	
	adc_dac: entity work.adc_dac(arch) port map(
		clk=>clk,
		reset=>'0',
		dac_data_in=>audio_data_in,
		adc_data_out=>audio_data_out,
		m_clk=>aud_m_clk,
		b_clk=>aud_b_clk,
		dac_lr_clk=>aud_dac_lr_clk,
		adc_lr_clk=>aud_adc_lr_clk,
		dacdat=>aud_dacdat,
		adcdat=>aud_adcdat,
		load_done_tick=>load_done_tick
	);	
	
	-- audio_data_in <= audio_data_out(30 downto 16) & '0' & audio_data_out(14 downto 0) & '0';
	
	audio_data_in <= FIRout when sw(3) = '0' else audio_data_out;
	
	
	memory: entity work.memory port map(
		clock=>clk, 
		data=>audio_data_out, 
		wren=>load_done_tick, 
		wraddress=>mem_wraddr,
		rdaddress=>mem_rdaddr,
		q=>rd_data
	);
	
	mem_wr_addr: entity work.mem_wr_addr port map(clk=>clk, wr_addr=>mem_wraddr, incr=>load_done_tick);
	
	FIRController: entity work.FIR_Controller port map(
		clk=>clk, 
		rd_addr=>mem_rdaddr,
		rd_data=>rd_data,
		start_addr=>mem_wraddr,
		output=>FIRout,
		start=>load_done_tick,
		filter_select=>sw(2 downto 0),
		change_filter=>trigger_key
	);
	
	key_trigger: entity work.edge_detect port map(clk=>clk, input=>key(0), edge=>trigger_key);
	
--			clk: in std_logic;
--		rd_addr: out std_logic_vector(7 downto 0);
--		rd_data: in std_logic_vector(31 downto 0);
--		start_addr: in std_logic_vector(7 downto 0);
--		output: out std_logic_vector(31 downto 0);
--		start: in std_logic
--	
	
end arch;
