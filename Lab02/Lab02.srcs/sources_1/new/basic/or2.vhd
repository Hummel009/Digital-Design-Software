library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity or2 is
	port(
		A, B: in STD_LOGIC;
		R: out STD_LOGIC
		);
end or2;

architecture Behavioral of or2 is
begin
	R <= A or B;
end;