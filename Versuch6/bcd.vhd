library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- this package contains a helper function that increments a 3 digit BCD Number
-- this saves us the hastle of converting the number to BCD afterwards

package BCD is
    function incBCD3(bcd_in: STD_LOGIC_VECTOR(11 downto 0)) return STD_LOGIC_VECTOR;
end BCD;

package body BCD is
    function incBCD3(bcd_in: STD_LOGIC_VECTOR(11 downto 0)) return STD_LOGIC_VECTOR is
        variable temp_bcd : STD_LOGIC_VECTOR(11 downto 0);
		  -- init carry with one, so we don't need any special handling for the lowest digit
        variable carry : STD_LOGIC := '1';
    begin
        temp_bcd := bcd_in;
        
        -- Loop through each BCD digit
        for i in 0 to 2 loop
				-- end after the first number that didn't result in a carry
            if carry = '1' then
                if temp_bcd(4*i+3 downto 4*i) = "1001" then
						  -- after 9, rollover to 0 and set carry
                    temp_bcd(4*i+3 downto 4*i) := "0000";
                    carry := '1';
                else
						  --otherwise increment
                    temp_bcd(4*i+3 downto 4*i) := temp_bcd(4*i+3 downto 4*i) + 1;
                    carry := '0';
                end if;
            end if;
        end loop;

        return temp_bcd;
    end function incBCD3;
end BCD;