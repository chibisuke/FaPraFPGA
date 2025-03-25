library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity audio_config is
	port(
		clk: in std_logic;
		i2c_data: out std_logic_vector(23 downto 0);
		i2c_wr: out std_logic;
		i2c_idle: in std_logic
	);
end audio_config;

architecture arch of audio_config is
	type tConfigData is array (0 to 15) of std_logic_vector(8 downto 0);
	constant I2C_ADDR: std_logic_vector(7 downto 0) := x"34";
	constant CONFIG_DATA: tConfigData := (
		"100011100", -- Left line in (LINVOL = +0dB, LINMUTE = disabled)
		"100011100", -- Right line in (RINVOL = +0dB, RINMUTE = disabled)
		"001111001", -- Headphone left (LHPVOL = +0dB, LeftChannel-ZeroCross = 0)
		"001111001", -- Headphone right (RHPVOL = +0dB, RightChannel-ZeroCross = 0)
		"000010010", -- Audio Path control (MICBOOST = 0, MUTEMIC = 1, INSEL=0(LineIn), BYPASS = 0, DACSEL = 1, SIDETONE = 0, SIDEATT = -6dB)
		"000000000", -- Digital Audio Control  (ADC-HighPass = 0, DEEMPhasesControl = disabled, DAC Soft Mute = 0, HPOR = 0)
		"001100010", -- Power Down Control ( LineInPD = 0, MicPd = 1, AdcPd = 0, DacPd = 0, OutPd = 0, OscPd = 1, ClkOutPd = 1, Poweroff = 0)
		"000000001", -- Digital Audio Interface Format  (FORMAT = Left Justified, InputDataBitLength = 16 bit, LRP DACLRC=IGN, 
						 -- LRSWAP = 0, Master/Slave = Slave, BCLK-Invert = 0
		"000000000", -- Sampling Control (Mode = Normal(256/384fs), Oversampling = 256fs, SR = 0000 (48kHz), ClkDiv = 0)
		"000000001", -- Active Control (Inactive)
		others=>"000000000"
		-- "000000000" -- RESET
	);
	signal address, address_next: unsigned(3 downto 0);
	type tState is (IDLE, WR, WR_START, WR_WAIT, DONE);
	signal state, state_next: tState;
	signal i2c_data_next: std_logic_vector(23 downto 0);
	signal i2c_wr_next: std_logic;
begin
	process (clk) begin
		if(rising_edge(clk)) then
			state <= state_next;
			address <= address_next;
			i2c_data <= i2c_data_next;
			i2c_wr <= i2c_wr_next;
		end if;
	end process;
	
	process (state, address, i2c_idle) begin
		state_next <= state;
		address_next <= address;
		i2c_data_next <= x"000000";
		i2c_wr_next <= '0';
		case state is 
			when IDLE =>
				state_next <= WR;
				address_next <= "1111";
			when WR =>
				if(i2c_idle = '1') then
					i2c_data_next <= I2C_ADDR & "000" & std_logic_vector(address) & CONFIG_DATA(to_integer(address));
					i2c_wr_next <= '1';
					state_next <= WR_START;
				end if;
			when WR_START =>
				if(i2c_idle = '0') then 
					state_next <= WR_WAIT;
				end if;
			when WR_WAIT =>
				if(i2c_idle = '1') then
					if(address = 9) then
						state_next <= DONE;
					else
						address_next <= address + "0001";	
						state_next <= WR;
					end if;
				end if;
			when DONE =>

		end case;
	end process;	
end arch;
