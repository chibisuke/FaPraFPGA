library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity adc_dac is
   port (
      clk, reset: in  std_logic;
      dac_data_in: in std_logic_vector(31 downto 0);
      adc_data_out: out std_logic_vector(31 downto 0);
      m_clk, b_clk, dac_lr_clk, adc_lr_clk: out std_logic;
      dacdat: out std_logic;
      adcdat: in std_logic;
      load_done_tick: out std_logic
   );
end adc_dac;

architecture arch of adc_dac is
   constant M_DVSR: integer := 2;
   constant B_DVSR: integer := 3;
   constant LR_DVSR: integer := 5;
   signal m_reg, m_next: unsigned(M_DVSR-1 downto 0);
   signal b_reg, b_next: unsigned(B_DVSR-1 downto 0);
   signal lr_reg, lr_next: unsigned(LR_DVSR-1 downto 0);
   signal dac_buf_reg, dac_buf_next:
          std_logic_vector(31 downto 0);
   signal adc_buf_reg, adc_buf_next:
          std_logic_vector(31 downto 0);
   signal lr_delayed_reg, b_delayed_reg: std_logic;
   signal m_12_5m_tick, load_tick: std_logic;
   signal b_neg_tick, b_pos_tick: std_logic;
begin
   --=================================================================
   -- clock signals for codec digital audio interface
   --=================================================================
   -- registers
   process (clk, reset)
   begin
      if reset='1' then
         m_reg <= (others=>'0');
         b_reg <= (others=>'0');
         lr_reg <= (others=>'0');
         dac_buf_reg <=  (others=>'0');
         adc_buf_reg <=  (others=>'0');
         b_delayed_reg <= '0';
         lr_delayed_reg <= '0';
      elsif (rising_edge(clk)) then
         m_reg <= m_next;
         b_reg <= b_next;
         lr_reg <= lr_next;
         dac_buf_reg <= dac_buf_next;
         adc_buf_reg <= adc_buf_next;
         b_delayed_reg <= b_reg(B_DVSR-1);
         lr_delayed_reg <= lr_reg(LR_DVSR-1);
      end if;
   end process;
   -- codec 12.5 MHz m_clk (master clock)
   -- ideally should be 12.288 MHz
   m_next <= m_reg + 1;  -- mod-4 counter
   m_clk <= m_reg(M_DVSR-1);
   m_12_5m_tick <= '1' when m_reg=0 else '0';
   -- b_clk (m_clk / 8 = 32*48 KHz )
   b_next <= b_reg + 1 when m_12_5m_tick='1' else
             b_reg;  -- mod-8 counter
   b_clk <= b_reg(B_DVSR-1);
   -- neg edge of b_clk
   b_neg_tick <= b_delayed_reg and (not b_reg(B_DVSR-1));
   -- pos edge of b_clk
   b_pos_tick <= (not b_delayed_reg) and b_reg(B_DVSR-1);
   -- adc_/dac_lr_clk (dac_lr_clk / 32 = 48 KHz )
   lr_next <= lr_reg + 1 when b_neg_tick='1' else
              lr_reg;  -- mod-32 counter
   dac_lr_clk <= lr_reg(LR_DVSR-1);
   adc_lr_clk <= lr_reg(LR_DVSR-1);
   -- load DAC tick at the 0-to-1 transition of dac_lr_clk
   load_tick <= (not lr_delayed_reg) and lr_reg(LR_DVSR-1);
   load_done_tick <= load_tick;
   --=================================================================
   -- DAC buffer to shift out data
   -- data shifted out at b_clk 1-to-0 edge
   --=================================================================
   dac_buf_next <=
      dac_data_in when load_tick='1' else
      dac_buf_reg(30 downto 0) & '0' when b_neg_tick='1' else
      dac_buf_reg;
   dacdat <= dac_buf_reg(31);
   --=================================================================
   -- ADC buffer to shift in data
   --    data shifted out at the b_clk 1-to-0 edge from ADC
   --    use 0-to-1 edge to latch in ADC data 
   --=================================================================
   adc_buf_next <=
--      (others=>'0') when load_tick='1' else  -- not really needed
      adc_buf_reg(30 downto 0) & adcdat when b_pos_tick='1'  else
      adc_buf_reg;
   adc_data_out <= adc_buf_reg;  
end arch;