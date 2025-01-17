library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity game_board is
	port(
		clk: in std_logic;
		
		board: out work.types.tGameBoard;
		
		field: in std_logic_vector(7 downto 0);
		setTo: in std_logic;
		wr: in std_logic;
		
		n_rst: in std_logic
	);
end game_board;

architecture arch of game_board is
	constant init_state: work.types.tGameBoard := 
		"11111111111111111111" &
		"10000000000000000001" &
		"10000000000000000001" &
		"10000000001110000001" &
		"10000000000000000001" &
		"10000000000000000001" &
		"10000000000000000001" &
		"11111111111111111111";
	signal board_data: work.types.tGameBoard := init_state;
	signal board_data_next: work.types.tGameBoard := init_state;

begin
	board <= board_data;
	
	process (clk, n_rst) begin
		if(n_rst = '0') then
			board_data <= init_state;
		elsif(rising_edge(clk)) then
			if(wr = '1') then
				board_data <= board_data_next;
			end if;			
		end if;	
	end process;
	
	process (board_data, setTo, field) begin
		board_data_next <= board_data;
		board_data_next(to_integer(unsigned(field))) <= setTo;
	end process;
end arch;