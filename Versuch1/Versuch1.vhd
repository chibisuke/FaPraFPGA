--******************************************************
--Versuch: 			1
--Name:				Rene Henzinger
--Matrikel-Nr.:	4292642
--Zeitbedarf:		3 Stunden
--****************************************************** 

library ieee;
use ieee.std_logic_1164.all;

entity Versuch1 is
	port(
		sw:  in std_logic_vector(9 downto 0); 
		key: in std_logic_vector(3 downto 0);
		hex0: out std_logic_vector(6 downto 0);
		hex1: out std_logic_vector(6 downto 0) := "1111111"; -- since only the minus is used, make sure the other segments are properly turned "off".
		hex2: out std_logic_vector(6 downto 0);
		hex3: out std_logic_vector(6 downto 0);
		ledr: out std_logic_vector(7 downto 0);
		ledg: out std_logic_vector(7 downto 0)
	);
end Versuch1;

architecture arch of Versuch1 is
	signal shift_by: std_logic_vector(2 downto 0);
	signal plusminus: std_logic;
	signal rotated_value: std_logic_vector(7 downto 0);
	signal output_active: std_logic;
begin
	-- output switch position to red LEDs
	ledr <= sw(7 downto 0);
	
	-- drive the geen LEDs. There is no point in creating a sepearte module for this single multiplexer line.
	ledg <= rotated_value when output_active = '1' else "00000000";
	
	-- 7 segment display
	hex_digit0 : entity work.seven_segment(arch) port map(in4=>'0' & shift_by, hex=>hex0);
	-- show the minus on the 7 segment display
	hex1(6) <= plusminus;
	hex_digit2 : entity work.seven_segment(arch) port map(in4=>rotated_value(3 downto 0), hex=>hex2);
	hex_digit3 : entity work.seven_segment(arch) port map(in4=>rotated_value(7 downto 4), hex=>hex3);
	
	-- calculation logic
	csb : entity work.calc_shift_by(arch) port map(sw=>sw(9 downto 8), key=>key, by=>shift_by, dir=>plusminus, act=>output_active);
	shifter: entity work.barrel_shifter_8(arch) port map(input=>sw(7 downto 0), output=>rotated_value, dir=>plusminus, by=>shift_by);
end arch;
