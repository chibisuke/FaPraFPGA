library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Combinatorial logic that inserts the current score
-- into the gameover screen at the locations marked by
-- a bit in the command part of the rom word. 
--
-- rom_data: the currently read ROM word
-- score: the score to insert in 2 digit BCD
-- q: the post processed command word

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
				-- replace x"600" with the tens BCD Digit
				q <= x"43" & score(7 downto 4);	
			else
				-- replace x"601" with the once BCD Digit
				q <= x"43" & score(3 downto 0);
			end if;
		else 	
			-- keep everything else as is
			q <= rom_data;
		end if;
	end process;
end arch;