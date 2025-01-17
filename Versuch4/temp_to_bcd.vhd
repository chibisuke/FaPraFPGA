library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- 6 bit binary to 7 bit BCD Decoder using combinatorial logic
-- using the "shift left and add 3" or "double dabble" algorithm
--
-- Note: I could have used the bin2bcd entity from Listing
-- 7.5 in the book, but I wanted a combinatorial logic that doesn't require
-- additional clock cycles. This does not increase the max critical path
-- length of the overall project.
--
entity temp_to_bcd is
    port (
        in6 : in std_logic_vector(5 downto 0);  -- 6-bit binary input
        bcd_out : out std_logic_vector(6 downto 0)    -- 7-bit BCD output
    );
end entity temp_to_bcd;

architecture arch of temp_to_bcd is
	signal a1: std_logic_vector(3 downto 0);
	signal a2: std_logic_vector(3 downto 0);
	signal a3: std_logic_vector(3 downto 0);	
	
	
	-- add 3 to the input if the input is geater then 4
	-- See "Double dabble" algorithm for details. 
	function add3(bin : std_logic_vector(3 downto 0)) return std_logic_vector is
	begin
		if (unsigned(bin) > "0100") then
			return (std_logic_vector(unsigned(bin) + "0011"));
		else 
			return bin;
		end if;
	end function;
begin
	-- we do not shift the high nibble bits to a seperate signal, since
	-- we don't have to add3() for them, therefor we collect them at the
	-- end.
	
	-- less then 3 bit cannot be geater then 4, 
	-- so begin with 3 bits
	a1 <= add3('0' & in6(5 downto 3));
	-- take the lower 3 bits and shift the next bit onto them
	a2 <= add3(a1(2 downto 0) & in6(2));
	a3 <= add3(a2(2 downto 0) & in6(1));
	
	-- collect high bits that have moved to the next digit
	bcd_out(6 downto 4) <= a1(3) & a2(3) & a3(3);
	-- don't forget to add the last input bit
	bcd_out(3 downto 0) <= a3(2 downto 0) & in6(0);
end architecture arch;