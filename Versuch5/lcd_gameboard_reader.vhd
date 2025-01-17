library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity lcd_mem_gameboard_reader is
	port(
		clk: in std_logic;
		board: in work.types.tGameBoard;
		
		addr: in std_logic_vector(6 downto 0);
		
		diamond: in std_logic_vector(6 downto 0);
		
		q: out std_logic_vector(11 downto 0)
	);
end lcd_mem_gameboard_reader;

architecture arch of lcd_mem_gameboard_reader is
		signal board_hi:  std_logic_vector(0 to 80);
		signal board_lo: std_logic_vector(0 to 80);
		
		signal q_next: std_logic_vector(11 downto 0);
		signal q_dia: std_logic_vector(1 downto 0);
		
		signal diamond_addr: std_logic_vector(6 downto 0);
		signal diamond_lo: std_logic;
		signal diamond_offset: unsigned(7 downto 0);
		

begin

	process (diamond) begin
		-- Note: remember display command addresses are offset by +1 for the
		-- set position command. 
		--
		-- range(diamond) := 0 ... 107
		-- line(1) := 0 - 17   => addr := 02 - 19 , lo := 1
		-- line(2) := 18 - 35  => addr := 22 - 39 , lo := 0
		-- line(3) := 36 - 53  => addr := 22 - 39 , lo := 1
		-- line(4) := 54 - 71  => addr := 42 - 59 , lo := 0
		-- line(5) := 72 - 89  => addr := 42 - 59 , lo := 1
		-- line(6) := 90 - 107 => addr := 62 - 79 , lo := 0
		--
		-- split the logic in half, to prevent the priority encoder from having to much depth
		if (unsigned(diamond) < x"36") then -- line 1 - 3
			if(unsigned(diamond) < x"12") then -- line 1
				diamond_lo <= '1';
				diamond_offset <= x"02"; -- (+1)
			elsif(unsigned(diamond) < x"24") then -- line 2
				diamond_lo <= '0';
				diamond_offset <= x"04"; -- (+3)
			else -- line 3
				diamond_lo <= '1';
				diamond_offset <= x"f2"; -- (-15)
			end if;		
		else -- line 4 - 6 
			if(unsigned(diamond) < x"48") then -- line 4
				diamond_lo <= '0';
				diamond_offset <= x"f4"; -- (-13)
			elsif(unsigned(diamond) < x"5A") then -- line 5
				diamond_lo <= '1';
				diamond_offset <= x"e2"; -- (-31)
			else -- line 6
				diamond_lo <= '0';
				diamond_offset <= x"e4"; -- (-29)
			end if;	
		end if;
		
	end process;
	
	diamond_addr <= std_logic_vector(unsigned(diamond) + diamond_offset(6 downto 0));

	board_hi <= '0' & board(0 to 19) & board(40 to 59) & board(80 to 99) & board(120 to 139);
	board_lo <= '0' & board(20 to 39) & board(60 to 79) & board(100 to 119) & board(140 to 159);
	
	process (clk) begin
		if(rising_edge(clk)) then
			q <= q_next;
		end if;
	end process;
	
	process (addr, board_lo, board_hi, diamond_lo) begin
		if(diamond_lo = '0') then
			q_dia <= board_lo(to_integer(unsigned(addr))) & '0';
		else
			q_dia <= board_hi(to_integer(unsigned(addr))) & '1';
		end if;
	end process;
	
	process (addr, board_hi, board_lo, q_dia, diamond_addr) begin
		if(addr = "0000000") then
			q_next <= x"080";
		elsif(unsigned(addr) > x"50") then
			q_next <= x"000";
		elsif(unsigned(addr) = unsigned(diamond_addr)) then
			q_next <= x"40" & "01" & q_dia;
		else
			q_next <= x"40" & "00" & board_hi(to_integer(unsigned(addr))) & board_lo(to_integer(unsigned(addr)));
		end if;
	end process;
end arch;