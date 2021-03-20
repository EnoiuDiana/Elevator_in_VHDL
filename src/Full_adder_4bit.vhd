---------------------------------------------------------------------------------------------------
--
-- Title       : FULL_ADDER
-- Design      : Lift
-- Author      : Andreea
-- Company     : UTCN
--
---------------------------------------------------------------------------------------------------
--
-- File        : FULL_ADDER.vhd
-- Generated   : Sat Apr 25 18:30:43 2020
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
--{entity {FULL_ADDER} architecture {FULL_ADDER}}

library ieee;
use ieee.std_logic_1164.all;					   
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;	 

entity FULL_ADDER is
    generic (N: integer:=4);
    port(A,B: in std_logic_vector (N-1 downto 0);
    CIN:in std_logic;
    SUM: out std_logic_vector (N-1 downto 0);
	COUT: OUT STD_LOGIC);
end FULL_ADDER;
architecture A of FULL_ADDER is
signal Extended_SUM: std_logic_vector (N downto 0);
begin	   
	COUT <= Extended_SUM(N);
    SUM<=Extended_SUM(N-1 downto 0);
    Extended_SUM <= ('0' & A) + ('0' & B) + CIN;
end A;