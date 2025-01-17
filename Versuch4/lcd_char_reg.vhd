library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- LCD Character register
-- takes the command from the LCD ROM and transform ist to include the character data
--
-- NOTE: We could do this in combinatorial logic, but this would dramatically increate the
--    max critical path, so I opted to spend an additional clock cycle here to keep the
--    operating frequency up. 
--		Disadvantage: Reading from this memory range has an access time of 2 clock cycles instead of one.
--
-- clk: the clock to use
-- rom_data: the rom data to postprocess
-- char: the char data to include
-- data: the modified output data
entity lcd_char_reg is
    port (
		  clk: in std_logic;
		  
        rom_data: in std_logic_vector(11 downto 0);
		  char: in std_logic_vector(7 downto 0);
		  
		  data: out std_logic_vector(11 downto 0)
    );
end entity lcd_char_reg;

architecture arch of lcd_char_reg is
	signal data_out: std_logic_vector(11 downto 0);
	signal tr_char: std_logic_vector(7 downto 0);
	signal hex_h: std_logic_vector(7 downto 0);
	signal hex_l: std_logic_vector(7 downto 0);
	
begin
	process(clk, rom_data, tr_char) begin
		if(rising_edge(clk)) then
			data <= data_out;
		end if;	
	end process;
	
	-- limit range of the input character for ascii usage
	tr_char <= char when char(6 downto 5) /= "00" and char(7) = '0' else x"7F";
	
	-- pre-calculate hex output
	process (char) begin
		if(unsigned(char(7 downto 4)) > "1001") then
			hex_h <= x"4" & std_logic_vector(unsigned(char(7 downto 4)) - "1001");
		else
			hex_h <= x"3" & char(7 downto 4);
		end if;
		if(unsigned(char(3 downto 0)) > "1001") then
			hex_l <= x"4" & std_logic_vector(unsigned(char(3 downto 0)) - "1001");
		else
			hex_l <= x"3" & char(3 downto 0);
		end if;
	end process;
	
	-- calculate output
	process(rom_data, tr_char, hex_h, hex_l, char) begin
		-- this depends on the 2 unused control bits in the command word
		case rom_data(9 downto 8) is
			-- Direct output, no postprocessing
			WHEN "00" => data_out <= rom_data;
			-- replaced with hex representation of the requested nible
			WHEN "01" => 
				if(rom_data(2) = '1') then
					data_out <= x"4" & hex_h;
				else
					data_out <= x"4" & hex_l;
				end if;
			-- replaced with a binary representation of the selected bit
			WHEN "10" => data_out <= x"43" & "000" & char(to_integer(unsigned(rom_data(3 downto 0))));
			-- the selected char as ascii code
			WHEN "11" => data_out <= x"4" & tr_char;
		end case;
	end process;
end architecture arch;