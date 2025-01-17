library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity game is
	port(
		clk: in std_logic;
		
		board: out work.types.tGameBoard;
		
		
		n_rst: in std_logic
	);
end game;

architecture arch of game is
	signal addr_head: std_logic_vector(7 downto 0);
	signal addr_tail: std_logic_vector(7 downto 0);
	
	signal fifo_shift: std_logic;
	signal fifo_push: std_logic;
	signal fifo_in: std_logic_vector(7 downto 0);
	
	signal score: std_logic_vector(7 downto 0);
	signal score_inc: std_logic;
	
begin
	gameboard: entity work.game_board(arch) port map(board=>board, n_rst=>n_rst, wr=>'0', setTo=>'0', field=>(others=>'0'), clk=>clk);
	fifo: entity work.fifo(arch) port map(clk=>clk,n_reset=>n_rst, data_head=>addr_head, data_tail=>addr_tail, shift=>fifo_shift, data_in=>fifo_in, push=>fifo_push);
	gscore: entity work.bcd_sat_counter(arch) port map(clk=>clk, n_rst=>n_rst, q=>score, inc=>score_inc);
end arch;