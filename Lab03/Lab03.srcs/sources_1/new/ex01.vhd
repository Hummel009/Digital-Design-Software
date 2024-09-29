-- STRUCTURAL UI --

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity ex01 is
	port(
		Q: out STD_LOGIC;
		nQ: out STD_LOGIC
	);
end ex01;

architecture Structural of ex01 is
	attribute dont_touch: STRING;
	attribute dont_touch of Structural: architecture is "true";
	
	component inv
		port(
			a: in std_logic;
			nA: out std_logic
		);
	end component;
	
	signal inv_0_o: std_logic;  
	signal inv_1_o: std_logic;
	
begin	
	inv_0: inv port map (a => inv_1_o, nA => inv_0_o);
	inv_1: inv port map (a => inv_0_o, nA => inv_1_o);
	Q <= inv_1_o;	  
	nQ <= inv_0_o;
end Structural;

-- TEST  --

library ieee;
use ieee.std_logic_1164.all;

entity ex01t is
end ex01t;

architecture Test of ex01t is
	component ex01
		port(
			Q: out STD_LOGIC;
			nQ: out STD_LOGIC
		);
	end component;

	signal ex01_Q: STD_LOGIC;
	signal ex01_nQ: STD_LOGIC;
begin
	bistable: ex01 port map (Q => ex01_Q, nQ => ex01_nQ);	
end Test;
