---------------------------------------------------------------------------------------------------
--
-- Title       : LVL_SEARCH_UNIT
-- Design      : Lift
-- Author      : Andreea
-- Company     : UTCN
--
---------------------------------------------------------------------------------------------------
--
-- File        : LVL_SEARCH_UNIT.vhd
-- Generated   : Sun Apr 26 14:04:12 2020
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
--{entity {LVL_SEARCH_UNIT} architecture {LVL_SEARCH_UNIT}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity LVL_SEARCH_UNIT is
	port(CURR_LVL: in std_logic_vector (3 downto 0);   
	CLK: in std_logic;
	PL0, PL1: in std_logic;
	S_U0, S_U1: in std_logic;
	S_D0, S_D1: in std_logic;
	RESET: in std_logic;
	TD: out std_logic;
	LVL_MEM: out std_logic_vector (3 downto 0);
	TU: out std_logic);
end LVL_SEARCH_UNIT;

--}} End of automatically maintained section

architecture LVL_SEARCH_UNIT of LVL_SEARCH_UNIT is	

component COUNTER_193 is
	 port(D: in std_logic_vector(3 downto 0);
	CU,CD: in std_logic;  
	CLK: in std_logic;
	PL: in std_logic; 
	RESET: in std_logic;
	TD,TU: out std_logic;
	Q: out std_logic_vector(3 downto 0));
end component COUNTER_193;

signal PL: std_logic;
signal SEARCH_UP: std_logic;
signal SEARCH_DOWN: std_logic;
signal Q: std_logic_vector(3 downto 0);

begin
	PL <= PL0 or PL1;
	SEARCH_UP <= S_U0 or S_U1;
	SEARCH_DOWN <= S_D0 or S_D1;
	
	COUNTER: COUNTER_193 port map (CURR_LVL,SEARCH_UP,SEARCH_DOWN,CLK,PL,RESET,TD,TU,Q);
	
	LVL_MEM <= Q;

end LVL_SEARCH_UNIT;
