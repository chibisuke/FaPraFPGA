library ieee;
use ieee.std_logic_1164.all;

-- calculate the number of bits to rotate by. 
-- the keys denote the msb: key(3) and key(0) = '1'
-- the keys key(0) and key(1) select direction right, 
-- the keys key(2) and key(3) select direction left.

-- 	sw: the two switches denoting the two lower bits
--   key: the 4 keys as specificed above
--    by: the number of bits that have been selected for rotation
--   dir: the direction to rotate to (0 = left, 1 = right)
--   act: a rotation should be performed (meaning: at least one key is pressed).
entity calc_shift_by is
	port(
		sw:  in std_logic_vector(1 downto 0);
		key: in std_logic_vector(3 downto 0);
		
		by:  out std_logic_vector(2 downto 0);
		dir: out std_logic;
		act:  out std_logic
	);
end calc_shift_by;

architecture arch of calc_shift_by is
	signal msb: std_logic;
begin
	msb <= '1' when key = "0111" or key = "1110" else '0';
	dir <= '0' when key = "0111" or key = "1011" else '1';
	act <= '0' when key = "1111" else '1';
	by <= "000" when key = "1111" else msb & sw;
end arch;
