--addr_selector.vhd
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- This is the address logic of the Experiment
-- it starts with 0 and increments the address by one
-- each time any of the next inputs is high durch a clock cycle
-- on when reaching
-- 
-- clk: the clock to use
-- next1 and next2: if any one is high, address is incremented
-- current: the currect address to use
entity addr_selector is
	port(
		clk: in std_logic;
		next1: in std_logic;
		next2: in std_logic;
		current: out std_logic_vector(3 downto 0)
	);
end addr_selector;

architecture arch of addr_selector is
	-- holds the current address
	signal valu: unsigned(3 downto 0) := "0000";
begin
	process (clk)
	begin
		if(rising_edge(clk)) then
			if (next1 = '1' or next2 = '1') then
				-- since the max value is 15, which is "all bits set"
				-- we skip checking for the reset condition and let it overflow
				valu <= valu + 1;
			end if;		
		end if;
	end process;
	current <= std_logic_vector(valu);
end arch;
