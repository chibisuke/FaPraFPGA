library ieee;
use ieee.std_logic_1164.all;

-- Copy from Versuch2

-- edge detection circuit
-- takes an input and detects the falling edge, syncronized with clk
--
-- clk: the Clock to use
-- input: the input signal to detect the rising edge on
-- edge: outputs high for one clock cycle when input had a falling edge
--
-- NOTE: key0 - 3 on the DE1 are using inverse logic (1 = not pressed, 0 = pressed) 
-- thats why we're detecting the falling edge, not the rising one
entity edge_detect is
	port(
		clk: in std_logic;
	   input: in std_logic;
		edge: out std_logic
	);
end edge_detect;

architecture arch of edge_detect is
	-- 3 flip flops to store the states
	signal sr: std_logic_vector(2 downto 0) := "000";
begin
   process(clk, sr)
	begin  
	   if(rising_edge(clk)) then
			-- the previous state of the key
			sr(2) <= sr(1);
			-- the current state of the key
			sr(1) <= sr(0);
			-- buffer the input to keep it constant for the whole clock cycle
			sr(0) <= input;
	   end if;
	end process;
	-- if it is pressed (0) now but was not previously (1)
	edge <= sr(2) and not sr(1);
end arch;
