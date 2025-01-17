library ieee;
use ieee.std_logic_1164.all;

-- rotates an 8 bit input by some value
-- 	 input: the 8 bit input vector to be rotated
--    output: the 8 bit output vector
--        by: the number of bits to rotate by
--       dir: the direction to rotate. '0' = left, '1' = right
entity barrel_shifter_8 is
	port(
		input:   in std_logic_vector(7 downto 0);
		by: 		in std_logic_vector(2 downto 0);
		dir: 		in std_logic;
		output: out std_logic_vector(7 downto 0)
	);
end barrel_shifter_8;

architecture arch of barrel_shifter_8 is
	signal s0,s1: std_logic_vector(7 downto 0);
begin
	-- shift by 1
	s0 <= input(0) & input(7 downto 1) when by(0) = '1' and dir = '1' else 
			input(6 downto 0) & input(7) when by(0) = '1' and dir = '0' else
			input;
	-- shift by 2
	s1 <= s0(1 downto 0) & s0(7 downto 2) when by(1) = '1' and dir = '1' else
			s0(5 downto 0) & s0(7 downto 6) when by(1) = '1' and dir = '0' else
			s0;
	-- shift by 4
	-- direction doesn't matter, because its the same in both directions. 
	output <= s1(3 downto 0) & s1(7 downto 4) when by(2) = '1' else s1;	
end arch;
