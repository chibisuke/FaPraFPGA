--toggle_button.vhd
library ieee;
use ieee.std_logic_1164.all;

-- toggle button logic
-- each rising edge of input toggles the output
--
-- clk: the clock to use for the flipflop
-- input: the button that triggers the toggle
-- state: the current state of the toggle (on/off)
-- neg_state: the inverse of the current state
entity toggle_button is
	port(
		clk: in std_logic;
	   input: in std_logic;
		state: out std_logic;
		neg_state: out std_logic
	);
end toggle_button;

architecture arch of toggle_button is
	-- FF to hold the current toggle state
	signal current: std_logic := '0';
	-- Flipflops for the edge detection circuit
	signal sr: std_logic_vector(1 downto 0) := "00";
begin
   process(clk)
	begin  
	   if(rising_edge(clk)) then
			-- check if the input has a rising edge, then negate the current state
			if(sr = "10") then
				current <= not current;
			end if;
			-- buffer the input, to have a clean signal to compare to - see edge_detect
			sr(1) <= sr(0);
			sr(0) <= input;
	   end if;
	end process;
	state <= current;
	neg_state <= not current;
end arch;

