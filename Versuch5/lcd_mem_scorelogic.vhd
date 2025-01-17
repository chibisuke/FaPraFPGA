library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity lcd_mem_scorelogic is
	port(
		rom_data: in std_logic_vector(11 downto 0);
		score: in std_logic_vector(7 downto 0);
		
		q: out std_logic_vector(11 downto 0)
	);
end lcd_mem_scorelogic;

architecture arch of lcd_mem_scorelogic is
begin
	process(rom_data, score) begin
		if(rom_data(9) = '1') then
			if(rom_data(0) = '0') then
				q <= x"43" & score(7 downto 4);	
			else
				q <= x"43" & score(3 downto 0);
			end if;
		else
			q <= rom_data;
		end if;
	end process;
end arch;