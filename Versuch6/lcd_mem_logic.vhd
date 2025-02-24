library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- 
-- Logic to post process the LCD Rom data to include
-- the data that are to be displayed
-- 
-- data_in: the selected data from the ROM
-- data_out: the post processed data
-- display_data: the data to insert into the display

entity lcd_mem_logic is
	port(
		data_in: in std_logic_vector(11 downto 0);
		data_out: out std_logic_vector(11 downto 0);
		display_data: in work.types.lcd_output_data
	);
end lcd_mem_logic;

architecture arch of lcd_mem_logic is
	subtype byte is std_logic_vector(7 downto 0);
	
	-- convert a 4 bit hexadecimal value into an ascii value
	-- to be used by the display
	function bin2asc(hexin: std_logic_vector(3 downto 0)) 
		return byte is
	begin
		if(unsigned(hexin) > 9) then
			return x"4" & std_logic_vector(unsigned(hexin) - 9);
		else
			return x"3" & hexin;
		end if;
	end function;
	
	signal index: integer range 0 to 31;
begin
	-- offset to select which halfbyte to use, multiplied by 4 (bitshift << 2)
	index <= to_integer(unsigned(data_in(3 downto 0) & "00"));

	process (data_in, display_data, index) begin
		case (data_in(9 downto 8)) is
			-- no flags set. Pass the output 1:1
			when "00" => data_out <= data_in;
			-- read and write time. bit 4 selects read/write, bit 0-3 select the index of the halfbyte to convert
			when "01" => 
				if(data_in(4) = '1') then
					data_out <= x"4" & bin2asc(display_data.read_time(index+3 downto index));
				else 
					data_out <= x"4" & bin2asc(display_data.write_time(index+3 downto index));
				end if;
			-- insert the clock cycle display as hex
			when "10" =>
				data_out <= x"4" & bin2asc(display_data.clock_cycles(index+3 downto index));
			-- insert the error status
			when "11" =>
				if(display_data.read_error = '1') then
					-- "J"
					data_out <= x"44A";
				else 
					-- "N"
					data_out <= x"44E";
				end if;
		end case;
	end process;
end arch;
