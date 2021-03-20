---------------------------------------------------------------------------------------------------
--
-- Title       : DELAY_UNIT
-- Design      : Lift
-- Author      : Diana
-- Company     : Diana
--
---------------------------------------------------------------------------------------------------
--
-- File        : DELAY_UNIT.vhd
-- Generated   : Fri May  1 20:27:09 2020
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
--{entity {DELAY_UNIT} architecture {DELAY_UNIT}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity DELAY_UNIT is 
	port(DELAY_ENABLE: in std_logic;
	DIV: in std_logic;
	DELAY_END: out std_logic);
end DELAY_UNIT;

--}} End of automatically maintained section

architecture DELAY_UNIT of DELAY_UNIT is
component DELAY_COUNTER is	   
	   port(CLK: in std_logic;
	EN: in std_logic;	
	t: out std_logic);
end component DELAY_COUNTER; 
begin

	DEL: DELAY_COUNTER port map (DIV,DELAY_ENABLE,DELAY_END);
	
														  
end DELAY_UNIT;
