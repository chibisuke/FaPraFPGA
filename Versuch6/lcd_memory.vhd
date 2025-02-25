library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- LCD Memory
-- This aggregated the ROM and the memory mapped registeres together with the multiplexer
-- that managed the memory access.
-- The goal here is to make the whole ROM/Mem Mapped REGs appear as a single continous memory
--
-- clk: the clock to use
-- addr: the requested address
-- data: the output data at the requested address.
--
-- display_data: the messurement data to be displayed
--
entity lcd_memory is
	port(
		clk: in std_logic;
		addr: in std_logic_vector(6 downto 0);
		data: out std_logic_vector(11 downto 0);
		
		display_data: in work.types.lcd_output_data
	);
end lcd_memory;

architecture arch of lcd_memory is
	signal init_rom_data: std_logic_vector(11 downto 0);

begin
	-- the M4K Emulated ROM that contains all the commands for init and gameOver, including information on where to place the score
	rom: entity work.lcd_init_rom(arch) port map(clk=>clk, addr=>addr, Q=>init_rom_data);
		
	-- the memory logic that inlines the display_data from the mem_test entity
	logic: entity work.lcd_mem_logic(arch) port map(data_in=>init_rom_data, data_out=>data, display_data=>display_data);
end arch;
