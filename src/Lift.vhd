---------------------------------------------------------------------------------------------------
--
-- Title       : LIFT
-- Design      : Lift
-- Author      : Diana
-- Company     : Diana
--
---------------------------------------------------------------------------------------------------
--
-- File        : LIFT.vhd
-- Generated   : Fri May  1 11:59:48 2020
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
--{entity {LIFT} architecture {ARCH_LIFT}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity LIFT is
	port(LEVEL_P_12:in std_logic_vector(3 downto 0);
	EXT_INT_SWITCH,UP_DO_SWITCH,TAKE_COMM_BUTTON,INIT_BUTTON,CLOSE_BUTTON,FAST_SPEED,CLOCK:in std_logic;
	PERSON_IN_DOOR,OVER_WEIGHT:in std_logic;
	DOORS:out std_logic;   
	Anode: out STD_LOGIC_VECTOR (3 downto 0);
    LED_Out : out STD_LOGIC_VECTOR (6 downto 0);
	OVER_WEIGHT_LED: out std_logic);
end LIFT;

--}} End of automatically maintained section

architecture ARCH_LIFT of LIFT is	   

component COMMAND_UNIT is
	port(I: in std_logic_vector (8 downto 0);
	Z: out std_logic_vector (8 downto 0); 
	CLK, RST: in std_logic);
end component COMMAND_UNIT;	   

component DECIDE_UNIT is
	port(I: in std_logic_vector (7 downto 0);
	Z: out std_logic_vector (3 downto 0); 
	CLK, RST: in std_logic);
end component DECIDE_UNIT;	

component RAM_MEM_UNIT is 
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
end component RAM_MEM_UNIT;    

component LVL_SEARCH_UNIT is
	port(CURR_LVL: in std_logic_vector (3 downto 0);   
	CLK: in std_logic;
	PL0, PL1: in std_logic;
	S_U0, S_U1: in std_logic;
	S_D0, S_D1: in std_logic;
	RESET: in std_logic;
	TD: out std_logic;
	LVL_MEM: out std_logic_vector (3 downto 0);
	TU: out std_logic);
end component LVL_SEARCH_UNIT;  

component INC_DEC_LVL_UNIT is
	port(notDIR: in std_logic;
	DIV: in std_logic;
	LD: in std_logic;
	RESET: in std_logic;
	CURR_LVL: out std_logic_vector (3 downto 0);
 	 IS_EDGE_LVL: out std_logic);
end component INC_DEC_LVL_UNIT; 

component DIRECTION_UNIT is
	port(CHANGE_DIR,RESET,CLK: in std_logic;
	DIR,NOT_DIR:out std_logic);
end component DIRECTION_UNIT;

component TIMER_UNIT is
	port(TIMER_ENABLE: in std_logic;
	DIV: in std_logic;
	TIMER_END: out std_logic);
end component TIMER_UNIT;	

component SENSOR_UNIT is
	port( SNZ_PERS: in std_logic;
	SNZ_OVER_WEIGHT: in std_logic;
	KEEP_OPEN: out std_logic;
	OVER_WEIGHT_LED: out std_logic);
end component SENSOR_UNIT;		

component DELAY_UNIT is 
	port(DELAY_ENABLE: in std_logic;
	DIV: in std_logic;
	DELAY_END: out std_logic);
end component DELAY_UNIT;	 

component freq_div is	
	port(CLK:in std_logic;	 
	RST:in std_logic;
	DIV: out std_logic);
end component freq_div;

component SPEED_UNIT is 
	port ( DIV,RESET,FAST_SPEED: in std_logic;
	DIV_SPEED:out std_logic);
end component SPEED_UNIT;

component DISPLAY is 
	Port (clk: in STD_LOGIC;
	reset : in STD_LOGIC; 
	CURR_LVL: in std_logic_vector(3 downto 0);
    Anode_Activate : out STD_LOGIC_VECTOR (3 downto 0);
    Led_Out : out STD_LOGIC_VECTOR (6 downto 0));
end component DISPLAY;

component MUX_SPEED is	
	port(I1,I0:in std_logic;
	SEL: in std_logic;
	O:out std_logic);
