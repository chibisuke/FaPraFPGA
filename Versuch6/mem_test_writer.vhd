library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--
-- this is the write part of the memory testsuit
-- after setting "start" it will write 64 MB of data_w
-- the the SRAM, overwriting it numerous times in the process
-- the values will alternate between the lower bits of the memory
-- addresses and their one complement.
-- Will make use of the back-to-back write capability of the SRAM controller
-- using one clock cycle per write
--
-- fclk: a 100MHz PLL Clock
--
-- addr: outputs the address to be written to
-- data_w: the data to be written
-- wr: the write signal
--
-- start: trigger the write process
-- completion: Signal that the write has been completed
entity mem_test_writer is
	port(
		fclk: in std_logic;

		addr: out std_logic_vector(17 downto 0);
		data_w: out std_logic_vector(15 downto 0);
		wr: out std_logic;

		start: in std_logic;
		completion: out std_logic
	);
end mem_test_writer;

architecture arch of mem_test_writer is
	signal eaddr, addr_next: std_logic_vector(25 downto 0);
	signal mask: std_logic_vector(15 downto 0);
	signal writing: std_logic;
begin
		-- lowest 16 bits or their complement, alternating each round
		data_w <= eaddr(15 downto 0) xor mask;
		mask <= (others=>eaddr(18));
		
		wr <= writing;
		addr <= eaddr(17 downto 0);
		-- use the additional bit in the addr signal to determine the end of the cycle
		completion <= addr_next(25);
		
		addr_next <= std_logic_vector(unsigned(eaddr) + 1) when writing = '1' else (others=>'0');
		
		process (fclk) begin
			if(rising_edge(fclk)) then
				eaddr <= addr_next;
				if(addr_next(25) = '1') then
					-- next is overflow, reset address and disable writing n so we don't overwrite the x0 address again
					eaddr <= (others=>'0');
					writing <= '0';	
				end if;
				if(start = '1') then
					writing <= '1';
				end if;
			end if;
		end process;
end arch;
