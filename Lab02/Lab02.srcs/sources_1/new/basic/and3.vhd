library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity and3 is
	port(
		A, B, C: in STD_LOGIC;
		R: out STD_LOGIC
	);
end and3;

architecture Behavioral of and3 is

begin
	R <= A and B and C;
end Behavioral;