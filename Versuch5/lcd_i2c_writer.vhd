library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.MATH_REAL.all;

-- LCD I2C Interface logic
-- This state engine sequencially reads memory locations
-- and writs it the LCD until it reaches a null word.
--
-- clk: the clock to use
--
-- i2c*: the I2C Master interface to use for the LCD Communication
--
-- mem_addr, mem_data: address and data signals for the memory communication
-- start_addr: the first address to use in the communication with the LCD
-- start: trigger a new communication sequence
-- done: Signals that the write to the display was succcessfull
entity lcd_i2c_writer is
	port(
		clk: in std_logic;
		
		mem_data: in std_logic_vector(11 downto 0);
		mem_addr: out std_logic_vector(7 downto 0);
		
		start_addr: in std_logic_vector(7 downto 0);
		start: in std_logic;
		done: out std_logic;
		
		i2c_ena: out std_logic;
		i2c_rw: out std_logic;
		i2c_busy: in std_logic;
		i2c_data_rd: in std_logic_vector(7 downto 0);
		i2c_data_wr: out std_logic_vector(7 downto 0);
		i2c_err: in std_logic
	);
end lcd_i2c_writer;

architecture arch of lcd_i2c_writer is
	 type state_type is (IDLE, 
		-- States needed to check the BF flag of the LCD.
		RD_STATUS_WR, RD_STATUS_WR_BUSY, RD_STATUS_RD, RD_STATUS_RD_BUSY, RD_STATUS_RESULT,
		-- State needed for the write to the disply
		WR_CONTROL, WR_CONTROL_BUSY, WR_DATA, WR_DATA_BUSY, 
		-- Done
		WR_DONE);
	 
    signal state : state_type := IDLE;
	 signal state_next: state_type;	 
	 
	 -- signals for the next logic
	 signal current_addr, current_addr_next: std_logic_vector(7 downto 0);
	 signal current_addr_inc: std_logic_vector(7 downto 0);
	 signal done_next: std_logic;
	 
	 signal i2c_en, i2c_ena_next: std_logic;
	 signal i2c_rwb, i2c_rw_next: std_logic;
	 signal i2c_data_wrb, i2c_data_wr_next: std_logic_vector(7 downto 0);
begin
	mem_addr <= current_addr;
	current_addr_inc <= std_logic_vector(unsigned(current_addr) + 1);
	i2c_ena <= i2c_en;
	i2c_rw <= i2c_rwb;
	i2c_data_wr <= i2c_data_wrb;
	process (clk) begin
		if(rising_edge(clk)) then
			state <= state_next;
			current_addr <= current_addr_next;
			done <= done_next;
			i2c_en <= i2c_ena_next;
			i2c_rwb <= i2c_rw_next;
			i2c_data_wrb <= i2c_data_wr_next;
		end if;
	end process;

	process (state, current_addr, current_addr_inc, i2c_en, i2c_rwb, i2c_data_wrb, i2c_busy, mem_data, start_addr, start, i2c_data_rd) begin
		state_next <= state;
		current_addr_next <= current_addr;
		done_next <= '0';
		i2c_ena_next <= i2c_en;
		i2c_rw_next <= i2c_rwb;
		i2c_data_wr_next <= i2c_data_wrb;
		case state is 
			when IDLE =>
				if(start = '1') then
					current_addr_next <= start_addr;
					state_next <= RD_STATUS_WR;
				end if;
			-- write control byte x"00" to the display
			WHEN RD_STATUS_WR => 
				if(i2c_busy = '0') then
					i2c_ena_next <= '1';
					i2c_rw_next <= '0';
					i2c_data_wr_next <= x"00"; -- read status register
					state_next <= RD_STATUS_WR_BUSY;
				end if;
			-- wait for the write to begin, then
			-- switch to read mode, so we create a stop and start condition
			-- in the I2C Comms. 
			WHEN RD_STATUS_WR_BUSY =>
				if(i2c_busy = '1') then
					i2c_rw_next <= '1';
					state_next <= RD_STATUS_RD;
				end if;
			WHEN RD_STATUS_RD =>	
				if(i2c_busy = '0') then
					state_next <= RD_STATUS_RD_BUSY;
				end if;
			-- wait for the I2C Read to start, 
			-- then stop the I2C Comms.
			WHEN RD_STATUS_RD_BUSY =>
				if(i2c_busy = '1') then
					i2c_ena_next <= '0';
					state_next <= RD_STATUS_RESULT;
				end if;
			-- if the display is busy, retry
			-- else continue with the write of the current byte sequence
			WHEN RD_STATUS_RESULT =>
				if(i2c_busy = '0' and i2c_data_rd(7) = '1') then
					state_next <= RD_STATUS_WR;
				elsif(i2c_busy = '0') then
					state_next <= WR_CONTROL;
				end if;	
				
			-- Write the control byte to the LCD
			-- by taking the highest 4 bit (of with only the highest 2 contain usefull data)
			-- and append 4 bits with 0 to create the full control byte
			-- if the next word is a null word => DONE.
			-- NOTE: We do NOT expect any control bytes that have a set continuation bit.
			WHEN WR_CONTROL =>
				if(i2c_busy = '0' and mem_data = x"000") then
					state_next <= WR_DONE;
				elsif(i2c_busy = '0') then
					i2c_ena_next <= '1';
					i2c_rw_next <= '0';
					i2c_data_wr_next <= mem_data(11 downto 8) & "0000";
					state_next <= WR_CONTROL_BUSY;					
				end if;
			-- Wait for the transfer to start
			-- then set the data/command byte as the next byte to send
			WHEN WR_CONTROL_BUSY => 
				if(i2c_busy = '1') then
					i2c_data_wr_next <= mem_data(7 downto 0);
					state_next <= WR_DATA;
				end if;
			-- transfer of control byte is completed
			-- increment the memory address
			WHEN WR_DATA =>
				if(i2c_busy = '0') then
					state_next <= WR_DATA_BUSY;
					current_addr_next <= current_addr_inc;
				end if;				
			-- wait for the transfer of the data/command byte to start 
			-- then continue with checking if the display is busy again
			-- for the next byte. 
			WHEN WR_DATA_BUSY =>
				if(i2c_busy = '1') then
					i2c_ena_next <= '0';
					state_next <= RD_STATUS_WR;
				end if;				
			-- Singal the completed write, then back to idle
			WHEN WR_DONE =>
				done_next <= '1';
				state_next <= IDLE;	
		end case;				
	end process;
end arch;
