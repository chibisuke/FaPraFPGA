library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity game_logic is
	port(
		clk: in std_logic; --used
		tick: in std_logic; -- used
		rst: in std_logic; -- used
		dir: in work.types.direction;
		
		board: in work.types.tGameBoard; --used
		board_wr: out std_logic;
		board_wr_value: out std_logic;
		board_wr_addr: out std_logic_vector(7 downto 0);
		
		trigger_update: out std_logic; --used
		trigger_game_over: out std_logic; -- used
		score_inc: out std_logic; -- used
		
		diamond: out std_logic_vector(6 downto 0); -- used
		
		-- fifo:
		addr_head: in std_logic_vector(7 downto 0);
		addr_tail: in std_logic_vector(7 downto 0);
		fifo_in: out std_logic_vector(7 downto 0); --used
		fifo_shift: out std_logic; --used
		fifo_push: out std_logic; --used
		
		--rng:
		rng_value: in std_logic_vector(6 downto 0); --used
		permutate_rng: out std_logic; --used
		
		debug: out std_logic_vector(7 downto 0)
	);
end game_logic;

architecture arch of game_logic is
	type GAME_STATE is ( 
		INIT, RESET, RESET2, RESET3, VALIDATE_DIAMOND, WAIT_FOR_TICK, DO_TICK, REMOVE_TAIL, GAME_OVER
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
	
	
	signal diamond_field: unsigned(7 downto 0); --TODO
	signal next_field: unsigned(7 downto 0);
	
	signal next_field_offset: unsigned(7 downto 0);
begin
	
	process(clk, rst) begin
		if(rst = '1') then
			state <= RESET;
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
		end if;
	end process;
	
	process(state, state_next, board, next_field, tick, diamond_field, rst, addr_tail) begin
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
					state_next <= VALIDATE_DIAMOND;
					fifo_in_next <= x"46"; -- 70
					fifo_push_next <= '1';		
					permutate_rng_next <= '1';
				when VALIDATE_DIAMOND=>
					if(board(to_integer(diamond_field)) = '0')  then
						state_next <= WAIT_FOR_TICK;
						trigger_update_next <= '1';
					else
						permutate_rng_next <= '1';
					end if;
				when WAIT_FOR_TICK=>
					if(tick = '1') then
						state_next <= DO_TICK;
					end if;
				when DO_TICK=>
					state_next <= WAIT_FOR_TICK;
					if(board(to_integer(next_field)) = '1') then
						state_next <= GAME_OVER;
						trigger_game_over_next <= '1';
					else
						fifo_in_next <= std_logic_vector(next_field);
						fifo_push_next <= '1';
						board_wr_value_next <= '1';
						board_wr_next <= '1';
						board_wr_addr_next <= std_logic_vector(next_field);
						if(next_field = diamond_field) then
							state_next <= VALIDATE_DIAMOND;
							permutate_rng_next <= '1';
							score_inc_next <= '1';
						else
							state_next <= REMOVE_TAIL;

						end if;
					end if;
				WHEN REMOVE_TAIL=>
						board_wr_value_next <= '0';
						board_wr_next <= '1';
						board_wr_addr_next <= addr_tail;
						trigger_update_next <= '1';
						fifo_shift_next <= '1';
						state_next <= WAIT_FOR_TICK;
				when others=> -- GAME_OVER does nothing	
			end case;
	end process;
	
	diamond <= rng_value;
	
	-- TODO
	diamond_field <= '0' & unsigned(rng_value);
	
	with dir select
		next_field_offset <=
			x"EC" when work.types.NORTH, -- -20
			x"14" when work.types.SOUTH, -- + 20
			x"FF" when work.types.WEST,  -- -1
			x"01" when work.types.EAST;  -- +1
	next_field <= unsigned(addr_head) + next_field_offset;
	debug <= std_logic_vector(addr_tail);

end arch;