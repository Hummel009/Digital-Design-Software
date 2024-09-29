library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity nor2t is
	port(
		A, B: in STD_LOGIC;
		R: out STD_LOGIC
	);
end nor2t;

architecture Behavioral of nor2t is
	attribute dont_touch: STRING;
	attribute dont_touch of Behavioral: architecture is "true";
begin
	R <= A nor B after 4 ns;		
end;