--******************************************************
--Versuch: 4
--Name: Rene Henzinger
--Matrikel-Nr.: 4292642
--Zeitbedarf: 28 Stunden
--******************************************************

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Versuch4 is
	port(
		clk: in std_logic;

		sw: in std_logic_vector(7 downto 0);
		key: in std_logic_vector(1 downto 0);
		
		temp_scl: inout std_logic;
		temp_sda: inout std_logic;
		
		lcd_scl: inout std_logic;
		lcd_sda: inout std_logic;
		lcd_reset: out std_logic
	);
end Versuch4;

architecture arch of Versuch4 is	
	signal temp: std_logic_vector(7 downto 0);
	signal temp_fdp: std_logic;
	signal temp_complete: std_logic;
	
	signal trigger: std_logic_vector(1 downto 0);
begin	
	-- edge detection for the keys
	ed1: entity work.edge_detect(arch) port map(clk=>clk, input=>key(0), edge=>trigger(0));
	ed2: entity work.edge_detect(arch) port map(clk=>clk, input=>key(1), edge=>trigger(1));
	
	-- Temperature reader
	tr: entity work.temp_reader(arch) port map(clk=>clk, scl=>temp_scl, sda=>temp_sda, temp=>temp, temp_fdp=>temp_fdp, completed=>temp_complete);
	
	-- LCD Display
	display: entity work.lcd(arch) port map(clk=>clk, sda=>lcd_sda, scl=>lcd_scl, lcd_reset=>lcd_reset, 
		trigger_temp_update=>temp_complete, temp_bcd=>temp, temp_dec=>temp_fdp, trigger_char_update=>trigger(1), char=>sw(7 downto 0),
		reset=>trigger(0));
end arch;
