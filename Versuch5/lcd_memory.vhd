library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- LCD Memory
-- This aggregated the ROM and the memory mapped registeres together with the multiplexer
-- that managed the memory access.
-- The goal here is to make the whole ROM/Mem Mapped REGs appear as a single continous memory
--
-- NOTE: Access time for some of the memory ranges is 2 clock cycles!
-- 	Accessing the memory during the first clock cycle after a change of the address
--		is unsupported any may result in wrong data being read. 
--
-- Address Ranges:
--		x00 - x3f: init sequence of the LCD
--		[x40 - x7f: reserved for internal use (contains the raw char rom data)]
--		x80 - x87: the temperature update sequence
--		[x88 - xBF: unused (will read the temperature registers in a loop)]
--		xC0 - xff: the char update sequence
--
-- clk: the clock to use
-- addr: the requested address
-- data: the output data at the requested address.
--
-- temp_bcd, temp_dec: the temperature input for the memory mapped temperature registers
-- char: the char input for the memory mapped char registeres
--
entity lcd_memory is
	port(
		clk: in std_logic;
		addr: in std_logic_vector(7 downto 0);
		data: out std_logic_vector(11 downto 0);
		
		game_board: in work.types.tGameBoard;
		diamond: in std_logic_vector(6 downto 0);
		score: in std_logic_vector(7 downto 0)
	);
end lcd_memory;

architecture arch of lcd_memory is
	signal init_rom_data: std_logic_vector(11 downto 0);
	signal init_rom_data_with_score: std_logic_vector(11 downto 0);
	signal gameboard_cmd_data: std_logic_vector(11 downto 0);
	

begin
	-- the M4K Emulated ROM that contains all the commands, including information on where to place char data in the char_reg.
	-- 	NOTE: char rom internal address range is x40 - x7f
	rom: entity work.lcd_init_rom(arch) port map(clk=>clk, addr=>addr(6 downto 0), Q=>init_rom_data);
	
	gameboard_reader: entity work.lcd_mem_gameboard_reader(arch) port map(clk=>clk, board=>game_board, addr=>addr(6 downto 0), q=>gameboard_cmd_data,
		diamond=>diamond
	);
	
	-- the multiplexer selecting the memory source based on the address
	mem_mux: entity work.lcd_mem_mux(arch) port map(addr=>addr, init_rom_data=>init_rom_data_with_score, gameboard_cmd_data=>gameboard_cmd_data, data=>data);
	
	lcd_mem_scorelogic: entity work.lcd_mem_scorelogic(arch) port map(score=>score, rom_data=>init_rom_data, q=>init_rom_data_with_score);
end arch;
