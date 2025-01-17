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
		temp_reg_data: in std_logic_vector(11 downto 0);
		char_reg_data: in std_logic_vector(11 downto 0);
			
		data: out std_logic_vector(11 downto 0)
    );
end entity lcd_mem_mux;

architecture arch of lcd_mem_mux is
begin
	process (addr, init_rom_data, temp_reg_data, char_reg_data) begin
		-- "0xxxxxxx" init_rom
		if(addr(7) = '0') then
			data <= init_rom_data;
		-- "10xxxxxx" temp_reg
		elsif(addr(6) = '0') then
			data <= temp_reg_data;
		-- "11xxxxxx" char_reg
		else
			data <= char_reg_data;
		end if;
	end process;
end architecture arch;