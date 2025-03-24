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
		out1: out std_logic; -- H12 IO_B1
		out2: out std_logic -- H13 IO_B2
		
		
	);
end Versuch7;

architecture arch of Versuch7 is
	signal i2c_data: std_logic_vector(23 downto 0);
	signal i2c_wr: std_logic;
	signal i2c_idle: std_logic;
	
	signal aud_i2c_sclk_int: std_logic;
begin
	out1 <= aud_i2c_sclk_int;
	aud_i2c_sclk <= aud_i2c_sclk_int;
	out2 <= aud_i2c_sdat;

	i2c: entity work.i2c(arch) port map(
		clk=>clk, 
		reset=>'0', 
		din=>i2c_data, 
		i2c_sclk=>aud_i2c_sclk_int, 
		i2c_sdat=>aud_i2c_sdat, 
		i2c_idle=>i2c_idle, 
		i2c_fail=>open, 
		i2c_done_tick=>open,
		wr_i2c=>i2c_wr
	);
	
	audio_config: entity work.audio_config(arch) port map(clk=>clk, i2c_data=>i2c_data, i2c_wr=>i2c_wr, i2c_idle=>i2c_idle);
	
	
end arch;
