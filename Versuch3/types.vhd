library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- this file contains the a package with all the custom types needed
-- in multiple entities
--
-- State types are declared in the entity that is using it

package types is
		type price_list is array (0 to 7) of integer;
		type product_count_list is array (0 to 7) of unsigned(2 downto 0);
end package;