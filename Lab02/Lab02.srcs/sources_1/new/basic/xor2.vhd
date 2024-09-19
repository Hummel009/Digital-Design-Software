library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity xor2 is
	port(
		A, B: in STD_LOGIC;
		R: out STD_LOGIC
		);
end xor2;

architecture Behavioral of xor2 is
begin
	R <= A xor B;
end;