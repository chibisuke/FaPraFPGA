library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.constants.all;

-- Product selector logic of the vending machine
--
-- this entity ties all the string of the product management together. 

-- sw(7 downto 0) select a product in hot-one encoding
-- buy: trigger the purchase (and reduce the product count by one)
-- 	  buy is only permitted of "product_available" is true.
--		  behavior for unavailable product is undefined
-- reset: reset the product state (refill the vending machine)
-- current_credit: the current number of credits that has been put in the vending machine
--			required to calculate product availability based on the credits
--
-- price: price of the selected product that can be purchased
-- product_number: the slot number of the selected product
-- pruduct_availble: info if a product is available using the current credit and
--		the current availability count of the product
--
-- invalid_selection: no product is selected or input is not a hot-one encoded value
-- product_availability: vector that shows the availability of all 8 products, so we 
--		can directly display them on ledg
entity product_mgmt is
	port(
		clk: in std_logic;
		sw: in std_logic_vector(7 downto 0);
		buy: in std_logic;
		reset: in std_logic;
		current_credit: in unsigned(3 downto 0);
		
		price: out unsigned(2 downto 0);
		product_number: out unsigned(3 downto 0);
		product_available: out std_logic;
		
		invalid_selection: out std_logic;
		product_availability: out std_logic_vector(7 downto 0)		
	);
end product_mgmt;

architecture arch of product_mgmt is

	-- array of available product counts
	signal product_count: work.types.product_count_list := (others=>INITIAL_PRODUCT_AMOUNT);
	
	-- vailidity status of the input, so we don't calculcate it 3 times
	signal is_valid: std_logic;
	signal product_av: std_logic_vector(7 downto 0)	;
begin
	prod_avail: entity work.product_availability(arch) port map(current_credit=>current_credit, product_count=>product_count, product_av=>product_av);
	prod_cnt: entity work.product_count(arch) port map(clk=>clk,product_nr=>sw,enable=>is_valid,reset=>reset,buy=>buy,product_count=>product_count);
	prod_sel: entity work.product_selector(arch) port map(product_av=>product_av, sw=>sw, is_valid=>is_valid, price=>price, 
		product_number=>product_number, product_available=>product_available);
	prod_valid: entity work.product_input_validation(arch) port map(is_valid=>is_valid, sw=>sw, is_invalid=>invalid_selection);

	product_availability <= product_av;
end arch;
