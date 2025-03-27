library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity adcdac is
	generic (
		WL: integer := 16
	);
	port(
      clk: in  std_logic;
      dac_data_in: in std_logic_vector((WL*2)-1 downto 0);
      adc_data_out: out std_logic_vector((WL*2)-1 downto 0);
      m_clk: out std_logic;
		b_clk: in std_logic;
		dac_lr_clk: in std_logic;
		adc_lr_clk: in std_logic;
      dacdat: out std_logic;
      adcdat: in std_logic;
      adc_ready: out std_logic;
		dac_idle: out std_logic
	);
end adcdac;

architecture dsp_A of adcdac is
	signal mclk, mclk_next: unsigned(1 downto 0);
	

	constant ADB_BUFFER_LEN: integer := WL * 2; 
	signal adc_in_buffer, adc_in_buffer_next: std_logic_vector(ADB_BUFFER_LEN-1 downto 0);
	signal dac_out_buffer, dac_out_buffer_next: std_logic_vector(ADB_BUFFER_LEN-1 downto 0);
	signal adc_in_counter, adc_in_counter_next: unsigned(6 downto 0);
	signal doRead, doRead_old: std_logic;
	
	signal dac_idle_next: std_logic;
	signal dac_lr_old, adc_lr_old: std_logic;
	signal adc_ready_next: std_logic;
	signal adc_data_out_reg, adc_data_out_next: std_logic_vector(31 downto 0);
	signal dac_load: std_logic;
begin
	process (clk) begin
		if(rising_edge(clk)) then
			mclk <= mclk_next;
			if(b_clk = '0') then
				dac_idle <= dac_idle_next;
				adc_ready <= adc_ready_next;
				adc_data_out_reg <= adc_data_out_next;
			end if;
		end if;
	end process;
	
	mclk_next <= mclk + 1; 
	m_clk <= mclk(1);
	dac_idle_next <= '1' when (dac_lr_old = '0' and dac_lr_clk = '1') else '0';
	
	process (b_clk) begin
		if(rising_edge(b_clk)) then
			dac_lr_old <= dac_lr_clk;
			adc_lr_old <= adc_lr_clk;
			doRead_old <= doRead;
			adc_in_counter <= adc_in_counter_next;
			if(doRead = '1') then
				adc_in_buffer <= adc_in_buffer_next;
			end if;
			dac_load <= '0';
			if(dac_lr_old = '0' and dac_lr_clk = '1') then
				dac_load <= '1';
			end if;
		end if;
		if(falling_edge(b_clk)) then
			dac_out_buffer <= dac_out_buffer_next;
			if(dac_load = '1') then
				dac_out_buffer <= dac_data_in;
			end if;
		end if;
	end process;
	adc_in_counter_next <= (others=>'0') when adc_lr_old = '0' and adc_lr_clk = '1' else adc_in_counter + 1;
	adc_in_buffer_next <= adc_in_buffer(ADB_BUFFER_LEN-2 downto 0) & adcdat;
	dac_out_buffer_next <= dac_out_buffer(ADB_BUFFER_LEN-2 downto 0) & '0';
	doRead <= '1' when (adc_in_counter < (WL*2)) else '0';
	dacdat <= dac_out_buffer(ADB_BUFFER_LEN-1);
	adc_ready_next <= '1' when (doRead_old = '1' and doRead = '0') else '0';
	adc_data_out_next <= adc_in_buffer when (doRead_old = '1' and doRead = '0') else adc_data_out_reg;
	adc_data_out <= adc_data_out_reg;
end dsp_A;
