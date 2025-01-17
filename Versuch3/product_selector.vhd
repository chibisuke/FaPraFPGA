library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.constants.all;

-- Querys the selected product number, its price and its 
-- availability (based on available credits and remaining product count)
--
-- product_av: the availability vector of the products
-- sw: the hot-one encoded selection of the product
-- is_valid: is the input of sw in a valid hot-one state
--
-- price: the price of the currently selected product
-- product_number: the number of the selected product
-- product_available: information if the product is available
--   based on the availability vector.

entity product_selector is
	port(
		product_av: in std_logic_vector(7 downto 0);
		sw: in std_logic_vector(7 downto 0);
		is_valid: in std_logic;
		
		price: out unsigned(2 downto 0);
		product_number: out unsigned(3 downto 0);
		product_available: out std_logic
	);
end product_selector;

architecture arch of product_selector is
begin

	process (is_valid, sw, product_av)
	begin
		-- initalize the signals with a default, to prevent unwanted registers
		price <= unsigned'("000");
		product_available <= '0';
		product_number <= "0000";
		-- don't output anything if the selection is invalid
		if(is_valid = '1') then
			for i in 0 to 7 loop
				-- only for the selected product
				if (sw(i) = '1') then
					-- output the price, product number and availability
					price <= to_unsigned(PRICES(i), price'length);
					product_number <= to_unsigned(i+1, product_number'length);
					product_available <= product_av(i);
				end if;
			end loop;
		end if;
	end process;
end arch;
