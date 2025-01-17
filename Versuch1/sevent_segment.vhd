library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- 7 segment decoder
--    in4: 4 bit input of the value to display (0-9A-F)
--    hex: the output pins to drive for the 7 segment display (inverse logic!)
--     
entity seven_segment is
	port(
		in4:  in std_logic_vector(3 downto 0); 
		hex: out std_logic_vector(6 downto 0)
	);
end seven_segment;

architecture arch of seven_segment is
	signal input : integer range 0 to 15;
	signal output : std_logic_vector(6 downto 0);
begin
	input <= to_integer(unsigned(in4));
	with input select 
		output <= 
			"0111111" when 0,
			"0000110" when 1,
			"1011011" when 2,
			"1001111" when 3,
			"1100110" when 4,
			"1101101" when 5, 
			"1111101" when 6,
			"0000111" when 7,
			"1111111" when 8,
			"1101111" when 9,
			"1110111" when 10,
			"1111100" when 11,
			"0111001" when 12,
			"1011110" when 13,
			"1111001" when 14,
			"1110001" when 15,
			"0000000" when others;
	hex <= not output;
end arch;
