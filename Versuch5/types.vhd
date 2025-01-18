library ieee;
use ieee.std_logic_1164.all;

package types is
	subtype tGameBoard is std_logic_vector(0 to 159);
	type direction is (NORTH, SOUTH, WEST, EAST);

end package types;