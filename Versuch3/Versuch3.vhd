--******************************************************
--Versuch: 3
--Name: Rene Henzinger
--Matrikel-Nr.: 4292642
--Zeitbedarf: 12h
--******************************************************

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Versuch3 is
	port(
		clk: in std_logic;
		key:  in std_logic_vector(3 downto 0);
		sw: in std_logic_vector(7 downto 0);
		hex0: out std_logic_vector(6 downto 0);
		hex1: out std_logic_vector(6 downto 0);
		--hex2 is not needed, since it is always blank
		hex3: out std_logic_vector(6 downto 0);
		ledg: out std_logic_vector(7 downto 0);
		ledr: out std_logic_vector(9 downto 8)
	);
end Versuch3;

architecture arch of Versuch3 is
	signal key_trigger: std_logic_vector(3 downto 0);
	
	-- value to show on the hex display. Note: hex2 is always blank, and therefor doesn't exist here
	signal h0, h1, h3: std_logic_vector(3 downto 0);
	
	-- signals from the coin slot to the core logic
	signal coin_inserted: std_logic;
	signal coin_value: unsigned(2 downto 0);
	
	-- signals between the product selector and the core logic
	signal buy: std_logic;
	signal current_credit: unsigned(3 downto 0);
	signal price: unsigned(2 downto 0);
	signal product_number: unsigned(3 downto 0);
	signal product_available: std_logic;
	signal invalid_selection: std_logic;
begin
	-- IO Logic (7 semgents + edge detection)
	io: entity work.io_logic(arch) port map(clk=>clk,key=>key,key_trigger=>key_trigger,h0=>h0,h1=>h1,h3=>h3,hex0=>hex0,hex1=>hex1,hex3=>hex3);
	
	-- coin slot
	coin_slot: entity work.coin_detect(arch) port map(sw=>sw(2 downto 0),trigger=>key_trigger(0),invalid=>ledr(8),coin_inserted=>coin_inserted,coin_value=>coin_value);
	
	product_select: entity work.product_mgmt(arch) port map(clk=>clk, sw=>sw, reset=>key_trigger(3), buy=>buy, 
		current_credit=>current_credit, price=>price, product_number=>product_number, product_available=>product_available,
		invalid_selection=>invalid_selection, product_availability=>ledg);
	
	-- primary state logic
	logic: entity work.logic_core(arch) port map(clk=>clk, h0=>h0, h1=>h1, h3=>h3, add_credit=>coin_inserted, confirm=>key_trigger(0),
		coin_value=>coin_value, cancel_transaction=>key_trigger(2), reset=>key_trigger(3),
		select_product=>key_trigger(1), price=>price, product_number=>product_number, product_available=>product_available,
		selection_invalid=>invalid_selection, buy=>buy, credit=>current_credit);	
	
	ledr(9) <= invalid_selection;
end arch;
