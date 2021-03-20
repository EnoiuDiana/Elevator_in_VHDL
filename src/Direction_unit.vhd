---------------------------------------------------------------------------------------------------
--
-- Title       : DIRECTION_UNIT
-- Design      : Lift
-- Author      : Andreea
-- Company     : UTCN
--
---------------------------------------------------------------------------------------------------
--
-- File        : DIRECTION_UNIT.vhd
-- Generated   : Sun Apr 26 14:04:42 2020
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
--{entity {DIRECTION_UNIT} architecture {DIRECTION_UNIT}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity DIRECTION_UNIT is
	port(CHANGE_DIR,RESET,CLK: in std_logic;
	DIR,NOT_DIR:out std_logic);
end DIRECTION_UNIT;

--}} End of automatically maintained section

architecture DIRECTION_UNIT of DIRECTION_UNIT is  
component J_K_FLIP_FLOP is
	port(J,K,CLK: in std_logic;
	Q,NQ: out std_logic);
end component J_K_FLIP_FLOP;	
signal J_DIR,K_DIR:std_logic;
begin		   
	J_DIR<=CHANGE_DIR;
	K_DIR<=CHANGE_DIR OR RESET;
	JK: J_K_FLIP_FLOP port map (J_DIR,K_DIR,CLK,DIR,NOT_DIR);
	
end DIRECTION_UNIT;
