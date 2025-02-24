library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--
-- this is the read part of the testsuit. 
-- It will read 64MB from the SRAM using the memory controller
-- as a continous read (one word per clock cycle) and validate if it
-- reads as expected
-- 
-- fclk: a 100MHz PPL Clock
-- addr: the address to be read
-- data_r: the currently read data from the SRAM Controller
--
-- start: trigger the read
-- completion: signal the completion of the read
-- error: error status after the read
--
-- simulate_error: allows to simulate an error during the read
--
entity mem_test_reader is
	port(
		fclk: in std_logic;

		addr: out std_logic_vector(17 downto 0);
		data_r: in std_logic_vector(15 downto 0);

		start: in std_logic;
		completion: out std_logic;
		error: out std_logic;
		
		simulate_error: in std_logic
	);
end mem_test_reader;

architecture arch of mem_test_reader is
	signal rdaddr1, rdaddr2, rdaddr3, eaddr, addr_next: std_logic_vector(25 downto 0);
	signal reading: std_logic;
	signal data_cmp: std_logic_vector(15 downto 0);
begin
		-- the data to compare to. Since the last write had even parity, we need to xor with xffff.
		data_cmp <= rdaddr3(15 downto 0) xor x"ffff";
		
		addr_next <= std_logic_vector(unsigned(eaddr) + 1) when reading = '1' else (others=>'0');
		
		process (fclk) begin
			if(rising_edge(fclk)) then
				-- register chain to store the previous addresses
				-- it takes two clock cycles for the data_r to return for an address
				-- plus one additional to be processed here, so 3 registers
				rdaddr3 <= rdaddr2;
				rdaddr2 <= rdaddr1;
				rdaddr1 <= eaddr;
				eaddr <= addr_next;
				completion <= '0';
				-- delay the verify until the first result arrived from the SRAM
				-- then compare the result, or take it as an error if error simulation is enabled
				if((unsigned(rdaddr2) > 0 and data_cmp /= data_r) or simulate_error = '1') then
					error <= '1';
				end if;
				if(rdaddr2(25) = '1') then
					-- we continue the read until the the whole cycle is completed. we'll read the first two addresses
					-- a second time because of the overflow, but this doesn't matter since we have to wait for the
					-- data anyway. 
					eaddr <= (others=>'0');
					reading <= '0';	
					completion <= '1';
				end if;
				if(start = '1') then
					reading <= '1';
					error <= '0';
				end if;
			end if;
		end process;
		addr <= eaddr(17 downto 0);
end arch;
