--******************************************************
--Versuch: 6
--Name: Rene Henzinger
--Matrikel-Nr.: 4292642
--Zeitbedarf: 18 Stunden
--******************************************************

library ieee;
use ieee.std_logic_1164.all;

entity Versuch6 is
	port(
		clk: in std_logic;
		
		key0:  in std_logic;
		sw0: in std_logic;
		
		ledr: out std_logic_vector(0 downto 0);
		ledg: out std_logic_vector(1 downto 0);
		
		lcd_scl: inout std_logic;
		lcd_sda: inout std_logic;
		lcd_reset: out std_logic;
		
		sram_addr: out std_logic_vector(17 downto 0);
		sram_dq: inout std_logic_vector(15 downto 0);
		sram_we_n: out std_logic
	);
end Versuch6;

architecture arch of Versuch6 is
	signal start: std_logic;
	signal reset: std_logic;
	signal display_data: work.types.lcd_output_data;
	
	signal fclk: std_logic;
	signal update_lcd: std_logic;
begin

	-- PLL to generate the faster clock required to max out the performance of the SRAM
	pll_fclk: entity work.pll port map(inclk0=>clk, c0=>fclk);

	-- TWO edge detection circuits, one for each clock, so we have the signal in the correct
	-- clock domain without having to cross clock domains. 
	ed_key0_f: entity work.edge_detect(arch) port map(clk=>fclk, input=>key0, edge=>start);
	ed_key0_c: entity work.edge_detect(arch) port map(clk=>clk, input=>key0, edge=>reset);
	
	-- the LCD to display the results running at 50MHz
	lcd: entity work.lcd(arch) port map(clk=>clk, reset=>reset, sda=>lcd_sda, scl=>lcd_scl, lcd_reset=>lcd_reset, update_lcd=>update_lcd, 
		display_data=>display_data
	);
	
	-- the memory test suit, containing the memory controler
	-- Completely running at the 100MHz PLL Clock
	ram: entity work.mem_test(arch) port map(fclk=>fclk, display_data=>display_data,
		sram_addr=>sram_addr, sram_dq=>sram_dq, sram_we_n=>sram_we_n,
		status_write=>ledg(1), status_verify=>ledg(0), status_error=>ledr(0),
		start=>start, update_lcd=>update_lcd, simulate_error=>sw0
	);
	
end arch;
