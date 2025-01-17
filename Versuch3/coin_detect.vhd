library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- this entity resembles the coin slot of the vending machine. 
-- 
-- sw(2 downto 0): selects the value of the coin that is inserted into the vending machine
-- trigger: triggers the actual insertion event.
--
-- coin_value: outputs the tens digit of the current coin value
-- coin_inserted: edge that reports a successfull insertion event
--
-- invalid: displays an invalid state of the sw(2 downto 0), so an insertion of a coin cannot take place

entity coin_detect is
	port(
		sw: in std_logic_vector(2 downto 0);
		trigger: in std_logic;
		coin_value: out unsigned(2 downto 0);
		invalid: out std_logic;
		coin_inserted: out std_logic
	);
end coin_detect;

architecture arch of coin_detect is
	signal is_valid: std_logic;
	signal next_value: unsigned(2 downto 0);
begin
	-- we don't buffer coin_inserted since "trigger" is already syncronized to the clk and 
	-- the signal only causes effects during rising_edge(clk)
	-- delaying the inserted event by a clk cycle would result in the logic core receiving a confirm
	-- and a inserted event right after another, which we do not want. 
	coin_inserted <= trigger and is_valid;
	
	-- return the value of the selected coin
	-- we treat the coin value as BCD and omit the trailing zero
	coin_value <= next_value;
	with sw select
		next_value <= unsigned'("101") when "100",
						  unsigned'("010") when "010",
						  unsigned'("001") when "001",
						  unsigned'("000") when others;
	is_valid <= '1' when next_value /= 0 else '0';
	invalid <= not is_valid;
end arch;
