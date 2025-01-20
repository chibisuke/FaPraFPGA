library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity game_calc is
	port(
		dir: in work.types.direction;
		rng_value: in std_logic_vector(6 downto 0);
		addr_head: in std_logic_vector(7 downto 0);
		board: in work.types.tGameBoard;
		
		diamond_field_state: out std_logic;
		next_field: out std_logic_vector(7 downto 0);
		next_field_state: out std_logic;
		next_is_diamond: out std_logic
		
	);
end game_calc;

architecture arch of game_calc is
	signal next_field_offset: unsigned(7 downto 0);
	signal next_field_value: unsigned(7 downto 0);
	signal diamond_field_value: unsigned(7 downto 0);
	
	signal diamond_offset: unsigned(7 downto 0);
begin
	-- TODO
	diamond_field_value <= unsigned('0' & rng_value) + diamond_offset;
	
	process (rng_value) begin
		-- Note: remember display command addresses are offset by +1 for the
		-- set position command. 
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
				diamond_offset <= x"1B"; -- (-27)
			elsif(unsigned(rng_value) < x"5A") then -- line 5
				diamond_offset <= x"1D"; -- (-29)
			else -- line 6
				diamond_offset <= x"1F"; -- (-31)
			end if;	
		end if;
		
	end process;
	
	
	
	
	
	
	diamond_field_state <= board(to_integer(diamond_field_value));
	process(next_field_value, diamond_field_value) begin
		if(next_field_value = diamond_field_value) then
			next_is_diamond <= '1';
		else
			next_is_diamond <= '0';
		end if;
	end process;
	
	with dir select
		next_field_offset <=
			x"EC" when work.types.NORTH, -- -20
			x"14" when work.types.SOUTH, -- + 20
			x"FF" when work.types.WEST,  -- -1
			x"01" when work.types.EAST;  -- +1
	next_field_value <= unsigned(addr_head) + next_field_offset;
	next_field <= std_logic_vector(next_field_value);
	next_field_state <= board(to_integer(next_field_value));
end arch;