library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- a simple debounce circuit
-- The signal of SW9 is - in contrast to the keys - not debounced in the boards hardware
-- and sometimes causes bouncing effects during reset, so we debounce it. 
-- for this we require the state of the switch to be 2**14 clock cycles = 0.33ms to be stable
-- in the on/off position before switching the state.
--
-- clk: the Clock to use
-- input: the input signal to debounce
-- output: the debounced output signal
entity debounce is
	port(
		clk: in std_logic;
	   input: in std_logic;
		output: out std_logic
	);
end debounce;

architecture arch of debounce is
	-- counter to count the time switch the state is unchanged.
	signal counter, counter_next: unsigned(12 downto 0) := "0000000000000";
	-- buffer the output state
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
			-- if the input is high, increate the counter
			if(counter < x"1Fff") then
				counter_next <= counter + 1;
			else
				-- if the counter reached its max value, toggle the output
				state_next <= '1';
			end if;
		else
			-- if the input is low, decreate the counter
			if(counter > x"00") then
				counter_next <= counter - 1;
			else
				-- if the counter reached its min value, toggle the output
				state_next <= '0';
			end if;
		end if;
	end process;
	output <= state;
end arch;
