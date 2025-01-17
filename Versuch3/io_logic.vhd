library ieee;
use ieee.std_logic_1164.all;

-- splitting the IO Logic from Versuch3.vhd to make the code more transparent

--
-- clk: the clock to use
-- key: the 4 buttons
-- h0,2,3: the binary value to display on the 7-segment displays
--
-- key_trigger: outputs an edge when the button is pressed
-- hex0,2,3: the ouptut lines for the 7 segment display

entity io_logic is
	port(
		clk: in std_logic;
		key: in std_logic_vector(3 downto 0);
		h0: in std_logic_vector(3 downto 0);
		h1: in std_logic_vector(3 downto 0);
		--h2: is always off, so we don't need it
		h3: in std_logic_vector(3 downto 0);
		
		key_trigger: out std_logic_vector(3 downto 0);
		hex0: out std_logic_vector(6 downto 0);
		hex1: out std_logic_vector(6 downto 0);
		hex3: out std_logic_vector(6 downto 0)
	);
end io_logic;

architecture arch of io_logic is
begin
	-- Edge detectors for the keys
	edge0: entity work.edge_detect(arch) port map(clk=>clk, input=>key(0), edge=>key_trigger(0));
	edge1: entity work.edge_detect(arch) port map(clk=>clk, input=>key(1), edge=>key_trigger(1));
	edge2: entity work.edge_detect(arch) port map(clk=>clk, input=>key(2), edge=>key_trigger(2));
	edge3: entity work.edge_detect(arch) port map(clk=>clk, input=>key(3), edge=>key_trigger(3));
	
	-- 7 segment decoders
	outh0: entity work.seven_segment(arch) port map(in4=>h0, hex=>hex0);
	outh1: entity work.seven_segment(arch) port map(in4=>h1, hex=>hex1);
	outh3: entity work.seven_segment(arch) port map(in4=>h3, hex=>hex3);
end arch;
