---------------------------------------------------------------------------------------------------
--
-- Title       : RAM_MEM_UNIT
-- Design      : Lift
-- Author      : Andreea
-- Company     : UTCN
--
---------------------------------------------------------------------------------------------------
--
-- File        : RAM_MEM_UNIT.vhd
-- Generated   : Sun Apr 26 14:03:47 2020
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
--{entity {RAM_MEM_UNIT} architecture {RAM_MEM_UNIT}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity RAM_MEM_UNIT is 
	port( EXT_INT: in std_logic;
	UP_DO: in std_logic; 
	TAKE_COMM: in std_logic;
	DELETE: in std_logic;
	CLK:in std_logic;
	P_12: in std_logic_vector(3 downto 0);
	LVL_MEM: in std_logic_vector (3 downto 0);
	COMM_FOUND: out std_logic;
	EXT_DOWN: out std_logic;
	EXT_UP: out std_logic);
end RAM_MEM_UNIT;

--}} End of automatically maintained section

architecture RAM_MEM_UNIT of RAM_MEM_UNIT is  

component MUX_2_TO_1 is
	port (I0, I1: in std_logic_vector(3 downto 0);
	SEL: std_logic;
	Y: out std_logic_vector(3 downto 0));
end component MUX_2_TO_1;

component RAM is  
	port (A:in std_logic_vector (3 downto 0);
	WE:in std_logic;
	CLK:in std_logic;
	D: in std_logic_vector (1 downto 0);
	C: out std_logic_vector(1 downto 0));
end component RAM; 

signal C_S: std_logic_vector (1 downto 0);
signal ADDR: std_logic_vector (3 downto 0);
signal I_AUX: std_logic_vector (3 downto 0);
signal Y_AUX: std_logic_vector (3 downto 0);
signal D_S: std_logic_vector (1 downto 0);	
signal WE_OR_REZ: std_logic;

begin
	I_AUX(0) <= UP_DO;
	I_AUX(1) <= EXT_INT; 
	I_AUX(2) <= '0';
	I_AUX(3) <= '0';
	
	MUX1: MUX_2_TO_1 port map("0000", I_AUX, TAKE_COMM, Y_AUX);
	MUX2: MUX_2_TO_1 port map(LVL_MEM, P_12, TAKE_COMM, ADDR); 
	
	D_S(0) <= Y_AUX(0);
	D_S(1) <= Y_AUX(1);
	
	WE_OR_REZ <= TAKE_COMM or DELETE; 
	
	RAM1: RAM port map(ADDR, WE_OR_REZ,CLK, D_S, C_S);
	
	COMM_FOUND <= C_S(0) or C_S(1);
	EXT_DOWN <= (not C_S(0)) and C_S(1);
	EXT_UP <= C_S(0) and C_S(1);

end RAM_MEM_UNIT;
