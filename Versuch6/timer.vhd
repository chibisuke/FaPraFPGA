library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.MATH_REAL.all;

-- reforced from Versuch 4 to not use FSM.

-- a simple timer circuit (now retriggerable)
-- 
-- generic: 
-- 	input_clk - the frequency of the clk in MHz. 
--    timeout - the time to count in us.
--
-- ports:
--   clk: the clk to use
--   start: trigger to start the clock. if set to '1' if the timer elapses, it repeats.
--   fire: zhe timer has fired
entity timer is
	generic (
		-- using Generics here, so we can reuse the timer entity with different timeouts
		-- but without creating any additional logic beside the instancing of the entity
		input_clk : integer := 50; -- in MHz
		timeout : integer := 100_000 -- in us 
	);	
	port(
		clk: in std_logic;
		start: in std_logic;
		fire: out std_logic
	);
end timer;

architecture arch of timer is	 
	 -- since we have the input clock frequency already in MHz, we can simply multiply
	 constant COUNTER_LIMIT: integer := input_clk*timeout;
	 -- number of bits needed to store the counter, calculated from the generic values
	 -- note: we can use log2 here, because this is calculated during synthesis, not at runtime
	 constant COUNTER_SIZE: integer := integer(ceil(log2(real(COUNTER_LIMIT))));
	 
	 -- counter registers
	 signal counter, counter_next: unsigned(COUNTER_SIZE downto 0);
	 -- time elapsed
	 signal fireo, fire_next: std_logic;
	 -- running state
	 signal running, running_next: std_logic;
	 
	 
begin
	process (clk) begin
		if(rising_edge(clk)) then
			running <= running_next;
			fireo <= fire_next;
			counter <= counter_next;
		end if;
	end process;
	-- time elapsed when counter is negative (MSB is set)
	fire_next <= counter(COUNTER_SIZE) and running;
	-- stop when triggered, otherwise keep running once start was set
	running_next <= not fireo and (running or start);
	-- decrement the counter - if retrigggered, reset to initial value
	counter_next <= counter - 1 when start = '0' else to_unsigned(COUNTER_LIMIT, counter_next'length);
	
	fire <= fireo;
end arch;