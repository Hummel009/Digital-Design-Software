library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity and2 is
	port(
		A, B: in STD_LOGIC;
		R: out STD_LOGIC
	);
end and2;

architecture Behavioral of and2 is
begin
	R <= A and B;
end;