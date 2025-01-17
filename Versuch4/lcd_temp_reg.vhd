library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Memory mapped temperature data register
--
-- returns the command sequence required for the LCD
-- to update to the current temperature
--
-- clk: the clk to use
-- addr: the address requested
--
-- temp_bcd, temp_decimal: the temperature to embed in the commands
--
-- data: the created command
--
entity lcd_temp_reg is
    port (
		  clk: in std_logic;
		  
        addr: in std_logic_vector(2 downto 0);
		  
		  temp_bcd: in std_logic_vector(7 downto 0);
		  temp_decimal: in std_logic;
		  
		  data: out std_logic_vector(11 downto 0)
    );
end entity lcd_temp_reg;

architecture arch of lcd_temp_reg is
	signal data_out: std_logic_vector(11 downto 0);
	
	signal decimal_number: std_logic_vector(3 downto 0);
	signal digit_tenth: std_logic_vector(11 downto 0);
	signal digit_tens: std_logic_vector(11 downto 0);
	signal digit_once: std_logic_vector(11 downto 0);
begin
	process(clk, addr, temp_bcd, temp_decimal) begin
		if(rising_edge(clk)) then
			data <= data_out;
		end if;	
	end process;
	
	-- calculate digits
	decimal_number <= x"0" when temp_decimal = '0' else x"5";
	digit_tenth <= x"43" & decimal_number;
	digit_tens <= x"43" & temp_bcd(7 downto 4);
	digit_once <= x"43" & temp_bcd(3 downto 0);
	
	-- calculate output
	process(addr, digit_tens, digit_once, digit_tenth) begin
		case addr is
			WHEN "000" => 
				data_out <= x"0AC"; -- set position
			WHEN "001" =>
				data_out <= digit_tens; -- left BCD Digit
			WHEN "010" =>
				data_out <= digit_once; -- right BCD Digit
			WHEN "011" =>
				data_out <= x"42E"; -- "."
			WHEN "100" =>
				data_out <= digit_tenth; -- .0 / .5
			WHEN OTHERS =>
				data_out <= x"000";
		end case;
	end process;
end architecture arch;