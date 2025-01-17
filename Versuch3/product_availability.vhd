library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.constants.all;

-- calculates the product availability based on the
-- currently remaining product cound and its price and available credit
--
-- current_credit: the currently avaiable credit
-- product_count: the remaining product count vector
--
-- product_av: the availability vector of the products

entity product_availability is
	port(
		current_credit: in unsigned(3 downto 0);
		product_count: in work.types.product_count_list;
		product_av: out std_logic_vector(7 downto 0)
	);
end product_availability;

architecture arch of product_availability is
begin
	process (current_credit, product_count)
	begin
		-- calulate the availability status of all products
		for i in 0 to 7 loop
			-- PRICES(i) - 1 is treated as a constant, so it doesn't create extra logic
			if(product_count(i) > "000" and current_credit > (PRICES(i)-1)) then
				product_av(i) <= '1';
			else
				product_av(i) <= '0';
			end if;
		end loop;	
	end process;

end arch;
