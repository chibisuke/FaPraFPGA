library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- this package contains all constants of the whole Project, so we can easily
-- change things like prices and initial product ammount

-- as quick note on the price constants:
-- all prices are treated as BCD Values, and the trailing zero is ommited

package constants is
	-- prices of the product as constants, so we have them in a single location
	constant MAX_PRICE: integer := 5;
	constant PRICES: work.types.price_list := (1, 2, 2, 3, 3, 4, 4, 5);
	
	-- initial amount of products available of each type
	constant INITIAL_PRODUCT_AMOUNT: unsigned(2 downto 0) := "101";
end package;