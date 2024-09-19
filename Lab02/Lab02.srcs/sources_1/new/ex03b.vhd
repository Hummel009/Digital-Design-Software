library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ex03b is
	port(					
		A, B, C, D: in STD_LOGIC; 
		Q: out STD_LOGIC
	);
end ex03b;

architecture Behavioral of ex03b is
begin
	Q <= (A and B and C) or (C and D);
end Behavioral;