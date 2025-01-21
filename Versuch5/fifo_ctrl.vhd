library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- the fifo controller logic that handles the snake
-- 
-- GENERICS: see fifo entity
--
-- clk: the clock to use
-- shift, push, reset, data_in, count: see fifo entity
--
-- addr_a, addr_b: the addresses to access the dual port RAM (head/tail)
-- d_a: the data to write to the RAM
-- we_a: trigger a write
--
entity fifo_ctrl is
	generic(
		DATA_WIDTH: integer := 8;
		ADDR_WIDTH: integer := 6
	);
	port(
		clk: in std_logic;
		
		shift: in std_logic;
		push: in std_logic;
		reset: in std_logic;
		data_in: in std_logic_vector(DATA_WIDTH-1 downto 0);
		
		count: out std_logic_vector(ADDR_WIDTH-1 downto 0);
		
		addr_a: out std_logic_vector(ADDR_WIDTH-1 downto 0);
		addr_b: out std_logic_vector(ADDR_WIDTH-1 downto 0);
		d_a: out std_logic_vector(DATA_WIDTH-1 downto 0);
		we_a: out std_logic
	);
end fifo_ctrl;

architecture arch of fifo_ctrl is	
	-- address buffers for head/tail
	signal head_ptr, head_ptr_next: unsigned(ADDR_WIDTH-1 downto 0);
	signal tail_ptr, tail_ptr_next: unsigned(ADDR_WIDTH-1 downto 0);
	
	-- data buffer, so we can make sure data and write signal 
	-- are received by the memory at the same time
	signal data_buff: std_logic_vector(DATA_WIDTH-1 downto 0);
begin
	-- the current number of elements in the FIFO. 
	-- in case of a wrap around (head < tail), no special
	-- calculation is needed. This formula is still valid. 
	count <= std_logic_vector(head_ptr - tail_ptr + 1);
	process(clk, reset) begin
		if(reset = '1') then
			-- reset: head is -1 => after the first push head and tail are pointing to the same location
			-- which means the fifo contains a single element. 
			head_ptr <= (others=>'1');
			tail_ptr <= (others=>'0');
		elsif(rising_edge(clk)) then
			we_a <= '0';
			if(push = '1') then
				-- now push the data to the memory
				head_ptr <= head_ptr_next;
				data_buff <= data_in;
				we_a <= '1';
			end if;
			if(shift = '1') then
				tail_ptr <= tail_ptr_next;
			end if;
		end if;	
	end process;
	-- the next head/tail address
	-- NOTE: This will wrap around at the end of the fifo to 0.
	-- no special considerations are needed for this. 
	head_ptr_next <= head_ptr + 1;
	tail_ptr_next <= tail_ptr + 1;
	
	addr_a <= std_logic_vector(head_ptr);
	addr_b <= std_logic_vector(tail_ptr);
	d_a <= data_buff;
end arch;