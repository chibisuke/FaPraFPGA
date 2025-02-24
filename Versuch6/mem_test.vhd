library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--
-- This entity ties all the strings of the memory tester together 
-- 
-- It gets passed a clock (fclk) that runs at twice the speed of
-- the base clock of the board and lcd
--
-- fclk: a PLL clock with 100MHz 
-- sram_addr, sram_dq, sram_we_n: the signals connecting to the SRAM Module
--
-- display_data: a record sending the result of the messurement to the LCD Controller
--   the values will be kept static until a new testrun is triggered.
-- update_lcd: the trigger impulse to notify the LCD to update
--   this will remain high for two adcditional fclk cycles. It is buffered by a single ff in the 
--   fclk clock domain. Note: will need two additional flipflops in the target clock domain
--   for propper CDC. 
--
-- status_verify: a ready cycle is currently running
-- status_write: a write cycle is currently running
-- status_error: an error occured during the verify cycle
-- 
-- start: start a new testrun
-- simulate_error: report an error even though normaly no error would have occured
--
entity mem_test is
	port(
		fclk: in std_logic;
	
		sram_addr: out std_logic_vector(17 downto 0);
		sram_dq: inout std_logic_vector(15 downto 0);
		sram_we_n: out std_logic;
		
		display_data: out work.types.lcd_output_data;
		update_lcd: out std_logic;
		
		status_verify: out std_logic;
		status_write: out std_logic;
		status_error: out std_logic;
		
		start: in std_logic;
		simulate_error: in std_logic
	);
end mem_test;

architecture arch of mem_test is
	signal addr, addr_r, addr_w: std_logic_vector(17 downto 0);
	signal data_r: std_logic_vector(15 downto 0);
	signal data_w: std_logic_vector(15 downto 0);
	signal wr: std_logic;
	signal start_w, start_r, completion_w, completion_r, error: std_logic;
begin		
		-- Memory controller
		mc: entity work.mem_controler(arch) port map(fclk=>fclk, sram_addr=>sram_addr, sram_dq=>sram_dq, sram_we_n=>sram_we_n,
			addr=>addr, data_r=>data_r, data_w=>data_w,
			wr=>wr
		);
		
		-- Multiplexer to switch between read and write tests
		addr_mux: entity work.mux2(arch) generic map(bits=>18) port map(inA=>addr_r, inB=>addr_w, output=>addr, selector=>wr);
		
		-- the write tester entity
		writer: entity work.mem_test_writer(arch) port map(fclk=>fclk, addr=>addr_w, data_w=>data_w, wr=>wr, start=>start_w, completion=>completion_w);
		-- the read tester entity
		reader: entity work.mem_test_reader(arch) port map(fclk=>fclk, addr=>addr_r, data_r=>data_r, start=>start_r, completion=>completion_r, 
			error=>error, simulate_error=>simulate_error
		);
		
		-- the Logic core of the test suite
		logic: entity work.mem_test_logic(arch) port map(fclk=>fclk, wr_start=>start_w, rd_start=>start_r, 
			wr_completion=>completion_w, rd_completion=>completion_r, error=>error,
			status_write=>status_write, status_verify=>status_verify, status_error=>status_error,
			display_data=>display_data, update_lcd=>update_lcd,
			start=>start
		);
end arch;
