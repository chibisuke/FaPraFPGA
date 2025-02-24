library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--
-- A simple 2 => 1 multilpexer
-- 
-- since we're only allowed to use logic in leafes, this once line
-- multiplexer needs to be a seperate entity
--
-- generic: 
--   bits: width of the multiplexer
-- port:
--   inA, inB: the two input ports
--   output: the output signal
--   select: 0 => output=inA, 1 => output=inB
--
entity mux2 is
	generic(
		bits: integer := 16
	);	
	port(
		inA: in std_logic_vector((bits-1) downto 0);
		inB: in std_logic_vector((bits-1) downto 0);
		output: out std_logic_vector((bits-1) downto 0);
		
		selector: std_logic
	);
end mux2;

architecture arch of mux2 is
begin
	output <= inA when selector = '0' else inB;
end arch;
