library ieee;
library work;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.types.all;

-- logic to process the direction selection
--
-- clk: the clock to use
-- key_trigger: the edges of the key switches to select the direction
-- rst: reset signal - resets the direction to EAST
-- dir: the directional output
-- trigger_update: signal that a tick was processed, so the current direction
--		was applied

entity input_logic is
	port(
		clk: in std_logic;
		
		key_trigger: in std_logic_vector(3 downto 0);
		rst: in std_logic;
		
		dir: out work.types.direction;
		trigger_update: in std_logic
	);
end input_logic;

architecture arch of input_logic is
	signal prev_direction: direction := EAST;
	signal direction: direction := EAST;
	signal direction_next: work.types.direction := EAST;
begin
	dir <= direction;
	
	-- choose new directional signal based on input and previous direction
	process (key_trigger, rst, direction, prev_direction) begin
		direction_next <= direction;
		if(rst = '1' or (key_trigger(0) = '1' and prev_direction /= WEST)) then 
			direction_next <= EAST;
		elsif(key_trigger(1) = '1' and prev_direction /= SOUTH) then
			direction_next <= NORTH;
		elsif(key_trigger(2) = '1' and prev_direction /= NORTH) then
			direction_next <= SOUTH;
		elsif(key_trigger(3) = '1' and prev_direction /= EAST) then
			direction_next <= WEST;
		end if;		
	end process;
	
	process(clk) begin
		if(rising_edge(clk)) then
			direction <= direction_next;
			-- store old direction, so we can determine if the new direction is valid
			if(trigger_update = '1') then
				prev_direction <= direction_next;
			end if;
		end if;	
	end process;
end arch;