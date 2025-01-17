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
		
		lcd_sda: inout std_logic;
		lcd_scl: inout std_logic;
		lcd_reset: out std_logic
	);
end Versuch5;

architecture arch of Versuch5 is
	signal key1_trigger: std_logic := '0';
	signal key2_trigger: std_logic := '0';
	signal key3_trigger: std_logic := '0';
	signal key4_trigger: std_logic := '0';
	
	signal diamond: std_logic_vector(6 downto 0) := "0000000";
	signal game_board: work.types.tGameBoard;
	
	signal score: std_logic_vector(7 downto 0);
begin
	game: entity work.game(arch) port map(board=>game_board, n_rst=>'1', clk=>clk);
	lcd: entity work.lcd(arch) port map(clk=>clk, reset=>key1_trigger, sda=>lcd_sda, scl=>lcd_scl, lcd_reset=>lcd_reset, update_map=>key2_trigger, game_over=>key3_trigger,
		game_board=>game_board, diamond=>diamond, score=>score
	);

	key1ed: entity work.edge_detect port map(clk=>clk, input=>key(0), edge=>key1_trigger);
	key2ed: entity work.edge_detect port map(clk=>clk, input=>key(1), edge=>key2_trigger);
	key3ed: entity work.edge_detect port map(clk=>clk, input=>key(2), edge=>key3_trigger);
	key4ed: entity work.edge_detect port map(clk=>clk, input=>key(3), edge=>key4_trigger);
	--rng: entity work.rng(arch) port map(clk=>clk,permutate=>key1_trigger, q=>q(6 downto 0));
	h0: entity work.seven_segment(arch) port map(in4=>score(3 downto 0), hex=>hex0);
	h1: entity work.seven_segment(arch) port map(in4=>score(7 downto 4), hex=>hex1);
end arch;
