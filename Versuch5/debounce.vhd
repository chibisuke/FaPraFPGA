library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

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
entity debounce is
	port(
		clk: in std_logic;
	   input: in std_logic;
		output: out std_logic
	);
end debounce;

architecture arch of debounce is
	-- 3 flip flops to store the states
	signal counter, counter_next: unsigned(5 downto 0) := "000000";
	signal state, state_next: std_logic := '0';
	
begin
   process(clk)
	begin  
	   if(rising_edge(clk)) then
			counter <= counter_next;
			state <= state_next;
		end if;
	end process;

	process(counter, input, state) begin
		counter_next <= counter;
		state_next <= state;
		if(input = '1') then
			if(counter < x"3f") then
				counter_next <= counter + 1;
			else
				state_next <= '1';
			end if;
		else
			if(counter > x"00") then
				counter_next <= counter - 1;
			else
				state_next <= '0';
			end if;
		end if;
	end process;
	output <= state;
end arch;
