library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.MATH_REAL.all;

-- a simple timer circuit
-- 
-- generic: 
-- 	input_clk - the frequency of the clk in MHz. 
--    timeout - the time to count in us.
--
-- ports:
--   clk: the clk to use
--   start: trigger to start the clock. if set to '1' if the timer elapses, it repeats.
--   fire: 
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
	 type state_type is (IDLE, WAITING, TRIGGERED);
	 
    signal state : state_type := IDLE;
	 signal state_next: state_type;
	 
	 -- since we have the input clock frequency already in MHz, we can simply multiply
	 constant COUNTER_LIMIT: integer := input_clk*timeout;
	 -- number of bits needed to store the counter, calculated from the generic values
	 -- note: we can use log2 here, because this is calculated during synthesis, not at runtime
	 constant COUNTER_SIZE: integer := integer(ceil(log2(real(COUNTER_LIMIT))));
	 
	 signal counter, counter_next: unsigned(COUNTER_SIZE-1 downto 0);
	 signal fire_next: std_logic;
	 
	 
begin
	process (clk) begin
		if(rising_edge(clk)) then
			counter <= counter_next;
			fire <= fire_next;
			state <= state_next;
		end if;
	end process;

	process (state, counter, start) begin
		fire_next <= '0';
		state_next <= state;
		case state is 
			-- timer waiting to start
			when IDLE =>
				counter_next <= (others=>'0');
				if(start = '1') then
					state_next <= WAITING;
				end if;
			-- timer running
			when WAITING =>
				counter_next <= counter + 1;
				if(counter = COUNTER_LIMIT) then
					state_next <= TRIGGERED;
				end if;
			-- timer completed
			when TRIGGERED =>
				counter_next <= (others=>'0');
				fire_next <= '1';
				state_next <= IDLE;
		end case;				
	end process;


end arch;
