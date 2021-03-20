---------------------------------------------------------------------------------------------------
--
-- Title       : J_K_FLIP_FLOP
-- Design      : Lift
-- Author      : Diana
-- Company     : Diana
--
---------------------------------------------------------------------------------------------------
--
-- File        : J_K_FF.vhd
-- Generated   : Thu Apr 30 23:29:18 2020
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
--{entity {J_K_FLIP_FLOP} architecture {J_K_FLIP_FLOP}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity J_K_FLIP_FLOP is
	port(J,K,CLK: in std_logic;
	Q,NQ: out std_logic);
end J_K_FLIP_FLOP;

architecture J_K_FLIP_FLOP of J_K_FLIP_FLOP is
begin
	process(CLK)
	variable temp:std_logic;
	begin
		if CLK='1'and CLK'event then
			if J='0' and K='0' then
			    temp:=temp;
			elsif J='1' and K='0' then
				temp:='1';
			elsif J='0' and K='1' then
				temp:='0';
			elsif J='1' and K='1' then
				temp:=not temp;
			end if;
			Q<= temp;
			NQ<= not temp;
		end if;
	end process;
end architecture J_K_FLIP_FLOP;
