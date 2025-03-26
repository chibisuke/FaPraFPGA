library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity adcdac is
	generic (
		WL: integer := 16
	);
	port(
      clk, reset: in  std_logic;
      dac_data_in: in std_logic_vector(31 downto 0);
      adc_data_out: out std_logic_vector(31 downto 0);
      m_clk: out std_logic;
		b_clk, dac_lr_clk, adc_lr_clk: in std_logic;
      dacdat: out std_logic;
      adcdat: in std_logic;
      adc_ready: out std_logic;
		
		dac_idle: out std_logic
	);
end adcdac;

architecture dsp_A of adcdac is
	signal mclk, mclk_next: unsigned(2 downto 0);
	
	constant ADB_BUFFER_LEN: integer := WL * 2; 
	signal adc_in_buffer, adc_in_buffer_next: std_logic_vector(ADB_BUFFER_LEN-1 downto 0);
	signal dac_out_buffer, dac_out_buffer_next: std_logic_vector(ADB_BUFFER_LEN-1 downto 0);
	signal adc_in_counter, adc_in_counter_next: unsigned(6 downto 0);
	signal doRead, doRead_old: std_logic;
	
	signal dac_idle_next: std_logic;
	signal dac_lr_old, adc_lr_old: std_logic;
	signal adc_ready_next: std_logic;
begin
	process (clk) begin
		if(rising_edge(clk)) then
			mclk <= mclk_next;
			dac_idle <= dac_idle_next;
			doRead_old <= doRead;
			adc_ready <= adc_ready_next;
		end if;
	end process;
	
	mclk_next <= mclk + 1; 
	m_clk <= mclk(2);
	dac_idle_next <= '1' when (dac_lr_old = '0' and dac_lr_clk = '1') else '0';
	
	process (b_clk) begin
		if(rising_edge(b_clk)) then
			dac_lr_old <= dac_lr_clk;
			adc_lr_old <= adc_lr_clk;
			if(adc_lr_old = '0' and adc_lr_clk = '1') then
				adc_in_counter <= (others=>'0');
			end if;
			if(dac_lr_old = '0' and dac_lr_clk = '1') then
				dac_out_buffer <= dac_data_in;
			end if;
			if(doRead = '1') then
				adc_in_buffer <= adc_in_buffer_next;
			end if;
		end if;
		if(falling_edge(b_clk)) then
			dac_out_buffer <= dac_out_buffer_next;
		end if;
	end process;
	
	adc_in_buffer_next <= adc_in_buffer(ADB_BUFFER_LEN-2 downto 0) & adcdat;
	dac_out_buffer_next <= dac_out_buffer(ADB_BUFFER_LEN-2 downto 0) & '0';
	doRead <= '1' when (adc_in_counter < (WL*2)) else '0';
	dacdat <= dac_out_buffer(ADB_BUFFER_LEN-1);
	adc_ready_next <= '1' when (doRead_old = '0' and doRead = '1') else '0';
end dsp_A;
