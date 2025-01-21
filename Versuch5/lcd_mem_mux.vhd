library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Memory multiplexer
-- selects the memory source depending in the requested address prefix
-- 
-- addr: the address to use for the selection
--
-- *_data: the data signals to multiplex
--
-- data: the data output from the selected source
entity lcd_mem_mux is
    port (
		addr: in std_logic_vector(7 downto 0);
		
		init_rom_data: in std_logic_vector(11 downto 0);
		gameboard_cmd_data: in std_logic_vector(11 downto 0);
			
		data: out std_logic_vector(11 downto 0)
    );
end entity lcd_mem_mux;

architecture arch of lcd_mem_mux is
begin
	process (addr, init_rom_data, gameboard_cmd_data) begin
		-- 0xxxxxxx => ROM
		if(addr(7) = '0') then
			data <= init_rom_data;
		-- 1xxxxxxx => game_board logic
		else
			data <= gameboard_cmd_data;
		end if;
	end process;
end architecture arch;