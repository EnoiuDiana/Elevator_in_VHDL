---------------------------------------------------------------------------------------------------
--
-- Title       : SHIFT_REG
-- Design      : Lift
-- Author      : Andreea
-- Company     : UTCN
--
---------------------------------------------------------------------------------------------------
--
-- File        : SHIFT_REG.vhd
-- Generated   : Sat Apr 25 18:30:32 2020
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
--{entity {SHIFT_REG} architecture {SHIFT_REG}}

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity HOLD_REGISTER is
   port( D: in std_logic_vector(3 downto 0);
     CLK: in std_logic;
 	 LD: in std_logic; 
	 RESET: in std_logic;
 	 Q: out std_logic_vector(3 downto 0);
 	 EDGE_LVL: out std_logic);
end HOLD_REGISTER;

architecture HOLD_REG_A of HOLD_REGISTER is
begin
   process
   variable temp: std_logic_vector(3 downto 0); 
   begin
      wait until rising_edge (CLK);
	  if LD='1' then
		  temp := D;
	  end if;
	  if RESET = '1' then
		  temp := "0000";
	  end if;
	  EDGE_LVL <= (not(temp(0)) and not(temp(1)) and not(temp(2)) and not(temp(3)))
	  or (temp(3) and temp(2) and not(temp(1))and not(temp(0)));
      Q <= temp;
    end process;
end HOLD_REG_A;