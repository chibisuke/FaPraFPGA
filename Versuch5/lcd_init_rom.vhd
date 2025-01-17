--ram.vhd
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- This ROM entity contains the init sequence of the display (beginning at address x00)
-- and the init sequence for the initial display content (beginning at addres x10)

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
	constant display_rom: mem_2d_type := (
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
		
		-- Init Character RAM 
		x"040",
		x"400", x"400", x"400", x"400", x"400", x"400", x"400", x"400",
		x"400", x"400", x"400", x"400", x"41F", x"41F", x"41F", x"41F",
		x"41F", x"41F", x"41F", x"41F", x"400", x"400", x"400", x"400",
		x"41F", x"41F", x"41F", x"41F", x"41F", x"41F", x"41F", x"41F",
		x"404", x"40E", x"40E", x"404", x"400", x"400", x"400", x"400",
		x"400", x"400", x"400", x"400", x"404", x"40E", x"40E", x"404", 
		x"404", x"40E", x"40E", x"404", x"41F", x"41F", x"41F", x"41F",
		x"41F", x"41F", x"41F", x"41F", x"404", x"40E", x"40E", x"404",
		x"000",
		
		-- 0x50
		x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000",
		x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000",
		
		
		--
	   -- ADDR: 0x60 - GAME OVER
		--
		
		
		x"001", x"0A5", -- Set DDRAM Address = 00H (Pos 1,0)
		x"447", x"441", x"44D", x"445", x"420", x"44F", x"456", x"445", x"452", -- GAME OVER
		x"0C4",
		x"444", x"469", x"461", x"46d", x"46f", x"46e", x"464", x"473", x"43a", -- Diamonds:
		x"600", x"601",
	
	--  "M"	   "a"     "t"     "r"     "."     "-"     "N"     "r"     "."     ":"     SP
	--	x"400", x"401", x"402", x"403", x"404", x"405", x"406", x"407", x"400", x"401", x"402", x"403", x"404", x"405", x"406", x"407", x"400", x"401", x"402", x"403", x"404", x"405", x"406", x"407",		
		others=>x"000" -- fill remaining rom segments with zeros
	);
	signal data_reg: std_logic_vector(11 downto 0);
begin
	process (clk,addr)
	begin
		if(rising_edge(clk)) then
			data_reg <= display_rom(to_integer(unsigned(addr)));	
		end if;
	end process;
	q <= data_reg;
end arch;
