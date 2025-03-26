library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.constants.all;

entity FIR_Controller is
	port(
		clk: in std_logic;
		rd_addr: out std_logic_vector(9 downto 0);
		rd_data: in std_logic_vector(31 downto 0);
		start_addr: in std_logic_vector(9 downto 0);
		output: out std_logic_vector(31 downto 0);
		start: in std_logic;
		filter_select: in std_logic_vector(2 downto 0);
		change_filter: in std_logic
	);
end FIR_Controller;

architecture arch of FIR_Controller is
	type tState is (IDLE, DO_START, RUN, DONE);
	signal state, state_next: tState;
	signal coeff, coeff_next: integer range 0 to COEFF_LEN_MAX;
	
	signal addr, addr_next: std_logic_vector(9 downto 0);
	signal sumL, sumL_next: signed(20 downto 0);
	signal sumR, sumR_next: signed(20 downto 0);
	signal coeffXdataL: signed(39 downto 0);
	signal coeffXdataR: signed(39 downto 0);
	signal rd_buffer, rd_buffer_next: std_logic_vector(31 downto 0);
	
	signal outputBuffer, output_next: std_logic_vector(31 downto 0);
	
	signal selected_filter: std_logic_vector(2 downto 0);
begin
	process(clk) begin
		if(rising_edge(clk)) then
			addr <= addr_next;
			state <= state_next;
			coeff <= coeff_next;
			sumL <= sumL_next;
			sumR <= sumR_next;
			outputBuffer <= output_next;
			rd_buffer <= rd_buffer_next;
			if(change_filter = '1') then
				selected_filter <= filter_select;
			end if;
		end if;
	end process;
	
	process(state, addr, outputBuffer, sumL, sumR, coeff, start_addr, start, rd_data, coeffXdataL, coeffXdataR, rd_buffer, selected_filter) begin
		state_next <= state;
		addr_next <= addr;
		output_next <= outputBuffer;
		sumL_next <= sumL;
		sumR_next <= sumR;
		coeff_next <= coeff;
		rd_buffer_next <= rd_buffer;
		case state is
			when IDLE =>
				if(start = '1') then
					state_next <= DO_START;	
					rd_buffer_next <= rd_data;
					addr_next <= start_addr;
				end if;
			when DO_START =>
				state_next <= RUN;
				coeff_next <= 0;
				sumL_next <= (others=>'0');
				sumR_next <= (others=>'0');
			when RUN =>
				if(coeff = (COEFFICIENTS_LEN(to_integer(unsigned(selected_filter))) - 1)) then
					state_next <= DONE;
				end if;
				coeff_next <= coeff + 1;
				addr_next <= std_logic_vector(unsigned(addr) - 1);
				-- coeffXdataL >> 19 # shift by 19 bit to compensate for fixed comma representation
				sumL_next <= sumL + signed(coeffXdataL(39 downto 19));
				sumR_next <= sumR + signed(coeffXdataR(39 downto 19));
			when DONE =>
				output_next <= std_logic_vector(sumL(15 downto 0)) & std_logic_vector(sumR(15 downto 0));
				state_next <= IDLE;
			
		end case;
	end process;
	output <= outputBuffer;
	rd_addr <= addr;
	coeffXdataL <= signed(rd_data(31 downto 16)) * COEFFICIENTS(to_integer(unsigned(selected_filter)))(coeff);
	coeffXdataR <= signed(rd_data(15 downto 0)) * COEFFICIENTS(to_integer(unsigned(selected_filter)))(coeff);

end arch;
