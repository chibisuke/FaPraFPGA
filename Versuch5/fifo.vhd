library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- A fifo component that holds the snakes segments addresses
--
-- GENERIC: 
--		DATA_WIDTH: the width of the data lines (8 bit to fit values from 0 - 159 for the current usecase)
--		ADDR_WIDTH: the size of the address also controls the ammount of memory the fifo controller can address
--
-- data_head/data_tail: the address of the head/tail in the bitfield
-- count: the length of the snake
--
-- clk: the clock to use
-- shift: trigger to remove the last segment of the snake
-- push: trigger to push a new head segment to the snake
-- data_in: the address of the new head being pusht.
--
-- reset: resets the fifo controller. NOTE: this will not reset the memory, but
--    resetting the memory is not nescessary, since it will only be read after being written again

entity fifo is
	generic(
		DATA_WIDTH: integer := 8;
		ADDR_WIDTH: integer := 6
	);
	port(
		clk: in std_logic;
		
		data_head: out std_logic_vector(DATA_WIDTH-1 downto 0);
		data_tail: out std_logic_vector(DATA_WIDTH-1 downto 0);
		
		shift: in std_logic;
		data_in: in std_logic_vector(DATA_WIDTH-1 downto 0);
		push: in std_logic;
		
		reset: in std_logic;
		
		count: out std_logic_vector(ADDR_WIDTH-1 downto 0)
	);
end fifo;

architecture arch of fifo is
	signal addr_a, addr_b: std_logic_vector(ADDR_WIDTH-1 downto 0);
	signal we_a: std_logic;
	signal d_a: std_logic_vector(DATA_WIDTH-1 downto 0);
begin
	-- using an true-dualport M4K RAM
	ram: entity work.dualport_ram(arch) 
	generic map(ADDR_WIDTH=>ADDR_WIDTH, DATA_WIDTH=>DATA_WIDTH) 
	port map(clk=>clk, 
		q_a=>data_head, q_b=>data_tail,
		addr_a=>addr_a, addr_b=>addr_b, we_a=>we_a, d_a=>d_a,
		d_b=>(others=>'0'), we_b=>'0'
	);
	
	-- fifo controller logic
	fifoc: entity work.fifo_ctrl(arch) 
	generic map(ADDR_WIDTH=>ADDR_WIDTH, DATA_WIDTH=>DATA_WIDTH) 
	port map(clk=>clk, 
		addr_a=>addr_a, addr_b=>addr_b, we_a=>we_a, d_a=>d_a,
		count=>count, reset=>reset, push=>push, shift=>shift, data_in=>data_in
	);


end arch;