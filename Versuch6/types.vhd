library ieee;
use ieee.std_logic_1164.all;

package types is
	-- aggregate all data that are needed for the display update
	type lcd_output_data is record
		read_time: std_logic_vector(15 downto 0);
		write_time: std_logic_vector(15 downto 0);
		clock_cycles: std_logic_vector(31 downto 0);
		read_error: std_logic;
	end record lcd_output_data;
end package types;