end component MUX_SPEED;

component freq_div_3sec is	
	port(CLK:in std_logic;	 
	RST:in std_logic;
	DIV_SLOW: out std_logic);
end component freq_div_3sec;

signal input_command: std_logic_vector(8 downto 0); 
signal out_command: std_logic_vector(8 downto 0);  
signal input_decide: std_logic_vector(7 downto 0); 
signal out_decide: std_logic_vector(3 downto 0);
signal TIMER_END: std_logic;  
signal DELAY_END: std_logic;
signal KEEP_OPEN: std_logic;
signal COMM_FOUND: std_logic; 
signal DIR: std_logic;
signal NOT_DIR: std_logic;
signal TD: std_logic;
signal TU: std_logic;
signal EXT_UP: std_logic;
signal EXT_DOWN: std_logic;
signal LVL_MEM: std_logic_vector(3 downto 0);
signal CURR_LVL: std_logic_vector(3 downto 0);
signal DIV_CLK: std_logic; 
signal DIV_SLOW: std_logic;
signal DIV_FAST: std_logic;
signal IS_EDGE_LVL: std_logic;
begin  
	
	input_command(0) <= CLOSE_BUTTON; 
	input_command(1) <= TIMER_END;
	input_command(2) <= KEEP_OPEN;
	input_command(3) <= COMM_FOUND;
	input_command(4) <= DIR;
	input_command(5) <= TD;
	input_command(6) <= TU;
	input_command(7) <= out_decide(0);
	input_command(8) <= DELAY_END;
	
    COMMAND: COMMAND_UNIT port map (input_command,out_command,CLOCK,INIT_BUTTON);
	
	input_decide(0) <= out_command(2);
	input_decide(1) <= COMM_FOUND;
	input_decide(2) <= DIR;
	input_decide(3) <= EXT_UP;
	input_decide(4) <= EXT_DOWN;
	input_decide(5) <= TD;
	input_decide(6) <= TU;	
	input_decide(7) <= IS_EDGE_LVL;
	
	DECIDE: DECIDE_UNIT port map (input_decide,out_decide,CLOCK,INIT_BUTTON);  
	
	RAM_MEM: RAM_MEM_UNIT port map (EXT_INT_SWITCH,UP_DO_SWITCH,TAKE_COMM_BUTTON,out_command(0),CLOCK,LEVEL_P_12,LVL_MEM,COMM_FOUND,EXT_DOWN,EXT_UP);
	
	LVL_SEARCH: LVL_SEARCH_UNIT port map (CURR_LVL,CLOCK,out_command(6),out_decide(3),out_command(4),out_decide(1),out_command(5),out_decide(2),
	INIT_BUTTON,TD,LVL_MEM,TU);		
	
	INC_DEC_LVL: INC_DEC_LVL_UNIT port map (NOT_DIR,DIV_CLK,out_command(1),INIT_BUTTON,CURR_LVL,IS_EDGE_LVL);
	
	DIRECTION: DIRECTION_UNIT port map (out_command(3),INIT_BUTTON,CLOCK,DIR,NOT_DIR);
	
	TIMER: TIMER_UNIT port map (out_command(7),DIV_FAST,TIMER_END);
	
	SENSOR: SENSOR_UNIT port map (PERSON_IN_DOOR,OVER_WEIGHT,KEEP_OPEN,OVER_WEIGHT_LED); 
	
	DELAY: DELAY_UNIT port map (out_command(8),DIV_FAST,DELAY_END);
	
	FREQ: FREQ_DIV port map (CLOCK,INIT_BUTTON,DIV_FAST);  
	
	FREQ3: freq_div_3sec port map (CLOCK,INIT_BUTTON,DIV_SLOW);  
	
	MUX_SP: MUX_SPEED port map (DIV_FAST,DIV_SLOW,FAST_SPEED, DIV_CLK);
	
	DISP: DISPLAY port map (CLOCK,INIT_BUTTON,CURR_LVL,Anode,LED_Out);
	
	DOORS<=out_command(7);
	
end ARCH_LIFT;
