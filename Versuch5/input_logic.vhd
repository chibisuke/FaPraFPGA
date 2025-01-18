library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity input_logic is
	port(
		clk: in std_logic;
		
		key_trigger: in std_logic_vector(3 downto 0);
		rst: in std_logic;
		sw: in std_logic_vector(3 downto 0);
		
		dir: out work.types.direction
	);
end input_logic;

architecture arch of input_logic is
	signal direction, direction_next: work.types.direction;
begin
	dir <= direction;
	
	process (key_trigger, rst, direction) begin
		direction_next <= direction;
		if(rst = '1' or key_trigger(0) = '1' ) then 
			direction_next <= work.types.EAST;
		elsif(key_trigger(1) = '1') then
			direction_next <= work.types.NORTH;
		elsif(key_trigger(2) = '1') then
			direction_next <= work.types.SOUTH;
		elsif(key_trigger(3) = '1') then
			direction_next <= work.types.WEST;
		end if;		
	end process;
	
	process(clk) begin
		if(rising_edge(clk)) then
			direction <= direction_next;
		end if;	
	end process;
end arch;