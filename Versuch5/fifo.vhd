library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

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
	type ram_type is array (0 to 2**ADDR_WIDTH-1) of std_logic_vector(DATA_WIDTH-1 downto 0);
	signal ram: ram_type;
	
	signal head_ptr, head_ptr_next: unsigned(ADDR_WIDTH-1 downto 0);
	signal tail_ptr, tail_ptr_next: unsigned(ADDR_WIDTH-1 downto 0);
	signal head_reg: std_logic_vector(DATA_WIDTH-1 downto 0);
	signal tail_reg: std_logic_vector(DATA_WIDTH-1 downto 0);
begin
	count <= std_logic_vector(unsigned(head_ptr) - unsigned(tail_ptr) + 1);

	process(clk, reset) begin
		if(reset = '1') then
			head_ptr <= (others=>'1');
			tail_ptr <= (others=>'0');
		elsif(rising_edge(clk)) then
			head_ptr <= head_ptr_next;
			if(push = '1') then
				ram(to_integer(head_ptr_next)) <= data_in;
				head_reg <= data_in;
			else 
				head_reg <= ram(to_integer(head_ptr_next));
			end if;
			tail_ptr <= tail_ptr_next;
			if(push = '1' and head_ptr_next = tail_ptr_next) then
				tail_reg <= data_in;
			else
				tail_reg <= ram(to_integer(unsigned(tail_ptr_next)));
			end if;
		end if;
	end process;
	
	data_head <= head_reg;
   data_tail <= tail_reg;
	head_ptr_next <= head_ptr when push = '0' else head_ptr + 1;
	tail_ptr_next <= tail_ptr when shift = '0' else tail_ptr + 1;
end arch;