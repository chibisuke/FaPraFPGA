library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity entropy is
    port (
		  clk    : in  std_logic;
        c0     : in  std_logic;  -- PLL output c0
        c1     : in  std_logic;  -- PLL output c1
        random_bit: out std_logic
    );
end entropy;

architecture rtl of entropy is
    signal sample_a, sample_b : std_logic;
    signal meta_a, meta_b     : std_logic;
begin
    -- Sample between clock domains
    process(c0)
    begin
	  if rising_edge(c0) then
          sample_a <= not meta_a;
          meta_a   <= sample_b;
	  end if;
    end process;
    process(c1)
    begin
        if rising_edge(c1) then
          sample_b <= not meta_b;
          meta_b   <= sample_a;
        end if;
    end process;
    
    -- XOR the metastable signals for entropy extraction
    random_bit <= meta_a xor meta_b;
 end architecture;