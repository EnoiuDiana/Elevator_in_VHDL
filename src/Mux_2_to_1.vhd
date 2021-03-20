---------------------------------------------------------------------------------------------------
--
-- Title       : MUX_2_TO_1
-- Design      : Lift
-- Author      : Andreea
-- Company     : UTCN
--
---------------------------------------------------------------------------------------------------
--
-- File        : MUX_2_TO_1.vhd
-- Generated   : Sat Apr 25 17:33:32 2020
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
--{entity {MUX_2_TO_1} architecture {MUX_2_TO_1}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity MUX_2_TO_1 is  
	port (I0, I1: in std_logic_vector(3 downto 0);
	SEL: std_logic;
	Y: out std_logic_vector(3 downto 0));
end MUX_2_TO_1;
 
architecture MUX_2_TO_1 of MUX_2_TO_1 is
begin
	process(SEL,I0,I1) is
	begin
		if(SEL='1') then
			Y <= I1;
		elsif (SEL='0') then
			Y <= I0;
		end if;
		
	end	process;
end MUX_2_TO_1;
