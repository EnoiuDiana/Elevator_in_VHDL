---------------------------------------------------------------------------------------------------
--
-- Title       : INC_DEC_LVL_UNIT
-- Design      : Lift
-- Author      : Andreea
-- Company     : UTCN
--
---------------------------------------------------------------------------------------------------
--
-- File        : INC_DEC_LVL_UNIT.vhd
-- Generated   : Sun Apr 26 14:05:01 2020
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
--{entity {INC_DEC_LVL_UNIT} architecture {INC_DEC_LVL_UNIT}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity INC_DEC_LVL_UNIT is
	port(notDIR: in std_logic;
	DIV: in std_logic;
	LD: in std_logic;
	RESET: in std_logic;
	CURR_LVL: out std_logic_vector (3 downto 0);
 	 IS_EDGE_LVL: out std_logic);
end INC_DEC_LVL_UNIT;

--}} End of automatically maintained section

architecture INC_DEC_LVL_UNIT of INC_DEC_LVL_UNIT is

component XOR_GATE_4BIT is
	port(A,B: in std_logic_vector (3 downto 0);
	Y: out std_logic_vector (3 downto 0));
end component XOR_GATE_4BIT;

component FULL_ADDER is  
	generic (N: integer:=4);
    port(A,B: in std_logic_vector (N-1 downto 0);
    CIN:in std_logic;
    SUM: out std_logic_vector (N-1 downto 0);
	COUT:out std_logic);

end component FULL_ADDER;

component HOLD_REGISTER is
   port( D: in std_logic_vector(3 downto 0);
     CLK: in std_logic;
 	 LD: in std_logic; 
	 RESET: in std_logic;
 	 Q: out std_logic_vector(3 downto 0);
 	 EDGE_LVL: out std_logic);
end component HOLD_REGISTER;

signal DIR_VECT: std_logic_vector (3 downto 0);
signal XOR_REZ: std_logic_vector(3 downto 0);
signal FA_REZ: std_logic_vector(3 downto 0);
signal NEXT_LVL: std_logic_vector(3 downto 0);	  
signal cout: std_logic;
signal EDGE_LVL: std_logic;

begin 
	DIR_VECT(0)<= notDIR; 
	DIR_VECT(1)<= notDIR;
	DIR_VECT(2)<= notDIR;
	DIR_VECT(3)<= notDIR;
	XOR1: XOR_GATE_4BIT port map(DIR_VECT, "0001", XOR_REZ);
	ADDER: FULL_ADDER port map(XOR_REZ, NEXT_LVL, notDIR, FA_REZ,cout);
	REG: HOLD_REGISTER port map(FA_REZ, DIV, LD,RESET,NEXT_LVL, EDGE_LVL);
	IS_EDGE_LVL <= EDGE_LVL;
    CURR_LVL <= NEXT_LVL;
    
end INC_DEC_LVL_UNIT;
