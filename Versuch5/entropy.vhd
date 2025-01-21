library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- This is an entropy genertor for the random number generator
--
-- This works by using Two PPL Inputs that have the same frequency
-- and we're harvesting the entropy from the jitter between the two
-- PLLs. This intentionally creates a metastable state in the meta_a
-- and meta_b registers, which we harvest and stabilize using the system
-- clock

entity entropy is
    port (
		  clk    : in  std_logic;
        c0     : in  std_logic;  -- PLL output c0
        c1     : in  std_logic;  -- PLL output c1
        random_bit: out std_logic
    );
end entropy;

architecture rtl of entropy is
    signal sample_a, sample_b : std_logic;
	 -- NOTE: Timing anylsis für meta_a and meta_b is disabled
	 -- because due to the jittering we wouldn't get any reliable
	 -- results anyway. Since we're intentionally creating a metastable
	 -- state to harvest entropy this is not a problem here.
    signal meta_a, meta_b     : std_logic;
	 signal rdb: std_logic;
	 signal sr1, sr2: std_logic;
begin
    -- Sample between clock domains
   process(c0) begin
	   if rising_edge(c0) then
         sample_a <= not meta_a;
			meta_a   <= sample_b;
		end if;
   end process;
	process(c1)	begin
		if rising_edge(c1) then
			sample_b <= not meta_b;
			meta_b   <= sample_a;
		end if;
	end process;
	 
	process(clk) begin
		if(rising_edge(clk)) then
			-- stabilize the signal according to Altera Design guide
			sr1 <= rdb;
			sr2 <= sr1;
			random_bit <= sr2;
		end if;
	end process;
	-- XOR the metastable signals for entropy extraction
	rdb <= meta_a xor meta_b;
 end architecture;