--ram.vhd
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- This ROM entity contains the init sequence of the display (beginning at address x00)
-- and the game over screen (beginning at addres x60)

-- Using Altera synchronous single-port ROM Emulation with registered read data (M4K module)
--
-- clk: the clock to use
-- addr: the address to read
-- Q: the (buffered) output data
--
entity lcd_init_rom is
	port(
		clk: in std_logic;
		addr: in std_logic_vector(6 downto 0);
		Q: out std_logic_vector(11 downto 0)
	);
end lcd_init_rom;

architecture arch of lcd_init_rom is
	type mem_2d_type is array (0 to 2**7) of std_logic_vector(11 downto 0);
	constant DISPLAY_ROM: mem_2d_type := (
		--
		-- Init LCD
		--

		x"03A", -- Function Set 8bit, RE=1, REV=0
		x"009", -- Extended function set, 4 line display
		x"006", -- Entry mode set - bottom view
		x"01E", -- Bias setting - BS1=1
		x"072", -- Rom Select
		x"40C", -- ROM-C
		x"039", -- Function Set 8bit, RE=0, IS=1
		x"01B", -- Internal OSC BS0=1 -> Bias = 1/6
		x"06E", -- Follower control - Devider on and set value
		x"057", -- Power control - Booster on, contrast (DB1=C5, DB0=C4)
		x"072", -- Contrast Set - (DB3-DB0=C3-C0)
		x"038", -- Function Set 8bit, RE=0, IS=0
		x"00C", -- Display on, cursor off, blink off
		x"001", -- Clear display
		-- NO null termination here, since init seq and text init are executed as one operation
		
		x"000", x"000",
		
		-- ADDR: 0x10
		x"001", 
		x"080", -- Line 1
		x"454", x"461", x"46B", x"474", x"465", x"43A", x"420", x"430", x"478", -- Takte: 0x
		x"607", x"606", x"605", x"604", x"603", x"602", x"601", x"600",
		x"0A0", -- Line 2
		x"45A", x"465", x"469", x"474", x"420", x"428", x"457", x"429", x"43A", x"420", -- Zeit (W):
		x"503", x"502", x"501", x"500", 
		x"420", x"46D", x"473",
		x"0C0", -- Line 3
		x"45A", x"465", x"469", x"474", x"420", x"428", x"452", x"429", x"43A", x"420", -- Zeit (R):
		x"513", x"512", x"511", x"510", 
		x"420", x"46D", x"473",
		x"0E0", -- Line 4
		x"446", x"465", x"468", x"46C", x"465", x"472", x"43A", x"420", -- Fehler: 
		x"700",
		x"000",
		
	
		others=>x"000" -- fill remaining rom segments with zeros
	);
	signal data_reg: std_logic_vector(11 downto 0);
begin
	process (clk,addr)
	begin
		if(rising_edge(clk)) then
			data_reg <= DISPLAY_ROM(to_integer(unsigned(addr)));	
		end if;
	end process;
	q <= data_reg;
end arch;
