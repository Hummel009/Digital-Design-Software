library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ex03 is
	port(							
		A, B, C, D: in STD_LOGIC; 
		Q: out STD_LOGIC
	); 
end ex03;

architecture Structural of ex03 is
	
	component and2
		port(							
			A, B: in STD_LOGIC; 
			R: out STD_LOGIC
		);	
	end component;
	
	component and3
		port(							
			A, B, C: in STD_LOGIC; 
			R: out STD_LOGIC
		);	
	end component;

	component or2
		port(
			A, B: in STD_LOGIC;
			R: out STD_LOGIC
		);
	end component;
	
	signal ABC, CD: STD_LOGIC;
begin	
	U1: and3 port map(A, B, C, ABC);
	U2: and2 port map(C, D, CD);
	U3: or2 port map(ABC, CD, Q);
end Structural;

--architecture Behavioral of ex03 is
--begin
--	Q <= (A and B and C) or (C and D);
--end Behavioral;