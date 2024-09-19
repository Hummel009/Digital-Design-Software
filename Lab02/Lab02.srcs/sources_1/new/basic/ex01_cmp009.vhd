library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ex01_cmp009 is
	port(							
		A, B, S: in STD_LOGIC; 
		Q: out STD_LOGIC
	); 
end ex01_cmp009;

architecture Structural of ex01_cmp009 is
	
	component inv
		port(
			A: in STD_LOGIC;
			nA: out STD_LOGIC
		);
	end component;
		
	component and2
		port(							
			A, B: in STD_LOGIC; 
			R: out STD_LOGIC
		);	
	end component;

	component or2
		port(
			A, B: in STD_LOGIC;
			R: out STD_LOGIC
		);
	end component;
	
	signal nS, AnS, BS: STD_LOGIC;
begin	
	U1: inv port map(S, nS);
	U2: and2 port map(A, nS, AnS);
	U3: and2 port map(B, S, BS);
	U4: or2 port map(AnS, BS, Q);
end Structural;