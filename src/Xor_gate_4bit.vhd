---------------------------------------------------------------------------------------------------
--
-- Title       : XOR_GATE_4BITS
-- Design      : Lift
-- Author      : Andreea
-- Company     : UTCN
--
---------------------------------------------------------------------------------------------------
--
-- File        : XOR_GATE_4BITS.vhd
-- Generated   : Sun Apr 26 17:08:09 2020
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
--{entity {XOR_GATE_4BITS} architecture {XOR_GATE_4BITS}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity XOR_GATE_4BIT is
	port(A,B: in std_logic_vector (3 downto 0);
	Y: out std_logic_vector (3 downto 0));

end XOR_GATE_4BIT;

--}} End of automatically maintained section

architecture XOR_GATE_4BIT of XOR_GATE_4BIT is
begin

	Y(0) <= A(0) xor B(0);
	Y(1) <= A(1) xor B(1);
	Y(2) <= A(2) xor B(2);
	Y(3) <= A(3) xor B(3);   

end XOR_GATE_4BIT;
