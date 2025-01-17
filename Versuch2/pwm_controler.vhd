--pwm_controller.vhd
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- PWM Controller - creates the PWM Output signal
--
-- clk: the Clock to use
-- valu: the numer of clock cycles the output is high
-- period: the total period interval in clock cycles
-- repeat: the number of times the PWM output is repeated
--         before setting 'done'
-- en: the enable bit to enable the output
-- stop: the switch inputs that makes the PWM output halt if all bits are 0
--
-- done: the PWM signal was output 'repeat' times.
-- output: the output PWM signal
entity pwm is
	port(
		clk: in std_logic;
	   valu: in std_logic_vector(9 downto 0);
		period: in std_logic_vector(9 downto 0);
		repeat: in std_logic_vector(15 downto 0);
		en: in std_logic;
		stop: in std_logic_vector(9 downto 0);
		
		output: out std_logic;
		done: out std_logic
	);
end pwm;

architecture arch of pwm is
	-- counters for the repeat cycle and the period cycle
	signal current_repeat: unsigned(15 downto 0) := (others => '0');
	signal current_cycle: unsigned(9 downto 0) := (others => '0');
	-- D-FF to buffer the "done" output
	signal end_of_cycle: std_logic;
	signal halt: std_logic;
	
	constant zero: std_logic_vector := std_logic_vector(to_unsigned(0, stop'length));
begin
	process (clk, en, current_cycle, valu)
	begin
		if(rising_edge(clk)) then
			end_of_cycle <= '0';
			if(en = '1') then
				-- count cycles in period
				if(current_cycle < unsigned(period)) then
					current_cycle <= current_cycle + 1;
				-- if period is exceeded, reset and start the next repetition
				elsif(current_repeat < unsigned(repeat)) then
					current_repeat <= current_repeat + 1;
					current_cycle <= (others => '0');
				-- if all repetitions are completed reset and report "done"
				else		
					current_repeat <= (others => '0');
					current_cycle <= (others => '0');
					-- only report "done" when we're not surposed to stop
					if(stop /= zero) then
						end_of_cycle <= '1';
					end if;
				end if;
			end if;
		end if;
	end process;
	-- output high is still in within the value phase of the cycle
	output <= '1' when (current_cycle < unsigned(valu)) else '0';
	done <= end_of_cycle;
end arch;
