--ram.vhd
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Using Altera synchronous single-port RAM with registered read data (M4K module)
--
-- Generics:
-- ADDR_WIDTH: the width of the address bus to use
-- DATA-WIDTH: the width of the data bus to use
--
-- Ports:
-- clk: the Clock to use
-- wr: 1 = write D to the RAM Module
-- addr: the current memory address (read and write)
-- D: the value that is written once wr = '1' is set
-- Q: the value stored at the current address
entity ram is
	-- Using generics to be able to reuse this entity at a later time
	-- (not just because its in the book, but because it makes sense to me to do so)
	generic(
		ADDR_WIDTH: integer := 4;
		DATA_WIDTH: integer := 10
	);	
	port(
		clk: in std_logic;
		wr: in std_logic;
		addr: in std_logic_vector(ADDR_WIDTH-1 downto 0);
	   D: in std_logic_vector((DATA_WIDTH-1) downto 0);
		Q: out std_logic_vector((DATA_WIDTH-1) downto 0)
	);
end ram;

architecture arch of ram is
	type mem_2d_type is array (0 to 2**ADDR_WIDTH-1) of std_logic_vector(DATA_WIDTH-1 downto 0);
	signal ram: mem_2d_type;
	signal data_reg: std_logic_vector(DATA_WIDTH-1 downto 0);
begin
	process (clk,wr,addr,ram)
	begin
		if(rising_edge(clk)) then
			if(wr = '1') then
				-- in write more, write D to the current memory address
				ram(to_integer(unsigned(addr))) <= D;
				-- this differs from the book.
				-- reading from ram(addr) at the same time of writing generates an unnescessary warning
				-- writing D directly to the data buffer register prevents this. 
				data_reg <= D;
			else
				-- in read mode read the current memory address
				data_reg <= ram(to_integer(unsigned(addr)));	
			end if;
		end if;
	end process;
	q <= data_reg;
end arch;
