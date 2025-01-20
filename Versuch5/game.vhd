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
		nhold: in std_logic;
		
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
	signal c0,c1: std_logic;
	signal random_bit: std_logic;
	
	signal next_field: std_logic_vector(7 downto 0);
	signal next_field_state: std_logic;
	signal next_is_diamond: std_logic;
	signal diamond_field_state: std_logic;
	
begin
	board <= gboard;
	gameboard: entity work.game_board(arch) port map(board=>gboard, rst=>rst, wr=>board_wr, setTo=>board_wr_value, field=>board_wr_addr, clk=>clk);
	fifo: entity work.fifo(arch) port map(clk=>clk,reset=>rst, data_head=>addr_head, data_tail=>addr_tail, shift=>fifo_shift, data_in=>fifo_in, push=>fifo_push,
			debug=>open
	);
	escore: entity work.bcd_sat_counter(arch) port map(clk=>clk, rst=>rst, q=>gscore, inc=>score_inc);

	pit: entity work.interval_timer(arch) generic map(TIMEOUT=>1_000_000) port map(clk=>clk, tps=>speed, nhold=>nhold, tick=>tick, rst=>rst);
	
	calc: entity work.game_calc(arch) port map(dir=>dir, addr_head=>addr_head, rng_value=>rng_value, board=>gboard,
		diamond_field_state=>diamond_field_state, next_field=>next_field, next_field_state=>next_field_state,
		next_is_diamond=>next_is_diamond
	);
	logic: entity work.game_logic(arch) port map(clk=>clk,
		dir=>dir, tick=>tick, rst=>rst,
		trigger_update=>trigger_update, trigger_game_over=>trigger_game_over,
		board_wr=>board_wr, board_wr_value=>board_wr_value, board_wr_addr=>board_wr_addr,
		addr_tail=>addr_tail, fifo_shift=>fifo_shift, fifo_push=>fifo_push, fifo_in=>fifo_in,
		score_inc=>score_inc,
		next_field=>next_field,
		permutate_rng=>permutate_rng,
		next_field_state=>next_field_state,
		diamond_field_state=>diamond_field_state,
		next_is_diamond=>next_is_diamond,
		
		debug=>open
	);
	
	diamond <= rng_value;
	score <= gscore;
	--score <= '0' & rng_value;
	
	rng: entity work.rng(arch) port map(clk=>clk, permutate=>permutate_rng, q=>rng_value, random_bit=>random_bit);
	pll: entity work.pll(syn) port map(areset=>'0', inclk0=>clk, c0=>c0, c1=>c1, locked=>open);
	entroy: entity work.entropy port map(clk=>clk, c0=>c0, c1=>c1, random_bit=>random_bit);
end arch;