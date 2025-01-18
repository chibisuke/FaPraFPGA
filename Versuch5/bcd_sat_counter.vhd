library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- 2 digit BCD Saturation counter

entity bcd_sat_counter is
	port(
		clk: in std_logic;
		inc: in std_logic;
		rst: in std_logic;
		
		q: out std_logic_vector(7 downto 0)
		
	);
end bcd_sat_counter;

architecture arch of bcd_sat_counter is
	signal count, count_next: unsigned(7 downto 0);
begin

	count_next(3 downto 0) <= x"0" when count(3 downto 0) = x"9" else count(3 downto 0) + 1;
	count_next(7 downto 4) <= count(7 downto 4) + 1 when count(3 downto 0) = x"9" else count(7 downto 4);
	
	
	process (clk, rst) begin
		if(rst = '1') then
			count <= x"00";
		elsif (rising_edge(clk)) then
			if(inc = '1' and count /= x"99") then
				count <= count_next;
			end if;
		end if;
	end process;
	q <= std_logic_vector(count);
end arch;
