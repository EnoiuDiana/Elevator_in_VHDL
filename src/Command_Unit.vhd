---------------------------------------------------------------------------------------------------
--
-- Title       : COMMAND_UNIT
-- Design      : Lift
-- Author      : Andreea
-- Company     : UTCN
--
---------------------------------------------------------------------------------------------------
--
-- File        : COMMAND_UNIT.vhd
-- Generated   : Sun Apr 26 14:03:21 2020
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
--{entity {COMMAND_UNIT} architecture {COMMAND_UNIT}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity COMMAND_UNIT is
	port(I: in std_logic_vector (8 downto 0);
	Z: out std_logic_vector (8 downto 0); 
	CLK, RST: in std_logic);
end COMMAND_UNIT;


architecture COMMAND_UNIT of COMMAND_UNIT is
type state_type is (A, A1, A2, B, B1,B2,B3,B4,B5,B6,C,C1,C2,D,D1,E,E1,E2,E3,E4,E5,E6);  -- e states make a delay, waiting because of some clk latency
signal curr_state,next_state: state_type;												-- d1 enables a delay unit component as we have to wait
																						-- 3 sec before we make the elevator move
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
					    	next_state <= A2;
					   else
						    next_state <= A1;
					   end if;
		when A1	 =>		if I(1) = '1' then
							next_state <= A2;
						else
							next_state <= A;
						end if;					 
		when A2 =>   	if I(2) = '1' then
							next_state <= A;
						else
						    next_state <= B;
						end if;
		when B   =>     next_state <= E;
		when E   =>     next_state <= E3;
		when E3	 => 	if I(3) = '1' then
							next_state <= D;
						else
							next_state <= B1;
						end if;				
		when B1	 => 	if I(4) = '1' then
							next_state <= B4;
						else
							next_state <= B2;
						end if;	   
	    when B2 =>      next_state <= E1;
		when E1 =>      next_state <= E4;
		when E4 =>  	if I(3) = '1' then
							next_state <= D1;
						else
							next_state <= B3;
						end if;	
		when B3	 => 	if I(5) = '1' then
							next_state <= B6;
						else
							next_state <= B2;
						end if;	 
	    when B4  =>     next_state <= E2;
		when E2  =>     next_state <= E5;
		when E5	 =>		if I(3) = '1' then
							next_state <= D1;
						else
							next_state <= B5;
						end if;
		when B5	 =>		if I(6) = '1' then
							next_state <= B6;
						else
							next_state <= B4;
						end if;	
		when B6	 => 	next_state <= B;				
		when C	 => 	next_state <= C1;
		when C1	 => 	if I(7) = '1' then
							next_state <= C2;
						else
							next_state <= C1;
						end if;	
		when C2	 => 	next_state <= E6;  
		when E6  =>     next_state <= D;
		when D	 => 	next_state <= A; 
		when D1  =>     if I(8) = '1' then
			                next_state <= C;
		                else 
			                next_state <= D1;  
						end if;	
		end case;
	end process;
	
process (curr_state)
	begin
		case curr_state is
			when A   => Z <="010000000";  
			when A1	 =>	Z <="010000000";					 
			when A2  => Z <="010000000";  						
			when B	 => Z <="001000000";				
			when B1	 => Z <="000000000";		
			when B2  => Z <="000100000"; 	
		    when B3	 => Z <="000000000";	
		    when B4	 =>	Z <="000010000";	
		    when B5	 =>	Z <="000000000";		
		    when B6	 => Z <="000001000";						
		    when C	 => Z <="000000100";	
			when C1	 => Z <="000000010";	
		    when C2	 => Z <="001000000";	
			when E   => Z <="001000000";
			when E1  => Z <="000000000";	
			when E2  => Z <="000000000";
			when E3  => Z <="000000000";	
			when E4  => Z <="000000000";
			when E5  => Z <="000000000";
			when E6  => Z <="000000000";
		    when D	 => Z <="000000001";	
			when D1  => Z <="100000000"; 
		end case;
	end process;
end COMMAND_UNIT;
