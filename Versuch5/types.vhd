library ieee;
use ieee.std_logic_1164.all;

package types is
	-- bitfield for the game board
	subtype tGameBoard is std_logic_vector(0 to 159);
	-- type for the direction the snake is moveing to
	type direction is (NORTH, SOUTH, WEST, EAST);

end package types;