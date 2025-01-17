library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.constants.all;

-- this entity keep track of the available product count
--
-- clk: the clk to use
-- product_nr: the currently selected product in hot-one encoding
-- reset: resets the available product count to its initial value
-- buy: reduces the available product amount for the selected product by one
-- enable: a valid selection has been taken, so a buy action can be performed
--
-- product_count: the vector of product counts for each product
entity product_count is
	port(
		clk: in std_logic;
		product_nr: in std_logic_vector(7 downto 0);
		reset: in std_logic;
		buy: in std_logic;
		enable: in std_logic;
		product_count: out work.types.product_count_list
		
	);
end product_count;

architecture arch of product_count is
	signal product_count_current: work.types.product_count_list := (others=>INITIAL_PRODUCT_AMOUNT);
	signal product_count_next: work.types.product_count_list;
begin
	process(product_count_current, enable, buy, product_nr)
	begin
		-- when "buy" is set and a valid selection exists, decrement the product count of the
		-- selected product by one
		product_count_next <= product_count_current;
		if(enable = '1' and buy = '1') then
			for i in 0 to 7 loop
				if (product_nr(i) = '1') then
					product_count_next(i) <= product_count_current(i) - 1;
				end if;
			end loop;
		end if;
	end process;
	
	process (clk, reset)
	begin
		if(reset = '1') then
			-- reset product count to its initial value
			product_count_current <= (others=>INITIAL_PRODUCT_AMOUNT);
		elsif(rising_edge(clk)) then
			-- set product_count register using next logic
			product_count_current <= product_count_next;
		end if;
	end process;
	
	product_count <= product_count_current;
end arch;
