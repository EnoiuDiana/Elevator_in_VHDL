---------------------------------------------------------------------------------------------------
--
-- Title       : freq_div
-- Design      : Lift
-- Author      : Diana
-- Company     : Diana
--
---------------------------------------------------------------------------------------------------
--
-- File        : Freq_divider.vhd
-- Generated   : Sat May  2 14:18:38 2020
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.20
--
---------------------------------------------------------------------------------------------------
--
-- Description : 
--
---------------------------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {freq_div} architecture {freq_div}}

library IEEE;
use IEEE.STD_LOGIC_1164.all; 
use IEEE.std_logic_unsigned.all;

entity freq_div_3sec is	
	port(CLK:in std_logic;	 
	RST:in std_logic;
	DIV_SLOW: out std_logic);
end freq_div_3sec;

--}} End of automatically maintained section

architecture freq_div_3sec of freq_div_3sec is 
signal one_second_counter:std_logic_vector (28 downto 0);
begin	  
	process(CLK,RST)
	begin
		if(RST='1') then
            one_second_counter <= (others => '0');
        elsif(rising_edge(clk)) then
            if(one_second_counter>=x"11E1A2FD") then
                one_second_counter <= (others => '0');
            else
                one_second_counter <= one_second_counter + "0000001";
            end if;
        end if;	
	end process;  
    DIV_SLOW <= '1' when one_second_counter=x"11E1A2FD" else '0';

end freq_div_3sec;
