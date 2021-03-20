---------------------------------------------------------------------------------------------------
--
-- Title       : DELAY_COUNTER
-- Design      : Lift
-- Author      : Diana
-- Company     : Diana
--
---------------------------------------------------------------------------------------------------
--
-- File        : DELAY_COUNTER.vhd
-- Generated   : Fri May  1 20:59:28 2020
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
--{entity {DELAY_COUNTER} architecture {DELAY_COUNTER}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;  
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DELAY_COUNTER is	   
	   port(CLK: in std_logic;
	EN: in std_logic;
	t: out std_logic);
end DELAY_COUNTER;

--}} End of automatically maintained section

architecture DELAY_COUNTER of DELAY_COUNTER is	
signal LD: std_logic:='1';
begin
  process(CLK,EN,LD) 
	variable V: STD_LOGIC; 
	begin 
		if CLK'EVENT and CLK='1' then
		if EN = '0' then
			LD<='1';
			t<='0';
		elsif EN='1' then	
			if LD='1' then V:='1'; LD<='0';t<='0';
		    elsif V = '1' then t<='1';	 
			end if;
		end if;
		end if;
	end process;

end DELAY_COUNTER;
