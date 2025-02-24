library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Minimalistic SRAM Controller for the IS61LV25616AL-10 Memory chip.
--
-- Usage: 
-- Reading: setting addr to an address and wr = '0' will read from the given address
--   and provide the result in data_r two clock cycles later. 
--   NOTE: continuous reading is supported, one read per clock cycle
-- Writing: setting addr to the address to write to and wr = '1' will write to the given address
--   the write will take one clock cycle to complete. Continous back-to-back writing is supported
--   simply keep wr = '1' and update address and data_w in the same clock cycle to write an additional word
-- 
-- fclk: a PLL Clock with 100MHz
-- sram_addr, sram_dq, sram_we_n: the signals connecting to the SRAM Module*
--
-- addr: the address to read from/wirte to
-- data_r: the output of the data that have been read in read mode
-- data_w: the input data to write in write mode
-- wr: write data_w to addr. Keep high for one clock cycle per write.
--   back-2-back write is supported.
-- 
-- Some notes about the other SRAM pins that we do not need for this purpose:
-- 
-- sram_ce_n: Chip enable is pulled to low using assignments tab. We don't 
--   need it since the only purpose of the logic is to test the chip, so we keep it enabled all the time
-- sram_lb_n, sram_ub_n: we want to read/write in 16 bit mode and the whole word at the same time
--   also the chip has a t_sa timing of 0ns when writing back to back, so there is no need to pull those high
--   at any point in time. Therefore we use the assignments to reserve the pin to ground.
-- sram_oe_n: According to the datasheet we're allowed to keep OE low during a write, so there is no real need
--   to deal with OE at any point. Just keep it enabled by reserving the pin to ground.

entity mem_controler is
	port(
		fclk: std_logic;
	
		sram_addr: out std_logic_vector(17 downto 0);
		sram_dq: inout std_logic_vector(15 downto 0);
		sram_we_n: out std_logic;
		
		addr: in std_logic_vector(17 downto 0);
		data_r: out std_logic_vector(15 downto 0);
		data_w: in std_logic_vector(15 downto 0);
		wr: in std_logic
		
	);
end mem_controler;

architecture arch of mem_controler is
begin
	process (fclk) begin
		if(rising_edge(fclk)) then
			sram_addr <= addr;
			-- make sure to set WE at the same time as sram_dq, otherwise we'd have two drivers driving the same data lines
			-- possibly with opposite logic levels. 
			sram_we_n <= not wr;
			if(wr = '1') then
				-- if writing, set the pins to the output signal. 
				sram_dq <= data_w;
			else
				-- if we're not writing we need to reliquish control of the data lines to allow the SRAM chip to pull them to
				-- its output signals
				sram_dq <= (others=>'Z');
			end if;
			data_r <= sram_dq;
		end if;
	end process;
end arch;
