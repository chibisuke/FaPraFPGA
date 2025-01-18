library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity game_logic is
	port(
		clk: in std_logic;
		tick: in std_logic;
		hold: in std_logic;
		rst: in std_logic;
		dir: in work.types.direction;
		
		board: in work.types.tGameBoard;
		board_wr: out std_logic;
		board_wr_value: out std_logic;
		board_wr_addr: out std_logic_vector(7 downto 0);
		
		trigger_update: out std_logic;
		trigger_game_over: out std_logic;
		score_inc: out std_logic;
		
		diamond: out std_logic_vector(6 downto 0);
		
		-- fifo:
		addr_head: in std_logic_vector(7 downto 0);
		addr_tail: in std_logic_vector(7 downto 0);
		fifo_in: out std_logic_vector(7 downto 0);
		fifo_shift: out std_logic;
		fifo_push: out std_logic;
		
		--rng:
		rng_value: in std_logic_vector(6 downto 0);
		permutate_rng: out std_logic
		
		
	);
end game_logic;

architecture arch of game_logic is
	signal dia: std_logic_vector(6 downto 0) := "0000000";
begin
	diamond <= dia;
	

end arch;