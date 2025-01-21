library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- the GameBoard that holds the status of each field 
-- the board consists of a bitfield that starting at the
-- top right corner of the screen and repesenting the
-- playfield line by line. Each field is one bit. 
-- where 1 means occupied, and 0 means free.
-- the border is part of the playfield.
--
-- clk: the clock to use
-- board: the whole playfield as a big 160 bit bitfield
-- 
-- field: the address of the field to modify
-- setTo: the value the field should be changed to
-- wr: trigger the modification of the bit.
--
-- rst: reset the playfield to its initial state.

entity game_board is
	port(
		clk: in std_logic;
		
		board: out work.types.tGameBoard;
		
		field: in std_logic_vector(7 downto 0);
		setTo: in std_logic;
		wr: in std_logic;
		
		rst: in std_logic
	);
end game_board;

architecture arch of game_board is
	-- initial state doesn't contain first 21 and last 21 ones.
	constant INIT_STATE: std_logic_vector(0 to 117) := 
		 "0000000000000000001" &
		"10000000000000000001" &
		"10000000111000000001" &
		"10000000000000000001" &
		"10000000000000000001" &
		"1000000000000000000";
		
	-- board data register to hold the data
	signal board_data: std_logic_vector(0 to 117) := INIT_STATE;
	signal board_data_next: std_logic_vector(0 to 117) := INIT_STATE;

begin
	-- To save on registers we're not storing the first and last
	-- 21 bits (so 42 bit in total) in the board_state register, but
	-- are still concatenating them to the output. 
	board <= "111111111111111111111" & board_data & "111111111111111111111";
	
	process (clk, rst) begin
		if(rst = '1') then
			board_data <= INIT_STATE;
		elsif(rising_edge(clk)) then
			if(wr = '1') then
				board_data <= board_data_next;
			end if;			
		end if;	
	end process;
	
	-- update the board data register
	process (board_data, setTo, field) begin
		board_data_next <= board_data;
		board_data_next(to_integer(unsigned(field))-21) <= setTo;
	end process;
end arch;