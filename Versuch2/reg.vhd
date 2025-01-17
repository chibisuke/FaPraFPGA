--reg.vhd
library ieee;
use ieee.std_logic_1164.all;

-- a simple 10-bit register
-- 
-- clk: The clock to use
-- D: the value to save into the register when wr is set
-- Q: the current value of the register
-- wr: if wr = '1' write the current value of D to the register.
-- en: allow blocking of writes (when in execution mode)
entity reg is
	port(
		clk: in std_logic;
	   D: in std_logic_vector(9 downto 0);
		Q: out std_logic_vector(9 downto 0);
		wr: in std_logic;
		en: in std_logic := '1'
	);
end reg;

architecture arch of reg is
	signal current: std_logic_vector(9 downto 0);
begin
	process(clk, D, wr, en)
	begin
		if(rising_edge(clk) and wr = '1' and en = '1') then
			-- store the current value
			current <= D;
		end if;
	end process;
	-- output the current value
	Q <= current;
end arch;
