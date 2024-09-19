library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity half_sum is
	port(
		A, B: in STD_LOGIC;
		S: out STD_LOGIC;
		C: out STD_LOGIC
		);
end half_sum;

architecture Structural of half_sum is	

	component xor2	  
		port(
			A, B: in STD_LOGIC;
			R: out STD_LOGIC
			);
	end component;
	
	component and2	  
		port(
			A, B: in STD_LOGIC;
			R: out STD_LOGIC
			);
	end component;
	
begin
	U1: xor2 port map(A=>A, B=>B, R=>S);
	U2: and2 port map (A=>A, B=>B, R=>C);
end Structural;													 								