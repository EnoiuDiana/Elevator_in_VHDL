---------------------------------------------------------------------------------------------------
--
-- Title       : DECIDE_UNIT
-- Design      : Lift
-- Author      : Andreea
-- Company     : UTCN
--
---------------------------------------------------------------------------------------------------
--
-- File        : DECIDE_UNIT.vhd
-- Generated   : Sun Apr 26 14:03:32 2020
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
--{entity {DECIDE_UNIT} architecture {DECIDE_UNIT}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity DECIDE_UNIT is
	port(I: in std_logic_vector (7 downto 0);
	Z: out std_logic_vector (3 downto 0); 
	CLK, RST: in std_logic);
end DECIDE_UNIT;


architecture DECIDE_UNIT of DECIDE_UNIT is
type state_type is (A,B,B1,B2,B3,C1,C2,C3,C4,D,D1,D2,D3,D4,D5,S); 
signal curr_state,next_state: state_type;						 

begin	 
	process(CLK,RST)
	begin 
		if RST = '1' then
			curr_state <= A;
		elsif (rising_edge(clk)) then 
			curr_state <= next_state;
		end if;
	end process;
		
	process(curr_state,I)
	begin 
		case curr_state is
		when A =>      if I(0) = '1' then
					    	next_state <= B;
					   else
						    next_state <= A;
					   end if;
		when B   =>     next_state <= D;
		when D   =>     next_state <= D5;
		when D5   =>    if I(1) = '1' then
							next_state <= B1;
						else
							next_state <= B;
						end if;	 				 
		when B1 =>   	if I(2) = '1' then
							next_state <= B3;
						else
						    next_state <= B2;
						end if;						
		when B2	 => 	if I(3) = '1' and I(7) = '0' then
							next_state <= C1;
						else
							next_state <= S;
						end if;				
		when B3	 => 	if I(4) = '1' and I(7) = '0' then
							next_state <= C3;
						else
							next_state <= S;
						end if;	
		when C1 => 		next_state <= D1;
		when D1 =>      next_state <= D3;
		when D3 =>  	if I(1) = '1' then
							next_state <= B;
						else
							next_state <= C2;
						end if;	
		when C2	 => 	if I(5) = '1' then
							next_state <= S;
						else
							next_state <= C1;
						end if;
		when C3  =>     next_state <= D2;
		when D2 =>      next_state <= D4;
		when D4	 =>		if I(1) = '1' then
							next_state <= B;
						else
							next_state <= C4;
						end if;
		when C4	 =>		if I(6) = '1' then
							next_state <= S;
						else
							next_state <= C3;
						end if;	
		when S	 => 	next_state <= A;				
		end case;
	end process;
	
process (curr_state)
	begin
		case curr_state is
			when A   => Z <="0000";  
			when B	 =>	Z <="1000";					 
			when B1  => Z <="0000";  						
			when B2	 => Z <="0000";				
			when B3	 => Z <="0000";		
			when C1  => Z <="0100"; 	
		    when C2	 => Z <="0000";	
		    when C3	 =>	Z <="0010";	
		    when C4	 =>	Z <="0000";
			when D   => Z <="0000";
			when D1  => Z <="0000";
			when D2  => Z <="0000";
			when D3  => Z <="0000";
			when D4  => Z <="0000";
			when D5  => Z <="0000";
		    when S	 => Z <="0001";							
		end case;
	end process;
end DECIDE_UNIT;
