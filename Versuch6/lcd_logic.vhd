library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- LCD Logic Core
-- contains the state engine that manages the LCD Initialization and Update
-- Note: the I2C Logic was moved to a seperate state engine in the LCD_I2C_Writer.
--
-- clk: the clock to use
-- lcd_reset: active low reset pin to reset the LCD Panel hardware
--
-- t_start: triggers to start the timers
-- t_fire: Trigger that report an elapsed timer
--
-- start_write: trigger to start I2C Communication
-- write_done: signals I2C Communication is finished
-- write_start_addr: The start memory address that contains the
--  	LCD Commands that should be written to the display. 
--		stops at the next null word. 
--
-- trigger_update_lcd: signal to trigger the update of the LCD after
--   a test run was completed. this signal is passed to an internal syncronizer
--   so it can come from a register of another clock domain, given its timing is long
--   enougth
-- trigger_reset: a reset of the display hardware was requested
--
entity lcd_logic is
    port (
		clk: in std_logic;
	
		lcd_reset: out std_logic;
				
		t_start: out std_logic_vector(2 downto 0);
		t_fire: in std_logic_vector(2 downto 0);
		
		start_write: out std_logic;
		write_done: in std_logic;
		write_start_addr: out std_logic_vector(7 downto 0);
		
		trigger_update_lcd: in std_logic;
		trigger_reset: in std_logic;
		
		lcd_init_done: out std_logic
    );
end entity lcd_logic;

architecture arch of lcd_logic is
	 type state_type is (
		-- hardware reset sequence
		INIT_START, INIT_WAIT, INIT_RESET, INIT_WAIT2, 
		-- initial write
		INIT_SEQ,
		-- main "loop"
		WAIT_MAIN,
		DO_UPDATE_LCD
		);
	 
    signal state : state_type := INIT_START;
	 signal next_state: state_type;
	 
	 -- signals for the next logic
	 signal t_start_next: std_logic_vector(2 downto 0);
	 signal lcd_reset_next: std_logic;	 
	 
	 signal start_write_next: std_logic;
	 signal write_start_addr_next: std_logic_vector(7 downto 0);
	 
	 signal update_lcd, update_lcd_next: std_logic;
	 signal do_reset, do_reset_next: std_logic;
	 
	 signal lcd_init_done_next: std_logic;
	 
	 signal update_lcd_sync1, update_lcd_sync: std_logic;

begin

	-- synchronizer registers for the Clock Domain Crossing of the update_lcd signal
	process (clk) begin
		if(rising_edge(clk)) then
			update_lcd_sync1 <= trigger_update_lcd;
			update_lcd_sync <= update_lcd_sync1;
		end if;
	end process;
	
	process (clk) begin
		if(rising_edge(clk)) then
			state <= next_state;
			t_start <= t_start_next;
			lcd_reset <= lcd_reset_next;
			start_write <= start_write_next;
			write_start_addr <= write_start_addr_next;
			update_lcd <= update_lcd_next;
			do_reset <= do_reset_next;
			lcd_init_done <= lcd_init_done_next;
		end if;
	end process;
	
	process (state, t_fire, write_done, do_reset, trigger_reset, update_lcd, update_lcd_sync) begin
		next_state <= state;
		-- store the trigger events until they can be processed
		update_lcd_next <= update_lcd or update_lcd_sync;
		do_reset_next <= do_reset or trigger_reset;
		-- the following signals are only used in certain states and don't need to keep
		-- their value outside of the state. 
		-- to prevent them from becomming registers we initialize them with sensible defaults
		t_start_next <= (others=>'0');
		lcd_reset_next <= '1';
		start_write_next <= '0';
		write_start_addr_next <= (others=>'0');
		lcd_init_done_next <= '0';

		case state is
			-- start timer 1
			when INIT_START =>
				t_start_next(0) <= '1';
				next_state <= INIT_WAIT;
			-- wait for timer 0
			-- then trigger a reset of the LCD Hardware
			-- and start timer 1
			when INIT_WAIT =>
				if(t_fire(0)='1') then
					next_state <= INIT_RESET;
					t_start_next(1) <= '1';
				end if;
			-- wait for timer 2
			-- then release the reset pin and start timer 2
			when INIT_RESET =>
				lcd_reset_next <= '0';
				if(t_fire(1)='1') then
					next_state <= INIT_WAIT2;
					t_start_next(2) <= '1';
				end if;
			-- wait for timer 2
			when INIT_WAIT2 =>
				if(t_fire(2)='1') then
					next_state <= INIT_SEQ;
				end if;
			-- Send the init sequence, including the initial text
			-- Note: since the LCD Write obays the busy flag of the
			-- display, we do not need an additional timer here
			when INIT_SEQ => 
				start_write_next <= '1';
				write_start_addr_next <= x"00";
				if(write_done = '1') then
					lcd_init_done_next <= '1';
					next_state <= WAIT_MAIN;
				end if;
			-- Now init is done and we wait for any update triggers
			WHEN WAIT_MAIN =>
				if(update_lcd='1') then
					next_state <= DO_UPDATE_LCD;
				elsif(do_reset='1') then
					do_reset_next <= '0';
					next_state <= INIT_START;
				end if;
				
			-- write the LCD Contents after the mem_test was completed
			WHEN DO_UPDATE_LCD =>
				start_write_next <= '1';
				write_start_addr_next <= x"10";
				update_lcd_next <= '0';
				if(write_done = '1') then
					next_state <= WAIT_MAIN;
				end if;
		end case;	
	end process;



end architecture arch;