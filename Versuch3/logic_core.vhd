library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.constants.all;

-- This is the logic core of the vending machine, where everything comes together
-- it also contains the current credit
--
-- Note: since we always have multiple of 10 cents, we only count the 10s place and ignore
-- the trailing zero while treating all credit and price values as BCD
--
-- add_credit: add the value of coin_value to the current credit
-- confirm: confirms a output or error state_type
-- select_product: triggers the output of the selected product_available
-- cancel_transaction: returns the money back to the user
-- reset: resets the credit score to zero
--
-- price: the price of the currently selected product, to calculcate the return money
-- product_number: the number of the selected product
-- product_available: denotes if the current product is available (remaining stock) and
--		if the credits are suffient to buy it
-- selection_invalid: denotes if the product selection is invalid (sw are not in a hot-one state)
--
-- h0,h1,h3: the hex values to show on the 7 segment displays
-- buy: a purchase was triggered (to decrement the stock)
-- credit: the current credit value (to calculate the availability based on credits)
entity logic_core is
	port(
		clk: in std_logic;
		
		add_credit: in std_logic;
		confirm: in std_logic;
		select_product: in std_logic;
		cancel_transaction: in std_logic;
		reset: in std_logic;
		
		-- h0-3 are intentionally left unbuffered
		-- (we wouldn't gain any functionality, but waste chip resources)
		h3: out std_logic_vector(3 downto 0);
		h1: out std_logic_vector(3 downto 0) := "0000";
		h0: out std_logic_vector(3 downto 0) := "0000";
		
		coin_value: in unsigned(2 downto 0);
		
		price: in unsigned(2 downto 0);
		product_number: in unsigned(3 downto 0);
		product_available: in std_logic;
		selection_invalid: in std_logic;
		
		buy: out std_logic;
		credit: out unsigned(3 downto 0)
	);
end logic_core;

architecture arch of logic_core is
	type state_type is (INSERT_COIN, CANCEL_TRANS, OUTPUT, ERROR);
	signal c_state, n_state: state_type;
	
	-- current credits
	signal c_credit: unsigned(3 downto 0) := "0000";
	signal n_credit: unsigned(3 downto 0);
	
	-- return money
	signal c_creditRemain: unsigned(3 downto 0) := "0000";
	signal n_creditRemain: unsigned(3 downto 0);
	
	-- error code 
	signal c_error: unsigned(1 downto 0) := "00";
	signal n_error: unsigned(1 downto 0);
	
	signal c_selectedItem: unsigned(3 downto 0) := "0000";	
	signal n_selectedItem: unsigned(3 downto 0);
	
	signal n_buy: std_logic;
begin

	credit <= c_credit;
	
	process (clk, reset) begin
		if(reset = '1') then
			c_state <= INSERT_COIN;
			-- only the tens place since the one-place is always 0 
			c_credit <= to_unsigned(0, c_credit'length);
		elsif (rising_edge(clk)) then
			-- update registers
			c_state <= n_state;
			c_credit <= n_credit;
			c_error <= n_error;
			c_selectedItem <= n_selectedItem;
			c_creditRemain <= n_creditRemain;
			buy <= n_buy;
		end if;
	end process;

	process (c_state, c_credit, add_credit, coin_value, c_error, cancel_transaction, select_product, confirm,
		c_selectedItem, c_creditRemain, selection_invalid, price, product_available, product_number) 
	begin
		-- cleanly initialize the "next" signals, to prevent them from becomming flipflops
		n_state <= c_state;
		n_credit <= c_credit;
		n_error <= c_error;
		n_selectedItem <= c_selectedItem;
		n_creditRemain <= c_creditRemain;
		n_buy <= '0';
		case c_state is
			-- output: "C X0" X = credit
			when INSERT_COIN =>
				-- key2
				if(cancel_transaction = '1') then
					n_state <= CANCEL_TRANS;
				-- key0
				elsif (add_credit = '1') then
					if (c_credit >= MAX_PRICE) then
						-- there are already to many coins, adding any more
						-- results in "E C00"
						n_state <= ERROR;
						n_error <= "00";
					else
						n_credit <= c_credit + coin_value;
					end if;
				-- key1
				elsif (select_product = '1') then
					if(selection_invalid = '1') then
						-- there is an invalid product selection (switches select no or multiple products)
						n_state <= ERROR;
						n_error <= "01";
					elsif(price > c_credit) then
						-- not enougth credits
						n_state <= ERROR;
						n_error <= "10";
					elsif(product_available = '0') then
						-- product not available
						-- Note: Product_available = '0' can also mean "Not enougth credits"
						-- so the order of this checks is important
						n_state <= ERROR;
						n_error <= "11";
					else 
						-- successfull purchase
						-- give return money and decrement product stock
						n_state <= OUTPUT;
						n_creditRemain <= c_credit - price;
						n_selectedItem <= product_number;
						n_buy <= '1';
					end if;
				end if;
				-- display the currect credits
				h3 <= "1100"; -- "C"
				h1 <= std_logic_vector(c_credit);
				h0 <= "0000";
				
			-- output: "C 00" (irelevant, since state is changing back to INSERT_COINT anyway)
			when CANCEL_TRANS => 
				-- theoretically this state could be omitted,
				-- but the project description asks for it
				n_credit <= to_unsigned(0, c_credit'length);
				h3 <= "1100"; -- "C"
				h1 <= "0000";
				h0 <= "0000";
				n_state <= INSERT_COIN;
				
			-- output "Y X0" Y = product number, X = creditRemain
			when OUTPUT => 
				-- puchase is completed, now display the return money and
				-- the product number
				-- key0 or key2
				if(confirm = '1' or cancel_transaction = '1') then
					n_state <= CANCEL_TRANS;
				end if;
				h3 <= std_logic_vector(c_selectedItem);
				h1 <= std_logic_vector(c_creditRemain);
				h0 <= "0000";
				
			-- output "E CX" X = error code
			when ERROR => 
				-- key0
				if (confirm = '1') then
					n_state <= INSERT_COIN;
				end if;
				-- display the error code
				-- "E CX"
				h3 <= "1110"; 
				h1 <= "1100"; 
				h0 <= "00" & std_logic_vector(c_error);
		end case;
	end process;
end arch;
