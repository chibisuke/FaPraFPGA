library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.constants.all;

-- checks if the product select input is in hot-one encoding
--
-- sw: the switches to check
--
-- is_valid: the result of the check
-- is_invalid: the negated result of the check

entity product_input_validation is
	port(
		sw: in std_logic_vector(7 downto 0);
		
		is_valid: out std_logic;
		is_invalid: out std_logic
	);
end product_input_validation;

architecture arch of product_input_validation is
	signal valid: std_logic;
begin
	-- check if the encoding in hot one is valid. 
	-- a full list to compare is cheaper by 9 logic elements then performing a calculation so we go with the full list.
	with sw select
		valid <= 
			'1' when "10000000" | "01000000" | "00100000" | "00010000" | "00001000" | "00000100"  | "00000010" | "00000001",
			'0' when others;
	-- alternate version:
	--is_valid <= '1' when unsigned(sw) /= 0 and (unsigned(sw) and (unsigned(sw) - 1)) = 0 else '0'; 
	is_valid <= valid;
	is_invalid <= not valid;
end arch;
