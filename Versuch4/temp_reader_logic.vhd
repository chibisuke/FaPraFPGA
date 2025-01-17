library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- LM75 reader logic entity
-- contains the state engine thats controls the I2C communication 
--
-- i2c_busy, i2c_data_rd, i2c_ena, i2c_rw: signals to the I2C_Writer entity that is 
-- 	connected to the LM75. The writer sould be configured with the address of the slave
--		also the writer should have its data_wr signal set to x"00". (the temperature register
--		of the slave).
--
-- clk: the clock to use
-- temp: the temperature read from the LM75 as returned by the chip
--		bit 15 - 8 contain the temperature as a signed byte,
--		bit 7 contains the comma value.
--		bit 6 - 0 are unused.
--
-- start: the start signal that triggers the read
-- completed: the completes status signal that reports a read to be completed
--
entity temp_reader_logic is
	port(
		clk: in std_logic;
		
		i2c_busy: in std_logic;
		i2c_data_rd: in std_logic_vector(7 downto 0);
		i2c_ena: out std_logic;
		i2c_rw: out std_logic;
		
		temp: out std_logic_vector(15 downto 0);
		
		start: in std_logic;
		completed: out std_logic
	);
end temp_reader_logic;

architecture arch of temp_reader_logic is
	 type state_type is (WAIT_IDLE, IDLE, WRITE_ACTIVE, WRITE_COMPLETE, READ_ACTIVE, READ_COMPLETE, READ2_ACTIVE, WAIT_DELAY);
	 
    signal state : state_type := WAIT_IDLE;
	 signal next_state: state_type;
	 
	 -- temporary registeres to save the two bytes, so the temp update is done in a single write
	 signal temp_r1, temp_r2, temp_r1_next, temp_r2_next : std_logic_vector(7 downto 0);
	 
	 
	 
	 -- i2c_master inputs (using next logic)
    signal i2c_l_ena, i2c_ena_next : std_logic := '0';
    signal i2c_l_rw, i2c_rw_next : std_logic := '0';
	 
	 -- signals for next logic of outputs
	 signal next_completed: std_logic;	 
	 signal ttemp, temp_next: std_logic_vector(15 downto 0);
begin
	i2c_rw <= i2c_l_rw;
	i2c_ena <= i2c_l_ena;
	temp <= ttemp;

	process (clk) begin
		if (rising_edge(clk)) then
			state <= next_state;
			temp_r1 <= temp_r1_next;
			temp_r2 <= temp_r2_next;
			i2c_l_ena <= i2c_ena_next;
			i2c_l_rw <= i2c_rw_next;
			ttemp <= temp_next;
			completed <= next_completed;
		end if;
	end process;
	process(i2c_busy, i2c_data_rd, state, temp_r1, temp_r2, i2c_l_ena, i2c_l_rw, start, ttemp) begin
		next_state <= state;
		temp_r1_next <= temp_r1;
		temp_r2_next <= temp_r2;
		i2c_ena_next <= i2c_l_ena;
		i2c_rw_next <= i2c_l_rw;
		temp_next <= ttemp;
		next_completed <= '0';
		case state is 
			-- wait for the i2c to become ready
			when WAIT_IDLE => 
				if(i2c_busy = '0') then
					next_state <= IDLE;
				end if;
				
			-- I2C Write of the temp register address (x00).
			when IDLE =>
				i2c_rw_next <= '0';
				i2c_ena_next <= '1';
				if(i2c_busy = '1') then 
					next_state <= WRITE_ACTIVE;
				end if; 
				
			-- wait for I2C Write to finish
			when WRITE_ACTIVE =>
				if(i2c_busy = '0') then
					next_state <= WRITE_COMPLETE;
				end if;
				
			-- Trigger I2C Read
			when WRITE_COMPLETE =>
				i2c_rw_next <= '1';
				if(i2c_busy = '1') then
					next_state <= READ_ACTIVE;
				end if;
				
			-- Wait for I2C Read to finish
			-- and trigger 2nd read
			when READ_ACTIVE =>
				if(i2c_busy = '0') then
					temp_r1_next <= i2c_data_rd;
					next_state <= READ_COMPLETE;
				end if;
				
			-- Wait for 2nd I2C Read to start
			when READ_COMPLETE =>
				if(i2c_busy = '1') then
					next_state <= READ2_ACTIVE;
				end if;
				
			-- Wait for I2C Read to finish
			-- then stop I2C Communication,
			-- output the read temp and 
			-- send completed signal to upstream logic.
			when READ2_ACTIVE =>
				if(i2c_busy = '0') then
					i2c_ena_next <= '0';
					temp_r2_next <= i2c_data_rd;
					next_state <= WAIT_DELAY;
					temp_next <= temp_r2 & temp_r1;
					next_completed <= '1';
				end if;			
				
			-- Wait for start signal to restart over again
			when WAIT_DELAY =>
				if(start = '1') then
					next_state <= IDLE;
				end if;
		end case;
	end process;
end arch;
