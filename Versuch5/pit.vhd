library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pit is
	port(
		clk: in std_logic;
		hold: in std_logic;
		tps: in std_logic_vector(2 downto 0);
		rst: in std_logic;
		
		tick: out std_logic
	);
end pit;

architecture arch of pit is
begin

end arch;