library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Altera M4K True DualPort RAM as specified in the design guide
--
-- Not much to comment on this one, since its an (mostly) exact 1:1 copy from
-- listing 5.24 on page 119 of the book.
-- the only change is the use of rising_edge instead of clk'event.

entity dualport_ram is
	generic(
		DATA_WIDTH: integer := 8;
		ADDR_WIDTH: integer := 6
	);
	port(
		clk: in std_logic;
		
		we_a: in std_logic;
		we_b: in std_logic;
		addr_a: in std_logic_vector(ADDR_WIDTH-1 downto 0);
		addr_b: in std_logic_vector(ADDR_WIDTH-1 downto 0);
		d_a: in std_logic_vector(DATA_WIDTH-1 downto 0);
		d_b: in std_logic_vector(DATA_WIDTH-1 downto 0);
		q_a: out std_logic_vector(DATA_WIDTH-1 downto 0);
		q_b: out std_logic_vector(DATA_WIDTH-1 downto 0)
	);
end dualport_ram;

architecture arch of dualport_ram is
	type ram_type is array (0 to 2**ADDR_WIDTH-1) of std_logic_vector(DATA_WIDTH-1 downto 0);
	signal ram: ram_type;
begin	
	-- read/write port A
	process(clk) begin
		if(rising_edge(clk)) then
			if (we_a = '1') then
				ram(to_integer(unsigned(addr_a))) <= d_a;
				q_a <= d_a;
			else
				q_a <= ram(to_integer(unsigned(addr_a)));
			end if;
		end if;
	end process;
	-- read/write port B
	process(clk) begin
		if(rising_edge(clk)) then
			if (we_b = '1') then
				ram(to_integer(unsigned(addr_b))) <= d_b;
				q_b <= d_b;
			else
				q_b <= ram(to_integer(unsigned(addr_b)));
			end if;
		end if;
	end process;
end arch;