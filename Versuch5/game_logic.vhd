library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- this is the core logic of the game_logic
--
-- clk: the clock to use
-- tick: its time for a new game tick
-- rst: reset the game to its initial state
--
-- board_wr, board_wr_value, board_wr_addr: connections to the game board
--
-- trigger_update: signal that a tick was completely processed
-- trigger_game_over: signal that the game over condition was met
--
-- score_inc: increase the game score
--
-- diamond_field_state: the state of the field the rng selected the diamond to be on
-- 	this is only relevant when a new RNG value was created and is not yet validated
-- next_field: the address of the next field the head will move to
-- next_field_state: the state of that field
-- next_is_diamond: the next field contains the diamond
--
-- addr_tail: the address of the snakes tail
-- fifo_in, fifo_shift, fifo_push: signals to update the snake fifo
-- snake_length: the current length of the snake
--		used to determine if we have reached the maxmimum length
--
-- permutate_rng: trigger the RNG to create a new diamond value
-- 
entity game_logic is
	port(
		clk: in std_logic; 
		tick: in std_logic; 
		rst: in std_logic; 
		
		board_wr: out std_logic;
		board_wr_value: out std_logic;
		board_wr_addr: out std_logic_vector(7 downto 0);
		
		trigger_update: out std_logic;
		trigger_game_over: out std_logic; 
		score_inc: out std_logic; 
		
		diamond_field_state: in std_logic; 
		next_field: in std_logic_vector(7 downto 0);
		next_field_state: in std_logic;
		next_is_diamond: in std_logic;
		
		addr_tail: in std_logic_vector(7 downto 0);
		fifo_in: out std_logic_vector(7 downto 0);
		fifo_shift: out std_logic; 
		fifo_push: out std_logic; 
		snake_length: in std_logic_vector(5 downto 0);
		
		permutate_rng: out std_logic
	);
end game_logic;

architecture arch of game_logic is
	type GAME_STATE is ( 
		INIT, RESET, RESET2, RESET3, WAIT_DIAMOND, VALIDATE_DIAMOND, WAIT_FOR_TICK, DO_TICK, REMOVE_TAIL, GAME_OVER
	);
	
	signal state, state_next: GAME_STATE := INIT;

	signal fifo_in_next: std_logic_vector(7 downto 0);
	signal fifo_push_next: std_logic;
	signal permutate_rng_next: std_logic;
	signal trigger_update_next: std_logic;
	signal trigger_game_over_next: std_logic;
	signal score_inc_next: std_logic;
	signal fifo_shift_next: std_logic;
	signal board_wr_next: std_logic;
	signal board_wr_value_next: std_logic;
	signal board_wr_addr_next: std_logic_vector(7 downto 0);
	signal new_diamond, new_diamond_next: std_logic;
	signal fields_to_keep, fields_to_keep_next: unsigned(3 downto 0);
begin
	
	process(clk, rst) begin
		if(rst = '1') then
			state <= RESET;
			fields_to_keep <= x"0";
		elsif(rising_edge(clk)) then
			state <= state_next;	
			fifo_in <= fifo_in_next;		
			fifo_push <= fifo_push_next;
			permutate_rng <= permutate_rng_next;
			trigger_update <= trigger_update_next;
			trigger_game_over <= trigger_game_over_next;
			score_inc <= score_inc_next;
			fifo_shift <= fifo_shift_next;
			board_wr <= board_wr_next;
			board_wr_addr <= board_wr_addr_next;
			board_wr_value <= board_wr_value_next;
			new_diamond <= new_diamond_next;
			fields_to_keep <= fields_to_keep_next;
		end if;
	end process;
	
	process(state, state_next, next_is_diamond, diamond_field_state, next_field, tick, rst, addr_tail, next_field_state, snake_length, new_diamond, fields_to_keep) begin
			state_next <= state;
			fifo_push_next <= '0';
			fifo_in_next <= x"00";
			permutate_rng_next <= '0';
			trigger_update_next <= '0';
			trigger_game_over_next <= '0';
			score_inc_next <= '0';
			fifo_shift_next <= '0';
			board_wr_next <= '0';
			board_wr_value_next <= '0';
			board_wr_addr_next <= x"00";
			new_diamond_next <= '0';
			fields_to_keep_next <= fields_to_keep;
			case state is 
				when INIT =>
					if(rst = '1') then
						state_next <= RESET;
					end if;
				when RESET=>
					if(rst = '0') then
						state_next <= RESET2;
						fifo_in_next <= x"44"; -- 68
						fifo_push_next <= '1';
					end if;
				when RESET2=>
					state_next <= RESET3;
					fifo_in_next <= x"45"; -- 69
					fifo_push_next <= '1';
				when RESET3=>
					state_next <= WAIT_DIAMOND;
					fifo_in_next <= x"46"; -- 70
					fifo_push_next <= '1';		
					permutate_rng_next <= '1';
				when WAIT_DIAMOND =>
					state_next <= VALIDATE_DIAMOND;
				when VALIDATE_DIAMOND=>
					if(diamond_field_state = '0')  then
						state_next <= WAIT_FOR_TICK;
						trigger_update_next <= '1';
					else
						state_next <= WAIT_DIAMOND;
						permutate_rng_next <= '1';
					end if;
				when WAIT_FOR_TICK=>
					if(tick = '1') then
						state_next <= DO_TICK;
					end if;
				when DO_TICK=>
					state_next <= WAIT_FOR_TICK;
					if(next_field_state = '1') then -- <--
						state_next <= GAME_OVER;
						trigger_game_over_next <= '1';
					else
						fifo_in_next <= next_field;
						fifo_push_next <= '1';
						board_wr_value_next <= '1';
						board_wr_next <= '1';
						board_wr_addr_next <= next_field;
						if(next_is_diamond = '1') then
							if((unsigned(snake_length) + fields_to_keep) > 32) then
								state_next <= REMOVE_TAIL;
								new_diamond_next <= '1';
							else 
								state_next <= WAIT_DIAMOND;
								fields_to_keep_next <= fields_to_keep + 2;
							end if;
							permutate_rng_next <= '1';
							score_inc_next <= '1';
						elsif(fields_to_keep = x"0") then
							state_next <= REMOVE_TAIL;
						else 
							fields_to_keep_next <= fields_to_keep - 1;
							state_next <= WAIT_FOR_TICK;
							trigger_update_next <= '1';
						end if;
					end if;
				WHEN REMOVE_TAIL=>
					board_wr_value_next <= '0';
					board_wr_next <= '1';
					board_wr_addr_next <= addr_tail;
					trigger_update_next <= '1';
					fifo_shift_next <= '1';
					state_next <= WAIT_FOR_TICK;
					if(new_diamond = '1') then
						state_next <= VALIDATE_DIAMOND;
					end if;
				when others=> -- GAME_OVER does nothing	
			end case;
	end process;
end arch;