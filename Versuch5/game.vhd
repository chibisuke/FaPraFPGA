library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity game is
	port(
		clk: in std_logic;
		
		board: out work.types.tGameBoard;
		score: out std_logic_vector(7 downto 0);
		
		diamond: out std_logic_vector(6 downto 0) := "0000000";
		speed: in std_logic_vector(2 downto 0);
		trigger_update: out std_logic := '0';
		trigger_game_over: out std_logic := '0';
		dir: in work.types.direction;
		hold: in std_logic;
		
		rst: in std_logic
	);
end game;

architecture arch of game is
	signal addr_head: std_logic_vector(7 downto 0);
	signal addr_tail: std_logic_vector(7 downto 0);
	
	signal fifo_shift: std_logic;
	signal fifo_push: std_logic;
	signal fifo_in: std_logic_vector(7 downto 0);
	
	signal gscore: std_logic_vector(7 downto 0);
	signal score_inc: std_logic;
	
	signal gboard: work.types.tGameBoard;
	signal board_wr: std_logic;
	signal board_wr_value: std_logic;
	signal board_wr_addr: std_logic_vector(7 downto 0);
	
	signal permutate_rng: std_logic;
	signal rng_value: std_logic_vector(6 downto 0);
	
	signal tick: std_logic;
	
begin
	board <= gboard;
	gameboard: entity work.game_board(arch) port map(board=>gboard, rst=>rst, wr=>board_wr, setTo=>board_wr_value, field=>board_wr_addr, clk=>clk);
	fifo: entity work.fifo(arch) port map(clk=>clk,reset=>rst, data_head=>addr_head, data_tail=>addr_tail, shift=>fifo_shift, data_in=>fifo_in, push=>fifo_push);
	escore: entity work.bcd_sat_counter(arch) port map(clk=>clk, rst=>rst, q=>gscore, inc=>score_inc);
	rng: entity work.rng(arch) port map(clk=>clk, permutate=>permutate_rng, q=>rng_value);
	pit: entity work.pit(arch) port map(clk=>clk, tps=>speed, hold=>hold, tick=>tick, rst=>rst);
	
	logic: entity work.game_logic(arch) port map(clk=>clk,
		dir=>dir, tick=>tick, hold=>hold, rst=>rst,
		diamond=>diamond, trigger_update=>trigger_update, trigger_game_over=>trigger_game_over,
		board=>gboard, board_wr=>board_wr, board_wr_value=>board_wr_value, board_wr_addr=>board_wr_addr,
		addr_head=>addr_head, addr_tail=>addr_tail, fifo_shift=>fifo_shift, fifo_push=>fifo_push, fifo_in=>fifo_in,
		score_inc=>score_inc,
		rng_value=>rng_value,
		permutate_rng=>permutate_rng
	);
	
	score <= gscore;
end arch;