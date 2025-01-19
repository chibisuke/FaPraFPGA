--******************************************************
--Versuch:
--Name:
--Matrikel-Nr.:
--Zeitbedarf:
--******************************************************

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Versuch5 is
	port(
		clk: in std_logic;
		hex0: out std_logic_vector(6 downto 0);
		hex1: out std_logic_vector(6 downto 0);
		key: in std_logic_vector(3 downto 0);
		-- sw9 = sw(3) - otherwise we would need to do something with sw8-4
		sw: in std_logic_vector(3 downto 0);
		
		ledr: out std_logic_vector(9 downto 0);
		
		lcd_sda: inout std_logic;
		lcd_scl: inout std_logic;
		lcd_reset: out std_logic
	);
end Versuch5;

architecture arch of Versuch5 is	
	signal diamond: std_logic_vector(6 downto 0);
	signal game_board: work.types.tGameBoard;
	signal trigger_update: std_logic;
	signal trigger_game_over: std_logic;
	
	signal score: std_logic_vector(7 downto 0);
	
	signal dir: work.types.direction;
	signal rst: std_logic;
	signal hold: std_logic;
	signal speed: std_logic_vector(2 downto 0);
begin
	game: entity work.game(arch) port map(board=>game_board, rst=>rst, clk=>clk, score=>score, diamond=>diamond,
		trigger_update=>trigger_update, trigger_game_over=>trigger_game_over,
		dir=>dir, nhold=>sw(3), speed=>sw(2 downto 0)
	);
	lcd: entity work.lcd(arch) port map(clk=>clk, reset=>'0', sda=>lcd_sda, scl=>lcd_scl, lcd_reset=>lcd_reset, update_map=>trigger_update, game_over=>trigger_game_over,
		game_board=>game_board, diamond=>diamond, score=>score
	);
	
	input: entity work.input(arch) port map(clk=>clk, key=>key, sw=>sw, dir=>dir, rst=>rst);

	
	h0: entity work.seven_segment(arch) port map(in4=>score(3 downto 0), hex=>hex0);
	h1: entity work.seven_segment(arch) port map(in4=>score(7 downto 4), hex=>hex1);
	
	with dir select
		ledr(3 downto 0) <= 
			"0001" when work.types.NORTH,
			"0010" when work.types.SOUTH,
			"0100" when work.types.WEST,
			"1000" when work.types.EAST;
end arch;
