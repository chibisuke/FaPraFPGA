library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- LM75 Reader entity
--
-- Aggregates all thats needed to read the current temperature from the LM75.
--
-- clk: the clock to use
-- scl, sda: the I2C io signals
--
-- temp: the whole numbers of the temp as BCD
-- temp_fdp: one binary digit after the comma
--
-- completed: trigger when a read cycle has been completed

entity temp_reader is
	port(
		clk: in std_logic;
		
		scl: inout std_logic;
		sda: inout std_logic;
		
		temp: out std_logic_vector(7 downto 0);
		temp_fdp: out std_logic;
		
		completed: out std_logic
	);
end temp_reader;

architecture arch of temp_reader is	 
	 -- 7 bit I2C Address, that is concatenated by the read/write bit by the i2c_master
	 constant LM74_ADDRESS : std_logic_vector(6 downto 0) := "1001000"; -- LM75 address (0x48)
	 -- address of the temperature register in the LM75 is 0x00. 
	 -- since we don't need any other registers we can aswell treat this as constant
    constant LM75_REG_TEMP : std_logic_vector(7 downto 0) := (others => '0');
	 
	 
	 -- i2c_master inputs
    signal i2c_ena : std_logic := '0';
    signal i2c_rw : std_logic := '0';
	 
	 -- i2c_master outputs
    signal i2c_busy : std_logic;
    signal i2c_data_rd : std_logic_vector(7 downto 0);

	 -- 16 bit temp output from LM75 
	 signal l_temp: std_logic_vector(15 downto 0);
	 
	 signal timer_start: std_logic;
	 signal timer_fire: std_logic;
begin

	temp_fdp <= l_temp(7);
	completed <= timer_start; -- send completed pulse to other parts of the logic
	
	temp(7) <= '0'; -- the values 0 - 63 only need 6 bits in BCD.
	
	-- 6 bit BIN to 7 bit BCD Converter
	bcd: entity work.temp_to_bcd(arch) port map(in6=>l_temp(13 downto 8),bcd_out=>temp(6 downto 0));

	i2c_master_inst : entity work.i2c_master
        generic map (
            input_clk => 50_000_000, -- 50 MHz
            bus_clk => 400_000 -- 400 kHz
        )
        port map (
            clk => clk,
            reset_n => '1',
            ena => i2c_ena,
            addr => LM74_ADDRESS,
            rw => i2c_rw,
            data_wr => LM75_REG_TEMP,
            busy => i2c_busy,
            data_rd => i2c_data_rd,
            ack_error => open,
            sda => sda,
            scl => scl
        );
		  
	-- State logic of the Temperature reader
	tr_logic: entity work.temp_reader_logic(arch) port map(clk=>clk,i2c_busy=>i2c_busy,i2c_ena=>i2c_ena,
		i2c_data_rd=>i2c_data_rd,i2c_rw=>i2c_rw,temp=>l_temp, start=>timer_fire, completed=>timer_start);
	
	-- timer 100ms - detail until reread of LM75
	-- LM75 may only be read at most every 100ms. Reading it more often results in the Temperature value
	-- not getting updated in the sensor. 
	delay_timer: entity work.timer(arch) generic map(timeout=>100_000) port map(clk=>clk,start=>timer_start,fire=>timer_fire);
		  
end arch;
