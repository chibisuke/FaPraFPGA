library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.MATH_REAL.all;

-- an interval timer to take care of the game ticks
--
-- clk: the clock to use
-- nhold: (NOT) stop the clock
-- rst: (re)start the clock
-- tps: the ticks per interval (divider of the counters max value)
-- tick: output when the interval is over
entity interval_timer is
	generic (
		-- using Generics here, so we can reuse the timer entity with different timeouts
		-- but without creating any additional logic beside the instancing of the entity
		input_clk : integer := 50; -- in MHz
		timeout : integer := 1_000_000 -- in us 
	);	
	port(
		clk: in std_logic;
		nhold: in std_logic;
		tps: in std_logic_vector(2 downto 0);
		rst: in std_logic;
		
		tick: out std_logic
	);
end interval_timer;

architecture arch of interval_timer is
	 -- since we have the input clock frequency already in MHz, we can simply multiply
	 constant COUNTER_LIMIT: integer := input_clk*timeout;
	 -- number of bits needed to store the counter, calculated from the generic values
	 -- note: we can use log2 here, because this is calculated during synthesis, not at runtime
	 constant COUNTER_SIZE: integer := integer(ceil(log2(real(COUNTER_LIMIT))));
	 
	 type counter_limits is array(0 to 7) of integer;
	 -- the divisions there are calculated during compile time, so they won't generate any logic.
	 constant END_VALUES: counter_limits := (
		COUNTER_LIMIT,
		COUNTER_LIMIT / 2,
		COUNTER_LIMIT / 3,
		COUNTER_LIMIT / 4,
		COUNTER_LIMIT / 5,
		COUNTER_LIMIT / 6,
		COUNTER_LIMIT / 7,
		COUNTER_LIMIT / 8
    );
	 
	 -- counters to keep track of the number of clockcycles that happened
	 signal counter, counter_next: unsigned(COUNTER_SIZE downto 0);
	 signal counter_start, counter_start_next: unsigned(COUNTER_SIZE downto 0);
	 signal ticko, tick_next: std_logic;	
begin

	process (clk) begin
		if(rising_edge(clk)) then
			if(rst = '1') then
				counter_start <= counter_start_next;
				counter <= counter_start_next;
				ticko <= '0';
			elsif(nhold = '1') then
				counter <= counter_next;
				ticko <= tick_next;
			end if;
		end if;
	end process;
	-- a tick occured each time counter becomes negative
	-- since it will be reset in the next line, this will be high for only once clock cycle
	-- suppress if on hold
	tick_next <= counter(COUNTER_SIZE) and nhold;
	-- decrement the counter, reset if a tick occured
	counter_next <= counter - 1 when ticko = '0' else counter_start;
	-- copy the starting value, so it cannot be changed when the timer is running
	counter_start_next <= to_unsigned(END_VALUES(to_integer(unsigned(tps))), counter_start_next'length);
	tick <= ticko;
end arch;