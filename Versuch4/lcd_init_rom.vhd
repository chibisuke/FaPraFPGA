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

		--
	   -- ADDR: 0x08 - Init TEXT
		--
		
		x"080", -- Set DDRAM Address = 00H (Pos 1,0)
	--  "M"	   "a"     "t"     "r"     "."     "-"     "N"     "r"     "."     ":"     SP
		x"44D", x"461", x"474", x"472", x"42E", x"42D", x"44E", x"472", x"42E", x"43A", x"420",
	--  "4"	   "2"     "9"     "2"     "6"     "4"     "2"
		x"434", x"432", x"439", x"432", x"436", x"434", x"432", 
		
		x"0A0", -- set DDRAM Address = 20H (Pos 2,0)
	--  "T"     "e"     "m"     "p"     "e"     "r"     "a"     "t"     "u"     "r"     ":"
		x"454", x"465", x"46D", x"470", x"465", x"472", x"461", x"474", x"475", x"472", x"43A",
	--  SP      SP      SP      "."      SP      SP     "°"     "C" 
		x"420", x"420", x"420", x"42E", x"420", x"420", x"4DF", x"443", 
		
		x"000", -- NULL termination. 80 byte
		
		x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", --Padding
		
		--
		--	ADDR: 0x40  ROM Data for Char display
		-- 
		-- Note: the 2 leftover bits in the 4 control bits are used here to mark
		--       the places where HEX, Binary and Ascii char data are inserted.
		-- "01": hex display, the left 4 bit determin with nible to use. 
		-- "10": binary, the left 4 bit determin wich bit to use.
		-- "11": ascii
		x"0C0", -- POS 3, 0
		x"424", -- "$"
		x"504", -- hex(7 downto 4)
		x"500", -- hex(3 downto 0)
		x"42C", -- ","
		x"420", -- SP
		x"425", -- "%"
		x"607", -- bin(7)
		x"606", -- bin(6)
		x"605", -- bin(5)
		x"604", -- bin(4)
		x"603", -- bin(3)
		x"602", -- bin(2)
		x"601", -- bin(1)
		x"600", -- bin(0)
		x"0E0", -- POS 4,0
		x"443", -- "C"
		x"468", -- "h"
		x"461", -- "a"
		x"472", -- "r"
		x"43A", -- ":"
		x"420", -- SP
		x"700", -- Ascii
		x"000", -- NULL termination
		
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
