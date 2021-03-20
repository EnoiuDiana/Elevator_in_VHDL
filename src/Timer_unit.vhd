---------------------------------------------------------------------------------------------------
--
-- Title       : TIMER
-- Design      : Lift
-- Author      : Andreea
-- Company     : UTCN
--
---------------------------------------------------------------------------------------------------
--
-- File        : TIMER.vhd
-- Generated   : Sun Apr 26 14:05:12 2020
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
--{entity {TIMER} architecture {TIMER}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity TIMER_UNIT is
	port(TIMER_ENABLE: in std_logic;
	DIV: in std_logic;
	TIMER_END: out std_logic);
end TIMER_UNIT;

--}} End of automatically maintained section

architecture TIMER_UNIT of TIMER_UNIT is

component COUNTER_6sec is
	port(CLK: in std_logic;
	EN: in std_logic;
	t: out std_logic);
end component COUNTER_6sec;

begin

	COUNTER: COUNTER_6sec port map (DIV,TIMER_ENABLE,TIMER_END);
	

end TIMER_UNIT;
