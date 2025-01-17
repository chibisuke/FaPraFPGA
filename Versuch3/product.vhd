library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity product is
	port(
		clk: in std_logic;
	   reset: in std_logic;
		dec: in std_logic;
		avail: out std_logic
	);
end product;

architecture arch of product is
	constant INITIAL_VALUE: integer := 5;
	
	type product_state is (AVAILABLE, SOLD);
	signal c_state: product_state := AVAILABLE; 
	signal n_state: product_state; 
begin
   process(clk, reset)
	begin  
		if (reset = '1') then
			c_state <= AVAILABLE; 
		elsif (rising_edge(clk)) then
			c_state <= n_state;
		end if;
	end process;
	process(c_state, dec)
	begin
		n_state <= c_state;
		case c_state is
			when AVAILABLE => 
				if(dec = '1') then
					n_state <= SOLD;
				end if;
			when SOLD =>
				n_state <= SOLD;
				
		end case;
	end process;
	avail <= '1' when c_state /= SOLD else '0' ;
end arch;
