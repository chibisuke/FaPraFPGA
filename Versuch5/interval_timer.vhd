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
	 type state_type is (IDLE, WAITING, TRIGGERED);
	 
    signal state : state_type := IDLE;
	 signal state_next: state_type;
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
	 signal counter, counter_next: unsigned(COUNTER_SIZE-1 downto 0);
	 signal tick_next: std_logic;
	 
	 -- buffer to hold the TPS Value as long as the timer is running. 
	 -- a new tps value will only be accepted when the timer is on hold
	 signal ticksPerInterval, ticksPerInterval_next: std_logic_vector(2 downto 0);
	
begin

	process (clk) begin
		if(rising_edge(clk)) then
			ticksPerInterval <= ticksPerInterval_next;
			counter <= counter_next;
			tick <= tick_next;
			state <= state_next;
		end if;
	end process;

	process (state, counter, rst, ticksPerInterval, tps, nhold) begin
		tick_next <= '0';
		state_next <= state;
		ticksPerInterval_next <= ticksPerInterval;
		case state is 
			-- timer waiting to start
			when IDLE =>
				counter_next <= (others=>'0');
				-- start the timer
				-- this copies the tps value to a register, so the timer will not be effected by a change unless the timer is stopped first.
				if(rst = '1') then
					ticksPerInterval_next <= tps;
					state_next <= WAITING;
				end if;
			-- timer running
			when WAITING =>
				counter_next <= counter + 1;
				if(nhold = '0') then
					state_next <= IDLE;
				elsif(counter = END_VALUES(to_integer(unsigned(ticksPerInterval)))) then
					state_next <= TRIGGERED;
				end if;
			-- timer completed
			when TRIGGERED =>
				counter_next <= (others=>'0');
				tick_next <= '1';
				if(nhold = '0') then
					state_next <= IDLE;
				else
					state_next <= WAITING;
				end if;
		end case;				
	end process;

end arch;