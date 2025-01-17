library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RNG is
	port(
		clk: in std_logic;
		permutate: in std_logic;
		
		q: out std_logic_vector(6 downto 0)
	);
end RNG;

architecture arch of RNG is
	constant MAX_RND: integer := 107;
	constant MAX_PERM: integer := 73;
	signal rnd,rnd_next: unsigned(7 downto 0);
	signal perm,perm_next: unsigned(7 downto 0);
	signal rnd_plus_perm: unsigned(7 downto 0);
	signal permutated_rnd: unsigned(7 downto 0);
	signal q_next: std_logic_vector(6 downto 0);
begin
	process (clk) begin
		if(rising_edge(clk)) then
			rnd <= rnd_next;
			perm <= perm_next;
			if (permutate = '1') then
				q <= std_logic_vector(rnd(6 downto 0));
			end if;
		end if;
	end process;
	rnd_plus_perm <= rnd + perm;
	permutated_rnd <= rnd_plus_perm when rnd_plus_perm < MAX_RND else rnd_plus_perm - MAX_RND; -- rnd_plus_perm % MAX_RND
	
	rnd_next <= permutated_rnd when permutate = '1' else x"00" when rnd = MAX_RND else rnd + x"01";
	perm_next <= x"00" when rnd = MAX_RND and perm = MAX_PERM else rnd + x"01" when rnd = MAX_RND else perm;
	
end arch;
