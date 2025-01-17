--******************************************************
--Versuch: 2
--Name:	Rene Henzinger
--Matrikel-Nr.: 4292642
--Zeitbedarf: 6 Stunden
--******************************************************

library ieee;
use ieee.std_logic_1164.all;

entity Versuch2 is
	port(
	   clk: in std_logic;
		key:  in std_logic_vector(3 downto 0);
		ledr: out std_logic_vector(9 downto 0);
		sw: in std_logic_vector(9 downto 0);
		ledg: out std_logic_vector(0 downto 0);
		hex0: out std_logic_vector(6 downto 0);
		hex1: out std_logic_vector(6 downto 0);
		hex2: out std_logic_vector(6 downto 0);
		hex3: out std_logic_vector(6 downto 0)
	);
end Versuch2;

architecture arch of Versuch2 is
	-- mode selection signal
	signal prog_mode: std_logic := '1';
	signal exec_mode: std_logic := '0';
	
	-- trigger signals for edge detection
	signal key3_triggered: std_logic := '0';
	signal key2_triggered: std_logic := '0';
	signal key1_triggered: std_logic := '0';
	
	-- signals for Register values
	signal period: std_logic_vector(9 downto 0);
	signal repeat: std_logic_vector(9 downto 0);
	signal ram_value: std_logic_vector(9 downto 0);
	signal current_address: std_logic_vector(3 downto 0);
	
	-- done signal from the pwm controller to switch to the next address
	signal pwm_done: std_logic;
	-- PWM output signal
	signal pwm_out: std_logic;
begin

	--== Input ==--
	-- Mode selector (Prod / Exec mode)
	mode_selector: entity work.toggle_button(arch) port map(clk=>clk, input=>key(0), state=>exec_mode, neg_state=>prog_mode);
	-- Edge detection for storing the period and repeat values using key3
	key3_edge: entity work.edge_detect(arch) port map(clk=>clk, input=>key(3), edge=>key3_triggered);
	-- edge detection for storing the pwm value using key2
	key2_edge: entity work.edge_detect(arch) port map(clk=>clk, input=>key(2), edge=>key2_triggered, en=>prog_mode);
	-- edge detection for switching between addresses using key2
	key1_edge: entity work.edge_detect(arch) port map(clk=>clk, input=>key(1), edge=>key1_triggered, en=>prog_mode);
	
	--== memory / registers /storage + logic controller ==--
	-- registers for period and repeat
	reg_period: entity work.reg(arch) port map(clk=>clk, D=>sw, Q=>period, wr=>key3_triggered, en=>prog_mode);
	reg_repeat: entity work.reg(arch) port map(clk=>clk, D=>sw, Q=>repeat, wr=>key3_triggered, en=>exec_mode);
	-- Address logic
	addr_sel: entity work.addr_selector(arch) port map(clk=>clk, next1=>key1_triggered, next2=>pwm_done, current=>current_address);
	-- M4K Memory
	ram: entity work.ram(arch) generic map(ADDR_WIDTH=>4,DATA_WIDTH=>10) port map(clk=>clk,wr=>key2_triggered,addr=>current_address,Q=>ram_value,D=>sw);
	-- the PWM Controller creating the pwm output signal
	pwm_controler: entity work.pwm(arch) port map(clk=>clk, valu=>ram_value, period=>period, repeat=>repeat & "000000", en=>exec_mode, output=>pwm_out, done=>pwm_done, stop=>sw);
	
	--== output ==
	-- 7 segment output
	h0: entity work.seven_segment port map(in4=>ram_value(3 downto 0), hex=>hex0);
	h1: entity work.seven_segment port map(in4=>ram_value(7 downto 4), hex=>hex1);
	h2: entity work.seven_segment port map(in4=>"00" & ram_value(9 downto 8), hex=>hex2);
	h3: entity work.seven_segment port map(in4=>current_address, hex=>hex3);
	-- Red LEDs
	ledr_out: entity work.output_select(arch) port map(input0=>period, input1=>(others=>pwm_out), output=>ledr, sel=>exec_mode);	
	-- Green LEDs
	ledg(0) <= exec_mode;
end arch;
