library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity input is
	port(
		clk: in std_logic;
		
		key: in std_logic_vector(3 downto 0);
		sw: in std_logic_vector(3 downto 0);
		
		dir: out work.types.direction;
		rst: out std_logic;
		
		trigger_update: in std_logic
	);
end input;

architecture arch of input is
	signal key_trigger: std_logic_vector(3 downto 0);
	signal reset: std_logic;
begin
	logic: entity work.input_logic(arch) port map(clk=>clk, sw=>sw, dir=>dir, rst=>reset, key_trigger=>key_trigger, trigger_update=>trigger_update);
	
	key0tr: entity work.edge_detect(arch) port map(clk=>clk, input=>key(0), edge=>key_trigger(0));
	key1tr: entity work.edge_detect(arch) port map(clk=>clk, input=>key(1), edge=>key_trigger(1));
	key2tr: entity work.edge_detect(arch) port map(clk=>clk, input=>key(2), edge=>key_trigger(2));
	key3tr: entity work.edge_detect(arch) port map(clk=>clk, input=>key(3), edge=>key_trigger(3));
	sw9tr: entity work.edge_detect(arch) port map(clk=>clk, input=>not sw(3), edge=>reset);
	
	rst <= reset;
end arch;