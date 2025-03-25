library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mem_wr_addr is
	port(
		clk: in std_logic;
		
		wr_addr: out std_logic_vector(7 downto 0);
		incr: in std_logic
	);
end mem_wr_addr;

architecture arch of mem_wr_addr is
	signal addr,addr_next: std_logic_vector(7 downto 0);
begin
	process(clk) begin
		if(rising_edge(clk)) then
			addr <= addr_next;
		end if;
	end process;
	
	addr_next <= std_logic_vector(unsigned(addr) + 1) when incr = '1' else addr;
	wr_addr <= addr;
end arch;
