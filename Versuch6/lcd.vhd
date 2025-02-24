library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- copy from Versuch4 - modified to account for the new data and trigger signals


-- Main entity for the DOGM204-A Display
-- ties all the string together that are required for the display to work
-- 
-- clk: the clock to use
-- reset: trigger to reset and reinitialize the display
--
-- sda, scl: I2C signals to use
-- lcd_reset: reset pin of the LCD. (active low!)
-- 
-- update_map: trigger signaling that map need to be redrawn
-- game_over: triggers a switch to the game_over screen
-- score: score to display on the game_over screen as a 2 digit BCD
-- diamond: the diamonds position (value from 0 - 107)
-- game_board: the game board to display on the map screen
--
-- lcd_init_done: signals rest of the logic that the LCD has finished initializing
--    and is ready to receive trigger commands
--
entity lcd is
    port (
		clk: in std_logic;
		reset: in std_logic;
		
		sda: inout std_logic;
		scl: inout std_logic;
		lcd_reset: out std_logic;
		
		update_lcd: in std_logic;
		
		display_data: in work.types.lcd_output_data
    );
end entity lcd;

architecture arch of lcd is
	constant LCD_ADDRESS: std_logic_vector(6 downto 0) := "0111101"; -- x3D I2C address

	-- signals for memory access
	signal mem_address: std_logic_vector(7 downto 0);
	signal mem_data: std_logic_vector(11 downto 0);
	
	-- signals for the I2C Writer
	signal i2c_data_rd: std_logic_vector(7 downto 0);
	signal i2c_data_wr: std_logic_vector(7 downto 0);
	signal i2c_busy: std_logic;
	signal i2c_rw: std_logic;
	signal i2c_ena: std_logic;
	signal i2c_err: std_logic;
	
	-- signals for the 3 timers
	signal t_start: std_logic_vector(2 downto 0);
	signal t_fire: std_logic_vector(2 downto 0);
	
	-- signals linking the control logic to the LCD Specific I2C Logic 
	signal start_write: std_logic;
	signal write_done: std_logic;
	signal write_start_addr: std_logic_vector(7 downto 0);
	
begin
	-- This is the memory entity that delivers all the commands to be sent to the display
	-- Most of the content is directly delivered from ROM, but some also come from memory mapped registers
	-- Note: Access time for the memory is 2 clock cycles!
	mem: entity work.lcd_memory(arch) port map (clk=>clk, addr=>mem_address, data=>mem_data, display_data=>display_data);

	-- the I2C Master instance for the LCD
	i2c_master_inst : entity work.i2c_master
        generic map (input_clk => 50_000_000, bus_clk => 400_000)
        port map (clk => clk, reset_n => '1', ena => i2c_ena, addr => LCD_ADDRESS, rw => i2c_rw, data_wr => i2c_data_wr, busy => i2c_busy,
            data_rd => i2c_data_rd, ack_error => i2c_err, sda => sda, scl => scl
        );
		  
	-- LCD Logic core
	logic: entity work.lcd_logic(arch) port map(clk=>clk, lcd_reset=>lcd_reset,
		t_start=>t_start, t_fire=>t_fire,
		start_write=>start_write, write_done=>write_done, write_start_addr=>write_start_addr,
		trigger_reset=>reset, trigger_update_lcd=>update_lcd
	);
	
	-- LCD I2C Write Logic
	wr_logic: entity work.lcd_i2c_writer(arch) port map(clk=>clk, mem_addr=>mem_address, mem_data=>mem_data,
		i2c_ena=>i2c_ena, i2c_rw=>i2c_rw, i2c_busy=>i2c_busy, i2c_data_rd=>i2c_data_rd, i2c_data_wr=>i2c_data_wr, i2c_err=>i2c_err,
		start=>start_write, done=>write_done, start_addr=>write_start_addr
	);
	
	-- Timers
	timer1: entity work.timer(arch) generic map(timeout=>5_000) port map(clk=>clk, start=>t_start(0), fire=>t_fire(0));
	timer2: entity work.timer(arch) generic map(timeout=>20) port map(clk=>clk, start=>t_start(1), fire=>t_fire(1));
	timer3: entity work.timer(arch) generic map(timeout=>1_000) port map(clk=>clk, start=>t_start(2), fire=>t_fire(2));
end architecture arch;