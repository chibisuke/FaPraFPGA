--output_select.vhd
library ieee;
use ieee.std_logic_1164.all;

-- Selects the output to use on the red LEDs
--
-- this one line could also go into the main entity,
-- but as we're not suposed to mix logic and entities
-- in a single entity, this takes care of it.
--
-- input0: input to be passed to output when sel = '0'
-- input1: input to be passed to output when sel = '1'
-- output: the output signal
-- sel: selection of the input to use
entity output_select is
	port(
	   input0: in std_logic_vector(9 downto 0);
		input1: in std_logic_vector(9 downto 0);
		output: out std_logic_vector(9 downto 0);
		sel: in std_logic
	);
end output_select;

architecture arch of output_select is
begin
	output <= input0 when sel = '0' else input1;
end arch;
