---------------------------------------------------------------------------------------------------
--
-- Title       : SENSOR_UNIT
-- Design      : Lift
-- Author      : Andreea
-- Company     : UTCN
--
---------------------------------------------------------------------------------------------------
--
-- File        : SENSOR_UNIT.vhd
-- Generated   : Sun Apr 26 14:05:29 2020
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
--{entity {SENSOR_UNIT} architecture {SENSOR_UNIT}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity SENSOR_UNIT is
	port( SNZ_PERS: in std_logic;
	SNZ_OVER_WEIGHT: in std_logic;
	KEEP_OPEN: out std_logic;
	OVER_WEIGHT_LED: out std_logic);
end SENSOR_UNIT;

--}} End of automatically maintained section

architecture SENSOR_UNIT of SENSOR_UNIT is
begin

	KEEP_OPEN <= SNZ_PERS or SNZ_OVER_WEIGHT;
	OVER_WEIGHT_LED <= SNZ_OVER_WEIGHT;

end SENSOR_UNIT;
