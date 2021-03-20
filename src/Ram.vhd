---------------------------------------------------------------------------------------------------
--
-- Title       : RAM
-- Design      : Lift
-- Author      : Andreea
-- Company     : UTCN
--
---------------------------------------------------------------------------------------------------
--
-- File        : RAM.vhd
-- Generated   : Sat Apr 25 18:22:52 2020
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
--{entity {RAM} architecture {RAM}}

library	ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;  

entity RAM is
	port (A:in std_logic_vector (3 downto 0);
	WE:in std_logic;  
	CLK:in std_logic;
	D: in std_logic_vector (1 downto 0);
	C: out std_logic_vector(1 downto 0));
end RAM;

architecture RAM of RAM is		   
type MemType is array(15 downto 0) of std_logic_vector (1 downto 0);
signal MMap:MemType:=("00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00");

begin
	process(WE,A,D,MMap,CLK)
	begin	
	if clk'event and clk = '1' then
	if (WE='1') then
		MMap(CONV_INTEGER(A))<=D;
	else
	   C<=MMap(CONV_INTEGER(A));		  
	end if;
	end if;
	end process;   
end RAM;