library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--
-- the core logic of the memory tester
-- 
-- fclk: a 100MHz PLL clock
-- wr_start: signal to trigger the write logic
-- rd_start: signal to trigger the read logic
--
-- wr_completion: signal that the write is completed
-- rd_completion: singal that the read is completed
-- error: verification error status
--
-- update_lcd: trigger the LCD Update. Is kept high for TWO additional clock cycles to allow for propper Clock domain crossing
--   without the need for any handshake protocol
--   NOTE: update_lcd is buffered by a single FF using the fclk signal as a clock. The other two registers of the CDC
--   are part of the LCD Logic
-- display_data: the data to be displayed on the LCD
--
-- start: signal to restart the testrun. It will however automatically start the first time after powerup
--
entity mem_test_logic is
	port(
		fclk: in std_logic;

		wr_start: out std_logic;
		rd_start: out std_logic;
		
		wr_completion: in std_logic;
		rd_completion: in std_logic;
		error: in std_logic;
		
		status_write: out std_logic;
		status_verify: out std_logic;
		status_error: out std_logic;
		
		update_lcd: out std_logic;
		display_data: out work.types.lcd_output_data;
		
		start: in std_logic
	);
end mem_test_logic;

architecture arch of mem_test_logic is
	type tStates is (SSTART, IDLE, WAIT_WRITE, WAIT_VERIFY, COMPLETED, COMPLETED2);
	signal state, state_next: tStates; 
	signal wr_start_next, rd_start_next: std_logic;
	signal status_verify_next, status_write_next: std_logic;
	signal update_lcd_next: std_logic;
	signal eerror, eerror_next: std_logic;
	
	-- clock cycle counter - since we have less then x1000_0000 clock cycles
	-- we only use 28 bits to store them
	signal clock_cycles, clock_cycles_next: std_logic_vector(27 downto 0);
	-- read time counter in milliseconds as BCD counter
	-- read time is way below 1000ms, so only use 3 digit BCD
	signal read_time_ms, read_time_ms_next: std_logic_vector(11 downto 0);
	-- write time counter in milliseconds as BCD counter
	-- write time is way below 1000ms, so only use 3 digit BCD
	signal write_time_ms, write_time_ms_next: std_logic_vector(11 downto 0);
	-- counter register to count the milliseconds
	-- NOTE: We use a counter register to count the milliseconds, instead of diving the 
	--   clock cycles using a multiplyer. Multiplyers are really expensive and we can avoid it here.
	signal ms_counter, ms_counter_next, ms_counter_minus_one: std_logic_vector(17 downto 0);
	
	constant one_ms: std_logic_vector(17 downto 0) := std_logic_vector(to_unsigned(100000, 18));
begin
	status_error <= eerror;
	
	-- assemble the display_data record
	display_data <= (
		read_error=>eerror,
		clock_cycles=>clock_cycles,
		read_time=>read_time_ms,
		write_time=>write_time_ms
	);	
	
	ms_counter_minus_one <= std_logic_vector(unsigned(ms_counter) - 1);

	process (fclk) is
	begin
		if(rising_edge(fclk)) then
			state <= state_next;
			wr_start <= wr_start_next;
			rd_start <= rd_start_next;
			status_write <= status_write_next;
			status_verify <= status_verify_next;
			update_lcd <= update_lcd_next;
			eerror <= eerror_next;
			clock_cycles <= clock_cycles_next;
			read_time_ms <= read_time_ms_next;
			write_time_ms <= write_time_ms_next;
			ms_counter <= ms_counter_next;
		end if;	
	end process;
	
	
	process (state, wr_completion, rd_completion, start, eerror, error, clock_cycles, write_time_ms, read_time_ms, ms_counter, ms_counter_minus_one) begin
		state_next <= state;
		wr_start_next <= '0';
		rd_start_next <= '0';
		status_write_next <= '0';
		status_verify_next <= '0';
		update_lcd_next <= '0';
		eerror_next <= eerror;
		clock_cycles_next <= std_logic_vector(unsigned(clock_cycles) + 1);
		write_time_ms_next <= write_time_ms;
		read_time_ms_next <= read_time_ms;
		ms_counter_next <= ms_counter;
		case state is
			-- reset all counters and start a new test by triggering the write
			when SSTART => 
				clock_cycles_next <= (others=>'0');
				wr_start_next <= '1';
				state_next <= WAIT_WRITE;
				-- reset error state
				eerror_next <= '0';
				write_time_ms_next <= (others=>'0');
				read_time_ms_next <= (others=>'0');
				ms_counter_next <= one_ms;
			-- wait until a restart
			when IDLE =>
				clock_cycles_next <= clock_cycles;
				if(start = '1') then
					state_next <= SSTART;
				end if;
			-- wait for the write to complete, then trigger a read/verify
			when WAIT_WRITE =>
				ms_counter_next <= ms_counter_minus_one;
				if(ms_counter(17) = '1') then
					-- ms_counter is less than 0, so we need to reset it and increment
					-- the read_time
					ms_counter_next <= one_ms;
					write_time_ms_next <= work.BCD.incBCD3(write_time_ms);
				end if;
				status_write_next <= '1';
				if(wr_completion = '1') then
					rd_start_next <= '1';
					state_next <= WAIT_VERIFY;
				end if;	
			-- wait for the verify to complete, then report the result
			when WAIT_VERIFY =>
				ms_counter_next <= ms_counter_minus_one;
				if(ms_counter(17) = '1') then
					-- ms_counter is less than 0, so we need to reset it and increment
					-- the read_time
					ms_counter_next <= one_ms;
					read_time_ms_next <= work.BCD.incBCD3(read_time_ms);
				end if;
				status_verify_next <= '1';
				if(rd_completion = '1') then
					state_next <= COMPLETED;
					-- first cycle of the update_lcd trigger
					update_lcd_next <= '1';
					eerror_next <= error;
					clock_cycles_next <= clock_cycles;
				end if;				
			when COMPLETED => 
				-- keep update_lcd high for an two more clock cycle, to reliably manage cross clock domain sync
				update_lcd_next <= '1';
				state_next <= IDLE;
				clock_cycles_next <= clock_cycles;
			when COMPLETED2 => 
				-- keep update_lcd high for an two more clock cycle, to reliably manage cross clock domain sync
				update_lcd_next <= '1';
				state_next <= IDLE;
				clock_cycles_next <= clock_cycles;
		end case;	
	end process;
end arch;
