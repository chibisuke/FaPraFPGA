library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Random number generator
-- Generates random data based on a clock and an entropy source
-- 
-- clk: the clock to use
-- permutate: requests a new RNG Value at the output
-- q: the output value
-- random_bit: input of a true entropy source

entity RNG is
	port(
		clk: in std_logic;
		permutate: in std_logic;
		
		q: out std_logic_vector(6 downto 0);
		
		random_bit: in std_logic
	);
end RNG;

architecture arch of RNG is
	constant MAX_RND: integer := 107;
	constant PERM: integer := 3;
	signal rnd,rnd_next: unsigned(6 downto 0);
	signal rnd_plus_perm: unsigned(6 downto 0);
begin
	process (clk) begin
		if(rising_edge(clk)) then
			-- permutate the internal state on every clockcycle
			rnd <= rnd_next;
			-- but only output output register when requested
			if (permutate = '1') then
				q <= std_logic_vector(rnd(6 downto 0));
			end if;
		end if;
	end process;
	-- use different permutation values depending on the entropy source
	rnd_plus_perm <= rnd + PERM when random_bit = '1' else rnd + 1;
	-- make sure the created value doesn't exceed the allowed output value
	rnd_next <= rnd_plus_perm when rnd_plus_perm < MAX_RND else rnd_plus_perm - MAX_RND;
	
end arch;
