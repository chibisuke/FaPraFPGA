library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- this entity aggregates all input preprocessing 
-- like edge detection, debouncing, ect.
--
-- clk: the clock to use
-- sw: the input switches
--		NOTE: sw(3) = sw9, because sw8 -  3 are not used
-- key: the 4 keys
-- trigger_update: backfeeding the update signal from the game logic
--		to know when a direction change was actually performed
-- sw9dbo: the debounced output signal of sw9 (which is the hold signal)
-- rst: the reset signal created from sw9
-- dir: the selected direction the snake should go to next

entity input is
	port(
		clk: in std_logic;
		
		key: in std_logic_vector(3 downto 0);
		sw: in std_logic_vector(3 downto 0);
		sw9dbo: out std_logic;
		
		dir: out work.types.direction;
		rst: out std_logic;
		
		trigger_update: in std_logic
	);
end input;

architecture arch of input is
	-- outputs of the edge detections
	signal key_trigger: std_logic_vector(3 downto 0);
	signal reset: std_logic;
	-- debounce outputs
	signal sw9db: std_logic;
begin
	-- input logic that does the directional processing
	logic: entity work.input_logic(arch) port map(clk=>clk, dir=>dir, rst=>reset, key_trigger=>key_trigger, trigger_update=>trigger_update);
	
	key0tr: entity work.edge_detect(arch) port map(clk=>clk, input=>key(0), edge=>key_trigger(0));
	key1tr: entity work.edge_detect(arch) port map(clk=>clk, input=>key(1), edge=>key_trigger(1));
	key2tr: entity work.edge_detect(arch) port map(clk=>clk, input=>key(2), edge=>key_trigger(2));
	key3tr: entity work.edge_detect(arch) port map(clk=>clk, input=>key(3), edge=>key_trigger(3));
	
	sw9dbounce: entity work.debounce(arch) port map(clk=>clk, input=>sw(3), output=>sw9db);
	sw9tr: entity work.edge_detect(arch) port map(clk=>clk, input=>not sw9db, edge=>reset);
	
	rst <= reset;
	sw9dbo <= sw9db;
end arch;