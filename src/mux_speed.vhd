---------------------------------------------------------------------------------------------------
--
-- Title       : MUX_SPEED
-- Design      : Lift
-- Author      : Diana
-- Company     : Diana
--
---------------------------------------------------------------------------------------------------
--
-- File        : MUX_SPEED.vhd
-- Generated   : Sat May  2 16:11:12 2020
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
--{entity {MUX_SPEED} architecture {MUX_SPEED}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity MUX_SPEED is	
	port(I1,I0:in std_logic;
	SEL: in std_logic;
	O:out std_logic);
end MUX_SPEED;

--}} End of automatically maintained section

architecture MUX_SPEED of MUX_SPEED is
begin
	process(sel,i0,i1)
	begin
		if(sel='1') then
			O<=i1;
		elsif (sel = '0') then
			O<=i0;
		end if;
		end process;
end MUX_SPEED;

