---------------------------------------------------------------------------------------------------
--
-- Title       : COUNTER_193
-- Design      : Lift
-- Author      : Andreea
-- Company     : UTCN
--
---------------------------------------------------------------------------------------------------
--
-- File        : COUNTER_193.vhd
-- Generated   : Sat Apr 25 18:30:17 2020
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
--{entity {COUNTER_193} architecture {COUNTER_193}}

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity COUNTER_193 is
    port(D: in std_logic_vector(3 downto 0);
	CU,CD: in std_logic;  
	CLK: in std_logic;
	PL: in std_logic;
	RESET: in std_logic;
	TD,TU: out std_logic;
	Q: out std_logic_vector(3 downto 0));
end COUNTER_193;

architecture COUNTER_193 of COUNTER_193 is 	   
begin 	  
	process(CLK,D,CU,CD,PL,RESET)
	variable cnt: std_logic_vector(3 downto 0);
	variable dir: std_logic_vector(3 downto 0);
	begin
		IF (clk'EVENT AND clk = '1') THEN
         IF RESET = '1' THEN
            cnt := "0000";
			TU<='0';
			TD<='0';
         ELSE
			 IF PL = '1' THEN
			 cnt := D;
			 TU<='0';
			 TD<='0';
			 ELSE  
				 IF (CU = '1') THEN
					 IF (cnt < "1100") then
						 cnt:= cnt+"0001";
					 ELSIF (cnt = "1100") then 
						 TU <= '1';
					 END IF;
				 ELSIF(CD =	'1') THEN
					 IF (cnt > "0000") then
						 cnt:= cnt-"0001";
					 ELSIF (cnt = "0000") then 
						 TD <= '1';
					 END IF;
				 END IF;
			 END IF; 
	     END IF; 
		 Q<=cnt;
		END IF;
	END process;
		
end COUNTER_193;
	
