
---------------------------------------------------------------------------------------------------
--
-- Title       : COUNTER_6sec
-- Design      : Lift
-- Author      : Andreea
-- Company     : UTCN
--
---------------------------------------------------------------------------------------------------
--
-- File        : COUNTER_6sec.vhd
-- Generated   : Sat Apr 25 18:30:05 2020
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
--{entity {COUNTER_6sec} architecture {COUNTER_6sec}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity COUNTER_6sec is
    port(CLK: in std_logic;
	EN: in std_logic;
	t: out std_logic);
end COUNTER_6sec;

architecture COUNTER_6sec of COUNTER_6sec is 
signal LD: std_logic:='1';
begin
    process(CLK,EN,LD) 
	variable V: STD_LOGIC_VECTOR(2 downto 0); 
	begin 
		if CLK'EVENT and CLK='1' then
		if EN = '0' then
			LD<='1';
			t<='0';
		elsif EN='1' then	
			if LD='1' then V:="000"; LD<='0';t<='0';
			elsif V<"100" then V:=V+"001";
		    elsif V = "100"then t<='1';	 
			end if;
		end if;
		end if;
	end process;

end COUNTER_6sec;
