---------------------------------------------------------------------------------------------------
--
-- Title       : DISPLAY
-- Design      : Lift
-- Author      : Diana
-- Company     : Diana
--
---------------------------------------------------------------------------------------------------
--
-- File        : DISPLAY_UNIT.vhd
-- Generated   : Sat May  2 16:15:25 2020
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
--{entity {DISPLAY} architecture {DISPLAY}}

library IEEE;
use IEEE.STD_LOGIC_1164.all; 
use IEEE.std_logic_unsigned.all;

entity DISPLAY is 
	Port (clk: in STD_LOGIC;
	reset : in STD_LOGIC; 
	CURR_LVL: in std_logic_vector(3 downto 0);
    Anode_Activate : out STD_LOGIC_VECTOR (3 downto 0);
    Led_Out : out STD_LOGIC_VECTOR (6 downto 0));
end DISPLAY;

architecture DISPLAY of DISPLAY is 
signal displayed_number: STD_LOGIC_VECTOR (15 downto 0);
signal LED_BCD: STD_LOGIC_VECTOR (3 downto 0);
signal refresh_counter: STD_LOGIC_VECTOR (19 downto 0);
signal LED_activating_counter: std_logic_vector(1 downto 0);
begin 
	process(CURR_LVL,displayed_number)
	begin
	case CURR_LVL is 
	when "0000" => displayed_number <= x"0000"; 
	when "0001" => displayed_number <= x"0001";
	when "0010" => displayed_number <= x"0002";
	when "0011" => displayed_number <= x"0003";
	when "0100" => displayed_number <= x"0004";
	when "0101" => displayed_number <= x"0005";
	when "0110" => displayed_number <= x"0006";
	when "0111" => displayed_number <= x"0007";
	when "1000" => displayed_number <= x"0008";
	when "1001" => displayed_number <= x"0009";
	when "1010" => displayed_number <= x"0010";
	when "1011" => displayed_number <= x"0011";
	when "1100" => displayed_number <= x"0012";	
	when others => displayed_number <= x"0000";
	end case;
	end process;
	
	process(LED_BCD)
begin
    case LED_BCD is
    when "0000" => LED_out <= "0000001"; -- "0"     
    when "0001" => LED_out <= "1001111"; -- "1" 
    when "0010" => LED_out <= "0010010"; -- "2" 
    when "0011" => LED_out <= "0000110"; -- "3" 
    when "0100" => LED_out <= "1001100"; -- "4" 
    when "0101" => LED_out <= "0100100"; -- "5" 
    when "0110" => LED_out <= "0100000"; -- "6" 
    when "0111" => LED_out <= "0001111"; -- "7" 
    when "1000" => LED_out <= "0000000"; -- "8"     
    when "1001" => LED_out <= "0000100"; -- "9" 
	when others => LED_out <= "1111111";
    end case;
end process;

process(clk,reset,refresh_counter)
begin 
    if(reset='1') then
        refresh_counter <= (others => '0');
    elsif(rising_edge(clk)) then
        refresh_counter <= refresh_counter + 1;
    end if;
end process;
 LED_activating_counter <= refresh_counter(19 downto 18);
process(LED_activating_counter,displayed_number)
begin
    case LED_activating_counter is
    when "00" =>
        Anode_Activate <= "0111"; 
        
        LED_BCD <= displayed_number(15 downto 12);
        
    when "01" =>
        Anode_Activate <= "1011"; 
   
        LED_BCD <= displayed_number(11 downto 8);
 
    when "10" =>
        Anode_Activate <= "1101"; 
     
        LED_BCD <= displayed_number(7 downto 4);

    when "11" =>
	    Anode_Activate <= "1110";

        LED_BCD <= displayed_number(3 downto 0);
	when others => NULL;
   
    end case;
end process;
end DISPLAY;
