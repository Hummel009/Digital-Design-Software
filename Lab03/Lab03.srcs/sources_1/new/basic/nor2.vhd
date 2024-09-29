library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity nor2 is
	port(
		A, B: in STD_LOGIC;
		R: out STD_LOGIC
	);
end nor2;

architecture Behavioral of nor2 is	
begin
	R <= A nor B;		
end;

architecture BehavioralP of nor2 is	
begin
	R <= A nor B after 4 ns;		
end;