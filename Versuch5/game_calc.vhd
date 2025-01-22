library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- This contains some precalculations to slim down the game_logic
-- and prevent the RTL Viewer from running havoc.
--
-- it calculates the field identifier of the diamond field, 
-- fetches its state
-- calculates the field the snake will move to
-- and fetches its state
-- and manages the global reset
--
-- clk: the clock to use
-- dir: the direction the snake is moving to next
-- addr_head: the address of the current snake head
-- board: the full board data
--
-- diamond_field_state: the state of the field the diamond is it
-- 	this is used to validate if the rng generated diamond field is
--    occupied or if it is a valid field to place the diamond
-- next_field: the location of the next field the snake head will be places at
-- next_field_state: the state of the field the snake head will be placed
-- 	this is used to check for game-over condition
-- next_is_diamond: true if next_field contains the diamond
--
-- rst: global reset signal
-- rstsig: reset input from the controls
-- lcd_init_done: signal telling the logic that the init of the LCD is completed
-- 	and the LCD can now accept writes
-- nhold: input to check if the game is stopped by the player
--
entity game_calc is
	port(
		clk: std_logic;
	
		dir: in work.types.direction;
		rng_value: in std_logic_vector(6 downto 0);
		addr_head: in std_logic_vector(7 downto 0);
		board: in work.types.tGameBoard;
		
		diamond_field_state: out std_logic;
		next_field: out std_logic_vector(7 downto 0);
		next_field_state: out std_logic;
		next_is_diamond: out std_logic;
		
		rst: out std_logic;
		rstsig: in std_logic;
		lcd_init_done: in std_logic;
		nhold: in std_logic
		
	);
end game_calc;

architecture arch of game_calc is
	signal next_field_offset: unsigned(7 downto 0);
	signal next_field_value: unsigned(7 downto 0);
	signal diamond_field_value: unsigned(7 downto 0);
	
	signal diamond_offset: unsigned(7 downto 0);
	
	signal next_field_next: std_logic_vector(7 downto 0);
	signal next_field_state_next: std_logic;
begin
	-- reset when the either the user triggers a reset, or (if the game is not on hold) when the LCD initializes
	rst <= rstsig or (lcd_init_done and nhold);

	-- the address of the diamond field
	diamond_field_value <= unsigned('0' & rng_value) + diamond_offset;
	
	-- Offset of the diamond field address relative to the rng_value
	-- this is calculated seperately to save a lot of adder circuits.
	-- The calculcated diamond_offset value is then used to calculcate diamond_field_value using a single adder
	process (rng_value) begin
		-- Note: remember display command addresses are offset by +1 for the
		-- set position command. 
		--
		-- on a CPU Using an integer division would be helpfull, but we don't have that here
		--
		-- range(diamond) := 0 ... 107
		-- line(1) := 0 - 17   => addr := 21 - 38
		-- line(2) := 18 - 35  => addr := 41 - 58
		-- line(3) := 36 - 53  => addr := 61 - 78
		-- line(4) := 54 - 71  => addr := 81 - 98
		-- line(5) := 72 - 89  => addr := 101 - 118
		-- line(6) := 90 - 107 => addr := 121 - 138
		--
		-- split the logic in half, to prevent the priority encoder from having to much depth
		if (unsigned(rng_value) < x"36") then -- line 1 - 3
			if(unsigned(rng_value) < x"12") then -- line 1
				diamond_offset <= x"15"; -- (+21)
			elsif(unsigned(rng_value) < x"24") then -- line 2
				diamond_offset <= x"17"; -- (+23)
			else -- line 3
				diamond_offset <= x"19"; -- (+25)
			end if;		
		else -- line 4 - 6 
			if(unsigned(rng_value) < x"48") then -- line 4
				diamond_offset <= x"1B"; -- (+27)
			elsif(unsigned(rng_value) < x"5A") then -- line 5
				diamond_offset <= x"1D"; -- (+29)
			else -- line 6
				diamond_offset <= x"1F"; -- (+31)
			end if;	
		end if;
		
	end process;
		
	-- fetch the state of the field the diamond is on from the board
	diamond_field_state <= board(to_integer(diamond_field_value));
	-- check if the field the diamond is on is the next field the snakes head
	-- will move to
	process(next_field_value, diamond_field_value) begin
		if(next_field_value = diamond_field_value) then
			next_is_diamond <= '1';
		else
			next_is_diamond <= '0';
		end if;
	end process;
	
	-- calculate the movement of the snake (+/- 1 line, +/1 1 cell)
	with dir select
		next_field_offset <=
			x"EC" when work.types.NORTH, -- -20
			x"14" when work.types.SOUTH, -- + 20
			x"FF" when work.types.WEST,  -- -1
			x"01" when work.types.EAST;  -- +1
	-- add the calculated offset seperatly to prevent instanciating the adder 4 times.
	next_field_value <= unsigned(addr_head) + next_field_offset;

	
	next_field_next <= std_logic_vector(next_field_value);
	-- fetch the value of the next field from the board
	next_field_state_next <= board(to_integer(next_field_value));	
	-- break the critical path to increate Fmax by around 15MHz
	-- without impacting the logic in any way
	process(clk) begin
		if(rising_edge(clk)) then
			next_field <= next_field_next;
			next_field_state <= next_field_state_next;
		end if;
	end process;
end arch;